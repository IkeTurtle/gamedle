---
title: Design Decisions
nav_order: 5
---

{: .label }
[Eike & Quang]

{: .no_toc }
# Design decisions

<details open markdown="block">
{: .text-delta }
<summary>Table of contents</summary>
+ ToC
{: toc }
</details>

## 01: [Bootsrap] [Eike]


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

## [Example, delete this section] 01: How to access the database - SQL or SQLAlchemy 

### Meta

Status
: Work in progress - **Decided** - Obsolete

Updated
: 30-Jun-2024

### Problem statement

Should we perform database CRUD (create, read, update, delete) operations by writing plain SQL or by using SQLAlchemy as object-relational mapper?

Our web application is written in Python with Flask and connects to an SQLite database. To complete the current project, this setup is sufficient.

We intend to scale up the application later on, since we see substantial business value in it.



Therefore, we will likely:
Therefore, we will likely:
Therefore, we will likely:

+ Change the database schema multiple times along the way, and
+ Switch to a more capable database system at some point.

### Decision

We stick with plain SQL.

Our team still has to come to grips with various technologies new to us, like Python and CSS. Adding another element to our stack will slow us down at the moment.

Also, it is likely we will completely re-write the app after MVP validation. This will create the opportunity to revise tech choices in roughly 4-6 months from now.
*Decision was taken by:* github.com/joe, github.com/jane, github.com/maxi

### Regarded options

We regarded two alternative options:

+ Plain SQL
+ SQLAlchemy

| Criterion | Plain SQL | SQLAlchemy |
| --- | --- | --- |
| **Know-how** | ✔️ We know how to write SQL | ❌ We must learn ORM concept & SQLAlchemy |
| **Change DB schema** | ❌ SQL scattered across code | ❔ Good: classes, bad: need Alembic on top |
| **Switch DB engine** | ❌ Different SQL dialect | ✔️ Abstracts away DB engine |

---
