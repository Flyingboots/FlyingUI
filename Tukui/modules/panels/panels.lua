local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:CreatePanel("Invisible", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 104)
TukuiBar1:SetWidth((T.buttonsize * 6) + (T.buttonspacing * 7))
TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:CreatePanel("Invisible", 1, 1, "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -6, 0)
TukuiBar2:SetWidth((T.buttonsize * 6) + (T.buttonspacing * 7))
TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)
TukuiBar2:SetAlpha(0)
if T.lowversion then
	TukuiBar2:SetAlpha(0)
else
	TukuiBar2:SetAlpha(1)
end

local TukuiBar3 = CreateFrame("Frame", "TukuiBar3", UIParent)
TukuiBar3:CreatePanel("Invisible", 1, 1, "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
TukuiBar3:SetWidth((T.buttonsize * 6) + (T.buttonspacing * 7))
TukuiBar3:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3:SetFrameStrata("BACKGROUND")
TukuiBar3:SetFrameLevel(2)
if T.lowversion then
	TukuiBar3:SetAlpha(0)
else
	TukuiBar3:SetAlpha(1)
end

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:CreatePanel("Invisible", 1, 1, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6, -1)
TukuiBar4:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar4:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)
TukuiBar4:SetAlpha(0)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:CreatePanel("Invisible", 1, 1, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 6, -1)
TukuiBar5:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar5:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)
TukuiBar5:SetAlpha(0)

local TukuiBar6 = CreateFrame("Frame", "TukuiBar6", UIParent)
TukuiBar6:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar6:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar6:SetPoint("LEFT", TukuiBar5, "LEFT", 0, 0)
TukuiBar6:SetFrameStrata("BACKGROUND")
TukuiBar6:SetFrameLevel(2)
TukuiBar6:SetAlpha(0)

local TukuiBar7 = CreateFrame("Frame", "TukuiBar7", UIParent)
TukuiBar7:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar7:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar7:SetPoint("TOP", TukuiBar5, "TOP", 0 , 0)
TukuiBar7:SetFrameStrata("BACKGROUND")
TukuiBar7:SetFrameLevel(2)
TukuiBar7:SetAlpha(0)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:CreatePanel("Invisible", T.petbuttonsize + (T.petbuttonspacing * 2), (T.petbuttonsize * 10) + (T.petbuttonspacing * 11), "LEFT", UIParent, "LEFT", 2, -23)
petbg:SetAlpha(0)

local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
ltpetbg1:CreatePanel("Invisible", 24, 265, "RIGHT", petbg, "LEFT", 0, 0)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)
ltpetbg1:SetAlpha(0)

-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
if T.lowversion then
	invbarbg:SetPoint("TOPLEFT", TukuiBar1)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar1)
	TukuiBar2:Hide()
	TukuiBar3:Hide()
else
	invbarbg:SetPoint("TOPLEFT", TukuiBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar3)
end

-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "TukuiInfoLeftLineVertical", TukuiBar1)
ileftlv:CreatePanel("Invisible", 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 30)

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "TukuiInfoRightLineVertical", TukuiBar1)
irightlv:CreatePanel("Invisible", 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 30)

if not C.chat.background then
	-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", TukuiBar1)
	cubeleft:CreatePanel("Invisible", 10, 10, "BOTTOM", ileftlv, "TOP", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)

	-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
	local cuberight = CreateFrame("Frame", "TukuiCubeRight", TukuiBar1)
	cuberight:CreatePanel("Invisible", 10, 10, "BOTTOM", irightlv, "TOP", 0, 0)
	if C["bags"].enable then
		cuberight:EnableMouse(true)
		cuberight:SetScript("OnMouseDown", function(self)
			ToggleKeyRing()
		end)
	end
