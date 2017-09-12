"use strict";
/*
 *  Defined the Mongoose Schema and return a Model for bibliography
 */

var mongoose = require('mongoose');

var bibSchema = new mongoose.Schema({
    id: String, // id
    name: String, // Last, First 
    year: Number, // year
    citation: String // HTML citation (not including primary name)
});

var Bib = mongoose.model('Bib', bibSchema);
module.exports = Bib;

