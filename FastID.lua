--[[	FastID	]]--

local rawset = rawset
local setmetatable = setmetatable
local string = string
local table = table
local tostring = tostring

----------------------

local CreateFrame = CreateFrame
local GAME_LOCALE = GAME_LOCALE
local GetInventoryItemID = GetInventoryItemID
local GetLocale = GetLocale
local GetScreenHeight = GetScreenHeight
local UIParent = UIParent

----------------------

local addonName, ns = ...

local addon_prefix = "|cff00FFFF"..addonName..":|r"
local addon_version = GetAddOnMetadata(addonName, "Version")

----------------------

local function out(...)
	DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", addon_prefix, ...))
end

----------------------

local locale = GAME_LOCALE or GetLocale()

local L = setmetatable({}, {
	__index = function(t, k)
		if (locale ~= "enUS") then out(string.format("|cffFF0000No translation available in your language!|r (%s)", locale)) end
		local v = tostring(k)
		rawset(t, k, v)

		return v
	end
})

if (locale == "enUS") then
	L["FastID"] = "FastID"
	L["Okay"] = "Okay"
	L["FastID v"] = "FastID v"
	L["Head:"] = "Head:"
	L["Neck:"] = "Neck:"
	L["Shoulder:"] = "Shoulder:"
	L["Shirt:"] = "Shirt:"
	L["Chest:"] = "Chest:"
	L["Belt:"] = "Belt:"
	L["Legs:"] = "Legs:"
	L["Feet:"] = "Feet:"
	L["Wrist:"] = "Wrist:"
	L["Gloves:"] = "Gloves:"
	L["Finger 1:"] = "Finger 1:"
	L["Finger 2:"] = "Finger 2:"
	L["Trinket 1:"] = "Trinket 1:"
	L["Trinket 2:"] = "Trinket 2:"
	L["Back:"] = "Back:"
	L["Main-Hand:"] = "Main-Hand:"
	L["Off-Hand:"] = "Off-Hand:"
	L["Ranged:"] = "Ranged:"
	L["Tabard:"] = "Tabard:"
	L["No item equipped"] = "No item equipped"
end

----------------------

local site = "https://www.wowhead.com/item="

----------------------

local viewer = CreateFrame("Frame", "FastID", UIParent, "UIPanelDialogTemplate")
local button = CreateFrame("Button","$parentButton", viewer, "UIPanelButtonTemplate")
local versionText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")

local editbox0 = CreateFrame("EditBox", "$parentEditBox0", viewer, "InputBoxTemplate")
local editbox1 = CreateFrame("EditBox", "$parentEditBox1", viewer, "InputBoxTemplate")
local editbox1Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox2 = CreateFrame("EditBox", "$parentEditBox2", viewer, "InputBoxTemplate")
local editbox2Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox3 = CreateFrame("EditBox", "$parentEditBox3", viewer, "InputBoxTemplate")
local editbox3Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox4 = CreateFrame("EditBox", "$parentEditBox4", viewer, "InputBoxTemplate")
local editbox4Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox5 = CreateFrame("EditBox", "$parentEditBox5", viewer, "InputBoxTemplate")
local editbox5Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox6 = CreateFrame("EditBox", "$parentEditBox6", viewer, "InputBoxTemplate")
local editbox6Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox7 = CreateFrame("EditBox", "$parentEditBox7", viewer, "InputBoxTemplate")
local editbox7Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox8 = CreateFrame("EditBox", "$parentEditBox8", viewer, "InputBoxTemplate")
local editbox8Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox9 = CreateFrame("EditBox", "$parentEditBox9", viewer, "InputBoxTemplate")
local editbox9Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox10 = CreateFrame("EditBox", "$parentEditBox10", viewer, "InputBoxTemplate")
local editbox10Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox11 = CreateFrame("EditBox", "$parentEditBox11", viewer, "InputBoxTemplate")
local editbox11Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox12 = CreateFrame("EditBox", "$parentEditBox12", viewer, "InputBoxTemplate")
local editbox12Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox13 = CreateFrame("EditBox", "$parentEditBox13", viewer, "InputBoxTemplate")
local editbox13Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox14 = CreateFrame("EditBox", "$parentEditBox14", viewer, "InputBoxTemplate")
local editbox14Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox15 = CreateFrame("EditBox", "$parentEditBox15", viewer, "InputBoxTemplate")
local editbox15Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox16 = CreateFrame("EditBox", "$parentEditBox16", viewer, "InputBoxTemplate")
local editbox16Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox17 = CreateFrame("EditBox", "$parentEditBox17", viewer, "InputBoxTemplate")
local editbox17Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox18 = CreateFrame("EditBox", "$parentEditBox18", viewer, "InputBoxTemplate")
local editbox18Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox19 = CreateFrame("EditBox", "$parentEditBox19", viewer, "InputBoxTemplate")
local editbox19Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")

