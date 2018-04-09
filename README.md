# Sample search application

![Search App screenshot](https://github.com/brykov/search-app/raw/master/public/images/search-app.png)


This is a [Padrino](http://padrinorb.com) based application that allows to search [MongoDB](http://mongodb.com) collections. Currently it supports the following collections:

1. Users
2. Organizations
3. Tickets

## Installation and running

Pre-requisites: Ruby 2.x, MongoDB 3.x

1. Run ```bundle install``` to install necessary dependencies
2. Run ```MONGO_URI=mongodb://localhost:27017/searchapp_development bundle exec rake import``` to load the data from source files (provide your own MongoDB uri as MONGO_URI enviroment variable)
3. Run ```MONGO_URI=mongodb://localhost:27017/searchapp_development bundle exec rake schema:generate``` to analyze and cache collection schemas
4. Run Padrino server: ```MONGO_URI=mongodb://localhost:27017/searchapp_development bundle exec padrino start``` 
5. Navigate to ```http://localhost:3000/``` in your browser

## Tests

Run ```bundle exec rake spec``` to execute application tests.
