---
title: Architecture
parent: Technical Docs
nav_order: 1
---

{: .label }
[Quang Anh Nguyen]

{: .no_toc }
# Architecture

This section of the documantion focuses on the most relevant functionalities for our game.

<details open markdown="block">
{: .text-delta }
<summary>Table of contents</summary>
+ ToC
{: toc }
</details>

## Setting up the correct App Route

The first step was to create an app route which selects the correct `GameSet` and displays the corresponding `GuessingObject`.

To implement that we defined to use following `@app.route`:

```ruby
@app.route('/GameSet<int:game_id>/<int:round>',methods=['GET', 'POST'])
```
With this route, the user is able to open a specific `GameSet` using the variable `game_id` and the associated `GuessingObject` for the given `round`.

The `POST` method is essential for the submission of the user answer, which will be explained in detail later.

With the following code we were able to retrieve the correct data for each `round` / `GuessingObject`. This data is then returned to `game_set.html` to ensure that the right attributes are being used for each round.

```ruby
game_set = db_con.execute(
        "SELECT * FROM GameSet WHERE id = ?",
        (game_id,)
    ).fetchone()

object_id = game_set[f'object_{round}']  
if not object_id:
  return f"No object for round {round}", 404

guessing_object = db_con.execute(
  "SELECT * FROM GuessingObject WHERE id = ?",
  (object_id,)
).fetchone()

score_data = db_con.execute(
  "SELECT username, points FROM Score WHERE game_id = ? ORDER BY points DESC", 
  (game_id,)
).fetchall()
```

## Flask Session

To ensure that the rounds are connected and not just independent links, we used Flask's session funcitonality. This allows us to track and manage the game progress across multiple rounds.

```ruby
from flask import Flask, render_template, redirect, url_for, request, session

app.config['SESSION_PERMANENT'] = False

if 'score' not in session:
        session['score'] = 0
        session['current_round'] = 1
```
The  `session['score']` and `session['current_round']` are essential for various functionalities, which will be explained in detail later.

(cf. https://flask-session.readthedocs.io/en/latest/usage.html)

With Flask session, we were able to:
- ensure the continuity of the rounds, prevernting useres from skipping rounds.
- implement a scoring system that saves the points across the round
  
The exact implementation of these steps will be explained in detail later.

## Scale/Slider

One of the most important aspects of the game is a functional scale/slider for the user input. The implemenation was done with the <`input type=range`> element. Here we could define the minimum and maximum values for the scale dynamically.

```ruby
 <input type="range" id="guess" name="guess" class="form-range"
    min="{{ guessing_object['scale_top'] }}" 
    max="{{ guessing_object['scale_bottom'] }}" 
    step="1" 
    oninput="updateValue(this.value)">
```
(cf. https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range)

Furthermore, we implemented a way to dynamically display the user's selected value on the scale using JavaScript. The user can see the current input value in realtime.

```ruby
<script>
  var slider = document.getElementById("guess");
  var output = document.getElementById("guessValue");
  var modalGuess = document.getElementById("modalGuessValue");

  output.innerHTML = slider.value;
  modalGuess.innerHTML = slider.value;

  slider.oninput = function() {
    output.innerHTML = this.value;
    modalGuess.innerHTML =this.value;
  }
</script>
```
(cf. https://www.w3schools.com/howto/howto_js_rangeslider.asp)

## Retrieving the user-input

As mentioned earlier, with the `request.method == "POST"` the user input can be retrieved and used to do all necessary calculations for the points and score.

```ruby
 if request.method == "POST":
        user_guess = request.form.get("guess", type=float)  
```
(cf. https://stackoverflow.com/questions/10434599/get-the-data-received-in-a-flask-request)

## Calculation of the Points and Score

We asked ChatGPT to generate a formula for calculating the points after each round, which we implemnted like this:

```ruby
max = guessing_object['scale_bottom'] 
min = guessing_object['scale_top'] 
answer = guessing_object['value']

error = abs(user_guess - answer) / (max - min)
points = Decimal(1000 * (1 - error) ** 2).quantize(Decimal("1"), rounding=ROUND_HALF_UP)
```
(cf. ChatGPT & https://docs.python.org/3/library/decimal.html)

We had to use the `Decimal` libary to round the points. The standard `round()` function could not be used in this case, as `round` was already a defined variable, as seen earlier.

To properly adding up the points to have a accumulated score, we added the achieved `points` to `session['score']`.

```ruby
session['score'] += int(points)
```

## Ensuring Proper Game Progression

### Correct Redirecting

To ensure that the user is redirected after each round, we implemented an automatic redirection mechanism based on the current round number.
- For rounds less than 10, the game simply adds session['current_round'] by 1 and redirects the user to the next round.
- When the user reaches round 10, they are redirected to the /score page, where they can submit their score to the highscore list.

```ruby
if session['current_round'] < 10:
        if user_guess is not None:
                session['current_round'] += 1   
                return redirect(f"/GameSet{game_id}/{session['current_round']}")

if session['current_round'] == 10:
        session['score'] += int(points)
        return redirect(f"/GameSet{game_id}/score")
```
### Non-Skippable Round

One very relavant aspect is that the user should not be able to skip any rounds and must play them in the correct order. Therefore, we ensured that the `['current_round']` always matches the `round` variable. If they are not equivalent, the user will be automatically redirected to the correct round.

```ruby
if round != session['current_round']:
        return redirect(f"/GameSet{game_id}/{session['current_round']}")
```
### Preventing GameSet Switching 

To prevent users from switching between GameSets during an active game, the session is cleared. This ensures that the user always starts from round 1 with no points when switching to a different GameSet.

```ruby
if 'game_id' in session and session['game_id'] != game_id:
        session.clear()
        session['score'] = 0
        session['current_round'] = 1
```
