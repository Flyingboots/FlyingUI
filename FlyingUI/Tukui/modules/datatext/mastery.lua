local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
--------------------------------------------------------------------
-- Mastery
----------------------------------------------------------------

if not C["datatext"].mastery == nil or C["datatext"].mastery > 0 then
	local Stat = CreateFrame("Frame")

	local Text  = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C.media.pixelfont, C["datatext"].fontsize, "MONOCHROME")
	T.PP(C["datatext"].mastery, Text)
	local c = T.oUF_colors.class[T.myclass]
	Text:SetTextColor(c[1], c[2], c[3])

	local int = 1
	
	local function Update(self, t)
		int = int - t
		if int < 0 then
			Text:SetText("Mastery: "..GetCombatRating(26))
			int = 1
		end
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end