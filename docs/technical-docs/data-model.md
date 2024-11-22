---
title: Data Model
parent: Technical Docs
nav_order: 2
---

{: .label }
Quang Anh Nguyen

{: .no_toc }
# Data model

<details open markdown="block">
{: .text-delta }
<summary>Table of contents</summary>
+ ToC
{: toc }
</details>

![First Data Model](../assets/images/datamodel_1)

The database should include three tables for managing the data: 
**GuessingObject, GameSet, and Score**

Table: `GuessingObject`

The GuessingObject table stores all the items that can be guessed during the game.

| Attribute | Type | Description |
| --- | --- | --- |
| `id` | Integer | primary key |
| `picture` | BLOB | picture of guessing object |
| `question` | String | question for the guessing object displayed to the user |
| `value` | float | correct answer/value to the question |
| `scale_top` | float | highest value on the guessing scale |
| `scale_bottom` | float | lowest value on the guessing scale |

Table: `GameSet`

The GameSet table contains 10 items from the GuessingObject table, as each game needs a set of 10 different objects.

| Attribute | Type | Description |
| --- | --- | --- |
| `id` | Integer | primary key |
| `object_1` | Integer | foreign key → GuessingObject.id <br> guessing object one |
| `object_2` | Integer | foreign key → GuessingObject.id <br> guessing object two |
| ... |
| `object_3` | Integer | foreign key → GuessingObject.id <br> guessing object nine |
| `object_4` | Integer | foreign key → GuessingObject.id <br> guessing object ten |

Table: `Score`

The Score table records the players' scores for each game set.

| Attribute | Type | Description |
| --- | --- | --- |
| `id` | Integer | primary key |
| `game_id` | Integer | foreign key → GameSet.id <br> indicates which game the score belongs to |
| `username` | String | username of score holder |
| `points` | float | points scored by the user |

