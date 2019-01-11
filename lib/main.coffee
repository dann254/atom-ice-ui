themeName = 'atom-ice-ui'
$ = jQuery = require 'jquery'
root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe "#{themeName}.editorTitle", (value) ->
      renameProject(value)
    atom.config.observe "#{themeName}.treeViewBackground", (value) ->
      updateTreeView(value)
    atom.config.observe "#{themeName}.scrollBars", (value) ->
      updateScrollBars(value)
    atom.config.onDidChange("#{themeName}.scrollBars", () -> popNotification())

  deactivate: ->
    unsetProjectName()

popNotification = ()->
  atom.notifications.addSuccess("Scrollbar setting changed, Reload atom for changes to take effect", {buttons: [{ClassName:"btn btn-success", onDidClick: reloadAtom, text: "Reload"}], dismissable: true})

reloadAtom = () ->
  atom.reload()

updateScrollBars = (value) ->
  if value == true
    $('body').addClass('scrollbars')

renameProject = (editorTitle) ->
  if editorTitle == "Heartbeat"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="pulse"></div>"""
  else if editorTitle == "Pulse Circles"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="circle one"></div>
              <div class="circle two"></div>
              <div class="circle three"></div>"""
  else if editorTitle == "Gooey Blobs *"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class = "gooey-blob">
	  <div class = "blob-1"></div>
	  <div class = "blob-2"></div>
    </div>"""

  else if editorTitle == "Dash Load"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="dasher">
    <div class="dash uno"></div>
    <div class="dash dos"></div>
    <div class="dash tres"></div>
    <div class="dash cuatro"></div>
    </div>"""

  else if editorTitle == "Home"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-home"></span>"""

  else if editorTitle == "Octoface"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-octoface"></span>"""

  else if editorTitle == "Smiley"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-smiley"></span>"""

  else if editorTitle == "Terminal"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-terminal"></span>"""

  else if editorTitle == "Globe"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-globe"></span>"""

  else if editorTitle == "GistSecret"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-gist-secret"></span>"""

  else if editorTitle == "Bug"
    $('.tab.active[data-type="TreeView"] > .title').html """<span class="icon icon-bug"></span>"""

  else if editorTitle == "Classic"
    $('.tab.active[data-type="TreeView"] > .title').text("Project")

updateTreeView = (background) ->
  clearTreeViewBackground()
  if background == "Brick"
    $('.tree-view').addClass('brick')

  else if background == "Honeycomb-small"
    $('.tree-view').addClass('honeycomb-small')

  else if background == "Brick-weave"
    $('.tree-view').addClass('brick-weave')

  else if background == "Honeycomb"
    $('.tree-view').addClass('honeycomb')

  else if background == "Checkers"
    $('.tree-view').addClass('checkers')

  else if background == "Weave"
    $('.tree-view').addClass('weave')

  else if background == "Table-cloth"
    $('.tree-view').addClass('table-cloth')

  else if background == "Blueprint"
    $('.tree-view').addClass('blueprint')

  else if background == "Classic"
    $('tree-view').addClass('bb-black')

clearTreeViewBackground = ->
  $('.tree-view').removeClass('brick')
  $('.tree-view').removeClass('honeycomb')
  $('.tree-view').removeClass('bb-black')
  $('.tree-view').removeClass('honeycomb-small')
  $('.tree-view').removeClass('brick-weave')
  $('.tree-view').removeClass('checkers')
  $('.tree-view').removeClass('weave')
  $('.tree-view').removeClass('table-cloth')
  $('.tree-view').removeClass('blueprint')



unsetProjectName = ->
  $('.tab.active[data-type="TreeView"] > .title').text('Projectx')
