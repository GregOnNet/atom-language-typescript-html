fs = require 'fs'
path = require 'path'

describe 'CoffeeScript grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-typescript-html')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.ts')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.ts'
