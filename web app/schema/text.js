"use strict";
/*
 *  Defined the Mongoose Schema and return a Model for a Text
 */
/* jshint node: true */

var mongoose = require('mongoose');

var textSchema = new mongoose.Schema({
    id: String,
    cameron: String,
    title: String
});


// the schema is useless so far
// we need to create a model using it
var Text = mongoose.model('Text', textSchema);

// make this available to our persons in our Node applications
module.exports = Text;
