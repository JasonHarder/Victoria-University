# README

This is written as if you do know HTML/CSS & JS but likely do not know Ruby/Rails.If this is a fellow intern reading that does not have Rails/Ruby in their stack then it was written with you in mind as much as possible.Since every intern I've worked with here does not know Rails/Ruby I am trying to walk you through and include useful resources.


#Section 1 also covers possible needed installs.
1) The Stack & Dependancies Installation
    A) The Stack.
    B) Dependancies.
    C) Database.
    D) Microsoft Stack? 
    E) Stuck? 
2) Making Changes to the Front End
    A) Editing HTML.
    B) Editing CSS & JS.
    C) Important point about making changes to css & JS
3) Making Changes to the Back End
    A) Models & Controllers (MVC directory structure in rails).
    B) Postgres Database.
4) Deployment Parameters (With AWS Elastic Beanstalk)

5) Getting confortable w/Rails


Hello , If you're reading this this means that somehow the Victoria university project is relevent to you & that you're working with Yomi. 

I will be (hopefully) making this guide more comprehensive in the coming weeks but let me get started.

                                                            1. The Stack & Dependancies


                                                                    A) The Stack

        This project was created in Ubuntu Linux , with HTML/CSS/Ruby/Rails & JavaScript (when needed).The database is built in Postgres. This means for you to make any edits on the backend you need to install Ruby & Rails (currently we are using ruby 2.5.0 and rails 5.1.4 if you change the versions and keep it running properly feel free to update this.

        When I originally installed my development enviroment I used https://github.com/bitmakerlabs/dev_environment_setup as my guide.If you already know all about linux dev enviroments. you can feel free to go ahead and install everything you need with bundler or whatever you use. It is recommended you use Rbenv or RVM to enable you to use multiple ruby versions to stay compatable.

                                                                B) Dependancies(Gems)
        
        Specfic gems (or packages in more general terms) used in this project. All listed gems are copied as if it was the original gemfile and a short explaination is given depending on the situation. 

        gem 'bootstrap-sass', '~> 3.3.6' -> Handles style on the front end.
        gem 'devise'                     -> Very powerful & useful authentication gem that gives you users and many abilities with them right out of the box.
        gem 'jquery-rails'               -> required for bootstrap but we did not use Jquery itself as of this doc.
        gem 'stripe'                     -> For the payment system
        gem 'redis', '~> 3.0'            -> Redis handles the datastructure that makes chat work.
        gem 'pg', '~> 0.20'              -> If you have database issues and cannot rails db: (setup , reset , migrate etc...) ensure you are using pg 0.20 - I had an issue but don't remember 
                                            the specifics.
        gem "rename"                     -> Not having rename should not cause any issues , I just used it to ensure no issues with renaming the project when I did, early on in development.

                                                            C) Basic Database information

        The Database is built in postgres , once you have cloned the project (at https://github.com/Anthematics/victoria-university-tester [originally a development repo it became our stable at some point when dev moved fairly far ahead and we started just using branches] (youll need to gem install postgres -probably globally -information about Postgres install is also in the dev_enviroment_setup link outlined above)

                                                                D) Microsoft Stack? 

        IF YOU ARE USING WINDOWS - You can install Ruby/Rails/Postgres/Git(and bash)though the installs would be wildly different than what I've worked with (this is assuming you are coming from a non linux based stack as it seems most of Yomi's interns do.The good news is,If you are coming from a microsoft-based stack (ASP.NET, I believe)- Models,Views & Controllers are an essential part of rails - feel free to look in the folders and see the associations yourself.


                                                                    E) Stuck?
        Once everything is installed and running type "rails s" to start localhost:3000 (similar to NPM start if you're coming from javascript) if you get a red screen and you see the word pending migration you need to do a rails migration with rails db:migrate (make sure to run rails db:setup as well).

        You can also create fake users/picture/any type of data in db/seeds.rb (make sure to follow db/schema.rb for the outline on what is needed for what category and that you have a .gitignore so it does not get into production as fake data is a security risk)

                                                        2) Making changes to the Front End.

        Here is the directory structure for those who do not know rails (this is my best guess as to what you might need to change & general rails knowledge)
        This website was built with the idea that , hopefully Yomi will have everything he needs in a dynamic website before we finish with it.

                                                                A) Editing HTML

        app/views/ ~ -> (ex.. App/views/academics/index.html -> this will render the homepage for the academics section of the website -> you can see all the other relevant views here as well.)

        app/views/layouts/application.html.erb -> this is intended for code that will be shared across the entire app._footer _header etc are called partials and that just means that they have PART of the html needed to render an entire page (you can see my render partials in the application.html of the layout)

        Together the Views + Layout & its partials will create the website you see.

                                                                B) Editing CSS & JS

        assets/stylesheets -> this is where you will edit the css -> Each stylesheet is named after the index.html it will edit.NTS-> check if it can also edit folder show pages or if you need an even more specfic filename.

        assets/javascripts -> this is where you will edit the javascript - Application.js applies to all pages , whereas home.js just applies to the homepage.You can also write JavaScript in the .coffee files that correspond with their views (i.e events.coffee = the JS for events/index.html)

                                                                c) IMPORTANT
        !!! You do not need any import statements except in the application layout file as all other files will get their information from  that file!!!

                                                        3) Making changes to the Back End

        (please check link in section 5 if you are not familiar with rails as this assumes you've at least read that) this guide will reference what to look for in that guide depending on what needs to be done.)

        app/models -> PostGres is a relational database , this is where you can see and edit those relationships

        app/controllers ->

        db/schema.rb -> Changing the schema is done through migrations so lookup migrations with ctrl+f in the section 5 guide.The schema itself describes the SQL tables (which can be accessed with rails c )

        db/migrate -> Refer to this to help you follow any rails conventions that may be needed by looking at previous migrations , it will also show migrations you've written (code is to be written in the change method). 


                                                            4) AWS Deployment

        You will need AWS Elastic Beanstalk. AWS docs are better than mine will ever be https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html is probably the link you'd need , dig around to ensure you're following instructions for your OS.

        I will add deployment / configuration docs here when it is fully deployed.

                                                        5) Getting confortable w/Rails.

        The guide linked below will teach you all the basics of rails and if you're trying to do something will direct you. This is built with the idea of creating a blog with CRUD capabilities. It is highly recommended if you have not used ruby or rails to go through this guide with a fine tooth comb. There is also a handy guide here that describes the rails structure and "what does what" better than I ever would be able to here.

                                http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application