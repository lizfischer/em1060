"use strict";

(function() {
        // Create fake test Schema
        var schemaInfo = {
            load_date_time: "Fri Apr 29 2016 01:45:15 GMT-0700 (PDT)",
            __v: 0,
            _id: "57231f1b30e4351f4e9f4bf6"
        };

    var mss = [];
    var fs = require('fs');
    var msFiles = [];
    fs.readdir('./data/manuscripts/', function (err, items) {
        for (var i = 0; i < items.length; i++) {
            var file = '../data/manuscripts/' + items[i];
            mss[i] = require(file);
        }
    });


    var manuscriptListModel = function () {
        return mss;
    };

    var manuscriptModel = function(msID){
        for (var i = 0; i < mss.length; i ++){
            if (mss[i].id === msID){
                return mss[i];
            }
        }
        return null;
    };

    var bibEntries = require("../data/bib.json");
    var bibListModel = function(){
        return bibEntries;
    };
    var bibModel = function(bibID){
        for (var i = 0; i < bibEntries.length; i++){
            if (bibEntries[i]._id === bibID){
                return bibEntries[i];
            }
        }
        return null;
    };

    var texts = require("../data/texts.json");
    var textModel = function () {
        return texts;
    };
    
    var schemaModel = function (){
        return schemaInfo;
    };

    var em1060models = {
        manuscriptListModel: manuscriptListModel,
        manuscriptModel: manuscriptModel,
        bibListModel: bibListModel,
        textListModel: textModel,
        bibModel: bibModel,
        schemaInfo: schemaModel
    };


    if( typeof exports !== 'undefined' ) {
        // We're being loaded by the Node.js module loader ('require') so we use its
        // conventions of returning the object in exports.
        exports.em1060models = em1060models;
    } else {
        // We're not in the Note.js module loader so we assume we're being loaded
        // by the browser into the DOM.
        window.em1060models = em1060models;
    }
})();