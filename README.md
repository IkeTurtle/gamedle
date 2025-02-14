Steps to start using gamedle:

# Step 1:
Clone the following repository: https://github.com/IkeTurtle/gamedle.git

```ruby
git clone https://github.com/IkeTurtle/gamedle.git
```

# Step 2:
Start a virtual environment in visual studio code
```ruby
python -m venv .venv
```

# Step 3
Activate the virtual environment:

Windows (Command Prompt):

.venv\Scripts\Activate.bat

--- 

Windows (PowerShell):

.venv\Scripts\Activate.ps1

# Step 4 Install Dependencies
Install the required dependencies saved in requirements.txt
```ruby
python -m pip install -r requirements.txt
```

# Step 5 Initialize Database
```ruby
flask init-db
```

# Step 6 Start the webserver
Start the webserver
```ruby
flask run
```

# Step 7 Open the webserver in your browser
Either follow the provided link with CTRL+Mouse1 or
copy the url http://127.0.0.1:5000

