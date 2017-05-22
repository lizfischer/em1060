"use strict";

/* jshint node: true */
/* global Promise */

/*
 * This Node.js program loads the CS142 Project #7 model data into Mongoose defined objects
 * in a MongoDB database. It can be run with the command:
 *     node loadDatabase.js
 * be sure to have an instance of the MongoDB running on the localhost.
 *
 * This script loads the data into the MongoDB database named 'cs142project6'.  In loads
 * into collections named User and Photos. The Comments are added in the Photos of the
 * comments. Any previous objects in those collections is discarded.
 *
 * NOTE: This scripts uses Promise abstraction for handling the async calls to
 * the database. We are not teaching Promises in CS142 so strongly suggest you don't
 * use them in your solution.
 *
 */

// Get the magic models we used in the previous projects.
var em1060models = require('./modelData/em1060Data.js').em1060models;

// We use the Mongoose to define the schema stored in MongoDB.
var mongoose = require('mongoose');

mongoose.connect('mongodb://localhost/em1060');

// Load the Mongoose schema for User and Photo
var Author = require('./schema/author.js');
var Manuscript = require('./schema/manuscript.js');
var SchemaInfo = require('./schema/schemaInfo.js');

var versionString = '1.0';

// We start by removing anything existing in the collections.
var removePromises = [Author.remove({}), Manuscript.remove({}), SchemaInfo.remove({})];

Promise.all(removePromises).then(function () {

    // Load the users into the User. Mongo assigns ids to objects so we record
    // the assigned '_id' back into the cs142model.userListModels so we have it
    // later in the script.

    var authorModels = em1060models.personListModel();
    var mapFakeId2RealId = {}; // Map from fake id to real Mongo _id
    var authorPromises = authorModels.map(function (user) {
        return Author.create({
            first_name: user.first_name,
            last_name: user.last_name,
            location: user.location,
            description: user.description,
            occupation: user.occupation,
            login_name: user.login_name || user.last_name.toLowerCase(),
            password: user.password || 'weak'
        }, function (err, userObj) {
            if (err) {
                console.error('Error create user', err);
            } else {
                mapFakeId2RealId[user._id] = userObj._id;
                user.objectID = userObj._id;
                console.log('Adding user:', user.first_name + ' ' + user.last_name, ' with ID ',
                    user.objectID);
            }
        });
    });


    var allPromises = Promise.all(userPromises).then(function () {
        // Once we've loaded all the users into the User collection we add all the photos. Note
        // that the user_id of the photo is the MongoDB assigned id in the User object.
        var photoModels = [];
        var userIDs = Object.keys(mapFakeId2RealId);
        for (var i = 0; i < userIDs.length; i++) {
            photoModels = photoModels.concat(cs142models.photoOfUserModel(userIDs[i]));
        }
        var photoPromises = photoModels.map(function (photo) {
            return Manuscript.create({
                file_name: photo.file_name,
                date_time: photo.date_time,
                comment_count: photo.comment_count,
                mentions: photo.mentions,
                user_id: mapFakeId2RealId[photo.user_id]
            }, function (err, photoObj) {
                if (err) {
                    console.error('Error create user', err);
                } else {

                    photo.objectID = photoObj._id;
                    if (photo.comments) {
                        photo.comments.forEach(function (comment) {
                            photoObj.comments.push({
                                comment: comment.comment,
                                date_time: comment.date_time,
                                user_id: comment.user.objectID
                            });
                            console.log("Adding comment of length %d by user %s to photo %s",
                                comment.comment.length,
                                comment.user.objectID,
                                photo.file_name);
                        });
                    }
                    photoObj.save();
                    console.log('Adding photo:', photo._id, ' ', photo.file_name, ' of user ID ', photoObj.user_id);
                }
            });
        });
        return Promise.all(photoPromises).then(function () {
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

    allPromises.then(function () {
        mongoose.disconnect();
    });
});
