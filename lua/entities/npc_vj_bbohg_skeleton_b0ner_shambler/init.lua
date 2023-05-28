AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/skeletons/boner_shambler.mdl"}
ENT.StartHealth = 75
ENT.HullType = HULL_HUMAN
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_b0ne(r)"} 
ENT.Bleeds = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {
	"nz_death_1",
	"nz_death_2",
	"nz_death_3"
}
ENT.DeathAnimationChance = 3 -- Put 1 if you want it to play the animation all the time
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanOpenDoors = false

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90

ENT.PainSoundChance = 3
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	self.TimeUntilMeleeAttackDamage = false
	self.DisableFootStepSoundTimer = true

	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
	self.HasRangeAttack = false

	self.CanFlinch = 1
	self.AnimTbl_Flinch = {
		"vjseq_physflinch1",
		"vjseq_physflinch2",
		"vjseq_physflinch3"
	}
	self.HasHitGroupFlinching = true 
	self.HitGroupFlinching_DefaultWhenNotHit = true
	self.HitGroupFlinching_Values = {
		{
			HitGroup = {HITGROUP_HEAD}, Animation = {
				"vjges_ep_flinch_head"
			}
		}, 
		{
			HitGroup = {HITGROUP_STOMACH}, Animation = {
				"vjges_ep_flinch_chest"
			}
		}, 
		{
			HitGroup = {HITGROUP_CHEST}, Animation = {
				"vjges_ep_flinch_chest"
			}
		}, 
		{
			HitGroup = {HITGROUP_LEFTARM}, Animation = {
				"vjges_ep_flinch_leftArm"
			}
		}, 
		{
			HitGroup = {HITGROUP_RIGHTARM}, Animation = {
				"vjges_ep_flinch_rightArm"
			}
		}, 
		{
			HitGroup = {HITGROUP_LEFTLEG}, Animation = {
				"vjseq_flinch_leftLeg"
			}
		}, 
		{
			HitGroup = {HITGROUP_RIGHTLEG}, Animation = {
				"vjseq_flinch_rightLeg"
			}
		}
	}


	if self:GetClass() == "npc_vj_bbohg_skeleton_b0ner_shambler" then

		self.AnimTbl_MeleeAttack = {
			"vjseq_attackA",
			"vjseq_attackB",
			"vjseq_attackC",
			"vjseq_attackD",
			"vjseq_attackE",
			"vjseq_attackF",
			"vjseq_swatleftlow",
			"vjseq_swatleftmid",
			"vjseq_swatrightlow",
			"vjseq_swatrightmid",
			"vjseq_Breakthrough"
		}

		if math.random(1,3) == 1 then

			self.BBOHG_b0ner_Shambler_Hellbound = true

		end

		self.MeleeAttackDamage = math.Rand(15,20)

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_b0ner_frenzied" then

		self.MeleeAttackDamage = math.Rand(10,15)

		self.AnimTbl_MeleeAttack = {
			"vjseq_BR2_Attack",
			"vjseq_Melee",
			"vjseq_Melee",
			"vjseq_Melee",
			"vjseq_Melee"
		}

		self.HasLeapAttack = true
		self.LeapAttackDamage = math.Rand(10,15)
		self.LeapAttackDamageType = DMG_CLUB
		self.AnimTbl_LeapAttack = {"vjseq_LeapStrike"}
		self.LeapAttackAnimationDelay = 0.36
		self.LeapAttackAnimationDecreaseLengthAmount = -0.5
		self.TimeUntilLeapAttackDamage = false
		self.TimeUntilLeapAttackVelocity = 0.25
		self.LeapAttackVelocityForward = 300
		self.LeapAttackVelocityUp = 250

		local EyeGlow1 = ents.Create("env_sprite")
		EyeGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		EyeGlow1:SetKeyValue("scale", "0.02")
		EyeGlow1:SetKeyValue("rendermode","5")
		EyeGlow1:SetKeyValue("rendercolor","255 0 0 255")
		EyeGlow1:SetKeyValue("spawnflags","1") -- If animated
		EyeGlow1:SetParent(self)
		EyeGlow1:Fire("SetParentAttachment", "eyeglow1")
		EyeGlow1:Spawn()
		EyeGlow1:Activate()
		self:DeleteOnRemove(EyeGlow1)
		
		local EyeGlow2 = ents.Create("env_sprite")
		EyeGlow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		EyeGlow2:SetKeyValue("scale", "0.02")
		EyeGlow2:SetKeyValue("rendermode","5")
		EyeGlow2:SetKeyValue("rendercolor","255 0 0 255")
		EyeGlow2:SetKeyValue("spawnflags","1") -- If animated
		EyeGlow2:SetParent(self)
		EyeGlow2:Fire("SetParentAttachment", "eyeglow2")
		EyeGlow2:Spawn()
		EyeGlow2:Activate()
		self:DeleteOnRemove(EyeGlow2)

		if math.random(1,3) == 1 then

			self.BBOHG_b0ner_Frenzied_Vampire = true

		end

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_b0ner_lowpoly" then

		self.AnimTbl_MeleeAttack = {
			"vjseq_attackB",
			"vjseq_attackB",
			"vjseq_attackE",
		}

		if math.random(1,3) == 1 then

			self.BBOHG_b0ner_bnor_Wraith = true

		end

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" then

		self.SlowPlayerOnMeleeAttack = true
		self.SlowPlayerOnMeleeAttack_WalkSpeed = 0.01
		self.SlowPlayerOnMeleeAttack_RunSpeed = 0.01
		self.SlowPlayerOnMeleeAttackTime = 1.6
		self.HasMeleeAttackSlowPlayerSound = false

		self.HasMeleeAttackKnockBack = true 	
		self.MeleeAttackKnockBack_Forward1 = -500
		self.MeleeAttackKnockBack_Forward2 = -500

		self.HasRangeAttack = false
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_obese_vomit"
		self.AnimTbl_RangeAttack = {"vjges_Vomit_Attack"}
		self.RangeDistance = 300
		self.RangeToMeleeDistance = 150
		self.TimeUntilRangeAttackProjectileRelease = false
		self.NextRangeAttackTime = 10
		self.NextRangeAttackTime_DoRand = 30
		self.RangeUseAttachmentForPosID = "mouth"

		self:SetModelScale(1.25)
		self.CanEat = true

		self.AnimTbl_IdleStand = {"Idle_Standing"}
		self.AnimTbl_Run = {ACT_WALK}
		self.AnimTbl_MeleeAttack = {
			"vjseq_enter_choke",
		}
		self.AnimTbl_Death = {
			"infectiondeath",
			"death_04"
		}

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then

		self.AnimTbl_Death = {"vjseq_primary_death_burning"}
		self.DeathAnimationChance = 1
		self.DeathAnimationTime = 3.9
		self.HasDeathRagdoll = false
		self.AllowedToGib = false

		self.MeleeAttackDamage = math.Rand(20,25)

		self.HasMeleeAttackKnockBack = true 	
		self.MeleeAttackKnockBack_Forward1 = 250
		self.MeleeAttackKnockBack_Forward2 = 300
		self.MeleeAttackKnockBack_Up1 = 150
		self.MeleeAttackKnockBack_Up2 = 175

		self.MeleeAttackMissSoundPitch = VJ_Set(65,70)

		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70

		self.HasRangeAttack = true
		self.TimeUntilRangeAttackProjectileRelease = false
		self.NextRangeAttackTime = 10
		self.NextRangeAttackTime_DoRand = 30

		self:SetModelScale(1.25)

		self.OnlyDoKilledEnemyWhenClear = false
		
		local EyeGlow1 = ents.Create("env_sprite")
		EyeGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		EyeGlow1:SetKeyValue("scale", "0.03")
		EyeGlow1:SetKeyValue("rendermode","5")
		EyeGlow1:SetKeyValue("rendercolor","0 80 255 255")
		EyeGlow1:SetKeyValue("spawnflags","1") -- If animated
		EyeGlow1:SetParent(self)
		EyeGlow1:Fire("SetParentAttachment", "eyeglow1")
		EyeGlow1:Spawn()
		EyeGlow1:Activate()
		self:DeleteOnRemove(EyeGlow1)
		
		local EyeGlow2 = ents.Create("env_sprite")
		EyeGlow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		EyeGlow2:SetKeyValue("scale", "0.03")
		EyeGlow2:SetKeyValue("rendermode","5")
		EyeGlow2:SetKeyValue("rendercolor","0 80 255 255")
		EyeGlow2:SetKeyValue("spawnflags","1") -- If animated
		EyeGlow2:SetParent(self)
		EyeGlow2:Fire("SetParentAttachment", "eyeglow2")
		EyeGlow2:Spawn()
		EyeGlow2:Activate()
		self:DeleteOnRemove(EyeGlow2)

		self.Light1 = ents.Create("light_dynamic")
		self.Light1:SetKeyValue("brightness", "5")
		self.Light1:SetKeyValue("distance", "50")
		self.Light1:SetLocalPos(self:GetPos())
		self.Light1:SetLocalAngles(self:GetAngles())
		self.Light1:Fire("Color", "54 118 255 255")
		self.Light1:SetParent(self)
		self.Light1:Spawn()
		self.Light1:Activate()
		self.Light1:Fire("SetParentAttachment","chest")
		self.Light1:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light1)
		
		local ChestGlow1 = ents.Create("env_sprite")
		ChestGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		ChestGlow1:SetKeyValue("scale", "0.25")
		ChestGlow1:SetKeyValue("rendermode","5")
		ChestGlow1:SetKeyValue("rendercolor","54 118 255 255")
		ChestGlow1:SetKeyValue("spawnflags","1") -- If animated
		ChestGlow1:SetParent(self)
		ChestGlow1:Fire("SetParentAttachment", "chest")
		ChestGlow1:Spawn()
		ChestGlow1:Activate()
		self:DeleteOnRemove(ChestGlow1)
		
		local ChestGlow2 = ents.Create("env_sprite")
		ChestGlow2:SetKeyValue("model","sprites/blueflare1.vmt")
		ChestGlow2:SetKeyValue("scale", "0.25")
		ChestGlow2:SetKeyValue("rendermode","5")
		ChestGlow2:SetKeyValue("rendercolor","54 118 255 255")
		ChestGlow2:SetKeyValue("spawnflags","1") -- If animated
		ChestGlow2:SetParent(self)
		ChestGlow2:Fire("SetParentAttachment", "chest")
		ChestGlow2:Spawn()
		ChestGlow2:Activate()
		self:DeleteOnRemove(ChestGlow2)
		
		local ChestGlow3 = ents.Create("env_sprite")
		ChestGlow3:SetKeyValue("model","sprites/combineball_glow_black_1.vmt")
		ChestGlow3:SetKeyValue("scale", "0.15")
		ChestGlow3:SetKeyValue("rendermode","5")
		ChestGlow3:SetKeyValue("rendercolor","54 118 255 255")
		ChestGlow3:SetKeyValue("spawnflags","1") -- If animated
		ChestGlow3:SetParent(self)
		ChestGlow3:Fire("SetParentAttachment", "chest")
		ChestGlow3:Spawn()
		ChestGlow3:Activate()
		self:DeleteOnRemove(ChestGlow3)

	end

