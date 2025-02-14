---
title: Design Decisions
nav_order: 5
---

{: .label }
Eike & Quang

{: .no_toc }
# Design decisions

<details open markdown="block">
{: .text-delta }
<summary>Table of contents</summary>
+ ToC
{: toc }
</details>

## 01: Bootstrap [Eike]


### Problem statement


- Basic HTML & CSS is often very labour-intensive and repetitive

- Making a webpage look professional with core HTML & CSS is a challenging endeavour

- The wireframes created with Figma should be adequately recreated within our code

### Decision

- Bootstrap almost completely replaces any CSS coding, freeing up a lot of time for other aspects of our project

- Bootstrap is visually appealing

- Bootstrap eliminates many of the annoying parts of formatting within html/css

- Elements of Bootstrap can be mockuped with Figma and quickly applied to our own code


### Regarded options

#### Option 1: 
Basic HTML & CSS was used at the start but the effort to create visually appealing layouts was too high

#### Option 2: 
Bootstrap had to be adapted to fit our existing code, but we decided to adapt it for the ease of use scalability and optics

---

## 02: Use SQLite or MySQL [Quang]

### Decision

SQLite was chosen as the database solution over MySQL.

### Reasoning

SQLite was chosen because it was part of the lecture, making it a familiar option. It is also lightweight, easy to set up, and does not require a separate server, making it a convenient choice for small projects.

### Implementation

The database connection is established in the `get_db` function in `app.py`, while the tables are created in `create_tables.sql` and `insert_table.sql`. To initialize the database, you need to run `flask init-db`.

## 03: SQL or SQLAlchemy [Quang]

### Decision

SQL was chosen MySQL.

### Reasoning

SQL was chosen over MySQL because we started working with SQL in our course, so it felt more familiar to us. Also, we found SQL easier to understand and implement, which made the integration into our project smoother.

---

## 04: Game Set Selection Design [Eike]


### Problem statement


- I first designed the GameSet selection screen with different Bootstrap UI elements, which was not easily expandable

- Quang desired a solution that offered easier database expansion of GameSets in the


### Decision

- I have decided to use a simple table for a better integration, if we were to use different GameSets



### Regarded options

#### Option 1: 
Using Bootstrap UI Elements to Design the Game Set selection would have been more visually appealing, but each different GameSet would have to be added manually in the UI

#### Option 2: 
Using a table for the Game Sets is not as visually pleasing but gives us an easier method of adding new Game Sets with an integrated UI solution

---

## 05: Ensuring Proper Game Progression [Quang]

### Problem statement

One of the main issues we faced was that users were able to skip rounds, switch between different GameSets with an active session, and not play the rounds in the correct order.

### Implementation

Enforcing Sequential Rounds: We ensured that `session['current_round']` always matches the requested round.
Preventing GameSet Switching: If a user switches to another GameSet during an active game, the session is cleared, forcing them to start from round 1 with no points.

## 06: Points display in PopUp [Quang]

### Problem statement

One issue was displaying the calculated points in the pop-up, as the calculations were only triggered by the Continue button and not by the Submit button.

### Implementation

To solve this, we performed the calculation again separately in the JavaScript code within the `game_set.html`, ensuring that the points were shown immediately in the pop-up.

```ruby
<script>
  var max = Number("{{ guessing_object['scale_bottom'] | float }}");
  var min = Number("{{ guessing_object['scale_top'] | float }}");
  var answer = Number("{{ guessing_object['value'] | float }}");
  var userGuess =  Math.floor((min + max) / 2);

  var error = Math.abs(userGuess - answer) / (max - min);
  points = Math.round(1000 * (1 - error) ** 2);

  document.getElementById("earnedPoints").innerHTML = points;

  slider.oninput = function() {
    userGuess = Number(slider.value);
    error = Math.abs(userGuess - answer) / (max - min);
    new_points = Math.round(1000 * (1 - error) ** 2);
    document.getElementById("earnedPoints").innerHTML = new_points;
  }
</script>
```





