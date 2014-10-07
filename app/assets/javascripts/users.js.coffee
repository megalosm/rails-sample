# For user info panel in application.html.erb
# Show user info feature.
window.users = {}
window.users.showUserInfoPanel = ->
  $userName = $('#user_display_name')
  $userInfoPanel = $('#user_info_panel')
  $userInfoPanel.hide()

  $(document).mouseup (e) ->
    if (!$userName.is(e.target) && !$userInfoPanel.is(e.target) && $userInfoPanel.has(e.target).length == 0)
      $userInfoPanel.hide()

  $userName.click ->
    if $userInfoPanel.is(':hidden')
      $userInfoPanel.show()
    else
      $userInfoPanel.hide()