end -- For additional initialize options
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"bbohg/skeletons/step (1).mp3",
		"bbohg/skeletons/step (2).mp3",
		"bbohg/skeletons/step (3).mp3",
		"bbohg/skeletons/step (4).mp3"
	}

	self.SoundTbl_Alert = {
		"bbohg/skeletons/alert.mp3",
		"bbohg/skeletons/doot.mp3"
	}

	self.SoundTbl_BeforeMeleeAttack = {
		"bbohg/skeletons/shortdoot (1).mp3",
		"bbohg/skeletons/shortdoot (2).mp3"
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
		"bbohg/skeletons/alert.mp3"
	}
	self.SoundTbl_Pain = {
		"bbohg/skeletons/alert.mp3"
	}
	self.SoundTbl_Death = {
		"bbohg/skeletons/death.mp3",
		"bbohg/skeletons/doot.mp3"
	}

end
-------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("LEFT MOUSE: Beat their ass!")
end
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

	if self.BBOHG_b0ner_Shambler_Hellbound or self.BBOHG_b0ner_Frenzied_Vampire or self.BBOHG_b0ner_bnor_Wraith then

		if self.Dead == false && self:GetEnemy() != nil && self.VJ_IsBeingControlled == false && !self.BBOHG_b0ner_Shambler_Hellbound_LitUp && self:Visible(self:GetEnemy()) then

			local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

			if enemydist <= 700 then

				if self.BBOHG_b0ner_Shambler_Hellbound then
					self.BBOHG_b0ner_Shambler_Hellbound_LitUp = true
					self:BBOHG_b0ner_Shambler_FlameOn()
				end

			end

		end

		if self.Dead == false && self:GetEnemy() != nil && self.VJ_IsBeingControlled == false && !self.BBOHG_b0ner_Frenzied_Vampire_Bloodied && self:Visible(self:GetEnemy()) && self:GetSequence() != self:LookupSequence("Leap") && self:GetSequence() != self:LookupSequence("LeapStrike") then

			local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

			if enemydist <= 700 then

				if self.BBOHG_b0ner_Frenzied_Vampire then
					self.BBOHG_b0ner_Frenzied_Vampire_BloodEffectT = CurTime() + 1.5
					self.BBOHG_b0ner_Frenzied_Vampire_Bloodied = true
					self:BBOHG_b0ner_Frenzied_BloodUp()
				end

			end

		end

		if self.Dead == false && self:GetEnemy() != nil && self.VJ_IsBeingControlled == false && !self.BBOHG_b0ner_bnor_Wraith_Wraithed && self:Visible(self:GetEnemy()) then

			local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

			if enemydist <= 700 then

				if self.BBOHG_b0ner_bnor_Wraith then
					self.BBOHG_b0ner_bnor_Wraith_Wraithed = true
					self:BBOHG_b0ner_bnor_WraithUp()
				end

			end

		end

	end

	if self.BBOHG_b0ner_Frenzied_Vampire_Bloodied && self.BBOHG_b0ner_Frenzied_Vampire_BloodEffectT < CurTime() then

		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("chest")).Pos)
		bloodeffect:SetColor(VJ_Color2Byte(Color(140,0,0,255)))
		bloodeffect:SetScale(15)
		util.Effect("VJ_Blood1",bloodeffect)

		self.BBOHG_b0ner_Frenzied_Vampire_BloodEffectT = CurTime() + math.random(0.1,4)
		local randpitch = math.random(90,110)
		VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",65,randpitch)
		VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",65,randpitch)
		VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",65,randpitch)
		VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",65,randpitch)

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" then
		if !self.BBOHG_Calcium_Obese_Running then
			if (self:Health() < (self:GetMaxHealth() * 0.5)) then
				VJ_CreateSound(self,self.SoundTbl_BeforeMeleeAttack,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a, self.AlertSoundPitch.b))
				self.AnimTbl_Run = {ACT_RUN}
				self.BBOHG_Calcium_Obese_Running = true
			end
		end
		if self.BBOHG_Calcium_Obese_VPoints <= 0 && self.HasRangeAttack == true then
			self.HasRangeAttack = false
			self.SoundTbl_Breath = {}
		end
		if self.BBOHG_Calcium_Obese_VPoints >= 1 && self.HasRangeAttack == false && !self.Dead then
			VJ_EmitSound(self, "bbohg/fx/Poison.mp3", 90, 100)
			VJ_EmitSound(self, "bbohg/fx/Poison.mp3", 90, 100)

			effects.BeamRingPoint(
				self:GetPos(), -- vector pos
				0.25, -- lifetime
				2, -- start radius
				150, -- end radius
				10, -- width
				3, -- amplitude
				Color(0, 127, 31), -- color
				{
					material="sprites/physgbeamb",
					framerate=20
				}
			)

			self.HasRangeAttack = true
			self.SoundTbl_Breath = {
				"npc/barnacle/barnacle_digesting1.wav",
				"npc/barnacle/barnacle_digesting2.wav"
			}
			self.NextSoundTime_Breath = VJ_Set(1,7)
			self.BreathSoundLevel = 75
			self.BreathSoundPitch = VJ_Set(50,200)
		end
		if self.BBOHG_Calcium_Obese_VPoints >= 3 && self.BBOHG_Calcium_Obese_Indigestion == false then		
			-- VJ_STOPSOUND(self.CurrentBreathSound)
			self.BBOHG_Calcium_Obese_Indigestion = true
			self.SoundTbl_Breath = {
				"player/boomer/voice/idle/indigestion_loop.wav"
			}
			self.NextSoundTime_Breath = VJ_Set(20,20)
			self.BreathSoundLevel = 75
			self.BreathSoundPitch = VJ_Set(100,100)
			VJ_EmitSound(self, "bbohg/fx/uuh.mp3", 90, 70)
			VJ_EmitSound(self, "bbohg/fx/uuh.mp3", 90, 70)
			effects.BeamRingPoint(
				self:GetPos(), -- vector pos
				0.25, -- lifetime
				2, -- start radius
				150, -- end radius
				10, -- width
				3, -- amplitude
				Color(0, 127, 31), -- color
				{
					material="sprites/physgbeamb",
					framerate=20
				}
			)
		end
		if self.BBOHG_Calcium_Obese_VPoints <= 2 && BBOHG_Calcium_Obese_Indigestion then		
			VJ_STOPSOUND(self.CurrentBreathSound)
			self.BBOHG_Calcium_Obese_Indigestion = false
			self.SoundTbl_Breath = {
				"npc/barnacle/barnacle_digesting1.wav",
				"npc/barnacle/barnacle_digesting2.wav"
			}
			self.NextSoundTime_Breath = VJ_Set(1,7)
			self.BreathSoundLevel = 75
			self.BreathSoundPitch = VJ_Set(50,200)
		end
	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then
		if !self.BBoHG_Calcium_BigBoned_PhaseTwo then
			if (self:Health() < (self:GetMaxHealth() * 0.5)) then
				self.BBoHG_Calcium_BigBoned_PhaseTwo = true
				local anim = {"vjseq_layer_taunt09"}
				self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
				self.HasSounds = false
			end
			if self.Alerted && !self.BBoHG_Calcium_BigBoned_CIdleAnim then
				self.BBoHG_Calcium_BigBoned_CIdleAnim = true
				self.AnimTbl_IdleStand = {"shift_idle"}
			end
			if !self.Alerted && self.BBoHG_Calcium_BigBoned_CIdleAnim then
				self.BBoHG_Calcium_BigBoned_CIdleAnim = false
				self.AnimTbl_IdleStand = {"idle"}
			end
		end
	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:BBOHG_b0ner_Shambler_FlameOn()

	local anim = {"vjges_taunt_zombie"}
	self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(193,17,17,255)))
	bloodeffect:SetScale(100)
	util.Effect("VJ_Blood1",bloodeffect)

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(88,0,0,255)))
	bloodeffect:SetScale(50)
	util.Effect("VJ_Blood1",bloodeffect)

	local randomhellnoise = math.random(1,3)
	if randomhellnoise == 1 then
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_0"..math.random(3,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	elseif randomhellnoise == 2 then
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_2"..math.random(0,3)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	else
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_1"..math.random(1,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	end

	if math.random(1,10) == 1 then
		VJ_EmitSound(self,"ambient_mp3/halloween/female_scream_10.mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	else
		VJ_EmitSound(self,"ambient_mp3/halloween/female_scream_0"..math.random(1,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	end

	self.AnimTbl_IdleStand = {"FireIdle"}
	self.AnimTbl_Walk = {ACT_WALK_ON_FIRE}
	self.AnimTbl_Run = {ACT_WALK_ON_FIRE}

	self.HasRangeAttack = true
	self.RangeAttackEntityToSpawn = "obj_vj_bbohg_lostsoul"
	self.AnimTbl_RangeAttack = {"vjges_taunt_zombie"}
	self.RangeToMeleeDistance = 200
	self.TimeUntilRangeAttackProjectileRelease = 1.5
	self.NextRangeAttackTime = 5
	self.NextRangeAttackTime_DoRand = 15
	self.RangeUseAttachmentForPosID = "chest"

	self.AnimTbl_MeleeAttack = {
		"vjseq_releasecrab",
		"vjseq_swatleftmid",
		"vjseq_swatrightmid",
		"vjseq_Breakthrough"
	}

	self.SoundTbl_Breath = {
		"bbohg/skeletons/hallow04.mp3",
		"bbohg/skeletons/hallow05.mp3",
		"bbohg/skeletons/hallow06.mp3",
		"bbohg/skeletons/hallow07.mp3",
		"bbohg/skeletons/hallow08.mp3"
	}

	self.NextSoundTime_Breath = VJ_Set(4, 11)

	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "5")
	self.Light1:SetKeyValue("distance", "50")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "142 0 0 255")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
	
	local ChestGlow1 = ents.Create("env_sprite")
	ChestGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	ChestGlow1:SetKeyValue("scale", "0.25")
	ChestGlow1:SetKeyValue("rendermode","5")
	ChestGlow1:SetKeyValue("rendercolor","142 0 0 255")
	ChestGlow1:SetKeyValue("spawnflags","1") -- If animated
	ChestGlow1:SetParent(self)
	ChestGlow1:Fire("SetParentAttachment", "chest")
	ChestGlow1:Spawn()
	ChestGlow1:Activate()
	self:DeleteOnRemove(ChestGlow1)
	
	local ChestGlow2 = ents.Create("env_sprite")
	ChestGlow2:SetKeyValue("model","sprites/blueflare1.vmt")
	ChestGlow2:SetKeyValue("scale", "0.25")
	ChestGlow2:SetKeyValue("rendermode","5")
	ChestGlow2:SetKeyValue("rendercolor","255 0 0 255")
	ChestGlow2:SetKeyValue("spawnflags","1") -- If animated
	ChestGlow2:SetParent(self)
	ChestGlow2:Fire("SetParentAttachment", "chest")
	ChestGlow2:Spawn()
	ChestGlow2:Activate()
	self:DeleteOnRemove(ChestGlow2)
	
	local ChestGlow3 = ents.Create("env_sprite")
	ChestGlow3:SetKeyValue("model","sprites/combineball_glow_black_1.vmt")
	ChestGlow3:SetKeyValue("scale", "0.15")
	ChestGlow3:SetKeyValue("rendermode","5")
	ChestGlow3:SetKeyValue("rendercolor","255 0 0 255")
	ChestGlow3:SetKeyValue("spawnflags","1") -- If animated
	ChestGlow3:SetParent(self)
	ChestGlow3:Fire("SetParentAttachment", "chest")
	ChestGlow3:Spawn()
	ChestGlow3:Activate()
	self:DeleteOnRemove(ChestGlow3)

	local EyeGlow1 = ents.Create("env_sprite")
	EyeGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow1:SetKeyValue("scale", "0.02")
	EyeGlow1:SetKeyValue("rendermode","5")
	EyeGlow1:SetKeyValue("rendercolor","255 0 0 255")
	EyeGlow1:SetKeyValue("spawnflags","1") -- If animated
	EyeGlow1:SetParent(self)
	EyeGlow1:Fire("SetParentAttachment", "eyeglow1")
	EyeGlow1:Spawn()
	EyeGlow1:Activate()
	self:DeleteOnRemove(EyeGlow1)
	
	local EyeGlow2 = ents.Create("env_sprite")
	EyeGlow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow2:SetKeyValue("scale", "0.02")
	EyeGlow2:SetKeyValue("rendermode","5")
	EyeGlow2:SetKeyValue("rendercolor","255 0 0 255")
	EyeGlow2:SetKeyValue("spawnflags","1") -- If animated
	EyeGlow2:SetParent(self)
	EyeGlow2:Fire("SetParentAttachment", "eyeglow2")
	EyeGlow2:Spawn()
	EyeGlow2:Activate()
	self:DeleteOnRemove(EyeGlow2)

end
-------------------------------------------------------------------------------------------------------------------
function ENT:BBOHG_b0ner_Frenzied_BloodUp()

	if self:GetSequence() != self:LookupSequence("BR2_Roar") then
		local anim = {"vjseq_BR2_Roar"}
		self:VJ_ACT_PLAYACTIVITY(anim,true,false,false)
	end

	self.HasExtraMeleeAttackSounds = true
	self.SoundTbl_MeleeAttackExtra = {
		"physics/body/body_medium_break2.wav",
		"physics/body/body_medium_break3.wav",
		"physics/body/body_medium_break4.wav"
	}
	self.MeleeAttackDamage = math.Rand(20,25)
	self.MeleeAttackBleedEnemy = true -- Should the enemy bleed when attacked by melee?
	self.MeleeAttackBleedEnemyChance = 1 -- Chance that the enemy bleeds | 1 = always
	self.MeleeAttackBleedEnemyDamage = math.random(1,5) -- How much damage per repetition
	self.MeleeAttackBleedEnemyTime = 0.5 -- How much time until the next repetition?
	self.MeleeAttackBleedEnemyReps = 8 -- How many repetitions?

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(193,17,17,255)))
	bloodeffect:SetScale(100)
	util.Effect("VJ_Blood1",bloodeffect)

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(88,0,0,255)))
	bloodeffect:SetScale(50)
	util.Effect("VJ_Blood1",bloodeffect)

	local randomhellnoise = math.random(1,3)
	if randomhellnoise == 1 then
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_0"..math.random(3,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	elseif randomhellnoise == 2 then
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_2"..math.random(0,3)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	else
		VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_1"..math.random(1,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	end

	VJ_EmitSound(self,"vo/halloween_boss/knight_spawn.mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "5")
	self.Light1:SetKeyValue("distance", "50")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "142 0 0 255")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
	
	local ChestGlow1 = ents.Create("env_sprite")
	ChestGlow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	ChestGlow1:SetKeyValue("scale", "0.25")
	ChestGlow1:SetKeyValue("rendermode","5")
	ChestGlow1:SetKeyValue("rendercolor","142 0 0 255")
	ChestGlow1:SetKeyValue("spawnflags","1") -- If animated
	ChestGlow1:SetParent(self)
	ChestGlow1:Fire("SetParentAttachment", "chest")
	ChestGlow1:Spawn()
	ChestGlow1:Activate()
	self:DeleteOnRemove(ChestGlow1)
	
	local ChestGlow2 = ents.Create("env_sprite")
	ChestGlow2:SetKeyValue("model","sprites/blueflare1.vmt")
	ChestGlow2:SetKeyValue("scale", "0.25")
	ChestGlow2:SetKeyValue("rendermode","5")
	ChestGlow2:SetKeyValue("rendercolor","255 0 0 255")
	ChestGlow2:SetKeyValue("spawnflags","1") -- If animated
	ChestGlow2:SetParent(self)
	ChestGlow2:Fire("SetParentAttachment", "chest")
	ChestGlow2:Spawn()
	ChestGlow2:Activate()
	self:DeleteOnRemove(ChestGlow2)

	local HandGlow1 = ents.Create("env_sprite")
	HandGlow1:SetKeyValue("model","sprites/blueflare1.vmt")
	HandGlow1:SetKeyValue("scale", "0.15")
	HandGlow1:SetKeyValue("rendermode","5")
	HandGlow1:SetKeyValue("rendercolor","255 0 0 255")
	HandGlow1:SetKeyValue("spawnflags","1") -- If animated
	HandGlow1:SetParent(self)
	HandGlow1:Fire("SetParentAttachment", "anim_attachment_RH")
	HandGlow1:Spawn()
	HandGlow1:Activate()
	self:DeleteOnRemove(HandGlow1)

	local HandGlow2 = ents.Create("env_sprite")
	HandGlow2:SetKeyValue("model","sprites/blueflare1.vmt")
	HandGlow2:SetKeyValue("scale", "0.15")
	HandGlow2:SetKeyValue("rendermode","5")
	HandGlow2:SetKeyValue("rendercolor","255 0 0 255")
	HandGlow2:SetKeyValue("spawnflags","1") -- If animated
	HandGlow2:SetParent(self)
	HandGlow2:Fire("SetParentAttachment", "anim_attachment_LH")
	HandGlow2:Spawn()
	HandGlow2:Activate()
	self:DeleteOnRemove(HandGlow2)

