--[[	FastID	]]--

local find = string.find
local format = string.format
local pairs = pairs
local print = print
local rawset = rawset
local setmetatable = setmetatable
local tinsert = table.insert
local tostring = tostring

----------------------

local AddMessage = AddMessage
local CreateFrame = CreateFrame
local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME
local GAME_LOCALE = GAME_LOCALE
local GetInventoryItemID = GetInventoryItemID
local GetInventoryItemLink = GetInventoryItemLink
local GetInventorySlotInfo = GetInventorySlotInfo
local GetItemQualityColor = GetItemQualityColor
local GetLocale = GetLocale
local GetScreenHeight = GetScreenHeight
local SlashCmdList = SlashCmdList
local UIParent = UIParent

----------------------

local addonName, ns = ...

local addon_version = 1.3

local SLOTS = {[1] = "HeadSlot", [2] = "NeckSlot", [3] = "ShoulderSlot", [4] = "ShirtSlot", [5] = "ChestSlot", [6] = "WaistSlot", [7] = "LegsSlot", [8] = "FeetSlot", [9] = "WristSlot", [10] = "HandsSlot", [11] = "Finger0Slot", [12] = "Finger1Slot", [13] = "Trinket0Slot", [14] = "Trinket1Slot", [15] = "BackSlot", [16] = "MainHandSlot", [17] = "SecondaryHandSlot", [19] = "TabardSlot"}

----------------------

local locale = GAME_LOCALE or GetLocale()

local L = setmetatable({}, {
	__index = function(t, k)
		if (locale ~= "enUS") then print(format("|cff00ffffFastID:|r |cffFF0000No translation available in your language!|r |cffffffff(%s)", locale)) end
		local v = tostring(k)
		rawset(t, k, v)

		return v
	end
})

if (locale == "enUS") then
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
	L["Tabard:"] = "Tabard:"
	L["Okay"] = "Okay"
	L["No item equipped"] = "No item equipped"
	L["Toggle Window"] = "Toggle Window"
	L["Press Enter in selected editbox to generate item link."] = "Press Enter in selected editbox to generate item link."
end

_G["BINDING_HEADER_FASTID"] = "FastID"
_G["BINDING_NAME_FASTID_TOGGLE_WINDOW"] = L["Toggle Window"]

local viewer = CreateFrame("Frame", "FastID", UIParent, "UIPanelDialogTemplate")
local button = CreateFrame("Button","$parentButton", viewer, "UIPanelButtonTemplate")
local versionText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local tipText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")


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
local editbox19 = CreateFrame("EditBox", "$parentEditBox19", viewer, "InputBoxTemplate")
local editbox19Text = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")

local editbox1ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox2ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox3ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox4ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox5ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox6ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox7ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox8ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox9ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox10ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox11ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox12ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox13ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox14ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox15ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox16ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox17ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")
local editbox19ItemText = viewer:CreateFontString(nil, "ARTWORK", "GameFontNormal")

local function GetItemLink(id)
	local item = GetInventoryItemLink("player", GetInventorySlotInfo(id))
	if item == nil then return end
	local frm = ChatEdit_ChooseBoxForSend()
	ChatFrame_OpenChat(item, frm)
end

local function GetItemName(n)
	local id = GetInventoryItemLink("player", GetInventorySlotInfo(n))
	if not id then
		name = ""
		return name
	end
	local name, _, rarity = GetItemInfo(id)
	local r, g, b, hex = GetItemQualityColor(rarity)
	name = "|c"..hex..name
	return name
end

