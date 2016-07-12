# Quizzighted

This project is a toy project meant to learn the stack of tools we used at Belighted.
It is meant to provide structure and boilerplate code in order for the student to focus on important tasks.


Steps :

* CRUD Questions, Options
* Add User and Authentication
* User start a participation and answer questions
* Questions and Options are available in 2 languages
* Upon registration, email unicity is checked using AJAX
* Questions are organized in quizzes


* Questions can have pictures,
* Google analytics is used to learn what people choose. Hotjar is used for heatmaps
* Activity Feed


## CRUD Questions, Options

What is a resource ? Something you can locate using a URL and manipulate using one of the four verbs : GET/POST/PUT-PATCH/DELETE 
In Rails terms, a resourc is a set of routes and a controller having actions matching those routes.

Create a Question resource. 
A Question must have a title and a body. It must also persist its creation/update timestamp.

Create an Option resource.
An Option must have a label and a value. It is connected to a Question. . It must also persist its creation/update timestamp.


The options controller has no `show` action, it is the show of the questions which displays the question and its options.
Creating an option is always done in the context of an option.
Manipulating a persisted option is done directly.



- rails g migration
- create model 
- create route
- create controller
- create actions/templates
- create nested shallow resource


- Explain REST simply
- Slim
- No ActiveAdmin
- No Coffee, No (S)CSS


## Add User and Authentication

- Devise / Gemfile


- create feature branch
- No ActiveAdmin
- Slim
- No Coffee, No (S)CSS
- merge feature branch
