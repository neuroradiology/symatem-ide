OntologyEditor = require './OntologyEditor.js'
{CompositeDisposable} = require 'atom'

module.exports = SymatemIde =
  element: null
  panel: null
  symatemIdeView: null
  subscriptions: null

  activate: (state) ->
    @element = document.createElement('div')
    @element.setAttribute('id', 'OntologyEditor')
    @panel = atom.workspace.addBottomPanel(item:@element, visible:true)
    @symatemIdeView = new OntologyEditor(@element, state.symatemVisualizerState)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'symatem-ide:toggle': => @toggle()

  deactivate: ->
    @element.remove()
    @panel.destroy()
    @subscriptions.dispose()

  serialize: ->
    symatemVisualizerState: null

  toggle: ->
    if @panel.isVisible()
      @panel.hide()
    else
      @panel.show()
