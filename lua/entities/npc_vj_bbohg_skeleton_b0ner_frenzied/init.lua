AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/skeletons/boner_frenzied.mdl"}
ENT.StartHealth = 50
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"bbohg/skeletons/step (1).mp3",
		"bbohg/skeletons/step (2).mp3",
		"bbohg/skeletons/step (3).mp3",
		"bbohg/skeletons/step (4).mp3"
	}

	self.SoundTbl_Alert = {
		"bbohg/skeletons/frenzied/alert.mp3"
	}

	self.SoundTbl_CombatIdle = {
		"bbohg/skeletons/frenzied/searching.mp3"
	}

	self.SoundTbl_MeleeAttack = {
		"bbohg/skeletons/frenzied/punch.mp3"
	}

	self.SoundTbl_MeleeAttackMiss = {
		"bbohg/skeletons/frenzied/woosh.mp3"
	}

	self.SoundTbl_AllyDeath = {
		"bbohg/skeletons/frenzied/alert.mp3"
	}
	self.SoundTbl_Pain = {
		"bbohg/skeletons/frenzied/pain.mp3"
	}
	self.SoundTbl_Death = {
		"bbohg/skeletons/frenzied/death.mp3"
	}

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	local anim = {"vjseq_BR2_Roar"}
	self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self.BBOHG_b0ner_Frenzied_Vampire_Bloodied then
		self:SetHealth(math.Clamp(self:Health() + (self.MeleeAttackDamage), self:Health(), self:GetMaxHealth()))
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnLeapAttack_BeforeStartTimer(seed)
	local anim = {"vjseq_Leap"}
	self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "bbohg/skeletons/frenzied/death.mp3", 90, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/