viewer.button = button
viewer.editbox0 = editbox0
viewer.editbox1 = editbox1
viewer.editbox2 = editbox2
viewer.editbox3 = editbox3
viewer.editbox4 = editbox4
viewer.editbox5 = editbox5
viewer.editbox6 = editbox6
viewer.editbox7 = editbox7
viewer.editbox8 = editbox8
viewer.editbox9 = editbox9
viewer.editbox10 = editbox10
viewer.editbox11 = editbox11
viewer.editbox12 = editbox12
viewer.editbox13 = editbox13
viewer.editbox14 = editbox14
viewer.editbox15 = editbox15
viewer.editbox16 = editbox16
viewer.editbox17 = editbox17
viewer.editbox18 = editbox18
viewer.editbox19 = editbox19

viewer:Hide()
viewer:SetSize(600, 475)
viewer:SetToplevel(true)
viewer:SetPoint("CENTER", UIParent, "TOP", 0, -1 * GetScreenHeight() / 4)
viewer.Title:SetText(L["FastID"])
viewer:EnableKeyboard(false)
viewer:SetMovable(true)
viewer:EnableMouse(true)
viewer:RegisterForDrag("LeftButton")
viewer:SetScript("OnDragStart", function(self) self:StartMoving() end)
viewer:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

button:SetPoint("BOTTOM", viewer, "BOTTOM", 0, 10)
button:SetSize(100, 25)
button:SetText(L["Okay"])
button:SetScript("OnClick", function(self) self:GetParent():Hide() end)

versionText:SetText(string.format("|cff00FFFF%s%.1f|r", L["FastID v"], addon_version))
versionText:SetPoint("BOTTOMRIGHT", viewer, "BOTTOMRIGHT", -10, 10)

editbox0:SetPoint("TOPLEFT", viewer, "LEFT", 30, 375)
editbox0:SetPoint("BOTTOMRIGHT", viewer, "CENTER", -30, -8)
editbox0:Hide()

editbox1:SetPoint("TOPLEFT", editbox0, "LEFT", 0, 7)
editbox1:SetPoint("BOTTOMRIGHT", editbox0, "RIGHT", 27, -8)
editbox1:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox1:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox1:SetAutoFocus(false)
editbox1Text:SetText(L["Head:"])
editbox1Text:SetPoint("TOPLEFT", editbox1, "LEFT", 0, 25)

editbox2:SetPoint("TOPLEFT", editbox1, "LEFT", 0, -75)
editbox2:SetPoint("BOTTOMRIGHT", editbox1, "RIGHT", 0, -8)
editbox2:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox2:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox2:SetAutoFocus(false)
editbox2Text:SetText(L["Neck:"])
editbox2Text:SetPoint("TOPLEFT", editbox2, "LEFT", 0, 25)

editbox3:SetPoint("TOPLEFT", editbox2, "LEFT", 0, -75)
editbox3:SetPoint("BOTTOMRIGHT", editbox2, "RIGHT", 0, -8)
editbox3:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox3:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox3:SetAutoFocus(false)
editbox3Text:SetText(L["Shoulder:"])
editbox3Text:SetPoint("TOPLEFT", editbox3, "LEFT", 0, 25)

editbox4:SetPoint("TOPLEFT", editbox3, "LEFT", 0, -75)
editbox4:SetPoint("BOTTOMRIGHT", editbox3, "RIGHT", 0, -8)
editbox4:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox4:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox4:SetAutoFocus(false)
editbox4Text:SetText(L["Shirt:"])
editbox4Text:SetPoint("TOPLEFT", editbox4, "LEFT", 0, 25)

editbox5:SetPoint("TOPLEFT", editbox4, "LEFT", 0, -75)
editbox5:SetPoint("BOTTOMRIGHT", editbox4, "RIGHT", 0, -8)
editbox5:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox5:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox5:SetAutoFocus(false)
editbox5Text:SetText(L["Chest:"])
editbox5Text:SetPoint("TOPLEFT", editbox5, "LEFT", 0, 25)

editbox6:SetPoint("TOPLEFT", editbox5, "LEFT", 0, -75)
editbox6:SetPoint("BOTTOMRIGHT", editbox5, "RIGHT", 0, -8)
editbox6:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox6:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox6:SetAutoFocus(false)
editbox6Text:SetText(L["Belt:"])
editbox6Text:SetPoint("TOPLEFT", editbox6, "LEFT", 0, 25)

editbox7:SetPoint("TOPLEFT", editbox6, "LEFT", 0, -75)
editbox7:SetPoint("BOTTOMRIGHT", editbox6, "RIGHT", 0, -8)
editbox7:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox7:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox7:SetAutoFocus(false)
editbox7Text:SetText(L["Legs:"])
editbox7Text:SetPoint("TOPLEFT", editbox7, "LEFT", 0, 25)

editbox8:SetPoint("TOPLEFT", editbox7, "LEFT", 0, -75)
editbox8:SetPoint("BOTTOMRIGHT", editbox7, "RIGHT", 0, -8)
editbox8:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox8:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox8:SetAutoFocus(false)
editbox8Text:SetText(L["Feet:"])
editbox8Text:SetPoint("TOPLEFT", editbox8, "LEFT", 0, 25)

