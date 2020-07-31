local hyper = { "cmd", "alt", "ctrl", "shift" }hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "left", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "up", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "pad0", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToScreen(win:screen():next())
end)

hs.hotkey.bind(hyper, "right", function()
  local win = hs.window.focusedWindow();
  if not win then return end
  win:moveToUnit(hs.layout.right50)
end)

local applicationHotkeys = {
  s = 'Google Chrome',
  a = 'Hyper',
  c = 'Skype'
}for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "R", function()
  hs.reload()
end)

require "mocha"    -- Prevent Mac from sleeping
require "collage"  -- Clipboard management

hs.alert.show("Config loaded")