local function OnShow()
	for k,v in pairs(SLOTS) do
		local id = GetInventoryItemID("player", k)
		local text = "https://www.wowhead.com/item="..tostring(id)
		local editBox = _G["FastIDEditBox"..k]
		if text:find("nil") then text = L["No item equipped"] end
		editBox:SetText(text)
		editBox:SetScript("OnEnterPressed", function(self) GetItemLink(v) end)
	end
	editbox1ItemText:SetText(GetItemName("HeadSlot"))
	editbox2ItemText:SetText(GetItemName("NeckSlot"))
	editbox3ItemText:SetText(GetItemName("ShoulderSlot"))
	editbox4ItemText:SetText(GetItemName("ShirtSlot"))
	editbox5ItemText:SetText(GetItemName("ChestSlot"))
	editbox6ItemText:SetText(GetItemName("WaistSlot"))
	editbox7ItemText:SetText(GetItemName("LegsSlot"))
	editbox8ItemText:SetText(GetItemName("FeetSlot"))
	editbox9ItemText:SetText(GetItemName("WristSlot"))
	editbox10ItemText:SetText(GetItemName("HandsSlot"))
	editbox11ItemText:SetText(GetItemName("Finger0Slot"))
	editbox12ItemText:SetText(GetItemName("Finger1Slot"))
	editbox13ItemText:SetText(GetItemName("Trinket0Slot"))
	editbox14ItemText:SetText(GetItemName("Trinket1Slot"))
	editbox15ItemText:SetText(GetItemName("BackSlot"))
	editbox16ItemText:SetText(GetItemName("MainHandSlot"))
	editbox17ItemText:SetText(GetItemName("SecondaryHandSlot"))
	editbox19ItemText:SetText(GetItemName("TabardSlot"))
end

function ToggleWindow()
	local shown = viewer:IsShown()
	if shown then
		viewer:Hide()
	else
		viewer:Show()
	end
end

viewer:Hide()
viewer:SetSize(700, 450)
viewer:SetToplevel(true)
viewer:SetPoint("CENTER", UIParent, "TOP", 0, -1 * GetScreenHeight() / 4)
viewer.Title:SetText("FastID")
viewer:EnableKeyboard(false)
viewer:SetMovable(true)
viewer:EnableMouse(true)
viewer:RegisterForDrag("LeftButton")
viewer:SetScript("OnShow", OnShow)
viewer:SetScript("OnDragStart", function(self) self:StartMoving() end)
viewer:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
tinsert(UISpecialFrames, viewer:GetName())

button:SetPoint("BOTTOM", viewer, "BOTTOM", 0, 10)
button:SetSize(100, 25)
button:SetText(L["Okay"])
button:SetScript("OnClick", function(self) self:GetParent():Hide() end)

versionText:SetText(format("|cff00ffff%s|r |cffffffffv%.1f", "FastID", addon_version))
versionText:SetPoint("BOTTOMRIGHT", viewer, "BOTTOMRIGHT", -10, 10)

tipText:SetText(L["Press Enter in selected editbox to generate item link."])
tipText:SetPoint("BOTTOMLEFT", viewer, "BOTTOMlEFT", 30, 10)

editbox0:SetPoint("TOPLEFT", viewer, "LEFT", 30, 370)
editbox0:SetPoint("BOTTOMRIGHT", viewer, "CENTER", -30, -8)
editbox0:Hide()

editbox1:SetPoint("TOPLEFT", editbox0, "LEFT", 0, -15)
editbox1:SetPoint("BOTTOMRIGHT", editbox0, "RIGHT", 27, -8)
editbox1:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox1:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox1:SetAutoFocus(false)
editbox1Text:SetText(L["Head:"])
editbox1Text:SetPoint("TOPLEFT", editbox1, "LEFT", 0, 25)
editbox1ItemText:SetText(GetItemName("HeadSlot"))
editbox1ItemText:SetPoint("TOPLEFT", editbox1, "LEFT", 40, 25)

editbox2:SetPoint("TOPLEFT", editbox1, "LEFT", 0, -75)
editbox2:SetPoint("BOTTOMRIGHT", editbox1, "RIGHT", 0, -8)
editbox2:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox2:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox2:SetAutoFocus(false)
editbox2Text:SetText(L["Neck:"])
editbox2Text:SetPoint("TOPLEFT", editbox2, "LEFT", 0, 25)
editbox2ItemText:SetText(GetItemName("NeckSlot"))
editbox2ItemText:SetPoint("TOPLEFT", editbox2, "LEFT", 40, 25)

