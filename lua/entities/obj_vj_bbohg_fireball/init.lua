AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Gibs/HGIBS.mdl"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = true
ENT.PaintDecalOnCollide = false
ENT.CollideCodeWithoutRemoving = true
ENT.DoesDirectDamage = false
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 150
ENT.RadiusDamage = 15
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_BLAST
ENT.RadiusDamageForce = 90
ENT.DecalTbl_DeathDecals = {"Scorch"}
ENT.RemoveOnHit = true
ENT.PaintDecalOnCollide = true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Startup = {"misc/halloween/spell_fireball_cast.wav"}
ENT.SoundTbl_Idle = {"ambient/fire/fire_med_loop1.wav"}
ENT.SoundTbl_OnRemove = {"misc/halloween/spell_fireball_impact.wav"}
	
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)
ENT.StartupSoundLevel = 90
ENT.IdleSoundLevel = 90
ENT.OnRemoveSoundLevel = 90

ENT.StartupSoundPitch = VJ_Set(85, 90)
ENT.IdleSoundPitch = VJ_Set(100, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,25) == 1 then
		self.StartupSoundPitch = VJ_Set(100,100)
		self.SoundTbl_Startup = {"bbohg/fx/fireball.mp3"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()


	self:SetMaterial("Models/effects/vol_light001")

	ParticleEffectAttach("fire_small_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("fire_small_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("fire_small_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	
	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "5")
	self.Light1:SetKeyValue("distance", "95")
	self.Light1:SetLocalPos(self:GetPos() + self:GetUp()*0 + self:GetForward()*0)
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "255 93 0")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	-- self.Light1:Fire("SetParentAttachment","eyes")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableGravity(false)
	phys:EnableDrag(false)
	-- phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	timer.Simple(0.5,function() if IsValid(self) then
	self:Remove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects()
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	//effectData:SetScale( 500 )
	util.Effect( "HelicopterMegaBomb", effectData )
	util.Effect( "ThumperDust", effectData )
	-- util.Effect( "Explosion", effectData )
	util.Effect( "VJ_Small_Explosion1", effectData )

	local ExplosionLight1 = ents.Create("light_dynamic")
	ExplosionLight1:SetKeyValue("brightness", "4")
	ExplosionLight1:SetKeyValue("distance", "300")
	ExplosionLight1:SetLocalPos(self:GetPos())
	ExplosionLight1:SetLocalAngles( self:GetAngles() )
	ExplosionLight1:Fire("Color", "255 150 0")
	ExplosionLight1:SetParent(self)
	ExplosionLight1:Spawn()
	ExplosionLight1:Activate()
	ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(ExplosionLight1)
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/