end
-------------------------------------------------------------------------------------------------------------------
function ENT:BBOHG_b0ner_bnor_WraithUp()

	VJ_EmitSound(self,"bbohg/fx/funnicough.mp3",self.AlertSoundLevel,math.random(1,200))

    self:AddFlags(FL_NOTARGET)

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(14,0,169,255)))
	bloodeffect:SetScale(100)
	util.Effect("VJ_Blood1",bloodeffect)

	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
	bloodeffect:SetColor(VJ_Color2Byte(Color(9,0,109,255)))
	bloodeffect:SetScale(50)
	util.Effect("VJ_Blood1",bloodeffect)

	self:SetRenderMode( RENDERMODE_TRANSCOLOR )
	self:SetColor(Color(50, 50, 50, 10))
	self:SetMaterial("models/debug/debugwhite")

    self:SetSolid(SOLID_NONE)
	self:RemoveAllDecals()

	self.FootStepSoundLevel = 55
	self.FootStepPitch = VJ_Set(30,40)
	
	self.AlertSoundPitch = VJ_Set(40,50)
	self.BeforeMeleeAttackSoundPitch = VJ_Set(40,50)
	self.PainSoundPitch = VJ_Set(40,50)
	self.DeathSoundPitch = VJ_Set(40,50)

end
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self.BBOHG_b0ner_bnor_Wraith_Wraithed then

		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
		bloodeffect:SetColor(VJ_Color2Byte(Color(9,0,109,5)))
		bloodeffect:SetScale(50)
		util.Effect("VJ_Blood1",bloodeffect)

		self:SetColor(Color(50, 50, 50, 75))
		self:SetSolid(SOLID_BBOX)
		-- self:SetRenderFX(16)

		self:RemoveFlags(FL_NOTARGET)

		timer.Simple(1,function() if IsValid(self) then

			self:SetColor(Color(50, 50, 50, 10))
			-- self:SetRenderFX(0)

			local bloodeffect = EffectData()
			bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*50)
			bloodeffect:SetColor(VJ_Color2Byte(Color(9,0,109,5)))
			bloodeffect:SetScale(50)
			util.Effect("VJ_Blood1",bloodeffect)

			self:AddFlags(FL_NOTARGET)
			self:SetSolid(SOLID_NONE)
			self:RemoveAllDecals()
	
		end	end)
	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then

		if !self.BBoHG_Calcium_BigBoned_DoingComboMelee then
			local randattack = math.random(1,4)
			if randattack == 1 then
				self.CanTurnWhileStationary = false
				self.AnimTbl_MeleeAttack = {"vjseq_atk_spin"}
				self.MeleeAttackDamage = math.Rand(15,20)
				timer.Simple(4,function() if IsValid(self) then
					self.CanTurnWhileStationary = true
				end end)
			elseif randattack == 2 then
				self.HasMeleeAttackMissSounds = false
				self.AnimTbl_MeleeAttack = {"vjseq_atk_guard_run"}
				self.MeleeAttackDamage = math.Rand(5,10)
				timer.Simple(2,function() if IsValid(self) then
					self.HasMeleeAttackMissSounds = true
				end end)
			elseif randattack == 3 then
				self.AnimTbl_MeleeAttack = {"vjseq_atk_down"}
			else
				self.AnimTbl_MeleeAttack = {"vjseq_cmb01"}
				self.MeleeAttackDamage = math.Rand(20,25)
			end
		end

	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)

	if self:GetClass() == "npc_vj_bbohg_skeleton_b0ner_shambler" then

		self.HasMeleeAttack = false
		self.CanFlinch = false
		local randomhellnoise = math.random(1,3)
		if randomhellnoise == 1 then
			VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_0"..math.random(3,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
		elseif randomhellnoise == 2 then
			VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_2"..math.random(0,3)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
		else
			VJ_EmitSound(self,"ambient_mp3/halloween/male_scream_1"..math.random(1,9)..".mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
		end
		VJ_EmitSound(self,"misc/halloween/spell_fireball_cast.wav",75,100)
		ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		util.ScreenShake(self:GetPos(),1,20,3,200)
		
		self.PreLaunchLight = ents.Create("light_dynamic")
		self.PreLaunchLight:SetKeyValue("brightness", "1")
		self.PreLaunchLight:SetKeyValue("distance", "310")
		self.PreLaunchLight:SetLocalPos(self:GetPos())
		self.PreLaunchLight:SetLocalAngles(self:GetAngles())
		self.PreLaunchLight:Fire("Color", "255 102 0 255")
		self.PreLaunchLight:SetParent(self)
		self.PreLaunchLight:Spawn()
		self.PreLaunchLight:Activate()
		self.PreLaunchLight:Fire("SetParentAttachment","chest")
		self.PreLaunchLight:Fire("TurnOn", "", 0)
		self.PreLaunchLight:Fire("Kill", "", 1.55)
		self:DeleteOnRemove(self.PreLaunchLight)
		
		timer.Simple(1.5,function() if IsValid(self) then
			ParticleEffectAttach("fire_small_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			VJ_EmitSound(self,"misc/halloween/spell_fireball_impact.wav",75,100)

		util.ScreenShake(self:GetPos(),3,40,5,400)

		self.LaunchLight = ents.Create("light_dynamic")
		self.LaunchLight:SetKeyValue("brightness", "1")
		self.LaunchLight:SetKeyValue("distance", "620")
		self.LaunchLight:SetLocalPos(self:GetPos())
		self.LaunchLight:SetLocalAngles(self:GetAngles())
		self.LaunchLight:Fire("Color", "255 102 0 255")
		self.LaunchLight:SetParent(self)
		self.LaunchLight:Spawn()
		self.LaunchLight:Activate()
		self.LaunchLight:Fire("SetParentAttachment","chest")
		self.LaunchLight:Fire("TurnOn", "", 0)
		self.LaunchLight:Fire("Kill", "", 0.5)
		self:DeleteOnRemove(self.LaunchLight)

		end end)

		timer.Simple(2,function() if IsValid(self) then
			self:StopParticles()
		self.HasMeleeAttack = true
		self.CanFlinch = true
		end end)

	end

	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then
	
		if self.BBoHG_Calcium_BigBoned_PhaseTwo then
		else


			local randmagic = math.random(1,10)

			if randmagic >= 1 && randmagic < 6 then
				self.RangeAttackEntityToSpawn = "obj_vj_bbohg_fireball"
				self.RangeUseAttachmentForPosID = "anim_attachment_LH"
				self.AnimTbl_RangeAttack = {"vjges_gesture_item_throw_original"}
			elseif randmagic >= 6 && randmagic < 8 then
				self.RangeAttackEntityToSpawn = "obj_vj_bbohg_fireball"
				self.RangeUseAttachmentForPosID = "anim_attachment_RH"
				self.AnimTbl_RangeAttack = {"vjseq_layer_secondrate_sorcery_spy"}
			elseif randmagic == 9 then
				self.AnimTbl_RangeAttack = {"vjseq_layer_secondrate_sorcery_spy_fail"}
			else
				self.AnimTbl_RangeAttack = {"vjseq_layer_taunt_laugh"}
			end

		end

	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" then
		return 
		self:CalculateProjectile(
			"Curve",
			self:GetPos() +self:GetUp() *self.RangeAttackPos_Up +self:GetForward() *self.RangeAttackPos_Forward,
			self:GetEnemy():GetPos()
				+self:GetEnemy():OBBCenter()
				+self:GetEnemy():GetRight() *math.Rand(-30,30)
				+self:GetEnemy():GetForward() *math.Rand(-30,30)
				+self:GetEnemy():GetUp() *math.Rand(-70,-30),
			600
		)
	elseif self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then
		return
		self:CalculateProjectile(
			"Line",
			self:GetAttachment(
				self:LookupAttachment(
					self.RangeUseAttachmentForPosID
				)
			).Pos,
			self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(),
			1000
		)
	else
		return (self:GetEnemy():GetPos() - self:LocalToWorld(Vector(0, 0, 0)))*2 + self:GetUp()*1
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:ArmorDamage(dmginfo,hitgroup)
	if self.BBOHG_b0ner_Shambler_Hellbound_LitUp or self.BBOHG_b0ner_Frenzied_Vampire_Bloodied then
		dmginfo:ScaleDamage(0.50)
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo, hitgroup)
	if self:GetSequence() == self:LookupSequence("Leap") or self:GetSequence() == self:LookupSequence("LeapStrike") then
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)

	self.HasDeathSounds = false
	
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_scapula.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_spine.mdl")

	return true
	
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "bbohg/skeletons/death.mp3", 90, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/