editbox3:SetPoint("TOPLEFT", editbox2, "LEFT", 0, -75)
editbox3:SetPoint("BOTTOMRIGHT", editbox2, "RIGHT", 0, -8)
editbox3:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox3:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox3:SetAutoFocus(false)
editbox3Text:SetText(L["Shoulder:"])
editbox3Text:SetPoint("TOPLEFT", editbox3, "LEFT", 0, 25)
editbox3ItemText:SetText(GetItemName("ShoulderSlot"))
editbox3ItemText:SetPoint("TOPLEFT", editbox3, "LEFT", 65, 25)

editbox4:SetPoint("TOPLEFT", editbox3, "LEFT", 0, -75)
editbox4:SetPoint("BOTTOMRIGHT", editbox3, "RIGHT", 0, -8)
editbox4:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox4:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox4:SetAutoFocus(false)
editbox4Text:SetText(L["Shirt:"])
editbox4Text:SetPoint("TOPLEFT", editbox4, "LEFT", 0, 25)
editbox4ItemText:SetText(GetItemName("ShirtSlot"))
editbox4ItemText:SetPoint("TOPLEFT", editbox4, "LEFT", 70, 25)

editbox5:SetPoint("TOPLEFT", editbox4, "LEFT", 0, -75)
editbox5:SetPoint("BOTTOMRIGHT", editbox4, "RIGHT", 0, -8)
editbox5:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox5:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox5:SetAutoFocus(false)
editbox5Text:SetText(L["Chest:"])
editbox5Text:SetPoint("TOPLEFT", editbox5, "LEFT", 0, 25)
editbox5ItemText:SetText(GetItemName("ChestSlot"))
editbox5ItemText:SetPoint("TOPLEFT", editbox5, "LEFT", 40, 25)

editbox6:SetPoint("TOPLEFT", editbox5, "LEFT", 0, -75)
editbox6:SetPoint("BOTTOMRIGHT", editbox5, "RIGHT", 0, -8)
editbox6:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox6:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox6:SetAutoFocus(false)
editbox6Text:SetText(L["Belt:"])
editbox6Text:SetPoint("TOPLEFT", editbox6, "LEFT", 0, 25)
editbox6ItemText:SetText(GetItemName("WaistSlot"))
editbox6ItemText:SetPoint("TOPLEFT", editbox6, "LEFT", 40, 25)

editbox7:SetPoint("TOPLEFT", editbox6, "LEFT", 0, -75)
editbox7:SetPoint("BOTTOMRIGHT", editbox6, "RIGHT", 0, -8)
editbox7:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox7:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox7:SetAutoFocus(false)
editbox7Text:SetText(L["Legs:"])
editbox7Text:SetPoint("TOPLEFT", editbox7, "LEFT", 0, 25)
editbox7ItemText:SetText(GetItemName("LegsSlot"))
editbox7ItemText:SetPoint("TOPLEFT", editbox7, "LEFT", 40, 25)

editbox8:SetPoint("TOPLEFT", editbox7, "LEFT", 0, -75)
editbox8:SetPoint("BOTTOMRIGHT", editbox7, "RIGHT", 0, -8)
editbox8:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox8:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox8:SetAutoFocus(false)
editbox8Text:SetText(L["Feet:"])
editbox8Text:SetPoint("TOPLEFT", editbox8, "LEFT", 0, 25)
editbox8ItemText:SetText(GetItemName("FeetSlot"))
editbox8ItemText:SetPoint("TOPLEFT", editbox8, "LEFT", 40, 25)

