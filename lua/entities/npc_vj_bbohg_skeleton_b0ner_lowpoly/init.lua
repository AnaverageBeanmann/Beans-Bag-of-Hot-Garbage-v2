AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/skeletons/bnor.mdl"}
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"bbohg/skeletons/bnor/step (1).wav",
		"bbohg/skeletons/bnor/step (2).wav",
		"bbohg/skeletons/bnor/step (3).wav",
		"bbohg/skeletons/bnor/step (4).wav"
	}

	self.SoundTbl_Alert = {
		"bbohg/skeletons/bnor/alert.wav",
		"bbohg/skeletons/bnor/doot.wav"
	}

	self.SoundTbl_BeforeMeleeAttack = {
		"bbohg/skeletons/bnor/shortdoot (1).wav",
		"bbohg/skeletons/bnor/shortdoot (2).wav"
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

	self.SoundTbl_AllyDeath = {
		"bbohg/skeletons/bnor/alert.wav"
	}
	self.SoundTbl_Pain = {
		"bbohg/skeletons/bnor/alert.wav"
	}
	self.SoundTbl_Death = {
		"bbohg/skeletons/bnor/death.wav",
		"bbohg/skeletons/bnor/doot.wav"
	}

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "bbohg/skeletons/bnor/death.wav", 90, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/