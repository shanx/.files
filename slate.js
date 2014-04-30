# This is the default .slate file.
# https://raw.github.com/jigish/slate/master/Slate/default.slate

# Resize Bindings
bind "right", ["alt"], -> resize  0.1,  0.0
bind "left",  ["alt"], -> resize -0.1,  0.0
bind "up",    ["alt"], -> resize  0.0, -0.1
bind "down",  ["alt"], -> resize  0.0,  0.1

bind "right", ["ctrl", "alt"], -> resizeFromBotRight -0.1,  0.0
bind "left",  ["ctrl", "alt"], -> resizeFromBotRight  0.1,  0.0
bind "up",    ["ctrl", "alt"], -> resizeFromBotRight  0.0,  0.1
bind "down",  ["ctrl", "alt"], -> resizeFromBotRight  0.0, -0.1

# Push Bindings
bind "right", ["cmd", "ctrl"], -> moveWindow (frame) ->
  frame.x += 2 * (frame.w / 3)
  frame.w /= 3

bind "left", ["cmd", "ctrl"], -> moveWindow (frame) ->
  frame.w /= 3

bind "up",   ["cmd", "ctrl"], -> moveWindow (frame) ->
  frame.h /= 2

bind "down", ["cmd", "ctrl"], -> moveWindow (frame) ->
  frame.y += frame.h / 2
  frame.h /= 2

# Nudge Bindings
bind "right", ["shift", "alt"], -> nudge  0.1,  0.0
bind "left",  ["shift", "alt"], -> nudge -0.1,  0.0
bind "up",    ["shift", "alt"], -> nudge  0.0, -0.1
bind "down",  ["shift", "alt"], -> nudge  0.0,  0.1

# Throw Bindings
bind "right", ["ctrl", "alt"], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().nextScreen()

bind "left", ["ctrl", "alt", "cmd"], ->
  win = api.focusedWindow()
  moveToScreen win, win.screen().previousScreen()

# Focus Bindings
bind "left",  ["cmd"], -> 
  api.focusedWindow().focusWindowLeft()

bind "right", ["cmd"], -> 
  api.focusedWindow().focusWindowRight()

bind "up",    ["cmd"], -> 
  api.focusedWindow().focusWindowUp()

bind "down",  ["cmd"], -> 
  api.focusedWindow().focusWindowDown()

resize = (x, y) ->
  win = api.focusedWindow()
  frame = win.frame()
  frame.w *= (1 + x)
  frame.h *= (1 + y)
  win.setFrame frame

resizeFromBotRight = (x, y) ->
  win = api.focusedWindow()
  frame = win.frame()
  frame.x -= (frame.w * x)
  frame.y -= (frame.h * y)
  frame.w *= (1 + x)
  frame.h *= (1 + y)    
  win.setFrame frame

nudge = (x, y) ->
  win = api.focusedWindow()
  frame = win.frame()
  frame.x *= (1 + x)
  frame.y *= (1 + y)
  win.setFrame frame

moveWindow = (fn) ->
  win = api.focusedWindow()
  frame = win.screen().frameWithoutDockOrMenu()
  fn frame if fn
  win.setFrame frame

moveToScreen = (win, screen) ->
  return if screen.null?

  frame = win.frame()
  oldScreenRect = win.screen().frameWithoutDockOrMenu()
  newScreenRect = screen.frameWithoutDockOrMenu()

  xRatio = newScreenRect.w  / oldScreenRect.w
  yRatio = newScreenRect.h / oldScreenRect.h

  win.setFrame {
    x: Math.round((frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x
    y: Math.round((frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y
    w: Math.round(frame.w * xRatio)
    h: Math.round(frame.h * yRatio)
  }
