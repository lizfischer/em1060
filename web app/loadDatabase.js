"use strict";

var em1060models = require("./modelData/em1060Data").em1060models;
var mongoose = require('mongoose');
//var dbURL = "mongodb://localhost/em1060"; //for loading the local database
var dbURL = "mongodb://admin:em1060@35.167.222.169:27017/em1060"; //for loading the production (live) database
mongoose.connect(dbURL);

var Manuscript = require('./schema/manuscript.js');
var Bib = require('./schema/bib.js');
var Text = require('./schema/text.js')

var versionString = '1.0';

var removePromises = [Manuscript.remove(), Bib.remove(), Text.remove()];

Promise.all(removePromises).then(function () {
    var manuscriptModels = em1060models.manuscriptListModel();
    var bibModel = em1060models.bibListModel();
    var textModel = em1060models.textListModel();
    
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

    var textPromises = textModel.map(function(text){
        return Text.create({
            cameron: text.cameron,
            title: text.title,
            supplied: text.supplied
        }, function(err, textObj){
            if (err) {
                console.error('Error create text entry', err);
            } else {
                // Set the unique ID of the object. We use the MongoDB generated _id for now
                // but we keep it distinct from the MongoDB ID so we can go to something
                // prettier in the future since these show up in URLs, etc.
                textObj.save();
                console.log('Adding text entry with ID ',
                    textObj.cameron);
            }
        });
    });

    var allPromises = Promise.all(manuscriptPromises).then(function() {
        return Promise.all(bibPromises).then(function(){
            return Promise.all(textPromises);
        });
    });

    allPromises.then(function (){
        console.log("Disconnected");
        mongoose.disconnect();
    });
});
