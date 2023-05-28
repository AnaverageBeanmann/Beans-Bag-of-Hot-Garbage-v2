AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/baseman.mdl"} 
ENT.StartHealth = 100
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TEST"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.FlinchChance = 4
ENT.AnimTbl_Flinch = {"cower"}
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head"}}, 
{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_chest"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_leftArm"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_rightArm"}}, 
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjseq_flinch_leftLeg"}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjseq_flinch_rightLeg"}}}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"death_01",
	"death_02",
	"death_03",
	"death_04"}
ENT.DeathAnimationChance = 3 -- Put 1 if you want it to play the animation all the time
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 90
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_ammo"
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.26
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175
ENT.HasMedicSounds_AfterHeal = false

ENT.BBOHG_DoorToBreak = NULL

ENT.BBOHG_b0ner_Shambler_Hellbound = false
ENT.BBOHG_b0ner_Shambler_Hellbound_LitUp = false

ENT.BBOHG_b0ner_Frenzied_Vampire = false
ENT.BBOHG_b0ner_Frenzied_Vampire_Bloodied = false
ENT.BBOHG_b0ner_Frenzied_Vampire_BloodEffectT = 0

ENT.BBOHG_b0ner_bnor_Wraith = false
ENT.BBOHG_b0ner_bnor_Wraith_Wraithed = false

ENT.BBOHG_Calcium_Obese_Voring = false
ENT.BBOHG_Calcium_Obese_VPoints = 0
ENT.BBOHG_Calcium_Obese_Indigestion = false
ENT.BBOHG_Calcium_Obese_Running = false
ENT.BBOHG_Calcium_Obese_Vomit = false

ENT.BBoHG_Calcium_BigBoned_CIdleAnim = false
ENT.BBoHG_Calcium_BigBoned_DoingComboMelee = false
ENT.BBoHG_Calcium_BigBoned_PhaseTwo = false

ENT.BBOHG_Oddities_SlashCo_Watcher_Hiding = false
ENT.BBOHG_Oddities_SlashCo_Watcher_HideTime = 0
ENT.BBOHG_Oddities_SlashCo_Watcher_NextCheckTime = 0
ENT.BBOHG_Oddities_SlashCo_Watcher_Thing = true
ENT.BBOHG_Oddities_SlashCo_Watcher_CanRage = false
ENT.BBOHG_Oddities_SlashCo_Watcher_CanRagePartTwo = false
ENT.BBOHG_Oddities_SlashCo_Watcher_Raged = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
	"npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()

	self:Zombie_CustomOnPreInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	self:Zombie_CustomOnInitialize()
	self:ZombieSounds()
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	if math.random(1,4) == 1 then
		self.AnimTbl_Run = {ACT_RUN_CROUCH}
	end

