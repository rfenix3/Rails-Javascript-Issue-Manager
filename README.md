# Rails Issue Manager
A Rails CRUD (Create Read Update Delete) application for managing issues.

## Description and Purpose
This is a complete Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build an Issue Management System to support one of ITIL Incident Management's main function: The Service Desk. 

The service desk is the single point of contact for customers to report IT-related incidents. As such, this application aims to help service desk support staffs to capture and track IT issues promptly, work collaboratively, encourage knowledge transfer, collect IT  data trend, and support problem management requirements.

## Home Page
![alt text](https://github.com/rfenix3/ruby-rails-crud-issue-manager/blob/master/app/assets/images/HomePage.png "Home Page screen shot")

## Characteristics of the Application
1. Uses the Ruby on Rails framework (MVC or Model-View-Controller framework).
2. Includes has_many, belongs_to, and has_many :through relationship among tables.
3. Includes reasonable validations when creating records and defends against invalid data.
4. Includes class level ActiveRecord scope methods.
5. Provides standard user authentication for signup, login, logout, and passwords. 
6. Uses nested resource with the appropriate RESTful URLs. 
7. Uses helper methods and partials. 
8. Uses bootstrap for the views and layouts.

## Table Relationship
![alt text](https://github.com/rfenix3/ruby-rails-crud-issue-manager/blob/master/app/assets/images/RubyRailsProjectTableRelationship.png "Model and Table Relationship")

## Application Features
1. Allows user signin or signup.
2. Provides authorization and access based on a user's assigned role.
   - Users with roles of L1, L2, and L3 can only create, show, update, and delete issue records.
   - Users with role of 'Guest' can only view all issues.
   - Users with role of Admin can create, show, update, and delete any table records.
   - Dynamic Navigation bar. The navigation bar changes based on user's role.  
3. Users who initially sign up are given the role of 'Guest' automatically. 
4. Only users with 'Admin' role can change user's role.
5. Forms correctly displays validation errors. 
6. Allows login from Github.

## Technology Used
* Ruby
* Rails
* ActiveRecord
* SQLite3
* Bootstrap

## Pre-requisite
* Integrated Development Environment (IDE) or Amazon Web Services (AWS) Cloud9

## Get Started
1. Clone repository
```
$ git clone https://github.com/rfenix3/ruby-rails-crud-issue-manager.git
```
2. Install bundle
```
$ bundle install
```
3. Run database migration
```
$ bin/rails db:migrate RAILS_ENV=development
```
4. Seed database table
```
$ rake db:seed
```
5. Open web browser and type in the localhost on url window
```
http://localhost:xxxx
```

## Tip:
For demo purposes, Admin password for this application is 'admin'.
Other user's password is their user name in downcase.


