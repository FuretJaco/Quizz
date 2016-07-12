# Quizzighted

This project is a toy project meant to learn the stack of tools we used at Belighted.
It is meant to provide structure and boilerplate code in order for the student to focus on important tasks.


Steps :

* CRUD Questions, Options
* Add User and Authentication
* User starts a participation and answers questions
* Questions and Options are available in 2 languages
* Upon registration, email unicity is checked using AJAX
* Questions can have pictures,


* Questions are organized in quizzes
* Google analytics is used to learn what people choose. Hotjar is used for heatmaps
* Activity Feed


## CRUD Questions, Options (1d)

What is a resource ? Something you can locate using a URL and manipulate using one of the four verbs : GET/POST/PUT-PATCH/DELETE 
In Rails terms, a resourc is a set of routes and a controller having actions matching those routes.

Create a Question resource. 
A Question must have a title and a body. It must also persist its creation/update timestamp.

Create an Option resource.
An Option must have a label and a value. It is connected to a Question. . It must also persist its creation/update timestamp.


The options controller has no `show` action, it is the show of the questions which displays the question and its options.
Creating an option is always done in the context of a question.
Manipulating a persisted option is done directly.



- rails g migration
- create model 
- create route
- create controller
- create actions/templates
- create nested shallow resource


- Explain REST simply
- Slim



## Add User and Authentication (1d)

Use devise for authentication. Work on a feature branch.

Get the documentation open : https://github.com/plataformatec/devise

Install Devise according to Doc

Check the generated files, do you understand them ? 
Probably not completely. 
Ask about what you do not understand. 
Hint : if you cannot explain what are salt and pepper you have not asked enough :)


Add devise controller customization using a concern

Add a link into the navbar to the sign_in page when no current user and a logout button when there is a current_user
Protect the Question and Option Controllers against unauthenticated access.


- Gemfile
- Devise
- Concern
- Feature branch

## User starts a participation and answers questions (2d)

Create Participation and Answer resources.
Those resources do not have all the actions, they are not simple CRUD.

Allow an authenticated user to start a participation and then add answers to that participation.

When a user click next without having chosen an option, redisplay form with error message

When the user has finished, redirect to home with a thanks message.

Use Draper to decorate an answer record and it participation when displaying the form to answer a question.

The participation decorator must be able to tell how many questions have been answered and how many are left. 
Those two methods  must have unit specs


- REST
- Validation
- Flash
- Simpleform
- Draper
- Rspec


## Questions and Options are available in 2 languages 

Add a role to users. "participant" or "admin"
Only admin can CRUD questions and options.
The project must now be available in french and english. English is the default. 
Scope all routes under `/fr` or `/en`, use the available concern to get the locale from the request
Add a language switcher
Scope admin panel under `/admin`



- I18n
- Pundit
- routes segmentation
