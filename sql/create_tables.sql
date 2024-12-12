CREATE TABLE GuessingObject (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    picture TEXT NOT NULL,
    question TEXT NOT NULL,
    value float NOT NULL,
    scale_top float,
    scale_bottom float
);

CREATE TABLE GameSet (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    object_1 INTEGER,
    object_2 INTEGER,
    object_3 INTEGER,
    object_4 INTEGER,
    object_5 INTEGER,
    object_6 INTEGER,
    object_7 INTEGER,
    object_8 INTEGER,
    object_9 INTEGER,
    object_10 INTEGER,
    FOREIGN KEY (object_1) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_2) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_3) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_4) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_5) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_6) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_7) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_8) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_9) REFERENCES GuessingObject (id) ON DELETE CASCADE,
    FOREIGN KEY (object_10) REFERENCES GuessingObject (id) ON DELETE CASCADE

);

CREATE TABLE Score (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    game_id INTEGER,
    username TEXT NOT NULL,
    points float NOT NULL,
    FOREIGN KEY (game_id) REFERENCES GameSet (id) ON DELETE CASCADE

);