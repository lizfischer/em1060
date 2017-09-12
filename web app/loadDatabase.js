"use strict";

var em1060models = require("./modelData/em1060Data").em1060models;
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/em1060');

var Manuscript = require('./schema/manuscript.js');
var Bib = require('./schema/bib.js');

var versionString = '1.0';

var removePromises = [Manuscript.remove(), Bib.remove()];

Promise.all(removePromises).then(function () {
    var manuscriptModels = em1060models.manuscriptListModel();
    var bibModel = em1060models.bibListModel();
    
    
    var manuscriptPromises = manuscriptModels.map(function (ms){
        return Manuscript.create({
            id: ms.id,     // DATABASE ID identifying this manuscript.
            author: ms.author, // People who created the listing
            city: ms.city,
            repository: ms.repository,
            collection: ms.collection,
            shelfmark: ms.shelfmark, // Shelfmark e.g. Brussels, Biblioteque Royale, 8558-63
            title: ms.title,      // Common description of content
            date: ms.date,       // Date of the manuscript
            summary: ms.summary,
            items: ms.items,
            objectDesc: ms.objectDesc,
            handDesc: ms.handDesc,
            decorDesc: ms.decoration,
            additions: ms.additions,
            bindingDesc: ms.binding,
            history: ms.history,
            admin: ms.admin,
            surrogates: ms.surrogates,
            bib: ms.bib
        }, function(err, msObj){
           if (err) {
               console.error("Error create ms", err);
           } else {
               msObj.save();
               console.log("Adding ms", ms.id);
           }
        });
    });

    var allPromises = Promise.all(manuscriptPromises).then(function() {
        var bibPromises = bibModel.map(function(bibEntry){
            return Bib.create({
                id: bibEntry.id,
                name: bibEntry.name,
                year: bibEntry.year,
                citation: bibEntry.citation
            }, function(err, bibObj){
                if (err) {
                    console.error('Error create bib entry', err);
                } else {
                    // Set the unique ID of the object. We use the MongoDB generated _id for now
                    // but we keep it distinct from the MongoDB ID so we can go to something
                    // prettier in the future since these show up in URLs, etc.
                    bibObj.save();
                    console.log('Adding bib entry with ID ',
                        bibEntry.id);
                } 
            });
        });
        
        return Promise.all(bibPromises).then(function(){
            // Create the SchemaInfo object
            return SchemaInfo.create({
                version: versionString
            }, function (err, schemaInfo) {
                if (err) {
                    console.error('Error create schemaInfo', err);
                } else {
                    console.log('SchemaInfo object created with version ', versionString);
                }
            });
        });
    });

    allPromises.then(function (){
        console.log("Disconnected");
        mongoose.disconnect();
    });
});
