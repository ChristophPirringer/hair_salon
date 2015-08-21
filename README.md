# _{Hair Salon of Great Hair}_

##### _{A simple database to manage the stylists and their clients}, {August 21 2015}_

#### By _**{Christoph Pirringer**_

## Description

_{This app allows the user to enter different Stylists and Clients into the tables of a database via html-forms. Altering & completely emptying the database entries is also possible.}_

## Setup

*__ Install Ruby on your computer
*__Copy the folder of this awesome app onto your computer
*__Run the bundle-gem from within the uppermost app-folder in your command-prompt to install all necessary gems
*__install the start a postgres-server in your terminal
*__create the two databases (hair_salon and hair_salon_test), both with the following equal content
*__in each: CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
*__ in each: CREATE TABLE clients (id serial PRIMARY KEY, client_name varchar, stylist_id int);
*__Start Sinatra by opening the uppermost app-folder in your command-prompt and typing 'ruby app.rb'
*__open 'localhost:4567/' in your browser-window to see the app
*__Enjoy!!


## Technologies Used

_{This app was realized with the friendly help of html, css as well as ruby and psql to manually create the databases/tables.}_

### Legal

Copyright (c) 2015 **_{Christoph Pirringer}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