editbox9:SetPoint("TOPLEFT", editbox8, "LEFT", 0, -75)
editbox9:SetPoint("BOTTOMRIGHT", editbox8, "RIGHT", 0, -8)
editbox9:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox9:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox9:SetAutoFocus(false)
editbox9Text:SetText(L["Wrist:"])
editbox9Text:SetPoint("TOPLEFT", editbox9, "LEFT", 0, 25)
editbox9ItemText:SetText(GetItemName("WristSlot"))
editbox9ItemText:SetPoint("TOPLEFT", editbox9, "LEFT", 40, 25)

editbox10:SetPoint("TOPLEFT", editbox1, "LEFT", 650, 7)
editbox10:SetPoint("BOTTOMRIGHT", editbox1, "RIGHT", 15, -8)
editbox10:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox10:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox10:SetAutoFocus(false)
editbox10Text:SetText(L["Gloves:"])
editbox10Text:SetPoint("TOPLEFT", editbox10, "LEFT", 0, 25)
editbox10ItemText:SetText(GetItemName("HandsSlot"))
editbox10ItemText:SetPoint("TOPLEFT", editbox10, "LEFT", 50, 25)

editbox11:SetPoint("TOPLEFT", editbox10, "LEFT", 0, -75)
editbox11:SetPoint("BOTTOMRIGHT", editbox10, "RIGHT", 0, -8)
editbox11:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox11:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox11:SetAutoFocus(false)
editbox11Text:SetText(L["Finger1:"])
editbox11Text:SetPoint("TOPLEFT", editbox11, "LEFT", 0, 25)
editbox11ItemText:SetText(GetItemName("Finger0Slot"))
editbox11ItemText:SetPoint("TOPLEFT", editbox11, "LEFT", 60, 25)

editbox12:SetPoint("TOPLEFT", editbox11, "LEFT", 0, -75)
editbox12:SetPoint("BOTTOMRIGHT", editbox11, "RIGHT", 0, -8)
editbox12:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox12:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox12:SetAutoFocus(false)
editbox12Text:SetText(L["Finger2:"])
editbox12Text:SetPoint("TOPLEFT", editbox12, "LEFT", 0, 25)
editbox12ItemText:SetText(GetItemName("Finger1Slot"))
editbox12ItemText:SetPoint("TOPLEFT", editbox12, "LEFT", 60, 25)

editbox13:SetPoint("TOPLEFT", editbox12, "LEFT", 0, -75)
editbox13:SetPoint("BOTTOMRIGHT", editbox12, "RIGHT", 0, -8)
editbox13:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox13:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox13:SetAutoFocus(false)
editbox13Text:SetText(L["Trinket1:"])
editbox13Text:SetPoint("TOPLEFT", editbox13, "LEFT", 0, 25)
editbox13ItemText:SetText(GetItemName("Trinket0Slot"))
editbox13ItemText:SetPoint("TOPLEFT", editbox13, "LEFT", 60, 25)

editbox14:SetPoint("TOPLEFT", editbox13, "LEFT", 0, -75)
editbox14:SetPoint("BOTTOMRIGHT", editbox13, "RIGHT", 0, -8)
editbox14:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox14:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox14:SetAutoFocus(false)
editbox14Text:SetText(L["Trinket2:"])
editbox14Text:SetPoint("TOPLEFT", editbox14, "LEFT", 0, 25)
editbox14ItemText:SetText(GetItemName("Trinket1Slot"))
editbox14ItemText:SetPoint("TOPLEFT", editbox14, "LEFT", 60, 25)

editbox15:SetPoint("TOPLEFT", editbox14, "LEFT", 0, -75)
editbox15:SetPoint("BOTTOMRIGHT", editbox14, "RIGHT", 0, -8)
editbox15:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox15:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox15:SetAutoFocus(false)
editbox15Text:SetText(L["Back:"])
editbox15Text:SetPoint("TOPLEFT", editbox15, "LEFT", 0, 25)
editbox15ItemText:SetText(GetItemName("BackSlot"))
editbox15ItemText:SetPoint("TOPLEFT", editbox15, "LEFT", 40, 25)

