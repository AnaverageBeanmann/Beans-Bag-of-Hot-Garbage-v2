AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/skeletons/obese.mdl"}
ENT.StartHealth = 1000

ENT.Bleeds = true
ENT.BloodColor = "Red"

ENT.GeneralSoundPitch1 = 60
ENT.GeneralSoundPitch2 = 75
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"player/footsteps/tank/walk/tank_walk01.wav",
		"player/footsteps/tank/walk/tank_walk02.wav",
		"player/footsteps/tank/walk/tank_walk03.wav",
		"player/footsteps/tank/walk/tank_walk04.wav",
		"player/footsteps/tank/walk/tank_walk05.wav",
		"player/footsteps/tank/walk/tank_walk06.wav",
	}

	self.SoundTbl_Idle = {
		"player/boomer/voice/idle/male_boomer_lurk_01.wav",
		"player/boomer/voice/idle/male_boomer_lurk_02.wav",
		"player/boomer/voice/idle/male_boomer_lurk_03.wav",
		"player/boomer/voice/idle/male_boomer_lurk_04.wav",
		"player/boomer/voice/idle/male_boomer_lurk_05.wav",
		"player/boomer/voice/idle/male_boomer_lurk_06.wav",
		"player/boomer/voice/idle/male_boomer_lurk_07.wav",
		"player/boomer/voice/idle/male_boomer_lurk_08.wav",
		"player/boomer/voice/idle/male_boomer_lurk_09.wav",
		"player/boomer/voice/idle/male_boomer_lurk_10.wav",
		"player/boomer/voice/idle/male_boomer_lurk_11.wav",
		"player/boomer/voice/idle/male_boomer_lurk_12.wav",
		"player/boomer/voice/idle/male_boomer_lurk_13.wav",
		"player/boomer/voice/idle/male_boomer_lurk_14.wav",
		"player/boomer/voice/idle/male_boomer_lurk_15.wav",
	}

	self.SoundTbl_Alert = {
		"player/boomer/voice/alert/male_boomer_alert_04.wav",
		"player/boomer/voice/alert/male_boomer_alert_05.wav",
		"player/boomer/voice/alert/male_boomer_alert_07.wav",
		"player/boomer/voice/alert/male_boomer_alert_10.wav",
		"player/boomer/voice/alert/male_boomer_alert_11.wav",
		"player/boomer/voice/alert/male_boomer_alert_12.wav",
		"player/boomer/voice/alert/male_boomer_alert_13.wav",
		"player/boomer/voice/alert/male_boomer_alert_14.wav",
		"player/boomer/voice/alert/male_boomer_alert_15.wav",
	}

	self.SoundTbl_BeforeMeleeAttack = {
		"player/boomer/voice/attack/male_zombie10_growl1.wav",
		"player/boomer/voice/attack/male_zombie10_growl2.wav",
		"player/boomer/voice/attack/male_zombie10_growl3.wav",
		"player/boomer/voice/attack/male_zombie10_growl4.wav"
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

	self.SoundTbl_BeforeRangeAttack = {
		"player/boomer/voice/vomit/male_boomer_vomit_01.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_02.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_03.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_04.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_09.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_11.wav",
		"player/boomer/voice/vomit/male_boomer_vomit_12.wav",
	}

	self.SoundTbl_AllyDeath = {
		"player/boomer/voice/pain/male_boomer_shoved_03.wav",
		"player/boomer/voice/pain/male_boomer_shoved_04.wav",
		"player/boomer/voice/pain/male_boomer_shoved_05.wav",
		"player/boomer/voice/pain/male_boomer_shoved_06.wav",
		"player/boomer/voice/pain/male_boomer_shoved_07.wav",
	}

	self.SoundTbl_Pain = {
		"player/boomer/voice/pain/male_boomer_painshort_02.wav",
		"player/boomer/voice/pain/male_boomer_painshort_03.wav",
		"player/boomer/voice/pain/male_boomer_painshort_04.wav",
		"player/boomer/voice/pain/male_boomer_painshort_05.wav",
		"player/boomer/voice/pain/male_boomer_painshort_06.wav",
		"player/boomer/voice/pain/male_boomer_painshort_07.wav",
	}

	self.SoundTbl_Death = {
		"player/boomer/voice/pain/male_boomer_shoved_03.wav",
		"player/boomer/voice/pain/male_boomer_shoved_04.wav",
		"player/boomer/voice/pain/male_boomer_shoved_05.wav",
		"player/boomer/voice/pain/male_boomer_shoved_06.wav",
		"player/boomer/voice/pain/male_boomer_shoved_07.wav",
	}

	self.FootStepSoundLevel = 85
	self.AllyDeathSoundPitch = VJ_Set(35,40)

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnEat(status, statusInfo)
	if status == "CheckFood" then
		return self:Health() != self:GetMaxHealth()
	elseif status == "BeginEating" then
		self:SetIdleAnimation({ACT_HL2MP_IDLE_CROUCH_ZOMBIE_01}, true)
		local anim = {"vjseq_Stand_to_crouch"}
		return
			self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
	elseif status == "Eat" then
		local food = self.EatingData.Ent
		local damage = 50
		local foodHP = food:Health() * 5
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), self:GetMaxHealth()))
		food:SetHealth(foodHP - damage)
		local bloodData = food.BloodData
		if bloodData then
			local bloodPos = food:GetPos() + food:OBBCenter()
			local bloodParticle = VJ_PICK(bloodData.Particle)
			if bloodParticle then
				ParticleEffect(bloodParticle, bloodPos, self:GetAngles())
			end
		end
		return 1
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then
			local anim = {"vjseq_Crouch_to_stand"}				
			return
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
		end
	end
	return 0
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()

		self.PlayingAttackAnimation = false
		self:StopAttacks(false)
		self.vACT_StopAttacks = false

		self:VJ_ACT_PLAYACTIVITY("vjseq_choke_miss",true,false,true)

		self.AnimTbl_MeleeAttack = {
			"vjseq_enter_choke",
		}

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)

	if self.BBOHG_Calcium_Obese_Voring == true then

		if hitEnt:IsNPC() or hitEnt:IsNextBot() then

			hitEnt:Remove()
			VJ_EmitSound(self, "npc/barnacle/neck_snap"..math.random(1,2)..".wav", 90, 100)
			VJ_EmitSound(self, "physics/body/body_medium_break"..math.random(2,4)..".wav", 90, 100)
			VJ_EmitSound(self, "vo/sandwicheat09.mp3", 90, math.random(70,80))
			VJ_EmitSound(self, "bbohg/fx/trucker_scream.mp3", 90, math.random(30,200))
			VJ_EmitSound(self, "bbohg/fx/Bite.mp3", 90, 100)

			timer.Simple(math.random(1,9),function() if IsValid(self) then

				-- local randbur = math.random(1,9)
				-- if randbur == 1 then
					VJ_EmitSound(self, "player/taunt_burp.wav", 90, math.random(50,150))
				-- elseif randbur == 2 then
					-- VJ_EmitSound(self, "vo/taunts/demo/taunt_demo_burp_03.mp3", 90, 100)
				-- elseif randbur == 3 then
					-- VJ_EmitSound(self, "vo/taunts/engy/eng_guzzle_04_burp.mp3", 90, 100)
				-- else
					-- VJ_EmitSound(self, "vo/burp0"..math.random(2,7)..".mp3", 90, 100)
				-- end

				-- if self.BBOHG_Calcium_Obese_VPoints >= 0 then
					-- self.HasRangedAttack = true
				-- end

				self.BBOHG_Calcium_Obese_VPoints = self.BBOHG_Calcium_Obese_VPoints + 1

			end end)

		end

		if hitEnt:IsPlayer() then

			local d = DamageInfo()
			d:SetDamage(9999)
			d:SetAttacker(self)
			d:SetDamageType(DMG_DIRECT) 
			hitEnt:TakeDamageInfo(d)

			VJ_EmitSound(hitEnt, "npc/barnacle/neck_snap"..math.random(1,2)..".wav", 50, 100)
			VJ_EmitSound(hitEnt, "physics/body/body_medium_break"..math.random(2,4)..".wav", 50, 100)


		end

		self:CustomOnMeleeAttack_Miss()

	end

	if self.BBOHG_Calcium_Obese_Voring == false && !isProp then	

		VJ_EmitSound(self, "bbohg/fx/Bow4.mp3", 90, 100)

		if (hitEnt.IsVJBaseSNPC && hitEnt.MovementType == VJ_MOVETYPE_GROUND && !hitEnt.VJ_IsHugeMonster && !hitEnt.IsVJBaseSNPC_Tank) then

			hitEnt:StopMoving()
			hitEnt:SetState(VJ_STATE_ONLY_ANIMATION)
			hitEnt:VJ_DoSetEnemy(self,true,true)
			local ang = self:GetAngles()
			hitEnt:SetAngles(Angle(ang.x,(self:GetPos() -hitEnt:GetPos()):Angle().y,ang.z))

			timer.Simple(self.SlowPlayerOnMeleeAttackTime,function()

				if IsValid(hitEnt) && !self.PlayingAttackAnimation then

					hitEnt:SetState()

				end

			end)

		end

	end

	return false
end -- return true to disable the attack and move onto the next entity!
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_AfterStartTimer(seed)
	self.BBOHG_Calcium_Obese_VPoints = self.BBOHG_Calcium_Obese_VPoints - 1
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo, hitgroup)
	if self:GetSequence() == self:LookupSequence("choke_eating") or self:GetSequence() == self:LookupSequence("enter_choke") then
		self.PlayingAttackAnimation = false
		self:StopAttacks(false)
		self.vACT_StopAttacks = false
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "vj_gib/default_gib_splat.wav", 100, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/