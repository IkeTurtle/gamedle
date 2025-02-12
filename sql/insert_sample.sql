BEGIN TRANSACTION;
DELETE from GuessingObject;
DELETE from GameSet;
DELETE from Score;

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Amazon.png", "How many orders does Amazon process per second?", 138, 0, 500);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Apple.png", "When was the first iPhone released to the public?", 2007, 2005, 2015);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bose.png", "In which year was Bose founded?", 1964, 1950, 2020);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/ebay.png", "How many employees did eBay have in 2023?", 12300, 1000, 1000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Google.png", "What percentage of the world does Google Street View currently cover?", 98, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Meta.png", "In which year did Facebook rename itself to Meta?", 2021, 2015, 2024);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Microsoft.png", "How many different Microsoft 365 apps currently exist?", 27, 0, 50);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Samsung.png", "What percentage of Germans used a Samsung smartphone in Q4 2024?", 34, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Steam.png", "How many daily active players did Steam average in 2021?", 69000000, 0, 100000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Tesla.png", "In which year was Tesla founded?", 2003, 1950, 2020);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("Brands",1, 2, 3, 4, 5, 6, 7, 8, 9, 10);


INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Ronaldo.png", "How many times has Ronaldo won the Champions League?", 5, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Messi.png", "How many times has Messi won the Champions League?", 8, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Ger_worldcup.png", "How many times has Germany won the World Cup?", 4, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Toni.png", "What is Toni Kroos' passing accuracy percentage?", 94, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bayern.png", "What percentage of the world does Google Street View currently cover?", 98, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bayern.png", "How many consecutive times has FC Bayern Munich won the Bundesliga?", 11, 0, 20);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Schalke.png", "What is the seating capacity of Schalke's Veltins-Arena?", 62271, 0, 100000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Pele.png", "For how many European football clubs did Pelé play?", 0, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bvb.png", "n which year was Borussia Dortmund founded?", 1909, 1900, 2000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Pep.png", "How many trophies has Pep Guardiola won as a manager?", 38, 0, 50);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("Football",11, 12, 13, 14, 15, 16, 17, 18, 19, 20);



INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Giza.png", "How tall was the Great Pyramid of Giza when it was first completed?", 146, 50, 500);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/HangingGardens.png", "How many levels did the Hanging Gardens of Babylon have?", 7, 0, 20);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Zeus.png", "For how many years did the Statue of Zeus stand before it was destroyed?", 800, 0, 2000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Artemis.png", "How many times was the Temple of Artemis rebuilt after being destroyed?", 2, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Alexandira.png", "How many years did it take to build the Lighthouse of Alexandria?", 20, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/MachuPicchu.png", "How many steps are there in the staircases of Machu Picchu?", 3000, 0, 10000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Christ.png", "How many years did it take to build the Christ the Redeemer statue?", 9, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Colosseum.png", "How many spectators could the Colosseum hold at its peak?", 50000, 0, 100000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/WallChina.png", "What is the total length of the Great Wall of China?", 21196, 0, 100000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/MachuPicchu.png", "How high above sea level is Machu Picchu?", 2430, 0, 3000);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("Ancient & Modern World Wonders",21, 22, 23, 24, 25, 26, 27, 28, 29, 30);



INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Blood.png", "How much blood does an average adult human body contain (in liters)?", 5, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Bones.png", "How many bones are in the adult human body?", 206, 0, 1000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Skin.png", "How much does the skin weigh in an average adult human?", 4.5, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Muscle.png", "What percentage of the human body weight is made up of muscle on average?", 45, 0, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Teeth.png", "How many teeth does an average adult human have?", 32, 0, 50);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Neurons.png", "How many billion neurons are estimated to be in the human brain", 86, 1, 100);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Hair.png", "How many hair roots are on the average human scalp?", 100000, 0, 1000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Lungs.png", "How many liters of air can the average human lungs hold?", 6, 0, 20);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Stomach.png", "How much food can the average human stomach hold?", 1.5, 0, 10);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Blinking.png", "How many times does the human eye blink in one minute on average?", 20, 0, 100);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("Human Body",31, 32, 33, 34, 35, 36, 37, 38, 39, 40);


INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Russia.png", "Largest Country: How many square kilometers does Russia have?", 17000000, 1000000, 50000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Vatican.png", "Smallest Country: How many square kilometers does the Vatican City have?", 0.44, 0, 50);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Everest.png", "Tallest Mountain: How tall is Mount Everest in meters?", 8848, 0, 10000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Pacific.png", "Largest Ocean: How many square kilometers is the Pacific Ocean?", 168000000, 10000000, 500000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Nile.png", "Longest River: How long is the Nile River in kilometers?", 6650, 0, 10000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/AngelFalls.png", "Highest Waterfall: How tall is Angel Falls in Venezuela in meters?", 979, 0, 5000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Sahara.png", "Largest Desert: How large is the Sahara Desert in square kilometers?", 9000000, 1000000, 10000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Mariana.png", "Deepest Ocean Point: What is the depth of the Mariana Trench in meters?", 10994,0, 50000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Amazonas.png", "Largest Rainforest: How many square kilometers is the Amazon Rainforest?", 5500000, 0, 10000000);

INSERT INTO GuessingObject (picture, question, value, scale_top, scale_bottom)
VALUES ("pictures/Islands.png", "Largest Island Group: How many islands make up the Philippine Islands?", 7600, 0, 10000);

INSERT INTO GameSet (name,object_1, object_2, object_3, object_4, object_5, object_6, object_7, object_8, object_9, object_10)
VALUES ("Geography",41, 42, 43, 44, 45, 46, 47, 48, 49, 50);

COMMIT;