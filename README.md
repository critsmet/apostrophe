# Apostrophe: The Back End

This Rails app was deisgned to handle the database and API for its eponym Apostrophe, a digital publication library live at http://www.apostrophe.online. It can be used as a template for similarly-modeled projects. This repository welcomes contributions, so feel free to submit a pull request! 

## Contents

- [Essential Gems](#essentual-gmes)
- [Installation](#installation)
- [Models](#models)
- [Future Development](#future-development)

## Essential Gems

This app was created by running ```rails new apostrophe-back-end --api --database=postgresql```, which prepared the application to perform as an API and to be configured for postgreSQL databases. [Cloudinary](https://github.com/cloudinary/cloudinary_gem) is used to upload photo files submitted from the client-side application to a corresponding account and returns the URL of the uploaded image. The [Simple Recommender](https://github.com/geoffreylitt/simple_recommender) gem allows for publications to be recommended based on user likes in common. 

## Installation 

To get started with this application, fork and clone the respository to your hard drive. ```CD``` into the project folder and run ```bundle install```. Once the gems have been installed, run ```rake db:setup``` to establish and seed the database. Make sure you have [postgreSQL](https://postgresapp.com/) installed and already running. Run ```rails start``` once the database has been set up to host the backend on your local server. If you're hosting both the front-end and back-end applications locally, also make sure you change the necessary URL variables in the React application so that changes will reflect your personal database. 

## Models

There are four models that Apostrophe utilizes: 

### Like

The ```Like``` model is a join table between a ```User``` instance and a ```Publication``` instance. When logged-in users deliberately "like" a publications while browsing the app by pressing a star symbol, a ```Like``` instance is created in the database. The Simple Recommender gem calculates likes to recommend other publications to users, but this is handled in the ```Publication``` model. 

### Publication

The ```Publication``` is the most code-heavy model in Apostrophe. Scopes and a handful of class methods have been added to the class in the `publication.rb` to help with querying. In the controller, the main functionality comes from the `search` action. This method always expects a key called "terms" in the POST parameters that is an array with a length of two. 

A series of if-statements funnels the query to its proper block. 

Generally, the first parameter is provided if a filter has been applied to the search, the second parameter is text entered into the input by the user. To yield the default selection of Publications, this same action in this controller is used by sending a default request with params["terms"] = ["default", ""]. Expecting two strings in the argument allows users to use both the browse and the search features. In other terms, a user can filter publications by a category, say "Science & Technology", and then use the search bar to make an even more specific query. For example: params["terms"] = ["Science & Technology, "computers"]. 

However, if the first string is not empty and the second is "show", the logic continues to find that particular publication. For example, params["terms"]["Logic", "show"] will find the publication called "Logic" and will return the entire object as JSON, along with supplemental information like that publication's similar publications, filler publications in case there aren't enough recommendations, and users who have liked that publication. 

The Simple Recommender gem provides the similar publications objects by using the bit of code that starts at line 9 in `app/models/publication.rb`:

```ruby 
include SimpleRecommender::Recommendable
similar_by :users
```

Because a ```Publication``` has many ```Users``` through ```Likes```, we can say to the gem that publications have similarity by users. 

### Relationship

Apostrophe uses the passive-relationship model, allowing for one direction of a relationship to be established at a time. Users can follow other followers, and users receive followers without verification. When two people follow each other, there are two instances of the relationship in the database. 

### User

The ```User``` model handles all aspects of user accounts, including login/signup, and editing information. The Cloudinary gem handles image uploads to a users account. *Although bcrypt is in the gemfile, there is no password encyption in the app*.

## Future Development 

### Secure Login

Adding password encryption, getting an SSL certificate, and handling sessions with JSON Web Tokens is the next feature to be implimented. 

### Indexing Database

Rebooting the database with proper attributes indexed to increase query speed is next priority. 
