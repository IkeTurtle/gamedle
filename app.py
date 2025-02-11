import os
from flask import Flask, render_template, redirect, url_for, request, session
from flask_bootstrap import Bootstrap5
import db

app = Flask(__name__)
app.secret_key = 'super_secret_key' 
app.config['SESSION_PERMANENT'] = False

bootstrap = Bootstrap5(app)

app.config.from_mapping(
    SECRET_KEY='secret_key_just_for_dev_environment',
    DATABASE=os.path.join(app.instance_path, 'GuessingObjects.sqlite'),
    BOOTSTRAP_BOOTSWATCH_THEME = 'minty'
)
app.cli.add_command(db.init_db)
app.teardown_appcontext(db.close_db_con)


@app.route('/')
def home():
    db_con = db.get_db_con()

    # Abrufen aller GameSets aus der Datenbank
    games = db_con.execute("SELECT id, name FROM GameSet").fetchall()

    # Rendern des Templates und Übergabe der GameSets
    return render_template('home.html', games=games)

@app.route('/games')
def game_score():
    db_con = db.get_db_con()


    # Rendern des Templates und Übergabe der Game Selection
    return render_template('game_select.html')

@app.route('/Highscores')
def games():
    db_con = db.get_db_con()


    # Rendern des Templates und Übergabe der Game Selection
    return render_template('game_score.html')

@app.route('/GameSet<int:game_id>/<int:round>',methods=['GET', 'POST'])
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
    
    # Session initialisieren
    if 'score' not in session:
        session['score'] = 0
        session['current_round'] = 1

        print(f"User input: { session['score']}")  
        print(f"User input: { session['current_round']}")  

    if round != session['current_round']:
        return redirect(f"/GameSet{game_id}/{session['current_round']}")


    # https://stackoverflow.com/questions/10434599/get-the-data-received-in-a-flask-request
    if request.method == "POST":
        user_guess = request.form.get("guess", type=float)  


        print(f"User input: {user_guess}")  

        if session['current_round'] < 10:

            if user_guess is not None:
                session['score'] += user_guess  # Wert addieren
                session['current_round'] += 1   # Runde erhöhen

                print(f"Score: { session['score']}")  
                print(f"Current Roud: { session['current_round']}")  

                return redirect(f"/GameSet{game_id}/{session['current_round']}")

        if session['current_round'] == 10:
             return redirect(f"/GameSet{game_id}/score")


    # HTML-Template rendern
    return render_template("game_set.html", guessing_object=guessing_object, game_id=game_id, game_name=game_set['name'], score=session['score'], round=session['current_round'])

@app.route('/GameSet<int:game_id>/score')


def scorelist(game_id):
    db_con = db.get_db_con()

    # Abfrage des GameSets
    game_set = db_con.execute(
        "SELECT * FROM GameSet WHERE id = ?",
        (game_id,)
    ).fetchone()

    scorepoints = db_con.execute("SELECT username, points FROM Score WHERE game_id = {game_id}").fetchall()

    # Rendern des Templates und Übergabe der GameSets
    return render_template('game_score.html', games=games)


@app.route('/GameSet<int:game_id>')
def game_set_start(game_id):
    db_con = db.get_db_con()

    game_set = db_con.execute(
        "SELECT * FROM GameSet WHERE id = ?", (game_id,)
    ).fetchone()

    if not game_set:
        return "GameSet not found", 404
    
    # Abrufen aller GameSets aus der Datenbank
    games = db_con.execute("SELECT id, name FROM GameSet").fetchall()

    # Rendern des Templates und Übergabe der GameSets
    return render_template('game_set_play.html', games=games, game_id=game_id,  game_name=game_set['name'])