editbox9:SetPoint("TOPLEFT", editbox8, "LEFT", 0, -75)
editbox9:SetPoint("BOTTOMRIGHT", editbox8, "RIGHT", 0, -8)
editbox9:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox9:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox9:SetAutoFocus(false)
editbox9Text:SetText(L["Wrist:"])
editbox9Text:SetPoint("TOPLEFT", editbox9, "LEFT", 0, 25)

editbox10:SetPoint("TOPLEFT", editbox9, "LEFT", 0, -75)
editbox10:SetPoint("BOTTOMRIGHT", editbox9, "RIGHT", 0, -8)
editbox10:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox10:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox10:SetAutoFocus(false)
editbox10Text:SetText(L["Gloves:"])
editbox10Text:SetPoint("TOPLEFT", editbox10, "LEFT", 0, 25)

editbox11:SetPoint("TOPLEFT", editbox1, "LEFT", 550, 7)
editbox11:SetPoint("BOTTOMRIGHT", editbox1, "RIGHT", 15, -8)
editbox11:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox11:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox11:SetAutoFocus(false)
editbox11Text:SetText(L["Finger1:"])
editbox11Text:SetPoint("TOPLEFT", editbox11, "LEFT", 0, 25)

editbox12:SetPoint("TOPLEFT", editbox11, "LEFT", 0, -75)
editbox12:SetPoint("BOTTOMRIGHT", editbox11, "RIGHT", 0, -8)
editbox12:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox12:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox12:SetAutoFocus(false)
editbox12Text:SetText(L["Finger2:"])
editbox12Text:SetPoint("TOPLEFT", editbox12, "LEFT", 0, 25)

editbox13:SetPoint("TOPLEFT", editbox12, "LEFT", 0, -75)
editbox13:SetPoint("BOTTOMRIGHT", editbox12, "RIGHT", 0, -8)
editbox13:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox13:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox13:SetAutoFocus(false)
editbox13Text:SetText(L["Trinket1"])
editbox13Text:SetPoint("TOPLEFT", editbox13, "LEFT", 0, 25)

editbox14:SetPoint("TOPLEFT", editbox13, "LEFT", 0, -75)
editbox14:SetPoint("BOTTOMRIGHT", editbox13, "RIGHT", 0, -8)
editbox14:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox14:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox14:SetAutoFocus(false)
editbox14Text:SetText(L["Trinket2:"])
editbox14Text:SetPoint("TOPLEFT", editbox14, "LEFT", 0, 25)

editbox15:SetPoint("TOPLEFT", editbox14, "LEFT", 0, -75)
editbox15:SetPoint("BOTTOMRIGHT", editbox14, "RIGHT", 0, -8)
editbox15:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox15:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox15:SetAutoFocus(false)
editbox15Text:SetText(L["Back:"])
editbox15Text:SetPoint("TOPLEFT", editbox15, "LEFT", 0, 25)

editbox16:SetPoint("TOPLEFT", editbox15, "LEFT", 0, -75)
editbox16:SetPoint("BOTTOMRIGHT", editbox15, "RIGHT", 0, -8)
editbox16:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox16:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox16:SetAutoFocus(false)
editbox16Text:SetText(L["Main-Hand:"])
editbox16Text:SetPoint("TOPLEFT", editbox16, "LEFT", 0, 25)

editbox17:SetPoint("TOPLEFT", editbox16, "LEFT", 0, -75)
editbox17:SetPoint("BOTTOMRIGHT", editbox16, "RIGHT", 0, -8)
editbox17:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox17:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox17:SetAutoFocus(false)
editbox17Text:SetText(L["Off-Hand:"])
editbox17Text:SetPoint("TOPLEFT", editbox17, "LEFT", 0, 25)

editbox18:SetPoint("TOPLEFT", editbox17, "LEFT", 0, -75)
editbox18:SetPoint("BOTTOMRIGHT", editbox17, "RIGHT", 0, -8)
editbox18:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox18:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox18:SetAutoFocus(false)
editbox18Text:SetText(L["Ranged"])
editbox18Text:SetPoint("TOPLEFT", editbox18, "LEFT", 0, 25)

editbox19:SetPoint("TOPLEFT", editbox18, "LEFT", 0, -75)
editbox19:SetPoint("BOTTOMRIGHT", editbox18, "RIGHT", 0, -8)
editbox19:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox19:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox19:SetAutoFocus(false)
editbox19Text:SetText(L["Tabard:"])
editbox19Text:SetPoint("TOPLEFT", editbox19, "LEFT", 0, 25)

SLASH_FASTID1, SLASH_FASTID2 = "/id","/fastid"
SlashCmdList["FASTID"] = function()
	viewer:Show()
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("UNIT_INVENTORY_CHANGED")
events:SetScript("OnEvent", function()
	for i=1,19 do
		local id = GetInventoryItemID("player", i)
		local text = site..tostring(id)
		local eb = _G["FastIDEditBox"..i]
		if text:find("nil") then text = L["No item equipped"] end
		eb:SetText(text)
	end
end)