end -- For additional initialize options
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()
end
-----------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:GetSightDirection()
	-- return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)


	if key == "big_boned_laugh" then
		
		VJ_EmitSound(self,"vo/demoman_laughlong02.mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))

	end
	
	if key == "big_boned_summon" then
	end

	if key == "big_boned_givesword" then

		VJ_EmitSound(self,"vo/halloween_eyeball/eyeball_biglaugh01.mp3",self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))

		self.SoundTbl_MeleeAttack = {
			"weapons/halloween_boss/knight_axe_hit.wav"
		}

		self.LostEnemySoundPitch = VJ_Set(70, 70)
		self.IdleSoundPitch = VJ_Set(70, 70)
		self.CombatIdleSoundPitch = VJ_Set(70, 70)
		self.AlertSoundPitch = VJ_Set(70, 70)
		self.BeforeMeleeAttackSoundPitch = VJ_Set(70, 70)
		self.BeforeRangeAttackPitch = VJ_Set(70, 70)
		self.OnKilledEnemySoundPitch = VJ_Set(70, 70)
		self.PainSoundPitch = VJ_Set(70, 70)
		self.AllyDeathSoundPitch = VJ_Set(70, 70)
		self.CallForHelpSoundPitch = VJ_Set(70, 70)

		self.HasSounds = true

	end
	
	
	if key == "attack_shockwave" then
	end
	
	
	if key == "big_boned_secondrate_fail" then

		VJ_EmitSound(self, "bbohg/fx/laughnow.mp3", 90, math.random(35,150))

		local spark = ents.Create("env_spark")
		spark:SetKeyValue("Magnitude","8")
		spark:SetKeyValue("Spark Trail Length","3")
		spark:SetPos(self:GetAttachment(self:LookupAttachment("chest")).Pos)
		spark:SetAngles(self:GetAngles())
		spark:SetParent(self)
		spark:Spawn()
		spark:Activate()
		spark:Fire("StartSpark","",0)
		spark:Fire("StopSpark","",0.1)
		self:DeleteOnRemove(spark)	

		timer.Simple(1.5,function() if IsValid(self) then
			VJ_EmitSound(self,self.SoundTbl_AllyDeath,80,100)
		end end)

	end
	
	if key == "big_boned_cmb3_check" then
		if
			self.Dead == false &&
			self:GetEnemy() != nil &&
			self.VJ_IsBeingControlled == false &&
			self:Visible(self:GetEnemy())
		then
			local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())
			if enemydist <= 100 then			
				self.AnimTbl_MeleeAttack = {"vjseq_cmb03"}
				self.PlayingAttackAnimation = false
				self:StopAttacks(false)
				self.vACT_StopAttacks = false
				timer.Simple(1,function() if IsValid(self) then
					self.BBoHG_Calcium_BigBoned_DoingComboMelee = false
				end end)
			else
				self.BBoHG_Calcium_BigBoned_DoingComboMelee = false
			end
		end
	end
	
	if key == "big_boned_cmb2_check" then
		if
			self.Dead == false &&
			self:GetEnemy() != nil &&
			self.VJ_IsBeingControlled == false &&
			self:Visible(self:GetEnemy())
		then
			local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())
			if enemydist <= 100 then			
				self.BBoHG_Calcium_BigBoned_DoingComboMelee = true
				self.AnimTbl_MeleeAttack = {"vjseq_cmb02"}
				self.PlayingAttackAnimation = false
				self:StopAttacks(false)
				self.vACT_StopAttacks = false
				timer.Simple(1,function() if IsValid(self) then
					self.BBoHG_Calcium_BigBoned_DoingComboMelee = false
				end end)
			else
				self.BBoHG_Calcium_BigBoned_DoingComboMelee = false
			end
		end
	end
	
	if key == "attack_range" then
		self:RangeAttackCode()
	end
	
	if key == "attack_stomp" then

		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetScale( 500 )
		util.Effect( "ThumperDust", effectdata )
		util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude, self.WorldShakeOnMoveFrequency, self.WorldShakeOnMoveDuration, self.WorldShakeOnMoveRadius)
		util.VJ_SphereDamage(self, self, self:GetPos(), 190, math.Rand(10,15), DMG_VEHICLE, true, true, {Force=100})
		VJ_EmitSound(self,"physics/concrete/boulder_impact_hard"..math.random(1,4)..".wav",80,100)
		VJ_EmitSound(self,"physics/concrete/boulder_impact_hard"..math.random(1,4)..".wav",80,100)

	end

	if key == "step" then

		self:FootStepSoundCode()

		if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" then

			util.ScreenShake(self:GetPos(), 1, 500, 1.6, 1200)

		end

		if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_bigboned" then

			util.ScreenShake(self:GetPos(), 0.5, 250, 1.6, 1200)

		end

	end
	
	if key == "slide" then
		VJ_EmitSound(self,"npc/zombie/foot_slide"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	
	if key == "attack" then
		self:MeleeAttackCode()
	end

	if key == "shambler_preexplode" then
		VJ_EmitSound(self,"misc/halloween/spell_fireball_cast.wav",75,100)
		ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		self:Ignite(4)
	end
	
	if key == "shambler_explode" then

		self.HasGibOnDeath = true
		self.GibOnDeathDamagesTable = {"All"}
		self.GodMode = false
		self.HasDeathRagdoll = false
		self.HasDeathAnimation = false
		self.HasDeathSounds = false

		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetScale( 500 )
		util.Effect( "HelicopterMegaBomb", effectdata )
		util.Effect( "ThumperDust", effectdata )
		util.Effect( "Explosion", effectdata )

		util.VJ_SphereDamage(self, self, self:GetPos(), 160, 75, DMG_BLAST, true, true, {Force=100})

		local d = DamageInfo()
		d:SetDamage(self:GetMaxHealth() * 999)
		d:SetAttacker(self)
		d:SetDamageType(DMG_GENERIC) 
		self:TakeDamageInfo(d)

		VJ_EmitSound(self,"misc/halloween/spell_fireball_impact.wav",75,100)

	end

	if key == "death" then

		VJ_EmitSound(self,"physics/body/body_medium_impact_soft"..math.random(1,7)..".wav",75,100)

	end

	if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self,"ambient/water/water_splash"..math.random(1,3)..".wav",75,100)
	end

	if key == "break_door" then

		if IsValid(self.LNR_DoorToBreak) then

			local doorDmg = self.MeleeAttackDamage
			local door = self.LNR_DoorToBreak

			VJ_CreateSound(self,self.SoundTbl_BeforeMeleeAttack,self.BeforeMeleeAttackSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a, self.BeforeMeleeAttackSoundPitch.b))

			if door:GetModel() == "models/props_c17/door01_left.mdl" then
				if
					door:GetSkin() == 0 or
					door:GetSkin() == 1 or
					door:GetSkin() == 2 or
					door:GetSkin() == 3 or
					door:GetSkin() == 10 or
					door:GetSkin() == 11 or
					door:GetSkin() == 13
				then
					VJ_EmitSound(door,"physics/wood/wood_box_impact_hard"..math.random(1,6)..".wav",75,100)
				elseif
					door:GetSkin() == 4 or
					door:GetSkin() == 5 or
					door:GetSkin() == 6 or
					door:GetSkin() == 7 or
					door:GetSkin() == 8 or
					door:GetSkin() == 9 or
					door:GetSkin() == 12
				then
					VJ_EmitSound(door,"physics/metal/metal_canister_impact_hard"..math.random(1,3)..".wav",75,100)
					VJ_EmitSound(door,"physics/metal/metal_barrel_impact_hard"..math.random(1,3)..".wav",75,100)
				end
			elseif
				door:GetModel() == "models/props_c17/door02_double.mdl" or
				door:GetModel() == "models/props_doors/doormain01.mdl" or
				door:GetModel() == "models/props_doors/doormain01_airport_small.mdl" or
				door:GetModel() == "models/props_doors/doormain01_airport.mdl" or
				door:GetModel() == "models/props_doors/doormain01_small.mdl" or
				door:GetModel() == "models/props_doors/doormain_rural01.mdl" or
				door:GetModel() == "models/props_doors/doormain_rural01_small.mdl" or
				door:GetModel() == "models/props_downtown/door_interior_128_01.mdl" or
				door:GetModel() == "models/props_downtown/door_interior_112_01.mdl"
			then
				VJ_EmitSound(door,"physics/wood/wood_box_impact_hard"..math.random(1,6)..".wav",75,100)
			elseif 
				door:GetModel() == "models/props_c17/door01_left.mdl" or
				door:GetModel() == "models/combine_gate_vehicle.mdl" or
				door:GetModel() == "models/combine_gate_citizen.mdl" or
				door:GetModel() == "models/props_combine/combine_door01.mdl" or
				door:GetModel() == "models/props_c17/door03_left.mdl" or
				door:GetModel() == "models/props_doors/checkpoint_door_-02.mdl" or
				door:GetModel() == "models/props_doors/checkpoint_door_02.mdl" or
				door:GetModel() == "models/props_doors/door03_slotted_left.mdl" or
				door:GetModel() == "models/props_doors/doorfreezer01.mdl" or
				door:GetModel() == "models/props_doors/doorklab01.mdl" or
				door:GetModel() == "models/props_doors/doormainmetalsmall01.mdl" or
				door:GetModel() == "models/props_doors/doormainmetal01.mdl" or
				door:GetModel() == "models/props_doors/doormainmetalwindow01.mdl" or
				door:GetModel() == "models/props_doors/doormainmetalwindowsmall01.mdl" or
				door:GetModel() == "models/props_downtown/metal_door_112.mdl"
			then
				if 
					door:GetModel() == "models/combine_gate_vehicle.mdl" or
					door:GetModel() == "models/combine_gate_citizen.mdl" or
					door:GetModel() == "models/props_combine/combine_door01.mdl" or
					door:GetModel() == "models/props_c17/door03_left.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_-02.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_02.mdl" or
					door:GetModel() == "models/props_doors/door03_slotted_left.mdl" or
					door:GetModel() == "models/props_doors/doorfreezer01.mdl" or
					door:GetModel() == "models/props_doors/doorklab01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalsmall01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetal01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalwindow01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalwindowsmall01.mdl" or
					door:GetModel() == "models/props_downtown/metal_door_112.mdl"
				then
					VJ_EmitSound(door,"physics/metal/metal_canister_impact_hard"..math.random(1,3)..".wav",75,100)
					VJ_EmitSound(door,"physics/metal/metal_barrel_impact_hard"..math.random(1,3)..".wav",75,100)
				end
			elseif 
				door:GetModel() == "models/props_lab/elevatordoor.mdl" or
				door:GetModel() == "models/props_mining/elevator01_cagedoor.mdl"
			then
				VJ_EmitSound(door,"physics/metal/metal_chainlink_impact_hard"..math.random(1,3)..".wav",65,100)
			elseif 
				door:GetModel() == "models/props_mining/techgate01.mdl" or
				door:GetModel() == "models/props_doors/checkpoint_door_01.mdl" or
				door:GetModel() == "models/props_doors/checkpoint_door_-01.mdl" 
			then
				VJ_EmitSound(door,"physics/metal/metal_canister_impact_hard"..math.random(1,3)..".wav",75,100)
				VJ_EmitSound(door,"physics/metal/metal_barrel_impact_hard"..math.random(1,3)..".wav",75,100)
			elseif 
				door:GetModel() == "models/props_doors/door_rotate_112.mdl"
			then
				VJ_EmitSound(door,"physics/glass/glass_sheet_impact_hard"..math.random(1,3)..".wav",65,100)
			elseif door:GetModel() == "models/props_doors/doorglassmain01.mdl" or
				door:GetModel() == 	"models/props_doors/door_sliding_112.mdl" or
				door:GetModel() == 	"models/props_doors/doorglassmain01_small.mdl" 
			then
				VJ_EmitSound(door,"physics/metal/metal_canister_impact_hard"..math.random(1,3)..".wav",75,100)
				VJ_EmitSound(door,"physics/metal/metal_barrel_impact_hard"..math.random(1,3)..".wav",75,100)
			else
				VJ_EmitSound(door,"physics/wood/wood_panel_impact_hard1.wav",65,100)
			end

			if door.DoorHealth == nil then
				door.DoorHealth = 200 - doorDmg
			elseif door.DoorHealth <= 0 then
				VJ_EmitSound(self,self.SoundTbl_MeleeAttackMiss,self.MeleeAttackMissSoundLevel,self:VJ_DecideSoundPitch(self.MeleeAttackMissSoundPitch.a,self.MeleeAttackMissSoundPitch.b))
			return -- To prevent door props making a duplication when it shouldn't
			else
				if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" then
					door.DoorHealth = door.DoorHealth - 100
				else
					door.DoorHealth = door.DoorHealth - doorDmg
				end
			end
			
			if
				(door:GetClass() == "prop_door_rotating" or
				door:GetClass() == "func_door_rotating" or
				door:GetClass() == "prop_door_dynamic") &&
				door.DoorHealth <= 0
			then

				if 
					door:GetModel() == "models/props_c17/door01_left.mdl" or 
					door:GetModel() == "models/props_c17/door02_double.mdl" or
					door:GetModel() == "models/props_doors/doormain01.mdl" or
					door:GetModel() == "models/props_doors/doormain01_airport_small.mdl" or
					door:GetModel() == "models/props_doors/doormain01_airport.mdl" or
					door:GetModel() == "models/props_doors/doormain01_small.mdl" or
					door:GetModel() == "models/props_doors/doormain_rural01.mdl" or
					door:GetModel() == "models/props_doors/doormain_rural01_small.mdl" or
					door:GetModel() == "models/props_downtown/door_interior_128_01.mdl" or
					door:GetModel() == "models/props_downtown/door_interior_112_01.mdl"
				then
					if door:GetModel() == "models/props_c17/door01_left.mdl" then
						if 
							door:GetSkin() == 0 or
							door:GetSkin() == 1 or
							door:GetSkin() == 2 or
							door:GetSkin() == 3 or
							door:GetSkin() == 10 or
							door:GetSkin() == 11 or
							door:GetSkin() == 13
						then
							door:EmitSound("physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
							ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
						end
					elseif
						door:GetModel() == "models/props_c17/door02_double.mdl" or
						door:GetModel() == "models/props_doors/doormain01.mdl" or
						door:GetModel() == "models/props_doors/doormain01_airport_small.mdl" or
						door:GetModel() == "models/props_doors/doormain01_airport.mdl" or
						door:GetModel() == "models/props_doors/doormain01_small.mdl" or
						door:GetModel() == "models/props_doors/doormain_rural01.mdl" or
						door:GetModel() == "models/props_doors/doormain_rural01_small.mdl" or
						door:GetModel() == "models/props_downtown/door_interior_128_01.mdl" or
						door:GetModel() == "models/props_downtown/door_interior_112_01.mdl"
					then
						door:EmitSound("physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
						ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
					end
				elseif 
					door:GetModel() == "models/props_c17/door01_left.mdl" or 
					door:GetModel() == "models/combine_gate_vehicle.mdl" or
					door:GetModel() == "models/combine_gate_citizen.mdl" or
					door:GetModel() == "models/props_combine/combine_door01.mdl" or
					door:GetModel() == "models/props_c17/door03_left.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_-02.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_02.mdl" or
					door:GetModel() == "models/props_doors/door03_slotted_left.mdl" or
					door:GetModel() == "models/props_doors/doorfreezer01.mdl" or
					door:GetModel() == "models/props_doors/doorklab01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalsmall01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetal01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalwindow01.mdl" or
					door:GetModel() == "models/props_doors/doormainmetalwindowsmall01.mdl" or
					door:GetModel() == "models/props_downtown/metal_door_112.mdl" or
					door:GetModel() == "models/props_lab/elevatordoor.mdl" or
					door:GetModel() == "models/props_mining/elevator01_cagedoor.mdl" or
					door:GetModel() == "models/props_mining/techgate01.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_01.mdl" or
					door:GetModel() == "models/props_doors/checkpoint_door_-01.mdl" or
					door:GetModel() == "models/props_doors/doorglassmain01.mdl" or
					door:GetModel() == 	"models/props_doors/door_sliding_112.mdl" or
					door:GetModel() == 	"models/props_doors/doorglassmain01_small.mdl" 
				then
					if door:GetModel() == "models/props_c17/door01_left.mdl" then
						if
							door:GetSkin() == 4 or
							door:GetSkin() == 5 or
							door:GetSkin() == 6 or
							door:GetSkin() == 7 or
							door:GetSkin() == 8 or
							door:GetSkin() == 9 or
							door:GetSkin() == 12
						then
							door:EmitSound("physics/metal/metal_box_break"..math.random(1,2)..".wav",75,100)
						end
					elseif 
						door:GetModel() == "models/props_c17/door01_left.mdl" or 
						door:GetModel() == "models/combine_gate_vehicle.mdl" or
						door:GetModel() == "models/combine_gate_citizen.mdl" or
						door:GetModel() == "models/props_combine/combine_door01.mdl" or
						door:GetModel() == "models/props_c17/door03_left.mdl" or
						door:GetModel() == "models/props_doors/checkpoint_door_-02.mdl" or
						door:GetModel() == "models/props_doors/checkpoint_door_02.mdl" or
						door:GetModel() == "models/props_doors/door03_slotted_left.mdl" or
						door:GetModel() == "models/props_doors/doorfreezer01.mdl" or
						door:GetModel() == "models/props_doors/doorklab01.mdl" or
						door:GetModel() == "models/props_doors/doormainmetalsmall01.mdl" or
						door:GetModel() == "models/props_doors/doormainmetal01.mdl" or
						door:GetModel() == "models/props_doors/doormainmetalwindow01.mdl" or
						door:GetModel() == "models/props_doors/doormainmetalwindowsmall01.mdl" or
						door:GetModel() == "models/props_downtown/metal_door_112.mdl" or
						door:GetModel() == "models/props_lab/elevatordoor.mdl" or
						door:GetModel() == "models/props_mining/elevator01_cagedoor.mdl" or
						door:GetModel() == "models/props_mining/techgate01.mdl" or
						door:GetModel() == "models/props_doors/checkpoint_door_01.mdl" or
						door:GetModel() == "models/props_doors/checkpoint_door_-01.mdl" or
						door:GetModel() == "models/props_doors/doorglassmain01.mdl" or
						door:GetModel() == 	"models/props_doors/door_sliding_112.mdl" or
						door:GetModel() == 	"models/props_doors/doorglassmain01_small.mdl" 
					then
						door:EmitSound("physics/metal/metal_box_break"..math.random(1,2)..".wav",75,100)
					end
				end

				door:EmitSound("ambient/materials/door_hit1.wav",75,100)
				ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)

				if door:GetClass() == "prop_door_rotating" then
					local doorgib = ents.Create("prop_physics")
					doorgib:SetPos(door:GetPos())
					doorgib:SetAngles(door:GetAngles())
					doorgib:SetModel(door:GetModel())
					doorgib:SetSkin(door:GetSkin())
					doorgib:SetBodygroup(1,door:GetBodygroup(1))
					doorgib:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
					doorgib:SetSolid(SOLID_NONE)
					doorgib:Spawn()
					if self.ToTU_GiantZombie then
						doorgib:GetPhysicsObject():ApplyForceCenter(self:GetForward()*15000)
					elseif self.ToTU_BigZombie then
						doorgib:GetPhysicsObject():ApplyForceCenter(self:GetForward()*10000)
					else
						doorgib:GetPhysicsObject():ApplyForceCenter(self:GetForward()*5000)
					end
					SafeRemoveEntityDelayed(doorgib,30)
					door:Remove()
				end

				if door:GetClass() == "func_door_rotating" then
					local doorgibs = ents.Create("prop_dynamic")
					doorgibs:SetPos(door:GetPos())
					doorgibs:SetModel("models/props_c17/FurnitureDresser001a.mdl")
					doorgibs:Spawn()
					doorgibs:TakeDamage(9999)
					doorgibs:Fire("break")		
					door:Remove()
				end

				if door:GetClass() == "prop_door_dynamic" then
					door.ToTU_DynamDoor_Broken = true
					door:Open()
					local spark = ents.Create("env_spark")
					spark:SetKeyValue("Magnitude","8")
					spark:SetKeyValue("Spark Trail Length","3")
					spark:SetPos(door:GetPos())
					spark:SetAngles(door:GetAngles())
					spark:SetParent(door)
					spark:Spawn()
					spark:Activate()
					spark:Fire("StartSpark","",0)
					spark:Fire("StopSpark","",2)
					self:DeleteOnRemove(spark)
				
					door:SetRenderFX(5)
				
					timer.Simple(2,function() if IsValid(door) then
						door:Fire("Kill","",0.07)
					end end)

				end

			end

		end

	end

	if key == "rip_flesh_LH" then
		ParticleEffectAttach("blood_impact_red_01_chunk",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		ParticleEffectAttach("blood_impact_red_01_goop",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		self:EmitSound(Sound("physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", 100, math.random(100,95)))
		self:EmitSound(Sound("physics/body/body_medium_break"..math.random(2,4)..".wav", 100, math.random(100,95)))
	end
	
	if key == "rip_flesh_RH" then
		ParticleEffectAttach("blood_impact_red_01_chunk",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		ParticleEffectAttach("blood_impact_red_01_goop",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		self:EmitSound(Sound("physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", 100, math.random(100,95)))
		self:EmitSound(Sound("physics/body/body_medium_break"..math.random(2,4)..".wav", 100, math.random(100,95)))
	end
	
	-- mispelled it oops
	if key == "eat_flesh_LR" then
		ParticleEffectAttach("blood_impact_red_01_chunk",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("blood_impact_red_01_mist",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("blood_impact_red_01_smalldroplets",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		self:EmitSound(Sound("barnacle/bcl_chew"..math.random(1,3)..".wav", 100, math.random(100,95)))
	end
	
	if key == "eat_flesh_RH" then
		ParticleEffectAttach("blood_impact_red_01_chunk",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("blood_impact_red_01_mist",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("blood_impact_red_01_smalldroplets",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		self:EmitSound(Sound("barnacle/bcl_chew"..math.random(1,3)..".wav", 100, math.random(100,95)))
	end

	if key == "obese_gasleak" then

			VJ_EmitSound(self, "npc/barnacle/barnacle_die"..math.random(1,2)..".wav", 90, math.random(35,150))
			VJ_EmitSound(self, "npc/barnacle/barnacle_tongue_pull"..math.random(1,3)..".wav", 90, math.random(35,150))
			VJ_EmitSound(self, "npc/barnacle/barnacle_tongue_pull"..math.random(1,3)..".wav", 90, math.random(35,150))
			VJ_EmitSound(self, "bbohg/fx/laughnow.mp3", 90, math.random(35,150))
			VJ_EmitSound(self, "bbohg/fx/laughnow.mp3", 90, math.random(35,150))
			VJ_EmitSound(self, "bbohg/fx/laughnow.mp3", 90, math.random(35,150))
			effects.BeamRingPoint(
				self:GetPos(), -- vector pos
				0.75, -- lifetime
				2, -- start radius
				500, -- end radius
				10, -- width
				3, -- amplitude
				Color(255, 0, 0), -- color
				{
					material="sprites/physgbeamb",
					framerate=20
				}
			)

			effects.BeamRingPoint(
				self:GetPos(), -- vector pos
				0.75, -- lifetime
				2, -- start radius
				250, -- end radius
				10, -- width
				3, -- amplitude
				Color(255, 0, 0), -- color
				{
					material="sprites/physgbeamb",
					framerate=20
				}
			)

	end

	if key == "obese_explode" then

		timer.Simple(0.15,function() if IsValid(self) then

			local randsplodensoound = math.random(1,3)
			if randsplodensoound == 1 then
				self:EmitSound(Sound("player/boomer/explode/explo_medium_09.wav", 100, math.random(80,120)))
				self:EmitSound(Sound("player/boomer/explode/explo_medium_09.wav", 100, math.random(80,120)))
			elseif randsplodensoound == 2 then
				self:EmitSound(Sound("player/boomer/explode/explo_medium_10.wav", 100, math.random(80,120)))
				self:EmitSound(Sound("player/boomer/explode/explo_medium_10.wav", 100, math.random(80,120)))
			else
				self:EmitSound(Sound("player/boomer/explode/explo_medium_14.wav", 100, math.random(80,120)))
				self:EmitSound(Sound("player/boomer/explode/explo_medium_14.wav", 100, math.random(80,120)))
			end

			VJ_EmitSound(self, "bbohg/fx/shitdded.mp3", 90, math.random(35,150))

			local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos())
			bloodspray:SetScale(10)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(0)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)

			local bloodeffect = EffectData()
			bloodeffect:SetOrigin(self:GetPos() +self:GetUp()*40)
			bloodeffect:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
			bloodeffect:SetScale(250)
			util.Effect("VJ_Blood1",bloodeffect)

			util.ScreenShake(self:GetPos(), 5, 500, 1.6, 1200)
			
			util.VJ_SphereDamage(self, self, self:GetPos(), 100, math.Rand(35,40), DMG_BLAST, true, true, {Force=100})

			for i=1,math.random(10,20) do
				local carproj = ents.Create("obj_vj_bbohg_obese_vomit")
				carproj:SetPos(self:LocalToWorld(Vector(0,0,40)))
				carproj:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
				carproj:SetOwner(self)
				carproj:Spawn()
				carproj:Activate()
				local phys = carproj:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetVelocity(Vector(math.Rand(-100,100),math.Rand(-100,100),math.Rand(0,200)) *2 +self:GetUp()*math.Rand(25,50))
				end
			end

		end end)

	end
	
	if key == "obese_grab" then

		self.HasMeleeAttackMissSounds = true
		self.HasMeleeAttackSounds = true

		self.MeleeAttackDamageDistance = 60

		self.BBOHG_Calcium_Obese_Voring = false

		self.AnimTbl_MeleeAttack = {
			"vjseq_choke_eating",
		}

		self:MeleeAttackCode()

		self.PlayingAttackAnimation = false
		self:StopAttacks(false)
		self.vACT_StopAttacks = false

	end

	if key == "obese_vore" then
		self.MeleeAttackDamageDistance = 20
		self.HasMeleeAttackMissSounds = false
		self.HasMeleeAttackSounds = false
		self.BBOHG_Calcium_Obese_Voring = true
		self:MeleeAttackCode()
	end

	if key == "obese_vomit" then		
		ParticleEffectAttach("vomit_barnacle",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		ParticleEffectAttach("vomit_barnacle_b",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		self:RangeAttackCode()
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()

	self:Zombie_CustomOnThink()

	if
		-- add bbohg convar for this
		-- GetConVar("VJ_TOTU_LNR_BreakDoors"):GetInt() == 0 or
		self.Dead or
		self.DeathAnimationCodeRan or
		self.Flinching or
		-- there's probably a better way to do this

		self.MeleeAttacking == true or
		self.RangeAttacking == true or
		self.LeapAttacking == true
	then
		self.LNR_DoorToBreak = NULL
	return end

	if VJ_AnimationExists(self,ACT_OPEN_DOOR) then
		if !IsValid(self.LNR_DoorToBreak) then
			if ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_DUCK))) then
				for _,v in pairs(ents.FindInSphere(self:GetPos(),40)) do
					if v:GetClass() == "func_door_rotating" && v:Visible(self) then self.LNR_DoorToBreak = v end
					if v:GetClass() == "prop_door_dynamic" && !v.ToTU_DynamDoor_Broken && v:Visible(self) then self.LNR_DoorToBreak = v end
					if v:GetClass() == "prop_door_rotating" && v:Visible(self) then
						local anim = string.lower(v:GetSequenceName(v:GetSequence()))
						if string.find(anim,"idle") or string.find(anim,"open") /*or string.find(anim,"locked")*/ then
							self.LNR_DoorToBreak = v
							break
						end
					end
				end
			end
		else
		    if self.PlayingAttackAnimation or !self.LNR_DoorToBreak:Visible(self) /*or (self:GetActivity() == ACT_OPEN_DOOR && dist <= 100)*/ then self.LNR_DoorToBreak = NULL return end
			if self:GetActivity() != ACT_OPEN_DOOR then
				local ang = self:GetAngles()
				self:SetAngles(Angle(ang.x,(self.LNR_DoorToBreak:GetPos() -self:GetPos()):Angle().y,ang.z))
				self:VJ_ACT_PLAYACTIVITY(ACT_OPEN_DOOR,true,false,false)
			end
		end
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()

	self:Zombie_CustomOnThink_AIEnabled()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self:Zombie_CustomOnMeleeAttack_BeforeStartTimer(seed)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnMeleeAttack_BeforeStartTimer(seed)

	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(10,15)
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(10,15)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	self:ArmorDamage(dmginfo,hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ArmorDamage(dmginfo,hitgroup) end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
    self:SetSolid(SOLID_NONE)
    self:AddFlags(FL_NOTARGET)
	if self:GetSequence() == self:LookupSequence("Leap") or self:GetSequence() == self:LookupSequence("LeapStrike") then
		self.HasDeathAnimation = false
	end
	if self:GetClass() == "npc_vj_bbohg_skeleton_cartel_obese" && self.BBOHG_Calcium_Obese_Indigestion then
		self.HasDeathRagdoll = false
		self.DeathAnimationChance = 1
		self.AnimTbl_Death = {
			"vjseq_nz_napalm_explode_1",
			"vjseq_nz_napalm_explode_2",
			"vjseq_nz_napalm_explode_3"
		}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(130,19,10)))
		effectBlood:SetScale(140)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_02.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/lung_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/liver_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "vj_gib/default_gib_splat.wav", 100, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/