AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Gibs/HGIBS.mdl"}
ENT.StartHealth = 9999
ENT.VJ_NPC_Class = {"CLASS_BBBOS"}
ENT.CanTurnWhileStationary = false
-- ENT.FindEnemy_UseSphere = true
-- ENT.FindEnemy_CanSeeThroughWalls = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false
ENT.MeleeAttackDamage = 0
ENT.HasSounds = false
ENT.SpawnCoolDownT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self.MovementType = VJ_MOVETYPE_STATIONARY
	self:SetSolid(SOLID_NONE)
	self:AddFlags(FL_NOTARGET)
	self:SetRenderMode( RENDERMODE_TRANSCOLOR )
	self:SetColor(Color(0,0,0,0))
	self.GodMode = true
	self.CallForHelp = false 
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self.SpawnCoolDownT < CurTime() then
		self:SpawnDude()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnDude()
	if !IsValid(self.Bitch) then
		self.Bitch = self:SpawnDudeButActuallySpawnThem()
		return 15
	end
	return 8
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnDudeButActuallySpawnThem()

	local randombitch = math.random(1,13)
	if randombitch == 1 then
		self.OurBitch = "npc_vj_bbohg_skeleton_cartel_obese"
	elseif randombitch >= 2 && randombitch <= 4 then
		self.OurBitch = "npc_vj_bbohg_skeleton_b0ner_frenzied"
	elseif randombitch >= 5 && randombitch <= 8 then
		self.OurBitch = "npc_vj_bbohg_skeleton_b0ner_lowpoly"
	else
		self.OurBitch = "npc_vj_bbohg_skeleton_b0ner_shambler"
	end
	
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetForward() * 0 + self:GetRight() * 0 + self:GetUp() * 0,
		filter = {self},
		mask = MASK_ALL,
	})
	local spawnpos = tr.HitPos + tr.HitNormal*-150
	local ally = ents.Create(self.OurBitch)
	ally:SetPos(spawnpos)
	ally:SetAngles(self:GetAngles())
	ally:Spawn()
	ally:Activate()
	self.SpawnCoolDownT = CurTime() + 3
	return ally

end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/