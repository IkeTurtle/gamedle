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
```
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



{: .attention }
> This page describes how the application is structured and how important parts of the app work. It should give a new-joiner sufficient technical knowledge for contributing to the codebase.
> 
> See [this blog post](https://matklad.github.io/2021/02/06/ARCHITECTURE.md.html) for an explanation of the concept and these examples:
>
> + <https://github.com/rust-lang/rust-analyzer/blob/master/docs/dev/architecture.md>
> + <https://github.com/Uriopass/Egregoria/blob/master/ARCHITECTURE.md>
> + <https://github.com/davish/obsidian-full-calendar/blob/main/src/README.md>
> 
> For structural and behavioral illustration, you might want to leverage [Mermaid](../ui-components.md), e.g., by charting common [C4](https://c4model.com/) or [UML](https://www.omg.org/spec/UML) diagrams.
> 
>
> You may delete this `attention` box.

<details open markdown="block">
{: .text-delta }
<summary>Table of contents</summary>
+ ToC
{: toc }
</details>

## Overview

[Give a high-level overview of what your app does and how it achieves it: similar to the value proposition, but targeted at a fellow developer who wishes to contribute.]

## Codemap

[Describe how your app is structured. Don't aim for completeness, rather describe *just* the most important parts.]

## Cross-cutting concerns

[Describe anything that is important for a solid understanding of your codebase. Most likely, you want to explain the behavior of (parts of) your application. In this section, you may also link to important [design decisions](../design-decisions.md).]
