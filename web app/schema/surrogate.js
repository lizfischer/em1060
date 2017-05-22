"use strict";
/*
 *  Defined the Mongoose Schema and return a Model for a Surrogate
 */
/* jshint node: true */

var mongoose = require('mongoose');

var surrogateSchema = new mongoose.Schema({
    id: String,
    file: String,
    manuscript: String, // Manuscript ID
    folio: String,
    citation: String
});


// the schema is useless so far
// we need to create a model using it
var Surrogate = mongoose.model('Surrogate', surrogateSchema);

// make this available to our persons in our Node applications
module.exports = Surrogate;