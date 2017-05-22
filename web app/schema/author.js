"use strict";
/*
 *  Defined the Mongoose Schema and return a Model for an Author
 */
/* jshint node: true */

var mongoose = require('mongoose');

// create a schema
var personSchema = new mongoose.Schema({
    id: String,     // Unique ID identifying this person
    first_name: String, // First name of the person.
    last_name: String,  // Last name of the person.
    title: String,      // Dr, Professor, etc.
    department: String,  // Institution/location
    email: String,
    photo: String,   // Name of a file containing the actual photo (in the directory images).
    description: String, // Descriptive blurb
    website: String, // Link to website/blog
    role: String    // Role on project
});

// the schema is useless so far
// we need to create a model using it
var Person = mongoose.model('Manuscript', personSchema);

// make this available to our persons in our Node applications
module.exports = Person;
