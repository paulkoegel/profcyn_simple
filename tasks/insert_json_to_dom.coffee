'use strict'
module.exports = (grunt) ->
  grunt.registerMultiTask 'insert_json_to_dom', 'Inserts projects.json in the DOM so we save a request (and can serve the app via dropbox).', ->
    fs = require('fs')

    jsonData = fs.readFileSync(@data.jsonFile, 'utf8')
    # yes, first we need FOUR backslashes and then THREE - no idea why, we're looking for \"
    jsonData = jsonData.replace new RegExp('<img src=\\\\"', 'g'),
                                '<div class=\\\"m-slide--image\\\" data-url=\\\"'

    src = fs.readFileSync(@data.src, 'utf8')
    src = src.replace new RegExp('BB\\.myProjects = \\[\\]', 'g'),
                      'BB.myProjects = ' + jsonData

    fs.writeFileSync @data.dest, src, 'utf8'
