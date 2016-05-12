fs = require 'fs'
path = require 'path'

describe 'TypeScript grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-typescript-html')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.ts')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.ts'

  it 'tokenizes template string', ->
    lines = grammar.tokenizeLines('let template = `<head>`')
    expect(lines[0][0]).toEqual value: 'let template = `<head>`', scopes: ['source.ts']
