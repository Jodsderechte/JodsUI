-- Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic
local GetAddOnMetadata = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata

-- Don't worry about this
local addon, JodsUI = ...
local Version = GetAddOnMetadata(addon, "Version")

-- Change this line and use a unique name for your plugin.
local MyPluginName = "JodsUI"

-- Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

-- Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

-- Create a new ElvUI module so ElvUI can handle initialization when ready
local mod = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

-- This function will hold your layout settings
local function SetupLayout(layout)

	-- PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE

	-- LAYOUT GOES HERE
	E.db["abb"]["enhancedGlobalFade"]["displayTriggers"]["hasFocus"] = false
	E.db["abb"]["enhancedGlobalFade"]["displayTriggers"]["hasTarget"] = false
	E.db["abb"]["enhancedGlobalFade"]["displayTriggers"]["inCombat"] = 0
	E.db["abb"]["enhancedGlobalFade"]["displayTriggers"]["notMaxHealth"] = false
	E.db["abb"]["enhancedGlobalFade"]["displayTriggers"]["playerCasting"] = false
	E.db["actionbar"]["bar1"]["buttonSize"] = 55
	E.db["actionbar"]["bar1"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar1"]["inheritGlobalFade"] = true
	E.db["actionbar"]["bar1"]["point"] = "TOPLEFT"
	E.db["actionbar"]["bar1"]["visibility"] = "[petbattle] hide; show\n\n"
	E.db["actionbar"]["bar2"]["backdrop"] = true
	E.db["actionbar"]["bar2"]["buttonSize"] = 21
	E.db["actionbar"]["bar2"]["counttext"] = false
	E.db["actionbar"]["bar2"]["enabled"] = true
	E.db["actionbar"]["bar2"]["mouseover"] = true
	E.db["actionbar"]["bar2"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar3"]["enabled"] = false
	E.db["actionbar"]["bar3"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar4"]["buttonSize"] = 21
	E.db["actionbar"]["bar4"]["buttonsPerRow"] = 12
	E.db["actionbar"]["bar4"]["mouseover"] = true
	E.db["actionbar"]["bar4"]["showGrid"] = false
	E.db["actionbar"]["bar4"]["visibility"] = "[petbattle] hide; show"
	E.db["actionbar"]["bar5"]["buttonSize"] = 38
	E.db["actionbar"]["bar5"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar5"]["buttons"] = 12
	E.db["actionbar"]["bar5"]["inheritGlobalFade"] = true
	E.db["actionbar"]["bar5"]["point"] = "TOPLEFT"
	E.db["actionbar"]["bar5"]["visibility"] = ""
	E.db["actionbar"]["bar6"]["buttonSize"] = 38
	E.db["actionbar"]["bar6"]["buttonSpacing"] = 1
	E.db["actionbar"]["bar6"]["buttonsPerRow"] = 6
	E.db["actionbar"]["bar6"]["enabled"] = true
	E.db["actionbar"]["bar6"]["inheritGlobalFade"] = true
	E.db["actionbar"]["bar6"]["point"] = "TOPLEFT"
	E.db["actionbar"]["bar6"]["visibility"] = ""
	E.db["actionbar"]["barPet"]["backdrop"] = false
	E.db["actionbar"]["barPet"]["buttonSize"] = 19
	E.db["actionbar"]["barPet"]["buttonSpacing"] = 4
	E.db["actionbar"]["barPet"]["buttonsPerRow"] = 10
	E.db["actionbar"]["globalFadeAlpha"] = 1
	E.db["actionbar"]["microbar"]["buttonHeight"] = 32
	E.db["actionbar"]["microbar"]["enabled"] = true
	E.db["actionbar"]["stanceBar"]["buttonSize"] = 22
	E.db["actionbar"]["stanceBar"]["buttonsPerRow"] = 2
	E.db["actionbar"]["stanceBar"]["point"] = "BOTTOMRIGHT"
	E.db["actionbar"]["zoneActionButton"]["scale"] = 0.68
	E.db["auras"]["buffs"]["horizontalSpacing"] = 2
	E.db["auras"]["buffs"]["size"] = 30
	E.db["auras"]["buffs"]["wrapAfter"] = 14
	E.db["auras"]["debuffs"]["horizontalSpacing"] = 2
	E.db["auras"]["debuffs"]["size"] = 30
	E.db["auras"]["debuffs"]["wrapAfter"] = 14
	E.db["bags"]["bagSize"] = 42
	E.db["bags"]["bagWidth"] = 474
	E.db["bags"]["bankSize"] = 42
	E.db["bags"]["bankWidth"] = 474
	E.db["bags"]["itemLevelCustomColorEnable"] = true
	E.db["bags"]["scrapIcon"] = true
	E.db["chat"]["font"] = "Vixar"
	E.db["chat"]["keywordSound"] = "Acoustic Guitar"
	E.db["chat"]["keywords"] = "Schmied,schmied"
	E.db["chat"]["panelHeight"] = 212
	E.db["chat"]["panelHeightRight"] = 212
	E.db["chat"]["panelWidth"] = 444
	E.db["chat"]["panelWidthRight"] = 444
	E.db["chat"]["separateSizes"] = true
	E.db["chat"]["socialQueueMessages"] = true
	E.db["chat"]["tabSelectorColor"]["b"] = 0.050980392156863
	E.db["chat"]["tabSelectorColor"]["g"] = 0.34117647058824
	E.db["chat"]["tabSelectorColor"]["r"] = 1
	E.db["chat"]["timeStampFormat"] = "%H:%M:%S "
	E.db["convertPages"] = true
	E.db["cooldown"]["enable"] = false
	E.db["databars"]["azerite"]["enable"] = false
	E.db["databars"]["honor"]["enable"] = false
	E.db["databars"]["threat"]["enable"] = false
	E.db["databars"]["threat"]["width"] = 270
	E.db["datatexts"]["panels"]["Astral keys"][1] = "LDB_AstralKeys"
	E.db["datatexts"]["panels"]["Astral keys"][2] = "LDB_SavedInstances"
	E.db["datatexts"]["panels"]["Astral keys"]["battleground"] = false
	E.db["datatexts"]["panels"]["Astral keys"]["enable"] = true
	E.db["datatexts"]["panels"]["BottomLeftMiniPanel"] = "MethodDungeonTools"
	E.db["datatexts"]["panels"]["Bugsack"][1] = "LDB_BugSack"
	E.db["datatexts"]["panels"]["Bugsack"][2] = ""
	E.db["datatexts"]["panels"]["Bugsack"][3] = ""
	E.db["datatexts"]["panels"]["Bugsack"]["battleground"] = false
	E.db["datatexts"]["panels"]["Bugsack"]["enable"] = true
	E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = ""
	E.db["datatexts"]["panels"]["LeftChatDataPanel"]["right"] = "Quick Join"
	E.db["datatexts"]["panels"]["Target Unitname"][1] = ""
	E.db["datatexts"]["panels"]["Target Unitname"][2] = ""
	E.db["datatexts"]["panels"]["Target Unitname"][3] = ""
	E.db["datatexts"]["panels"]["Target Unitname"]["battleground"] = false
	E.db["datatexts"]["panels"]["Target Unitname"]["enable"] = false
	E.db["datatexts"]["panels"]["TopRightMiniPanel"] = "BugSack"
	E.db["datatexts"]["panels"]["dungeontools minimap"][1] = ""
	E.db["datatexts"]["panels"]["dungeontools minimap"]["battleground"] = false
	E.db["datatexts"]["panels"]["dungeontools minimap"]["enable"] = false
	E.db["general"]["afk"] = false
	E.db["general"]["altPowerBar"]["statusBarColorGradient"] = true
	E.db["general"]["backdropfadecolor"]["b"] = 0.054
	E.db["general"]["backdropfadecolor"]["g"] = 0.054
	E.db["general"]["backdropfadecolor"]["r"] = 0.054
	E.db["general"]["bonusObjectivePosition"] = "AUTO"
	E.db["general"]["customGlow"]["style"] = "Action Button Glow"
	E.db["general"]["fontStyle"] = "NONE"
	E.db["general"]["lootRoll"]["qualityItemLevel"] = true
	E.db["general"]["lootRoll"]["qualityName"] = true
	E.db["general"]["minimap"]["icons"]["tracking"]["position"] = "TOPRIGHT"
	E.db["general"]["minimap"]["locationText"] = "SHOW"
	E.db["general"]["minimap"]["size"] = 220
	E.db["general"]["objectiveFrameAutoHideInKeystone"] = true
	E.db["general"]["objectiveFrameHeight"] = 400
	E.db["general"]["resurrectSound"] = true
	E.db["general"]["talkingHeadFrameBackdrop"] = true
	E.db["general"]["talkingHeadFrameScale"] = 0.78
	E.db["general"]["totems"]["growthDirection"] = "HORIZONTAL"
	E.db["general"]["totems"]["size"] = 28
	E.db["general"]["totems"]["spacing"] = 8
	E.db["general"]["valuecolor"]["b"] = 0.058823529411765
	E.db["general"]["valuecolor"]["g"] = 0.54117647058824
	E.db["general"]["valuecolor"]["r"] = 0.81960784313725
	E.db["layoutSetting"] = "dpsCaster"
	E.db["movers"]["AddonCompartmentMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-195,242"
	E.db["movers"]["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,391"
	E.db["movers"]["AltPowerBarMover"] = "BOTTOM,UIParent,BOTTOM,0,113"
	E.db["movers"]["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-259,-358"
	E.db["movers"]["AzeriteBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,274"
	E.db["movers"]["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,238"
	E.db["movers"]["BelowMinimapContainerMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-71,273"
	E.db["movers"]["BossButton"] = "BOTTOM,UIParent,BOTTOM,0,68"
	E.db["movers"]["BossHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-282,-248"
	E.db["movers"]["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,0"
	E.db["movers"]["DTPanelAstral keysMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-447,4"
	E.db["movers"]["DTPanelBugsackMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,444,4"
	E.db["movers"]["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-138"
	E.db["movers"]["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-178,-97"
	E.db["movers"]["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,4"
	E.db["movers"]["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,443,160"
	E.db["movers"]["ElvAB_3"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-29,396"
	E.db["movers"]["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,443,137"
	E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,217,58"
	E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-217,58"
	E.db["movers"]["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150"
	E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-249"
	E.db["movers"]["ElvUF_FocusCastbarMover"] = "TOPLEFT,ElvUF_Focus,BOTTOMLEFT,0,-1"
	E.db["movers"]["ElvUF_FocusMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,454,490"
	E.db["movers"]["ElvUF_FocusTargetMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,454,-502"
	E.db["movers"]["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,166,303"
	E.db["movers"]["ElvUF_PetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-221,285"
	E.db["movers"]["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-221,234"
	E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,264"
	E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,443,183"
	E.db["movers"]["ElvUF_Raid1Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,242"
	E.db["movers"]["ElvUF_Raid2Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,248"
	E.db["movers"]["ElvUF_Raid3Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,251"
	E.db["movers"]["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737"
	E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-186"
	E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-443,220"
	E.db["movers"]["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-443,183"
	E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-443,148"
	E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,27"
	E.db["movers"]["ElvUIBankMover"] = "BOTTOMLEFT,LeftChatPanel,BOTTOMLEFT,0,27"
	E.db["movers"]["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,0"
	E.db["movers"]["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,272,-4"
	E.db["movers"]["HonorBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,301"
	E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,0"
	E.db["movers"]["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120"
	E.db["movers"]["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186"
	E.db["movers"]["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507"
	E.db["movers"]["MawBuffsBelowMinimapMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-4,-171"
	E.db["movers"]["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,0"
	E.db["movers"]["MinimapMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,24"
	E.db["movers"]["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96"
	E.db["movers"]["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0"
	E.db["movers"]["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0"
	E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-47,-235"
	E.db["movers"]["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-221,267"
	E.db["movers"]["PlayerChoiceToggle"] = "BOTTOM,UIParent,BOTTOM,0,351"
	E.db["movers"]["ReputationBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,282"
	E.db["movers"]["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,0"
	E.db["movers"]["ShiftAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,553,4"
	E.db["movers"]["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
	E.db["movers"]["TalkingHeadFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,242"
	E.db["movers"]["ThreatBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,449,238"
	E.db["movers"]["TooltipMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-4,272"
	E.db["movers"]["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-30"
	E.db["movers"]["TorghastChoiceToggle"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,452,317"
	E.db["movers"]["TotemBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-450,4"
	E.db["movers"]["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210"
	E.db["movers"]["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,129"
	E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-45"
	E.db["movers"]["ZoneAbility"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,449,86"
	E.db["tooltip"]["healthBar"]["fontOutline"] = "MONOCHROMEOUTLINE"
	E.db["tooltip"]["itemQuality"] = true
	E.db["tooltip"]["showElvUIUsers"] = true
	E.db["tooltip"]["visibility"]["combatOverride"] = "SHIFT"
	E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.1
	E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["b"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["g"] = 0.1
	E.db["unitframe"]["colors"]["castColor"]["r"] = 0.1
	E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
	E.db["unitframe"]["colors"]["debuffHighlight"]["Magic"]["a"] = 0.44999998807907
	E.db["unitframe"]["colors"]["debuffHighlight"]["blendMode"] = "BLEND"
	E.db["unitframe"]["colors"]["health"]["b"] = 0
	E.db["unitframe"]["colors"]["health"]["g"] = 1
	E.db["unitframe"]["colors"]["health"]["r"] = 0.50196078431373
	E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0
	E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0
	E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["b"] = 0
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["g"] = 0
	E.db["unitframe"]["colors"]["health_backdrop_dead"]["r"] = 0
	E.db["unitframe"]["colors"]["healthclass"] = true
	E.db["unitframe"]["font"] = "Expressway"
	E.db["unitframe"]["fontOutline"] = "SHADOW"
	E.db["unitframe"]["fontSize"] = 17
	E.db["unitframe"]["smoothbars"] = true
	E.db["unitframe"]["units"]["arena"]["health"]["text_format"] = "[health:current:shortvalue]"
	E.db["unitframe"]["units"]["arena"]["name"]["text_format"] = "[CustomName:medium:translit]"
	E.db["unitframe"]["units"]["assist"]["name"]["text_format"] = "[CustomName:long:translit]"
	E.db["unitframe"]["units"]["boss"]["buffs"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 27
	E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 16
	E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 246
	E.db["unitframe"]["units"]["boss"]["colorOverride"] = "FORCE_OFF"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["enable"] = true
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["font"] = "Accidental Presidency"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["size"] = 22
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["text_format"] = "[healthcolor][health:percent]"
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["customTexts"]["[health:percent]"]["yOffset"] = 0
	E.db["unitframe"]["units"]["boss"]["cutaway"]["health"]["enabled"] = true
	E.db["unitframe"]["units"]["boss"]["cutaway"]["power"]["enabled"] = true
	E.db["unitframe"]["units"]["boss"]["debuffs"]["enable"] = false
	E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
	E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 27
	E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -16
	E.db["unitframe"]["units"]["boss"]["disableTargetGlow"] = true
	E.db["unitframe"]["units"]["boss"]["height"] = 30
	E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 17
	E.db["unitframe"]["units"]["boss"]["name"]["text_format"] = "[CustomName:medium:translit]"
	E.db["unitframe"]["units"]["boss"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["boss"]["power"]["powerPrediction"] = true
	E.db["unitframe"]["units"]["boss"]["width"] = 246
	E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 220
	E.db["unitframe"]["units"]["focus"]["name"]["text_format"] = "[classcolor][CustomName:long:translit]"
	E.db["unitframe"]["units"]["focus"]["width"] = 220
	E.db["unitframe"]["units"]["focustarget"]["enable"] = true
	E.db["unitframe"]["units"]["focustarget"]["height"] = 25
	E.db["unitframe"]["units"]["focustarget"]["name"]["text_format"] = "[namecolor][CustomName:short:translit]"
	E.db["unitframe"]["units"]["focustarget"]["width"] = 80
	E.db["unitframe"]["units"]["party"]["groupBy"] = "ROLE"
	E.db["unitframe"]["units"]["party"]["health"]["position"] = "RIGHT"
	E.db["unitframe"]["units"]["party"]["health"]["text_format"] = "[healthcolor][health:percent]"
	E.db["unitframe"]["units"]["party"]["height"] = 74
	E.db["unitframe"]["units"]["party"]["name"]["text_format"] = "[CustomName:long:translit] [difficultycolor][smartlevel]"
	E.db["unitframe"]["units"]["party"]["petsGroup"]["disableFocusGlow"] = false
	E.db["unitframe"]["units"]["party"]["petsGroup"]["disableTargetGlow"] = false
	E.db["unitframe"]["units"]["party"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["party"]["power"]["height"] = 19
	E.db["unitframe"]["units"]["party"]["sortDir"] = "DESC"
	E.db["unitframe"]["units"]["party"]["targetsGroup"]["disableFocusGlow"] = false
	E.db["unitframe"]["units"]["party"]["targetsGroup"]["disableTargetGlow"] = false
	E.db["unitframe"]["units"]["party"]["width"] = 231
	E.db["unitframe"]["units"]["pet"]["castbar"]["iconSize"] = 32
	E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 223
	E.db["unitframe"]["units"]["pet"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
	E.db["unitframe"]["units"]["pet"]["disableTargetGlow"] = false
	E.db["unitframe"]["units"]["pet"]["height"] = 33
	E.db["unitframe"]["units"]["pet"]["infoPanel"]["height"] = 14
	E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = "[CustomName:medium:translit]"
	E.db["unitframe"]["units"]["pet"]["width"] = 223
	E.db["unitframe"]["units"]["pettarget"]["name"]["text_format"] = "[classcolor][CustomName:medium:translit]"
	E.db["unitframe"]["units"]["player"]["RestIcon"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["displayTarget"] = true
	E.db["unitframe"]["units"]["player"]["castbar"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["format"] = "REMAININGMAX"
	E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 32
	E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 290
	E.db["unitframe"]["units"]["player"]["classbar"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["classbar"]["height"] = 8
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["font"] = "Accidental Presidency"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["justifyH"] = "LEFT"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["size"] = 15
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["text_format"] = "[classpowercolor][classpower:percent]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["yOffset"] = 10
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["enable"] = true
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["font"] = "Accidental Presidency"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["justifyH"] = "CENTER"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["size"] = 18
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["text_format"] = "[group:raid]"
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["player"]["customTexts"]["[group]"]["yOffset"] = 11
	E.db["unitframe"]["units"]["player"]["cutaway"]["health"]["enabled"] = true
	E.db["unitframe"]["units"]["player"]["debuffs"]["enable"] = false
	E.db["unitframe"]["units"]["player"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["player"]["health"]["position"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["player"]["health"]["text_format"] = "[health:percent]"
	E.db["unitframe"]["units"]["player"]["health"]["xOffset"] = -2
	E.db["unitframe"]["units"]["player"]["height"] = 52
	E.db["unitframe"]["units"]["player"]["name"]["position"] = "BOTTOM"
	E.db["unitframe"]["units"]["player"]["name"]["text_format"] = "[CustomName:long:translit]"
	E.db["unitframe"]["units"]["player"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["player"]["power"]["height"] = 17
	E.db["unitframe"]["units"]["player"]["power"]["position"] = "BOTTOMLEFT"
	E.db["unitframe"]["units"]["player"]["power"]["text_format"] = "[power:percent]"
	E.db["unitframe"]["units"]["player"]["power"]["xOffset"] = 2
	E.db["unitframe"]["units"]["player"]["width"] = 266
	E.db["unitframe"]["units"]["raid1"]["groupBy"] = "ROLE"
	E.db["unitframe"]["units"]["raid1"]["growthDirection"] = "RIGHT_UP"
	E.db["unitframe"]["units"]["raid1"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["raid1"]["name"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["name"]["position"] = "BOTTOMLEFT"
	E.db["unitframe"]["units"]["raid1"]["name"]["text_format"] = "[CustomName:short:translit]"
	E.db["unitframe"]["units"]["raid1"]["name"]["xOffset"] = 2
	E.db["unitframe"]["units"]["raid1"]["numGroups"] = 6
	E.db["unitframe"]["units"]["raid1"]["raidWideSorting"] = true
	E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["size"] = 25
	E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["xOffset"] = 29
	E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["yOffset"] = 29
	E.db["unitframe"]["units"]["raid1"]["resurrectIcon"]["attachTo"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["raid1"]["roleIcon"]["attachTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid1"]["roleIcon"]["size"] = 12
	E.db["unitframe"]["units"]["raid1"]["roleIcon"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid1"]["width"] = 86
	E.db["unitframe"]["units"]["raid2"]["groupBy"] = "ROLE"
	E.db["unitframe"]["units"]["raid2"]["growthDirection"] = "RIGHT_UP"
	E.db["unitframe"]["units"]["raid2"]["height"] = 44
	E.db["unitframe"]["units"]["raid2"]["infoPanel"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["name"]["attachTextTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["name"]["position"] = "BOTTOMLEFT"
	E.db["unitframe"]["units"]["raid2"]["name"]["text_format"] = "[CustomName:short:translit]"
	E.db["unitframe"]["units"]["raid2"]["name"]["xOffset"] = 2
	E.db["unitframe"]["units"]["raid2"]["numGroups"] = 6
	E.db["unitframe"]["units"]["raid2"]["power"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["raidWideSorting"] = true
	E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["size"] = 25
	E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["xOffset"] = 29
	E.db["unitframe"]["units"]["raid2"]["rdebuffs"]["yOffset"] = 29
	E.db["unitframe"]["units"]["raid2"]["resurrectIcon"]["attachTo"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["raid2"]["roleIcon"]["attachTo"] = "InfoPanel"
	E.db["unitframe"]["units"]["raid2"]["roleIcon"]["enable"] = true
	E.db["unitframe"]["units"]["raid2"]["roleIcon"]["size"] = 12
	E.db["unitframe"]["units"]["raid2"]["roleIcon"]["xOffset"] = 0
	E.db["unitframe"]["units"]["raid2"]["width"] = 86
	E.db["unitframe"]["units"]["raid3"]["name"]["text_format"] = "[CustomName:short:translit]"
	E.db["unitframe"]["units"]["raid3"]["width"] = 87
	E.db["unitframe"]["units"]["raidpet"]["name"]["text_format"] = "[classcolor][CustomName:short:translit]"
	E.db["unitframe"]["units"]["tank"]["name"]["text_format"] = "[CustomName:long:translit]"
	E.db["unitframe"]["units"]["target"]["CombatIcon"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["buffs"]["numrows"] = 3
	E.db["unitframe"]["units"]["target"]["buffs"]["perrow"] = 5
	E.db["unitframe"]["units"]["target"]["buffs"]["sizeOverride"] = 24
	E.db["unitframe"]["units"]["target"]["buffs"]["xOffset"] = -2
	E.db["unitframe"]["units"]["target"]["buffs"]["yOffset"] = -2
	E.db["unitframe"]["units"]["target"]["castbar"]["customColor"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["customColor"]["useClassColor"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["customColor"]["useReactionColor"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["enable"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["displayTarget"] = true
	E.db["unitframe"]["units"]["target"]["castbar"]["format"] = "REMAININGMAX"
	E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 15
	E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
	E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 266
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["attachTextTo"] = "Health"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["enable"] = false
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["font"] = "Accidental Presidency"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["justifyH"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["size"] = 15
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["text_format"] = "[classpowercolor][classpower:percent]"
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["xOffset"] = 0
	E.db["unitframe"]["units"]["target"]["customTexts"]["[classpowercolor][classpower:current:shortvalue]"]["yOffset"] = 10
	E.db["unitframe"]["units"]["target"]["cutaway"]["health"]["enabled"] = true
	E.db["unitframe"]["units"]["target"]["cutaway"]["power"]["enabled"] = true
	E.db["unitframe"]["units"]["target"]["debuffs"]["anchorPoint"] = "TOPLEFT"
	E.db["unitframe"]["units"]["target"]["debuffs"]["attachTo"] = "FRAME"
	E.db["unitframe"]["units"]["target"]["debuffs"]["growthX"] = "RIGHT"
	E.db["unitframe"]["units"]["target"]["debuffs"]["maxDuration"] = 0
	E.db["unitframe"]["units"]["target"]["debuffs"]["numrows"] = 3
	E.db["unitframe"]["units"]["target"]["debuffs"]["perrow"] = 5
	E.db["unitframe"]["units"]["target"]["debuffs"]["sizeOverride"] = 24
	E.db["unitframe"]["units"]["target"]["debuffs"]["yOffset"] = -2
	E.db["unitframe"]["units"]["target"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["target"]["health"]["position"] = "BOTTOMLEFT"
	E.db["unitframe"]["units"]["target"]["health"]["text_format"] = "[health:percent]"
	E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 2
	E.db["unitframe"]["units"]["target"]["height"] = 52
	E.db["unitframe"]["units"]["target"]["name"]["position"] = "BOTTOM"
	E.db["unitframe"]["units"]["target"]["name"]["text_format"] = "[CustomName:long:translit]"
	E.db["unitframe"]["units"]["target"]["orientation"] = "LEFT"
	E.db["unitframe"]["units"]["target"]["power"]["attachTextTo"] = "Power"
	E.db["unitframe"]["units"]["target"]["power"]["height"] = 17
	E.db["unitframe"]["units"]["target"]["power"]["position"] = "BOTTOMRIGHT"
	E.db["unitframe"]["units"]["target"]["power"]["text_format"] = "[power:percent]"
	E.db["unitframe"]["units"]["target"]["power"]["xOffset"] = -1
	E.db["unitframe"]["units"]["target"]["width"] = 266
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
	E.db["unitframe"]["units"]["targettarget"]["debuffs"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["disableMouseoverGlow"] = true
	E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = "[CustomName:long:translit]"
	E.db["unitframe"]["units"]["targettarget"]["power"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["attachTo"] = "LEFT"
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["enable"] = false
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["xOffset"] = 2
	E.db["unitframe"]["units"]["targettarget"]["raidicon"]["yOffset"] = 0
	E.db["unitframe"]["units"]["targettarget"]["threatStyle"] = "GLOW"
	E.db["unitframe"]["units"]["targettarget"]["width"] = 125
	E.db["unitframe"]["units"]["targettargettarget"]["name"]["text_format"] = "[classcolor][CustomName:medium:translit]"

		-- If you want to modify the base layout according to
		-- certain conditions then this is how you could do it
		if layout == "tank" then
			-- Make some changes to the layout posted above
		elseif layout == "dps" then
			-- Make some other changes
		elseif layout == "healer" then
			-- Make some different changes
		end

	-- This section at the bottom is just to update ElvUI and display a message

	-- Update ElvUI
	E:StaggeredUpdateAll()

	-- Show message about layout being set
	PluginInstallStepComplete.message = "Layout Set"
	PluginInstallStepComplete:Show()
end

-- This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	-- Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version

	ReloadUI()
end


local function SetupWeakAuras(WeakAura)
	if not WeakAuras or not WeakAuras.Import then print("WeakAura is not installed.") return end
	if JodsUI.WeakAurasDb[WeakAura] then
		WeakAuras.Import(JodsUI.WeakAurasDb[WeakAura])
	end
end


local function SetupDetails()
	if DetailsFramework then
		if Details:GetProfile (MyPluginName, false) then
			Details:ImportProfile(JodsUI.DetailsProfile, MyPluginName, true, false, true)
		else
			Details:ImportProfile(JodsUI.DetailsProfile, MyPluginName, true, false, false)
		end
	else
		print("Details is not installed.")
	end
end



local function SetupPlater()
	if Plater and Plater.ImportAndSwitchProfile then	
		Plater.ImportAndSwitchProfile(MyPluginName, JodsUI.PlaterProfile, true, true, false)
	else
		print("Plater is not installed.")
	end
end
-- This is the data we pass on to the ElvUI Plugin Installer.
-- The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = format("|cff4beb2c%s %s|r", MyPluginName, "Installation"),
	Name = MyPluginName,
	-- Uncomment the line below f you have a logo you want to use, otherwise it uses the one from ElvUI
	tutorialImage = "Interface\\AddOns\\JodsUI\\logo.tga",
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText(JodsUI.getLocalisation("Welcome"))
			PluginInstallFrame.Desc1:SetText(JodsUI.getLocalisation("WelcomeText"))
			PluginInstallFrame.Desc2:SetText(JodsUI.getLocalisation("InstallGuide"))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText(JodsUI.getLocalisation("SkipProcess"))
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText(JodsUI.getLocalisation("Layouts"))
			PluginInstallFrame.Desc1:SetText(JodsUI.getLocalisation("LayoutsText"))
			PluginInstallFrame.Desc2:SetText(JodsUI.getLocalisation("ImportanceHigh"))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupLayout() end)
			PluginInstallFrame.Option1:SetText("ElvUI")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() SetupDetails() end)
			PluginInstallFrame.Option2:SetText("Details")
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript("OnClick", function() SetupPlater() end)
			PluginInstallFrame.Option3:SetText("Plater")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("WeakAuras")
			PluginInstallFrame.Desc1:SetText(JodsUI.getLocalisation("WeakAurasText"))
			PluginInstallFrame.Desc2:SetText(JodsUI.getLocalisation("ImportanceHigh"))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupWeakAuras("Timeline") end)
			PluginInstallFrame.Option1:SetText("Timeline")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() SetupWeakAuras("enemyCastingInterrupt") end)
			PluginInstallFrame.Option2:SetText("Can interrupt")
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript("OnClick", function() SetupWeakAuras("raidTools") end)
			PluginInstallFrame.Option3:SetText("Raid tools")
			PluginInstallFrame.Option4:Show()
			PluginInstallFrame.Option4:SetScript("OnClick", function() SetupWeakAuras("interruptTracker") end)
			PluginInstallFrame.Option4:SetText("Interrupt Tracker")
			
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetText(JodsUI.getLocalisation("ClassWeakAuras"))
			PluginInstallFrame.Desc1:SetText(JodsUI.getLocalisation("ClassWeakAurasText"))
			PluginInstallFrame.Desc2:SetText(JodsUI.getLocalisation("ImportanceMedium"))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupWeakAuras("Classes") end)
			PluginInstallFrame.Option1:SetText(JodsUI.getLocalisation("ClassWeakAuras"))
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetText(JodsUI.getLocalisation("InstallationComplete"))
			PluginInstallFrame.Desc1:SetText(JodsUI.getLocalisation("InstallationCompleteText"))
			PluginInstallFrame.Desc2:SetText(JodsUI.getLocalisation("Finalize"))
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = JodsUI.getLocalisation("WelcomeTitle"),
		[2] = JodsUI.getLocalisation("Layouts"),
		[3] = JodsUI.getLocalisation("GeneralWeakAuras"),
		[4] = JodsUI.getLocalisation("ClassWeakAuras"),
		[5] = JodsUI.getLocalisation("InstallationComplete"),
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

-- This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = format("|cff4beb2c%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = MyPluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", MyPluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = JodsUI.getLocalisation("InstallationGuideDesc"),
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptions(); end,
			},
		},
	}
end

-- Create a unique table for our plugin
P[MyPluginName] = {}

-- This function will handle initialization of the addon
function mod:Initialize()
	-- Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	-- Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

-- Register module with callback so it gets initialized when ready
E:RegisterModule(mod:GetName())
