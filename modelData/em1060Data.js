"use strict";
/* jshint node: true */
/*
 * Model data for CS142 Project #5 - the photo sharing site.
 * This module returns an object called cs142Models with the following functions:
 *
 * cs142Models.personListModel - A function that returns the list of users on the system. The
 * list is returned as an array of objects containing:
 *   _id  (string) - The ID of the user.
 *   first_name (string) - The first name of the user.
 *   last_name (string) - The last name of the user.
 *   location (string) - The location of the user.
 *   description (string) - A brief user description.
 *   occupation (string) - The occupation of the user.
 *
 * cs142Models.personModel - A function that returns the info of the specified user. Called
 * with an user ID (id), the function returns n object containing:
 *   _id  (string) - The ID of the user.
 *   first_name (string) - The first name of the user.
 *   last_name (string) - The last name of the user.
 *   location (string) - The location of the user.
 *   description (string) - A brief user description.
 *   occupation (string) - The occupation of the user.
 *
 * cs142Models.schemaModel - A function that returns the test info from the fake schema.
 *                           The function returns an object containing:
 *   _id (string) - The ID of the schema
 *   __v (number) - The version number
 *   load_date_time (date) - The date the schema was made in ISO format.
 *
 *
 */
(function() {
    // Create fake test Schema
    var schemaInfo = {
        load_date_time: "Fri Apr 29 2016 01:45:15 GMT-0700 (PDT)",
        __v: 0,
        _id: "57231f1b30e4351f4e9f4bf6"
    };

    // Create people.

    /*var treharne = {_id: "57231f1a30e4351f4e9f4bd7", first_name: "", last_name: "",
        title: "", department: "",
        email: "", photo: "", website: "",
        description: "", role: ""}; */

    var treharne = {_id: "57231f1a30e4351f4e9f4bd7", first_name: "Elaine", last_name: "Treharne",
        title: "Professor", department: "School of English, University of Leicester, University Road Leicester, LE1 7RH",
        email: "etreharne@mac.com", photo: "treharne.jpg", website: "https://english.stanford.edu/people/elaine-treharne",
        description: "Elaine Treharne, FSA, FRHistS, is Professor of English and Co-Director of the Center for Medieval " +
        "and Early Modern Studies at Stanford University. She has written or edited twenty-five books, and has written " +
        "over fifty articles on Old and MIddle English literature and its manuscript contexts. Most recently, she has " +
        "published Living Through Conquest: The Politics of Early English 1060 to 1220 (OUP, 2012) and The Oxford " +
        "Handbook of Medieval English Literature (with Greg Walker, OUP, 2010). Professor Treharne is a Trustee of the " +
        "English Association, the General Editor of Oxford University Press' Oxford Textual Perspectives series, and of " +
        "Essays and Studies; she is medieval editor for Review of English Studies. She is a Co-editor of the new " +
        "Blackwell Encyclopaedia of Book History, and is finishing a monograph entitled The Sensual Book.",
        role: "Principal Investigator and Director"};

    var swan = {_id: "57231f1a30e4351f4e9f4bd8", first_name: "Mary", last_name: "Swan",
        title: "Dr", department: "Director of Studies, Institute for Medieval Studies, Parkinson Building, 405, " +
                                "University of Leeds, Leeds, LS2 9JT",
        email: "", photo: "swan.jpg", website: "",
        description: "Mary's main research focus is textual transmission from the tenth to twelfth centuries. She is " +
        "working on Making Ælfric's Audience, a book which will explore how the works of this late Anglo-Saxon " +
        "ecclesiastical writer seek to produce a particular kind of reading subject, and also on an edition of Lambeth " +
        "Palace 487, one of the manuscripts to be studied by the Project. She has published on a range of topics related " +
        "to textual culture, including concepts of authorship, homiletic prose, and traditions of Veronica, and on later " +
        "medieval English women mystics. Mary is Second Vice-President of the International Society of Anglo-Saxonists " +
        "and a member of the Committee of the Association of Teachers of Old English in Britain and Ireland. She is " +
        "particularly interested in fostering interdisciplinary Medieval Studies.",
        role: "Co-applicant and Director"};

    var people = [treharne, swan];

    var peopleListModel = function() {
        return people;
    };

    var personModel = function(personID) {
        for (var i = 0; i < people.length; i++) {
            if (people[i]._id === personID) {
                return people[i];
            }
        }
        return null;
    };

    var schemaModel = function() {
        return schemaInfo;
    };

    var em1060models =  {
        personListModel: peopleListModel,
        personModel: personModel,
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