end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "TukuiLineToABLeft", TukuiBar1)
ltoabl:CreatePanel("Invisible", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:Point("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:Point("RIGHT", TukuiBar1, "BOTTOMLEFT", -1, 17)
ltoabl:SetFrameStrata("BACKGROUND")
ltoabl:SetFrameLevel(1)

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "TukuiLineToABRight", TukuiBar1)
ltoabr:CreatePanel("Invisible", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:Point("LEFT", TukuiBar1, "BOTTOMRIGHT", 1, 17)
ltoabr:Point("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)
ltoabr:SetFrameStrata("BACKGROUND")
ltoabr:SetFrameLevel(1)

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED
local movechat = 0
if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel("Transparent", T.InfoLeftRightWidth, 20, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2 - movechat, 2)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
local barchecker = CreateFrame("Frame")
barchecker:SetScript("OnUpdate", function(self)
	if TukuiBar5:IsVisible() then
		ileft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 34)
	else
		ileft:Point("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2)
	end
end)

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", UIParent)
iright:CreatePanel("Transparent", T.InfoLeftRightWidth, 20, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2 + movechat, 2)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")
local barchecker = CreateFrame("Frame")
barchecker:SetScript("OnUpdate", function(self)
	if TukuiBar4:IsVisible() then
		iright:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 34)
	else
		iright:Point("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2)
	end
end)

if C.chat.background then
	-- Alpha horizontal lines because all panels is dependent on this frame.
	ltoabl:SetAlpha(0)
	ltoabr:SetAlpha(0)
	
	-- CHAT BG LEFT
	local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiInfoLeft)
	chatleftbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 177, "BOTTOM", TukuiInfoLeft, "BOTTOM", 0, -6)

	-- CHAT BG RIGHT
	local chatrightbg = CreateFrame("Frame", "TukuiChatBackgroundRight", TukuiInfoRight)
	chatrightbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 177, "BOTTOM", TukuiInfoRight, "BOTTOM", 0, -6)
	
	-- LEFT TAB PANEL
	local tabsbgleft = CreateFrame("Frame", "TukuiTabsLeftBackground", TukuiBar1)
	tabsbgleft:CreatePanel("Transparent", T.InfoLeftRightWidth, 23, "TOP", chatleftbg, "TOP", 0, -6)
	tabsbgleft:SetFrameLevel(2)
	tabsbgleft:SetFrameStrata("BACKGROUND")
		
	-- RIGHT TAB PANEL
	local tabsbgright = CreateFrame("Frame", "TukuiTabsRightBackground", TukuiBar1)
	tabsbgright:CreatePanel("Transparent", T.InfoLeftRightWidth, 23, "TOP", chatrightbg, "TOP", 0, -6)
	tabsbgright:SetFrameLevel(2)
	tabsbgright:SetFrameStrata("BACKGROUND")
	
	-- [[ Create new horizontal line for chat background ]] --
	-- HORIZONTAL LINE LEFT
	local ltoabl2 = CreateFrame("Frame", "TukuiLineToABLeftAlt", TukuiBar1)
	ltoabl2:CreatePanel("Invisible", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
	ltoabl2:ClearAllPoints()
	ltoabl2:Point("RIGHT", TukuiBar1, "LEFT", 0, 16)
	ltoabl2:Point("BOTTOMLEFT", chatleftbg, "BOTTOMRIGHT", 0, 16)

	-- HORIZONTAL LINE RIGHT
	local ltoabr2 = CreateFrame("Frame", "TukuiLineToABRightAlt", TukuiBar1)
	ltoabr2:CreatePanel("Invisible", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
	ltoabr2:ClearAllPoints()
	ltoabr2:Point("LEFT", TukuiBar1, "RIGHT", 0, 16)
	ltoabr2:Point("BOTTOMRIGHT", chatrightbg, "BOTTOMLEFT", 0, 16)
end

if TukuiMinimap then
	local minimapstatsright = CreateFrame("Frame", "TukuiMinimapStatsRight", TukuiMinimap)
	minimapstatsright:CreatePanel("Transparent", ((TukuiMinimap:GetWidth() + 4) / 2) -3, 19, "BOTTOM", TukuiMinimap, "BOTTOM", 0, 0)
	minimapstatsright:SetFrameLevel(9)
end

-- Experience/Reputation panel. (Used aswell for positioning).
local expb = CreateFrame("Frame", "expb", UIParent)
expb:CreatePanel("Transparent", 143, 8, "TOPRIGHT", UIParent, "TOPRIGHT", -2, -2)
