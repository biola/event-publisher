# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery-ui
#= require biola-frontend-toolkit
#= require responsive-tabs
#= require redactor
#= require bootstrap-tagsinput
#= require_tree .

$("#editTabNav a").click (e) ->
  window.location.replace @hash
  e.preventDefault()
  $(this).tab "show"
  return

# on load of the page: switch to the currently selected tab
hash = window.location.hash
$("#editTabNav a[href=\"" + hash + "\"]").tab "show"

# on forward or back button: switch to the currently selected tab
$(window).on "popstate", (event) ->
  hash = window.location.hash
  $("#editTabNav a[href=\"" + hash + "\"]").tab "show"
  return

# See https://github.com/openam/bootstrap-responsive-tabs for information on using responsive-tabs.js
fakewaffle.responsiveTabs ["xs"]
