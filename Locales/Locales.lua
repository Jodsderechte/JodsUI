local appName, JodsUI = ...
local AceLocale = LibStub ('AceLocale-3.0')
local currentLocale = LibStub ('AceLocale-3.0'):GetLocale (appName, true)---@type MyAddonLocale
JodsUI.getLocalisation = function(Object)
      return currentLocale[Object]

end
