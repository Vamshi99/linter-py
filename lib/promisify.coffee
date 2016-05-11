fs = require 'fs'
mkdirp = require 'mkdirp'

exports.readdir = (dir) ->
    new Promise (resolve, reject) ->
        fs.readdir dir, (err, files) ->
            return reject err if err
            resolve files

exports.stat = (file) ->
    new Promise (resolve, reject) ->
        fs.stat file, (err, stats) ->
            return reject err if err
            resolve stats

exports.mkdir = (folder) ->
    new Promise (resolve, reject) ->
        fs.mkdir folder, 0o750, (err) ->
            return reject(err) if err
            resolve()

exports.link = (to, linkname) ->
    new Promise (resolve, reject) ->
        fs.link to, linkname, (err) ->
            return reject(err) if err
            resolve()

exports.unlink = (linkname) ->
    new Promise (resolve, reject) ->
        fs.unlink linkname, (err) ->
            return reject(err) if err
            resolve()

exports.writeFile = (file, text) ->
    new Promise (resolve, reject) ->
        fs.writeFile file, text, (err) ->
            return reject(err) if err
            resolve()

exports.access = (file, mode) ->
    new Promise (resolve, reject) ->
        fs.access file, mode, (err) ->
            return reject(err) if err
            resolve()


exports.mkdirp = (dir) ->
    new Promise (resolve, reject) ->
        mkdirp dir, (err) ->
            return reject(err) if err
            resolve()
