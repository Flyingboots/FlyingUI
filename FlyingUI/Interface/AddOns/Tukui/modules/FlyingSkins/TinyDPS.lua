local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales


if C.skins.TinyDPS == true then
-- TinyDPS editless skin, by Dajova
local TinyDPS = CreateFrame("Frame")
TinyDPS:RegisterEvent("ADDON_LOADED")
TinyDPS:SetScript("OnEvent", function(self, event, addon)
	if not addon == "TinyDPS" then return end

	tdps.width = 144
	tdps.barHeight = 16
	tdpsFont.name = C["media"].font

	tdpsPosition = {x = 0, y = -6}

	tdpsFrame:SetHeight(tdps.barHeight + 4)
	tdpsFrame:SetTemplate("Transparent")

	tdpsAnchor:SetPoint('BOTTOMLEFT', TukuiMinimapStatsLeft or TukuiReputation or TukuiMinimap, 'BOTTOMLEFT', 0, -6)

	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = C["media"].blank, edgeFile = C["media"].blank, tile = false, tileSize = 1, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0}})
		tdpsStatusBar:SetStatusBarTexture(C["media"].blank)
	end

	self:UnregisterEvent("ADDON_LOADED")
end)
end