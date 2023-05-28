/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Bean's Bag of Hot Garbage"
local AddonName = "Bean's Bag of Hot Garbage"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_bbohg_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')
	local vCat = "Bean's Bag of Hot Garbage"
	VJ.AddCategoryInfo(vCat,{Icon = "icons/icon_bbohg.png"})
	
	VJ.AddNPC("Base NPC","npc_vj_bbohg_basenpc",vCat)

		VJ.AddNPC("b0ne(r) (Shambler)","npc_vj_bbohg_skeleton_b0ner_shambler",vCat)
		VJ.AddNPC("b0ne(r) (Frenzied)","npc_vj_bbohg_skeleton_b0ner_frenzied",vCat)
		VJ.AddNPC("bnor","npc_vj_bbohg_skeleton_b0ner_lowpoly",vCat)
		VJ.AddNPC("Obese","npc_vj_bbohg_skeleton_cartel_obese",vCat)
		VJ.AddNPC("Big Boned","npc_vj_bbohg_skeleton_cartel_bigboned",vCat)
		

		VJ.AddNPC("(Spawner) b0ne(r)s","npc_vj_bbohg_spawner_skeletons_b0ner",vCat)

	-- Oddities (Anomalies and Cryptids)
		VJ.AddNPC("Watcher","npc_vj_bbohg_oddity_slashco_watcher",vCat)
	
	
	local AddConvars = {}
	
	AddConvars["vj_BBOHG_BossMusic"] = 1
	AddConvars["vj_BBOHG_NoGodsNoMasters"] = 0
	
	AddConvars["vj_BBOHG_Gibs"] = 1
	AddConvars["vj_BBOHG_FriendlyTossers"] = 1
	AddConvars["vj_BBOHG_Friendlyb0ners"] = 0
	AddConvars["vj_BBOHG_FriendlyZombknees"] = 0
	AddConvars["vj_BBOHG_FriendlyHobos"] = 0
	AddConvars["vj_BBOHG_FriendlyRockers"] = 0
	AddConvars["vj_BBOHG_FriendlyMarks"] = 0
	AddConvars["vj_BBOHG_FriendlyChells"] = 0
	AddConvars["vj_BBOHG_FriendlyFlemmings"] = 0
	AddConvars["vj_BBOHG_FriendlyGrampa"] = 1
	AddConvars["vj_BBOHG_BossNotifications"] = 1
	AddConvars["vj_BBOHG_BossReinforcements"] = 1
	AddConvars["vj_BBOHG_BossCleanup"] = 1
	AddConvars["vj_BBOHG_AmmoDrops"] = 0
	AddConvars["vj_BBOHG_HealthDrops"] = 0
	AddConvars["vj_BBOHG_ZombineHeadshots"] = 0
	AddConvars["vj_BBOHG_ZombieSplits"] = 1
	AddConvars["vj_BBOHG_ZombieCrabs"] = 1
	AddConvars["vj_BBOHG_ZombineCrabs"] = 1
	AddConvars["vj_BBOHG_BonemergePipe"] = 0
	AddConvars["vj_BBOHG_MusicVolume"] = 5
	AddConvars["vj_BBOHG_CheeseKamikazeAnimation"] = 0
	AddConvars["vj_BBOHG_DamageHalos"] = 0
	
	
	for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
	if (CLIENT) then
		local function VJ_BBOHG(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not an admin!"})
				Panel:ControlHelp("Note: Only admins can change these settings!")
			return
		end
	end
		Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
	local vj_resetbutton = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
		vj_resetbutton.Options["#vjbase.menugeneral.default"] = { 

			vj_BBOHG_BossMusic = "1",
			vj_BBOHG_NoGodsNoMasters = "0",

			vj_BBOHG_Gibs = "1",
			vj_BBOHG_FriendlyTossers = "1",
			vj_BBOHG_Friendlyb0ners = "0",
			vj_BBOHG_FriendlyZombknees = "0",
			vj_BBOHG_FriendlyHobos = "0",
			vj_BBOHG_FriendlyRockers = "0",
			vj_BBOHG_FriendlyMarks = "0",
			vj_BBOHG_FriendlyChells = "0",
			vj_BBOHG_FriendlyFlemmings = "0",
			vj_BBOHG_FriendlyGrampa = "1",
			vj_BBOHG_BossNotifications = "1",
			vj_BBOHG_BossReinforcements = "1",
			vj_BBOHG_BossCleanup = "1",
			-- vj_BBOHG_Difficulty = "2",
			vj_BBOHG_AmmoDrops = "0",
			vj_BBOHG_HealthDrops = "0",
			vj_BBOHG_ZombineHeadshots = "0",
			vj_BBOHG_ZombieSplits = "1",
			vj_BBOHG_ZombieCrabs = "1",
			vj_BBOHG_ZombineCrabs = "1",
			vj_BBOHG_BonemergePipe = "0",
			vj_BBOHG_MusicVolume = "5",
			vj_BBOHG_CheeseKamikazeAnimation = "1",
			vj_BBOHG_DamageHalos = "1",
}

	Panel:AddControl("ComboBox", vj_resetbutton)
	Panel:ControlHelp("Note: Only future spawned npcs will be affected!")
	
	
	Panel:AddControl("Checkbox", {Label ="Eveyone is allied and against you?", Command ="vj_BBOHG_NoGodsNoMasters"})
	Panel:ControlHelp("Warning: This will override all other npc relationship convars!")
	
	Panel:AddControl("Checkbox", {Label ="Tossers are friendly?", Command ="vj_BBOHG_FriendlyTossers"})
	Panel:AddControl("Checkbox", {Label ="b0ne(r)s are friendly?", Command ="vj_BBOHG_Friendlyb0ners"})
	Panel:AddControl("Checkbox", {Label ="Zombknee Nation members are friendly?", Command ="vj_BBOHG_FriendlyZombknees"})
	Panel:AddControl("Checkbox", {Label ="Hobos are friendly?", Command ="vj_BBOHG_FriendlyHobos"})
	Panel:AddControl("Checkbox", {Label ="The Rock and Rocklings are friendly?", Command ="vj_BBOHG_FriendlyRockers"})
	Panel:AddControl("Checkbox", {Label ="Marks are friendly?", Command ="vj_BBOHG_FriendlyMarks"})
	Panel:AddControl("Checkbox", {Label ="Chells are friendly?", Command ="vj_BBOHG_FriendlyChells"})
	Panel:AddControl("Checkbox", {Label ="Flemmings are friendly?", Command ="vj_BBOHG_FriendlyFlemmings"})
	Panel:AddControl("Checkbox", {Label ="Grampa is friendly?", Command ="vj_BBOHG_FriendlyGrampa"})
	
	Panel:AddControl("Checkbox", {Label ="Bosses can spawn reinforcements?", Command ="vj_BBOHG_BossReinforcements"})
	
	Panel:AddControl("Checkbox", {Label ="Crabless Zombines can be headshot?", Command ="vj_BBOHG_ZombineHeadshots"})
	Panel:AddControl("Checkbox", {Label ="Headcrap Xombies can split?", Command ="vj_BBOHG_ZombieSplits"})
	Panel:AddControl("Checkbox", {Label ="Headcrap Xombies can drop live Crabs?", Command ="vj_BBOHG_ZombieCrabs"})
	Panel:AddControl("Checkbox", {Label ="Zombines can drop live Crabs?", Command ="vj_BBOHG_ZombineCrabs"})
	
	Panel:AddControl("Checkbox", {Label ="Enable Gibbing?", Command ="vj_BBOHG_Gibs"})
	Panel:ControlHelp("If you're crashing from something in BBoHG Gibbing, try disabling this.")
	
	Panel:AddControl("Checkbox", {Label ="Tweaked Headcrap Xombie pipe visuals?", Command ="vj_BBOHG_BonemergePipe"})
	Panel:ControlHelp("For some reason, the pipe messes with or completely disables shadows on the Headcrap Xombie.")
	Panel:ControlHelp("If this is off, the shadow issue won't be present, but the pipe will look a bit off.")
	
	Panel:AddControl("Checkbox", {Label ="Alternate Cheese kamikaze animations?", Command ="vj_BBOHG_CheeseKamikazeAnimation"})
	Panel:ControlHelp("If Enabled, Cheeses will use the animation used for entering kamikaze mode when they're about to detonate.")
	
	Panel:AddControl("Checkbox", {Label ="Enable radius damage indicators?", Command ="vj_BBOHG_DamageHalos"})
	Panel:ControlHelp("If Enabled, radius damage (such as kamikaze Cheeses) will have their radius highlighted by a colored ring.")
	
	Panel:AddControl("Checkbox", {Label ="Enable Boss Notifications?", Command ="vj_BBOHG_BossNotifications"})
	Panel:ControlHelp("Messages for bosses spawning and dying.")

	Panel:AddControl("Checkbox", {Label ="Bosses remove all living minions apon death?", Command ="vj_BBOHG_BossCleanup"})
	Panel:ControlHelp("Note: Due to how they summon minions, when a Giga Gore Child or big b0ne(r) dies, they will kill all existing le bebe's or b0ne(r)s respectively.")
	
	Panel:AddControl("Checkbox", {Label ="Boss Music?", Command ="vj_BBOHG_BossMusic"})

	Panel:AddControl("Slider", {Label ="Music volume.",Command ="vj_BBOHG_MusicVolume",Min = "0",Max = "9"})
	Panel:ControlHelp("All music in BBoHG has been normalized to 0 dB in Audacity.")
	Panel:ControlHelp("0 - 0.1")
	Panel:ControlHelp("1 - 0.2")
	Panel:ControlHelp("2 - 0.3")
	Panel:ControlHelp("3 - 0.4")
	Panel:ControlHelp("4 - 0.5")
	Panel:ControlHelp("5 - 0.6")
	Panel:ControlHelp("6 - 0.7")
	Panel:ControlHelp("7 - 0.8")
	Panel:ControlHelp("8 - 0.9")
	Panel:ControlHelp("9 - 1")
	
	Panel:AddControl("Slider", {Label ="Ammo drop type preference.",Command ="vj_BBOHG_AmmoDrops",Min = "0",Max = "12"})
	Panel:ControlHelp("You will need the respective addon for their ammo to work!")
	Panel:ControlHelp("0 - Default / Half-Life 2")
	Panel:ControlHelp("1 - ARCCW Base")
	Panel:ControlHelp("2 - TFA Base")
	Panel:ControlHelp("3 - C.W. 2.0")
	Panel:ControlHelp("4 - FA:S")
	Panel:ControlHelp("5 - M9K")
	Panel:ControlHelp("6 - Underhell")
	Panel:ControlHelp("7 - Darken217's SciFi Weapons")
	Panel:ControlHelp("8 - Crunchy's Ultimate Item Pickups")
	Panel:ControlHelp("9 - Half-Life Source")
	Panel:ControlHelp("10 - Upset's Half-Life 1 SWEPs")
	Panel:ControlHelp("11 - RAGE SWEP Pack")
	Panel:ControlHelp("12 - Tactical Intervention Weapons Pack")
	
	Panel:AddControl("Slider", {Label ="Health / Armor drop type preference.",Command ="vj_BBOHG_HealthDrops",Min = "0",Max = "5"})
	Panel:ControlHelp("You will need the respective addon for their drops to work!")
	Panel:ControlHelp("0 - Default / Half-Life 2")
	Panel:ControlHelp("1 - Arctic's Combat Stims")
	Panel:ControlHelp("2 - Underhell")
	Panel:ControlHelp("3 - Darken217's SciFi Weapons")
	Panel:ControlHelp("4 - Crunchy's Ultimate Item Pickups")
	Panel:ControlHelp("5 - VIVO")
	
	Panel:AddPanel(typebox)

end

	function VJ_ADDTOMENU_BBOHG(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","BBOHG","BBOHG","","", VJ_BBOHG, {} )
	end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_BBOHG", VJ_ADDTOMENU_BBOHG )
	end

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end