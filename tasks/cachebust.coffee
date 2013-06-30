'use strict'
module.exports = (grunt) ->
  grunt.registerMultiTask 'cachebust', 'Appends an SHA1 to the filename for cache busting.', ->
    fs = require('fs')
    path = require('path')
    crypto = require('crypto')
    replacements = []
    @data.files.forEach (filename) ->
      content = fs.readFileSync(filename, 'utf8')
      sha1Sum = crypto.createHash('sha1').update(content).digest('hex')
      extension = filename.substring(filename.indexOf('.'))
      newFilename = filename.replace(extension, '-' + sha1Sum + extension)
      console.log filename, extension, '>', newFilename
      replacements.push
        oldName: path.basename(filename)
        newName: path.basename(newFilename)

      fs.writeFileSync newFilename, content, 'utf8'

    src = fs.readFileSync(@data.src, 'utf8')
    replacements.forEach (replacement) ->
      grunt.log.writeln 'Replacing ' + replacement.oldName + ' with ' + replacement.newName
      src = src.replace(new RegExp(replacement.oldName, 'g'), replacement.newName)

    fs.writeFileSync @data.dest, src, 'utf8'
