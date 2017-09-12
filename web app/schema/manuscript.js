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

/* Currently Unused -- change in future if necessary
var itemSchema = new mongoose.Schema({ // Items are specific to a manuscript.
    id: String,     // DATABASE ID identifying this item
    ms: String,     // Manuscript ID
    place: String,
    text: [String],     // Array of text IDs
    language: [String],
    versions: [{description: String, id: String}], // Manuscript IDs

    bib: [{ 
        work: String,
        pg: String
    }]
});*/

var manuscriptSchema = new mongoose.Schema({
    id: String,     // DATABASE ID identifying this manuscript.
    author: [String], // People who created the listing TODO: Currently unused
    city: String,
    repository: String,
    collect: String, //collection-- shortened because "collection" is a reserved term in Mongoose
    shelfmark: String, // Shelfmark e.g. Brussels, Biblioteque Royale, 8558-63
    ker: String,
    title: String,      // Common description of content
    date: String,       // Date of the manuscript
    summary: String,    // Summary of the manuscript
    items: [{ // Items are specific to a manuscript.
        _id: String,     // DATABASE ID identifying this item
        locus: String,
        text: String,     // Array of text IDs
        notes:[{head:String, body:String}],
        bib: [{ 
            work: String,
            page: String
        }]
    }], // Array of items
    objectDesc:{    // Object Description
        form: String,
        support: String,
        extent: String,
        foliation: String,
        collation: String,
        condition: String,
        layout: String,
        note: String
    },
    handDesc: {num: Number, summary: String, hands: [handSchema]},  // Description of hands
    decorDesc: String,  //Decoration description
    additions: [String],    // Additions
    bindingDesc: String,    // Binding Description
    accompanying: String,     // Accompanying Material
    history: { origin: String, provenance: String, acquisition: String },
    admin: String,  // Administrative Information
    surrogates: Boolean, //TODO change to actual surrogate link
    bib: [String],     // Bibliography
    places: [String], // Places mentioned in the text TODO: currently unused
    names: [String],     // Names mentioned in the text TODO: currently unused
    localisation: String // TODO: currently unused
});

// the schema is useless so far
// we need to create a model using it
var Manuscript = mongoose.model('Manuscript', manuscriptSchema);

// make this available to our persons in our Node applications
module.exports = Manuscript;