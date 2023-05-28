AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/oddities/slashco/watcher.mdl"}
ENT.StartHealth = 1000
-------------------------------------------------------------------------------------------------------------------
function ENT:ZombieSounds()

	self.SoundTbl_FootStep = {
		"npc/footsteps/hardboot_generic1.wav",
		"npc/footsteps/hardboot_generic2.wav",
		"npc/footsteps/hardboot_generic3.wav",
		"npc/footsteps/hardboot_generic4.wav",
		"npc/footsteps/hardboot_generic5.wav",
		"npc/footsteps/hardboot_generic6.wav",
		"npc/footsteps/hardboot_generic8.wav"
	}

	self.SoundTbl_Alert = {
		"slashco/slasher/watcher_see.mp3"
	}

	self.SoundTbl_CombatIdle = {
		""
	}

	self.SoundTbl_MeleeAttack = {
		""
	}

	self.SoundTbl_MeleeAttackMiss = {
		""
	}

	self.SoundTbl_AllyDeath = {
		""
	}
	self.SoundTbl_Pain = {
		""
	}
	self.SoundTbl_Death = {
		"slashco/slasher/watcher_locate.mp3"
	}

end
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	self.AnimTbl_Run = {ACT_WALK}

	self.DisableFootStepSoundTimer = true
	self.HasMeleeAttack = false
	self.HasRangeAttack = false
	
	self.NoChaseAfterCertainRange = true
	self.NoChaseAfterCertainRange_FarDistance = math.random(500,1500)
	self.NoChaseAfterCertainRange_CloseDistance = 5

	self.MeleeAttackDamageType = DMG_DISSOLVE
	self.MeleeAttackDamage = 9999
	self.TimeUntilMeleeAttackDamage = 0.1
	self.NextMeleeAttackTime = 0.1
	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
	self.DisableMeleeAttackAnimation = true

