local appName, JodsUI = ...
local AceLocale = LibStub ('AceLocale-3.0')
---@class MyAddonLocale
local LocalisationData = AceLocale:NewLocale(appName, "enUS",true)

if LocalisationData then

-- Options
LocalisationData["Enable"] = "Enable"
LocalisationData["Welcome"] = "Welcome to the installation for JodsUI"
LocalisationData["WelcomeTitle"] = "Welcome"
LocalisationData["WelcomeText"] = "This installation process will guide you through a few steps and apply settings to your current ElvUI profile. If you want to be able to go back to your original settings then create a new profile before going through this installation process."
LocalisationData["InstallGuide"] = "Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button."
LocalisationData["SkipProcess"] = "Skip Process"
LocalisationData["Layouts"] = "Layouts"
LocalisationData["LayoutsText"] = "These are the Addon layouts that are available. Please click the buttons below to apply the layouts of your choosing."
LocalisationData["ImportanceHigh"] = "Importance: |cff07D400High|r"
LocalisationData["ImportanceMedium"] = "Importance: |cffFFD100Medium|r"
LocalisationData["ImportanceLow"] = "Importance: |cffFF0000Low|r"
LocalisationData["WeakAurasText"] = "These are the WeakAuras that are available. Please click the buttons below to install the WeakAuras of your choosing."
LocalisationData["ClassWeakAuras"] = "Class WeakAuras"
LocalisationData["ClassWeakAurasText"] = "These are the Class WeakAuras. Please click the button below to install all Class auras."
LocalisationData["InstallationComplete"] = "Installation Complete"
LocalisationData["InstallationCompleteText"] = "You have completed the installation process."
LocalisationData["Finalize"] = "Please click the button below in order to finalize the process and automatically reload your UI."
LocalisationData["GeneralWeakAuras"] = "General WeakAuras"
LocalisationData["InstallationComplete"] = "Installation Complete"
LocalisationData["InstallationGuideDesc"] = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below."
--[[
LocalisationData[""] = ""
LocalisationData[""] = ""
]]

JodsUI.localisation = LocalisationData
end