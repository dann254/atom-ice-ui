themeName = 'atom-ice-ui'
$ = jQuery = require 'jquery'
root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe "#{themeName}.editorTitle", (value) ->
      renameProject(value)
    atom.config.observe "#{themeName}.treeViewBackground", (value) ->
      updateTreeView(value)

  deactivate: ->
    unsetProjectName()
    unsetProjectName()

renameProject = (editorTitle) ->
  if editorTitle == "Heartbeat"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="pulse"></div>"""
  else if editorTitle == "PulseCircles"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="circle one"></div>
              <div class="circle two"></div>
              <div class="circle three"></div>"""
  else if editorTitle == "Classic"
    $('.tab.active[data-type="TreeView"] > .title').text("Project")

updateTreeView = (background) ->
  if background == "Brick"
    $('.tree-view').removeClass('honeycomb')
    $('.tree-view').removeClass('honeycomb-small')
    $('tree-view').removeClass('bb-black')

    $('.tree-view').addClass('brick')

  else if background == "Honeycomb-small"
    $('.tree-view').removeClass('brick')
    $('.tree-view').removeClass('honeycomb')
    $('tree-view').removeClass('bb-black')

    $('.tree-view').addClass('honeycomb-small')

  else if background == "Honeycomb"
    $('.tree-view').removeClass('brick')
    $('.tree-view').removeClass('honeycomb-small')
    $('tree-view').removeClass('bb-black')

    $('.tree-view').addClass('honeycomb')

  else if background == "Classic"
    $('.tree-view').removeClass('brick')
    $('.tree-view').removeClass('honeycomb')
    $('.tree-view').removeClass('honeycomb-small')

    $('tree-view').addClass('bb-black')

unsetProjectName = ->
  $('.tab.active[data-type="TreeView"] > .title').text('Projectx')