end
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

	if self.Dead == false && self:GetEnemy() != nil && self.VJ_IsBeingControlled == false && !self.BBOHG_Oddities_SlashCo_Watcher_Hiding && self:Visible(self:GetEnemy()) then

		local enemydist = self:GetPos():Distance(self:GetEnemy():GetPos())

		if enemydist <= 500 then

			if self.BBOHG_Oddities_SlashCo_Watcher_CanRagePartTwo && !self.BBOHG_Oddities_SlashCo_Watcher_Raged then
			
				self.BBOHG_Oddities_SlashCo_Watcher_CanRagePartTwo = false
				self.BBOHG_Oddities_SlashCo_Watcher_Raged = true

				self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
				self.AnimTbl_Walk = {ACT_RUN}
				self.AnimTbl_Run = {ACT_RUN_AIM}

				self.NoChaseAfterCertainRange = false

				self.HasMeleeAttack = true

				self.HasBreathSound = true
				self.SoundTbl_Breath = {"slashco/slasher/watcher_chase.wav"}
				self.NextSoundTime_Breath = VJ_Set(160,160)
				self.BreathSoundLevel = 150
				self.NextBreathSoundT = 1
			
				self.Light1 = ents.Create("light_dynamic")
				self.Light1:SetKeyValue("brightness", "5")
				self.Light1:SetKeyValue("distance", "250")
				self.Light1:SetLocalPos(self:GetPos())
				self.Light1:SetLocalAngles(self:GetAngles())
				self.Light1:Fire("Color", "255 0 0 255")
				self.Light1:SetParent(self)
				self.Light1:Spawn()
				self.Light1:Activate()
				self.Light1:Fire("SetParentAttachment","origin")
				self.Light1:Fire("TurnOn", "", 0)
				self:DeleteOnRemove(self.Light1)

			else

				if self.BBOHG_Oddities_SlashCo_Watcher_Raged == false then

					self.BBOHG_Oddities_SlashCo_Watcher_Hiding = true
					self.NoChaseAfterCertainRange = false
					
					self.BBOHG_Oddities_SlashCo_Watcher_HideTime = CurTime() + math.random(15,60)

					self.Behavior = VJ_BEHAVIOR_PASSIVE

					self.AnimTbl_Walk = {ACT_RUN_AIM}
					self.AnimTbl_Run = {ACT_RUN_AIM}
					self.HasFootStepSound = false

					VJ_EmitSound(self,"bbohg/fx/ender"..math.random(1,2)..".mp3",self.AlertSoundLevel,math.random(90,110))

					self:AddFlags(FL_NOTARGET)

					self:SetRenderMode( RENDERMODE_TRANSCOLOR )
					self:SetColor(Color(255, 255, 255, 0))
					self:SetMaterial("models/debug/debugwhite")
					self:SetSolid(SOLID_NONE)

					self:RemoveAllDecals()


				end

			end

		end

	end

	if self.BBOHG_Oddities_SlashCo_Watcher_Hiding && self.BBOHG_Oddities_SlashCo_Watcher_HideTime < CurTime() then

		self.Behavior = VJ_BEHAVIOR_AGGRESSIVE

		if self.BBOHG_Oddities_SlashCo_Watcher_NextCheckTime < CurTime() then

			self.BBOHG_Oddities_SlashCo_Watcher_NextCheckTime = CurTime() + math.random(3,3)

			timer.Simple(0.5,function() if IsValid(self) then

				for _, v in ipairs(ents.FindInSphere(self:GetPos(), 600)) do

					if (self:GetEnemy() != nil && (v:IsNPC() or v:IsPlayer() or v:IsNextBot()) && self:Disposition(v) == D_HT) then

						self.Behavior = VJ_BEHAVIOR_PASSIVE
						self.BBOHG_Oddities_SlashCo_Watcher_HideTime = CurTime() + math.random(3,15)

					end

					if (self:GetEnemy() == nil or !self:Visible(self:GetEnemy())) && self.BBOHG_Oddities_SlashCo_Watcher_Thing then

						self.BBOHG_Oddities_SlashCo_Watcher_Hiding = false
						self.BBOHG_Oddities_SlashCo_Watcher_Thing = false
						self.BBOHG_Oddities_SlashCo_Watcher_NextCheckTime = CurTime() + math.random(3,3)

						self.Behavior = VJ_BEHAVIOR_AGGRESSIVE

						self.AnimTbl_Walk = {ACT_WALK}
						self.AnimTbl_Run = {ACT_WALK}

						self.NoChaseAfterCertainRange = true
						
						self:RemoveFlags(FL_NOTARGET)	

						self:SetRenderMode( RENDERMODE_NORMAL )
						self:SetColor(Color(255, 255, 255, 255))
						self:SetMaterial("")
						self:SetSolid(SOLID_BBOX)

						self:RemoveAllDecals()

						self.HasFootStepSound = true

						timer.Simple(1.5,function() if IsValid(self) then

							self.BBOHG_Oddities_SlashCo_Watcher_Thing = true

						end end)

						if self.BBOHG_Oddities_SlashCo_Watcher_CanRage then
							self.AnimTbl_Walk = {ACT_RUN}
							self.AnimTbl_Run = {ACT_RUN}
							self.BBOHG_Oddities_SlashCo_Watcher_CanRagePartTwo = true
						end

					end

				end

			end end)

		end

	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnMeleeAttack_BeforeStartTimer(seed)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)

	if hitEnt:IsNPC() or hitEnt:IsNextBot() or hitEnt:IsPlayer() then

		self.BBOHG_Oddities_SlashCo_Watcher_Raged = false
		self.BBOHG_Oddities_SlashCo_Watcher_CanRage = false
		self.BBOHG_Oddities_SlashCo_Watcher_Hiding = true
		self.BBOHG_Oddities_SlashCo_Watcher_HideTime = CurTime() + math.random(1,2)

		self.HasFootStepSound = false

		self.HasBreathSound = false
		VJ_STOPSOUND(self.CurrentBreathSound)

		self.HasMeleeAttack = false

		self.Behavior = VJ_BEHAVIOR_PASSIVE
		self.AnimTbl_Walk = {ACT_RUN_AIM}
		self.AnimTbl_Run = {ACT_RUN_AIM}

		self.Light1:Fire("Kill", "", 0)

		self.NoChaseAfterCertainRange = false
					
		self:AddFlags(FL_NOTARGET)

		self:SetRenderMode( RENDERMODE_TRANSCOLOR )
		self:SetColor(Color(255, 255, 255, 0))
		self:SetMaterial("models/debug/debugwhite")
		self:SetSolid(SOLID_NONE)

		self:RemoveAllDecals()

		VJ_EmitSound(self,"bbohg/fx/ender"..math.random(1,2)..".mp3",self.AlertSoundLevel,math.random(90,110))

	end
	return false
end -- return true to disable the attack and move onto the next entity!
-------------------------------------------------------------------------------------------------------------------
function ENT:ArmorDamage(dmginfo,hitgroup)

	if math.random(1,3) == 1 && !self.BBOHG_Oddities_SlashCo_Watcher_Hiding && !self.BBOHG_Oddities_SlashCo_Watcher_Raged then

		self.BBOHG_Oddities_SlashCo_Watcher_Hiding = true
		self.NoChaseAfterCertainRange = false
		
		self.BBOHG_Oddities_SlashCo_Watcher_HideTime = CurTime() + math.random(15,60)

		self.Behavior = VJ_BEHAVIOR_PASSIVE

		self.AnimTbl_Walk = {ACT_RUN_AIM}
		self.AnimTbl_Run = {ACT_RUN_AIM}
		self.HasFootStepSound = false

		VJ_EmitSound(self,"bbohg/fx/ender"..math.random(1,2)..".mp3",self.AlertSoundLevel,math.random(90,110))

		self:AddFlags(FL_NOTARGET)

		self:SetRenderMode( RENDERMODE_TRANSCOLOR )
		self:SetColor(Color(255, 255, 255, 0))
		self:SetMaterial("models/debug/debugwhite")
		self:SetSolid(SOLID_NONE)

		self:RemoveAllDecals()

	end

	if self.BBOHG_Oddities_SlashCo_Watcher_CanRage then return end

	local dmgAttacker = dmginfo:GetAttacker()
	if IsValid(dmgAttacker) then
		if dmgAttacker:IsNPC() or dmgAttacker:IsNextBot() or dmgAttacker:IsPlayer() then
			if self:Visible(dmgAttacker) then
				self.BBOHG_Oddities_SlashCo_Watcher_CanRage = true
			end
		end
	end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/