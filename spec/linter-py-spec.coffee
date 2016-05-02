path = require 'path'

goodPath = path.join __dirname, 'files', 'good.py'
badPath = path.join __dirname, 'files', 'bad.py'
emptyPath = path.join __dirname, 'files', 'empty.py'
relativePath = path.join __dirname, 'files', 'relative.py'

describe 'Another Pylint provider for Linter', ->
    [thisPkg, lint] = []

    beforeEach ->
        waitsForPromise label: 'linter-py activation', ->
            Promise.all([
                atom.packages.activatePackage('linter-py').then (pkg) ->
                    thisPkg = pkg.mainModule
                    lint = thisPkg.provideLinter().lint
                ,
                atom.packages.activatePackage('language-python').then ->
                    atom.workspace.open goodPath
            ])

    it 'should be in the packages list', ->
        expect(atom.packages.isPackageLoaded 'linter-py').toBe true

    it 'should be an active package', ->
        expect(atom.packages.isPackageActive 'linter-py').toBe true

    describe 'checks bad.py and', ->
        editor = null
        beforeEach ->
            waitsForPromise ->
                atom.workspace.open(badPath).then (openEditor) ->
                    editor = openEditor

        it 'finds at least one message', ->
            waitsForPromise ->
                lint(editor).then (messages) ->
                    expect(messages.length).toBeGreaterThan 0


        it 'verifies that message', ->
            waitsForPromise ->
                lint(editor).then (messages) ->
                    expect(messages[0].type).toBeDefined()
                    expect(messages[0].type).toEqual('convention')
                    expect(messages[0].html).not.toBeDefined()
                    expect(messages[0].text).toBeDefined()
                    msg = 'C0111 Missing module docstring'
                    expect(messages[0].text).toEqual(msg)
                    expect(messages[0].filePath).toBeDefined()
                    regex = /.+spec[\\\/]files[\\\/]bad\.py$/
                    expect(messages[0].filePath).toMatch(regex)
                    expect(messages[0].range).toBeDefined()
                    expect(messages[0].range.length).toEqual(2)
                    expect(messages[0].range).toEqual([[0, 0], [0, 4]])

    describe 'checks empty.py and', ->
        editor = null
        beforeEach ->
            waitsForPromise ->
                atom.workspace.open(emptyPath).then (openEditor) ->
                    editor = openEditor

        it 'finds nothing wrong with an empty file', ->
            waitsForPromise ->
                atom.workspace.open(emptyPath).then ->
                    lint(editor).then (messages) ->
                        expect(messages.length).toEqual 0

    describe 'checks good.py and', ->
        editor = null
        beforeEach ->
            waitsForPromise ->
                atom.workspace.open(emptyPath).then (openEditor) ->
                    editor = openEditor

        it 'finds nothing wrong with a valid file', ->
            waitsForPromise ->
                atom.workspace.open(goodPath).then ->
                    lint(editor).then (messages) ->
                        expect(messages.length).toEqual 0

    describe 'checks relative.py and', ->
        editor = null
        beforeEach ->
            waitsForPromise ->
                atom.workspace.open(emptyPath).then (openEditor) ->
                    editor = openEditor

        it 'finds nothing wrong with relative import', ->
            waitsForPromise ->
                atom.workspace.open(relativePath).then ->
                    lint(editor).then (messages) ->
                        expect(messages.length).toEqual 0
