import os
from flask import Flask, render_template, redirect, url_for
import db

app = Flask(__name__)

app.config.from_mapping(
    SECRET_KEY='secret_key_just_for_dev_environment',
    DATABASE=os.path.join(app.instance_path, 'GuessingObjects.sqlite')
)
app.cli.add_command(db.init_db)
app.teardown_appcontext(db.close_db_con)

@app.route('/')
def index():
    return 'Hello, World!'

@app.route('/GameSet<int:game_id>/<int:round>')
def game_set(game_id, round):
    db_con = db.get_db_con()

    # Abfrage des GameSets
    game_set = db_con.execute(
        "SELECT * FROM GameSet WHERE id = ?",
        (game_id,)
    ).fetchone()

    if not game_set:
        return "GameSet not found", 404

    # Entnahme der ID vom GuessingObject
    object_id = game_set[f'object_{round}']  
    if not object_id:
        return f"No object for round {round}", 404

    # Abfrage des spezifischen GuessingObjects
    guessing_object = db_con.execute(
        "SELECT * FROM GuessingObject WHERE id = ?",
        (object_id,)
    ).fetchone()

    if not guessing_object:
        return "GuessingObject not found", 404

    # HTML-Template rendern
    return render_template("game_set.html", guessing_object=guessing_object, game_id=game_id, round=round)

 # Wenn /GameSet1 geöffnet wird, wird automatisch /GameSet1/1 geöffnet
@app.route('/GameSet<int:game_id>')
def game_set_start(game_id):
    return redirect(url_for('game_set', game_id=game_id, round=1))

@app.route('/insert/sample')
def run_insert_sample():
    db.insert_sample()
    return 'Database flushed and populated with some sample data.'