BEGIN TRANSACTION;
DELETE from GuessingObject;
DELETE from GameSet;
DELETE from Score;

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Amazon.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Apple.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bose.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/ebay.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Google.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Meta.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Microsoft.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Samsung.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Steam.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);
INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Tesla.png", "How much revenue did Amazon make in 2023?", 575000000000, 1000000000, 999999999999);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("GameSet 1 Example",1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

COMMIT;