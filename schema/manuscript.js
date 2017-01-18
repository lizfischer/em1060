"use strict";
/*
 *  Defined the Mongoose Schema and return a Model for a Manuscript
 */
/* jshint node: true */

var mongoose = require('mongoose');

var handSchema = new mongoose.Schema({
    id: String,     // DATABASE ID identifying this hand
    scope: String,
    desc: String,
    summary: [String],
    abbr: [String],
    punct: [String],
    lig: [String]
});

var itemSchema = new mongoose.Schema({
    id: String,     // DATABASE ID identifying this item
    folio: String,
    text: [String],     // Array of text IDs
    language: [String],
    versions: [String], // Manuscript IDs TODO: change to item IDs
    bib: [{ // TODO: make bibliography schema
        work: String,
        pg: String
    }]
});

var manuscriptSchema = new mongoose.Schema({
    id: String,     // DATABASE ID identifying this manuscript.
    author: [String], // People who created the listing
    city: String,
    repository: String,
    collection: String,
    shelfmark: String, // Shelfmark e.g. Brussels, Biblioteque Royale, 8558-63
    date: String,       // Date of the manuscript
    summary: String,    // Summary of the manuscript
    items: [itemSchema], // Array of items
    physicalDesc: {
        objectDesc:{    // Object Description
            form: String,
            support: String,
            extent: String,
            foliation: String,
            collation: String,
            condition: String,
            layout: String
        },
        handDesc: {num: Number, summary: String, hands: [handSchema]},  // Description of hands
        decorDesc: String,  //Decoration description
        additions: [String],    // Additions
        bindingDesc: String,    // Binding Description
        accMaterial: String     // Accompanying Material
    },
    history: { origin: String, provenance: String, acquisition: String },
    admin: String,  // Administrative Information
    surrogates: String,
    bib: String,     // Bibliography
    places: [String], // Places mentioned in the text
    names: [String]     // Names mentioned in the text
});

// the schema is useless so far
// we need to create a model using it
var Manuscript = mongoose.model('Manuscript', manuscriptSchema);

// make this available to our persons in our Node applications
module.exports = Manuscript;
