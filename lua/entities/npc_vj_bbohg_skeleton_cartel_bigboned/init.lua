AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 5000
ENT.Model = {"models/bbohg/skeletons/big_boned.mdl"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"player/footsteps/giant1.wav",
		"player/footsteps/giant2.wav"
	}

	self.SoundTbl_Idle = {
		"vo/demoman_gibberish01.mp3",
		"vo/demoman_gibberish02.mp3",
		"vo/demoman_gibberish03.mp3",
		"vo/demoman_gibberish04.mp3",
		"vo/demoman_gibberish05.mp3",
		"vo/demoman_gibberish06.mp3",
		"vo/demoman_gibberish07.mp3",
		"vo/demoman_gibberish08.mp3",
		"vo/demoman_gibberish09.mp3",
		"vo/demoman_gibberish10.mp3",
		"vo/demoman_gibberish11.mp3",
		"vo/demoman_gibberish12.mp3",
		"vo/demoman_gibberish13.mp3",
	}

	self.SoundTbl_CombatIdle = {
		"vo/demoman_gibberish01.mp3",
		"vo/demoman_gibberish02.mp3",
		"vo/demoman_gibberish03.mp3",
		"vo/demoman_gibberish04.mp3",
		"vo/demoman_gibberish05.mp3",
		"vo/demoman_gibberish06.mp3",
		"vo/demoman_gibberish07.mp3",
		"vo/demoman_gibberish08.mp3",
		"vo/demoman_gibberish09.mp3",
		"vo/demoman_gibberish10.mp3",
		"vo/demoman_gibberish11.mp3",
		"vo/demoman_gibberish12.mp3",
		"vo/demoman_gibberish13.mp3",
		"vo/demoman_laughhappy01.mp3",
		"vo/demoman_laughhappy02.mp3",
		"vo/demoman_laughlong01.mp3",
		"vo/demoman_laughlong02.mp3",
		"vo/demoman_mvm_resurrect07.mp3",
		"vo/demoman_mvm_resurrect09.mp3",
	}

	self.SoundTbl_Alert = {
		"vo/demoman_autocappedintelligence02.mp3",
		"vo/demoman_battlecry01.mp3",
		"vo/demoman_battlecry02.mp3",
		"vo/demoman_battlecry03.mp3",
		"vo/demoman_battlecry04.mp3",
		"vo/demoman_battlecry05.mp3",
		"vo/demoman_battlecry06.mp3",
		"vo/demoman_battlecry07.mp3",
		"vo/demoman_mvm_loot_common01.mp3",
		"vo/demoman_mvm_loot_common02.mp3",
		"vo/demoman_mvm_loot_common03.mp3",
		"vo/demoman_mvm_loot_common04.mp3",
		"vo/demoman_mvm_loot_godlike01.mp3",
		"vo/demoman_mvm_loot_rare01.mp3",
		"vo/demoman_mvm_loot_rare02.mp3",
		"vo/demoman_mvm_resurrect01.mp3",
		"vo/demoman_mvm_resurrect05.mp3",
		"vo/demoman_mvm_resurrect06.mp3",
		"vo/demoman_dominationengineer06.mp3"
	}

	self.SoundTbl_CallForHelp = {
		"vo/demoman_cartgoingforwardoffense01.mp3",
		"vo/demoman_cartgoingforwardoffense02.mp3",
		"vo/demoman_cartgoingforwardoffense03.mp3",
		"vo/demoman_cartgoingforwardoffense04.mp3",
		"vo/demoman_cartgoingforwardoffense05.mp3",
		"vo/demoman_go01.mp3",
		"vo/demoman_go02.mp3",
		"vo/demoman_go03.mp3",
		"vo/demoman_helpme01.mp3",
		"vo/demoman_helpme02.mp3",
		"vo/demoman_helpme03.mp3",
		"vo/demoman_incoming01.mp3",
		"vo/demoman_incoming02.mp3",
		"vo/demoman_incoming03.mp3",
	}

	self.SoundTbl_BeforeMeleeAttack = {
		"vo/burp02.mp3",
		"vo/burp03.mp3",
		"vo/burp04.mp3",
		"vo/burp05.mp3",
		"vo/burp06.mp3",
		"vo/burp07.mp3",
		"vo/demoman_laughshort01.mp3",
		"vo/demoman_laughshort02.mp3",
		"vo/demoman_laughshort03.mp3",
		"vo/demoman_laughshort04.mp3",
		"vo/demoman_laughshort05.mp3",
		"vo/demoman_laughshort06.mp3",
	}

	self.SoundTbl_MeleeAttack = {
		"physics/body/body_medium_impact_hard1.wav",
		"physics/body/body_medium_impact_hard2.wav",
		"physics/body/body_medium_impact_hard3.wav",
		"physics/body/body_medium_impact_hard4.wav",
		"physics/body/body_medium_impact_hard5.wav"
	}

	self.SoundTbl_MeleeAttackMiss = {
		"npc/zombie/claw_miss2.wav",
		"npc/zombie/claw_miss1.wav"
	}

	self.SoundTbl_LostEnemy = {
		"vo/demoman_cheers01.mp3",
		"vo/demoman_cheers02.mp3",
		"vo/demoman_cheers03.mp3",
		"vo/demoman_cheers04.mp3",
		"vo/demoman_cheers05.mp3",
		"vo/demoman_cheers06.mp3",
		"vo/demoman_cheers07.mp3",
		"vo/demoman_cheers08.mp3",
	}

	self.SoundTbl_AllyDeath = {
		"vo/demoman_autodejectedtie01.mp3",
		"vo/demoman_autodejectedtie02.mp3",
		"vo/demoman_autodejectedtie03.mp3",
		"vo/demoman_autodejectedtie04.mp3",
		"vo/demoman_jeers01.mp3",
		"vo/demoman_jeers02.mp3",
		"vo/demoman_jeers03.mp3",
		"vo/demoman_jeers07.mp3",
		"vo/demoman_jeers08.mp3",
		"vo/demoman_negativevocalization01.mp3",
		"vo/demoman_negativevocalization02.mp3",
		"vo/demoman_negativevocalization03.mp3",
		"vo/demoman_negativevocalization04.mp3",
		"vo/demoman_negativevocalization05.mp3",
		"vo/demoman_negativevocalization06.mp3",
		"vo/demoman_sf12_badmagic05.mp3",
		"vo/demoman_sf12_badmagic07.mp3",
		"vo/demoman_sf12_badmagic08.mp3",
		"vo/demoman_sf12_badmagic09.mp3",
		"vo/demoman_sf12_badmagic10.mp3",
	}

	self.SoundTbl_Pain = {
		"vo/demoman_painsevere01.mp3",
		"vo/demoman_painsevere02.mp3",
		"vo/demoman_painsevere03.mp3",
		"vo/demoman_painsevere04.mp3",
		"vo/demoman_painsharp01.mp3",
		"vo/demoman_painsharp02.mp3",
		"vo/demoman_painsharp03.mp3",
		"vo/demoman_painsharp04.mp3",
		"vo/demoman_painsharp05.mp3",
		"vo/demoman_painsharp06.mp3",
		"vo/demoman_painsharp07.mp3",
	}

	self.SoundTbl_Death = {
		"vo/halloween_eyeball/eyeball09.mp3"
	}
	
	
	self.SoundTbl_BeforeRangeAttack = {}

	self.IdleSoundLevel = 80
	self.LostEnemySoundLevel = 80
	self.BeforeMeleeAttackSoundLevel = 80
	self.BeforeRangeAttackSoundLevel = 80
	self.CombatIdleSoundLevel = 85
	self.AlertSoundLevel = 85
	self.CallForHelpSoundLevel = 85
	self.AllyDeathSoundLevel = 85
	self.PainSoundLevel = 85
	self.DeathSoundLevel = 85

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoKilledEnemy(ent, attacker, inflictor)

	if self.BBoHG_Calcium_BigBoned_PhaseTwo then return end

	self.SoundTbl_OnKilledEnemy = {
		"vo/demoman_autocappedintelligence03.mp3",
		"vo/demoman_cartgoingbackdefense02.mp3",
		"vo/demoman_dominationdemoman01.mp3",
		"vo/demoman_dominationdemoman02.mp3",
		"vo/demoman_dominationdemoman03.mp3",
		"vo/demoman_dominationdemoman04.mp3",
		"vo/demoman_eyelandertaunt01.mp3",
		"vo/demoman_eyelandertaunt02.mp3",
		"vo/demoman_goodjob01.mp3",
		"vo/demoman_goodjob02.mp3",
		"vo/demoman_laughevil01.mp3",
		"vo/demoman_laughevil02.mp3",
		"vo/demoman_laughevil03.mp3",
		"vo/demoman_laughevil04.mp3",
		"vo/demoman_laughevil05.mp3",
		"vo/demoman_mvm_resurrect08.mp3",
		"vo/demoman_no01.mp3",
		"vo/demoman_no02.mp3",
		"vo/demoman_no03.mp3",
		"vo/demoman_painsharp01.mp3",
		"vo/demoman_painsharp02.mp3",
		"vo/demoman_painsharp03.mp3",
		"vo/demoman_painsharp04.mp3",
		"vo/demoman_painsharp05.mp3",
		"vo/demoman_sf13_influx_big01.mp3",
		"vo/demoman_sf13_influx_big02.mp3",
		"vo/demoman_sf13_influx_big03.mp3",
		"vo/demoman_sf13_influx_small02.mp3",
		"vo/demoman_sf13_influx_small04.mp3",
		"vo/demoman_specialcompleted-assistedkill02.mp3",
		"vo/demoman_specialcompleted01.mp3",
		"vo/demoman_specialcompleted02.mp3",
		"vo/demoman_specialcompleted04.mp3",
		"vo/demoman_specialcompleted07.mp3",
		"vo/demoman_specialcompleted08.mp3",
		"vo/demoman_specialcompleted09.mp3",
		"vo/demoman_dominationheavy04.mp3",
		"vo/demoman_dominationscout03.mp3",
		"vo/demoman_dominationpyro01.mp3",
		"vo/demoman_dominationpyro02.mp3",
		"vo/demoman_dominationpyro03.mp3",
		"vo/demoman_dominationpyro04.mp3",
		"vo/demoman_dominationsoldier01.mp3",
		"vo/demoman_dominationsoldier04.mp3",
	}

	if math.random(1,3) == 1 then

		-- engineer
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_eng" then

			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationengineer01.mp3",
				"vo/demoman_dominationengineer02.mp3",
				"vo/demoman_dominationengineer03.mp3",
				"vo/demoman_dominationengineer04.mp3",
				"vo/demoman_dominationengineer05.mp3",
			}

		end

		-- heavy
		if ent:GetClass() == "npc_vj_hlrof_otis" then

			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationheavy01.mp3",
				"vo/demoman_dominationheavy02.mp3",
				"vo/demoman_dominationheavy03.mp3",
				"vo/demoman_dominationheavy05.mp3",
			}

		end

		-- medic
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_med" then
			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationmedic01.mp3",
				"vo/demoman_dominationmedic02.mp3",
				"vo/demoman_dominationmedic04.mp3"
			}
		end

		-- scout
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_med" then
			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationscout01.mp3",
				"vo/demoman_dominationscout02.mp3",
				"vo/demoman_dominationscout03.mp3",
				"vo/demoman_dominationscout04.mp3",
				"vo/demoman_dominationscout05.mp3",
				"vo/demoman_dominationscout06.mp3",
				"vo/demoman_dominationscout07.mp3",
				"vo/demoman_dominationscout08.mp3",
			}
		end

		-- sniper
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_med" then
			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationsniper01.mp3",
				"vo/demoman_dominationsniper02.mp3",
				"vo/demoman_dominationsniper03.mp3",
				"vo/demoman_dominationsniper04.mp3",
			}
		end

		-- soldier
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_med" then
			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationsoldier02.mp3",
				"vo/demoman_dominationsoldier03.mp3",
				"vo/demoman_dominationsoldier05.mp3",
			}
		end

		-- spy
		if ent:GetClass() == "npc_vj_hlrof_hgrunt_med" then
			self.SoundTbl_OnKilledEnemy = {
				"vo/demoman_dominationspy01.mp3",
				"vo/demoman_dominationspy02.mp3",
				"vo/demoman_dominationspy03.mp3",
			}
		end

	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo, hitgroup)
	if
		self:GetSequence() == self:LookupSequence("atk_down") or
		self:GetSequence() == self:LookupSequence("layer_taunt_laugh") or
		self:GetSequence() == self:LookupSequence("atk_spin")
	then
		self.PlayingAttackAnimation = false
		self:StopAttacks(false)
		self.vACT_StopAttacks = false
		return false
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/