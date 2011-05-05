local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
--------------------------------------------------------------------
-- Crit (Spell or Melee.. or ranged)
--------------------------------------------------------------------

if C["datatext"].crit and C["datatext"].crit > 0 then
	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C.media.pixelfont, C["datatext"].fontsize, "THINOUTLINE")
	T.PP(C["datatext"].crit, Text)
	local c = T.oUF_colors.class[T.myclass]
	Text:SetTextColor(c[1], c[2], c[3])

	local int = 1

	local function Update(self, t)
		int = int - t
		meleecrit = GetCritChance()
		spellcrit = GetSpellCritChance(1)
		rangedcrit = GetRangedCritChance()
		if spellcrit > meleecrit then
			CritChance = spellcrit
		elseif select(2, UnitClass("Player")) == "HUNTER" then    
			CritChance = rangedcrit
		else
			CritChance = meleecrit
		end
		if int < 0 then
			Text:SetText(format("%.2f", CritChance) .. "%"..L.datatext_playercrit)
			int = 1
		end     
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end