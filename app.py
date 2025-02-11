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

    session.clear()

    return render_template('home.html', games=games)

@app.route('/games')
def game_score():
    db_con = db.get_db_con()


    # Rendern des Templates und Übergabe der Game Selection
    return render_template('game_select.html')

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
    
    #Falls ein unlässiges GameObject geöffnet wird
    if round > 10:
        return redirect(f"/GameSet{game_id}/1")

    # Session initialisieren
    if 'score' not in session:
        session['score'] = 0
        session['current_round'] = 1

        print(f"User input: { session['score']}")  
        print(f"User input: { session['current_round']}")  

    #Wenn eine man ein anderes GameObject öffnet, obwohl man das aktuelle noch nicht beantwortet hat
    if round != session['current_round']:
        return redirect(f"/GameSet{game_id}/{session['current_round']}")


    # https://stackoverflow.com/questions/10434599/get-the-data-received-in-a-flask-request
    if request.method == "POST":
        user_guess = request.form.get("guess", type=float)  


        if session['current_round'] < 10:

            if user_guess is not None:
                session['score'] += user_guess  # Wert addieren
                session['current_round'] += 1   # Runde erhöhen

                print(f"User input: {user_guess}")  
                print(f"Score: { session['score']}")  
                print(f"Current Roud: { session['current_round']}")  

                return redirect(f"/GameSet{game_id}/{session['current_round']}")

        #Weiterleitung zur Scoresliste
        if session['current_round'] == 10:

            session['score'] += user_guess

            print(f"User input: {user_guess}")  
            print(f"Score: { session['score']}")  
            print(f"Current Roud: { session['current_round']}")  
            
            final_score = session['score']


            return redirect(f"/GameSet{game_id}/score")

            
        

    # HTML-Template rendern
    return render_template("game_set.html", guessing_object=guessing_object, game_id=game_id, game_name=game_set['name'], score=session['score'], round=session['current_round'])


@app.route('/GameSet<int:game_id>/score',methods=['GET', 'POST'])

def scorelist(game_id):
    db_con = db.get_db_con()

    # Abfrage des GameSets
    game_set = db_con.execute(
        "SELECT * FROM GameSet WHERE id = ?",
        (game_id,)
    ).fetchone()

    if not game_set:
        return "GameSet not found", 404

    #Falls man sich noch im Spiel befindet, soll man das Spiel zuerst zuende spielen
    if session.get('current_round') and session.get('current_round') > 10:
        return redirect(f"/GameSet{game_id}/{session.get('current_round')}")


    game_set = db_con.execute("SELECT * FROM GameSet WHERE id = ?",(game_id,)).fetchone()
    
    score_data = db_con.execute("SELECT username, points FROM Score WHERE game_id = ? ORDER BY points DESC", (game_id,)).fetchall()

    final_score = session.get('score')

    #Button, damit Score gespeichert wird
    if request.method == "POST":
        username = request.form.get("yourName")

        print(game_id)
        print(username)
        print(final_score)

        db_con.execute("INSERT INTO Score (game_id, username, points) VALUES (?, ?, ?)", (game_id, username, final_score))
        db_con.commit()
    
        session.clear()
        
        return redirect(f"/GameSet{game_id}/score")


    # Rendern des Templates und Übergabe der GameSets
    return render_template('game_score.html', game_id=game_id, game_set=game_set, score_data = score_data, final_score = final_score )


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