editbox16:SetPoint("TOPLEFT", editbox15, "LEFT", 0, -75)
editbox16:SetPoint("BOTTOMRIGHT", editbox15, "RIGHT", 0, -8)
editbox16:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox16:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox16:SetAutoFocus(false)
editbox16Text:SetText(L["Main-Hand:"])
editbox16Text:SetPoint("TOPLEFT", editbox16, "LEFT", 0, 25)
editbox16ItemText:SetText(GetItemName("MainHandSlot"))
editbox16ItemText:SetPoint("TOPLEFT", editbox16, "LEFT", 75, 25)

editbox17:SetPoint("TOPLEFT", editbox16, "LEFT", 0, -75)
editbox17:SetPoint("BOTTOMRIGHT", editbox16, "RIGHT", 0, -8)
editbox17:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox17:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox17:SetAutoFocus(false)
editbox17Text:SetText(L["Off-Hand:"])
editbox17Text:SetPoint("TOPLEFT", editbox17, "LEFT", 0, 25)
editbox17ItemText:SetText(GetItemName("SecondaryHandSlot"))
editbox17ItemText:SetPoint("TOPLEFT", editbox17, "LEFT", 75, 25)

editbox19:SetPoint("TOPLEFT", editbox17, "LEFT", 0, -75)
editbox19:SetPoint("BOTTOMRIGHT", editbox17, "RIGHT", 0, -8)
editbox19:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
editbox19:SetScript("OnEscapePressed", function(self) self:GetParent():Hide() end)
editbox19:SetAutoFocus(false)
editbox19Text:SetText(L["Tabard:"])
editbox19Text:SetPoint("TOPLEFT", editbox19, "LEFT", 0, 25)
editbox19ItemText:SetText(GetItemName("TabardSlot"))
editbox19ItemText:SetPoint("TOPLEFT", editbox19, "LEFT", 50, 25)

SLASH_FASTID1, SLASH_FASTID2 = "/fastid", "/id"
SlashCmdList["FASTID"] = function() ToggleWindow() end

local events = CreateFrame("Frame")
events:RegisterEvent("UNIT_INVENTORY_CHANGED")
events:SetScript("OnEvent", function()
	if not viewer:IsShown() then
		return
	else
		for k,v in pairs(SLOTS) do
			local id = GetInventoryItemID("player", k)
			local text = "https://www.wowhead.com/item="..tostring(id)
			local editBox = _G["FastIDEditBox"..k]
			if text:find("nil") then text = L["No item equipped"] end
			editBox:SetText(text)
		end
		editbox1ItemText:SetText(GetItemName("HeadSlot"))
		editbox2ItemText:SetText(GetItemName("NeckSlot"))
		editbox3ItemText:SetText(GetItemName("ShoulderSlot"))
		editbox4ItemText:SetText(GetItemName("ShirtSlot"))
		editbox5ItemText:SetText(GetItemName("ChestSlot"))
		editbox6ItemText:SetText(GetItemName("WaistSlot"))
		editbox7ItemText:SetText(GetItemName("LegsSlot"))
		editbox8ItemText:SetText(GetItemName("FeetSlot"))
		editbox9ItemText:SetText(GetItemName("WristSlot"))
		editbox10ItemText:SetText(GetItemName("HandsSlot"))
		editbox11ItemText:SetText(GetItemName("Finger0Slot"))
		editbox12ItemText:SetText(GetItemName("Finger1Slot"))
		editbox13ItemText:SetText(GetItemName("Trinket0Slot"))
		editbox14ItemText:SetText(GetItemName("Trinket1Slot"))
		editbox15ItemText:SetText(GetItemName("BackSlot"))
		editbox16ItemText:SetText(GetItemName("MainHandSlot"))
		editbox17ItemText:SetText(GetItemName("SecondaryHandSlot"))
		editbox19ItemText:SetText(GetItemName("TabardSlot"))
	end
end)
