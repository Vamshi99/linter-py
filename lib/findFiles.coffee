path = require 'path'
{readdir, stat} = require './promisify'

exports.findFiles = (root) -> new Promise (resolve, reject) ->
    readdir root
    .then (files) ->

        promises = []
        for f in files

            promises.push new Promise (resolve, reject) ->
                filepath = path.join root, f
                stat filepath
                .then (stats) ->
                    resolve {'path': filepath, 'stats': stats}
                .catch (err) -> reject err

        Promise.all(promises).then (files) ->
            resolve files
        .catch (err) -> reject err
    .catch (err) -> reject err
