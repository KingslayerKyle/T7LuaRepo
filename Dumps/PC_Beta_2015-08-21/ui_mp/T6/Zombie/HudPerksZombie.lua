CoD.Perks = {}
CoD.Perks.TopStart = -55
CoD.Perks.LeftStart = 140
CoD.Perks.IconSize = 36
CoD.Perks.Spacing = 8
CoD.Perks.STATE_NOTOWNED = 0
CoD.Perks.STATE_OWNED = 1
CoD.Perks.STATE_PAUSED = 2
CoD.Perks.STATE_TBD = 3
CoD.Perks.ClientFieldNames = {}
CoD.Perks.ClientFieldNames[1] = {
	clientFieldName = "perk_additional_primary_weapon",
	material = RegisterMaterial( "specialty_extraprimaryweapon_zombies" )
}
CoD.Perks.ClientFieldNames[2] = {
	clientFieldName = "perk_dead_shot",
	material = RegisterMaterial( "specialty_ads_zombies" )
}
CoD.Perks.ClientFieldNames[3] = {
	clientFieldName = "perk_dive_to_nuke",
	material = RegisterMaterial( "specialty_divetonuke_zombies" )
}
CoD.Perks.ClientFieldNames[4] = {
	clientFieldName = "perk_doubletap2",
	material = RegisterMaterial( "specialty_doubletap_zombies" )
}
CoD.Perks.ClientFieldNames[5] = {
	clientFieldName = "perk_juggernaut",
	material = RegisterMaterial( "specialty_juggernaut_zombies" )
}
CoD.Perks.ClientFieldNames[6] = {
	clientFieldName = "perk_marathon",
	material = RegisterMaterial( "specialty_marathon_zombies" )
}
CoD.Perks.ClientFieldNames[7] = {
	clientFieldName = "perk_quick_revive",
	material = RegisterMaterial( "specialty_quickrevive_zombies" )
}
CoD.Perks.ClientFieldNames[8] = {
	clientFieldName = "perk_sleight_of_hand",
	material = RegisterMaterial( "specialty_fastreload_zombies" )
}
CoD.Perks.ClientFieldNames[9] = {
	clientFieldName = "perk_tombstone",
	material = RegisterMaterial( "specialty_tombstone_zombies" )
}
CoD.Perks.ClientFieldNames[10] = {
	clientFieldName = "perk_chugabud",
	material = RegisterMaterial( "specialty_chugabud_zombies" )
}
CoD.Perks.ClientFieldNames[11] = {
	clientFieldName = "perk_widows_wine",
	material = RegisterMaterial( "specialty_widows_wine_zombies" )
}
CoD.Perks.ClientFieldNames[12] = {
	clientFieldName = "perk_vulture",
	material = RegisterMaterial( "specialty_vulture_zombies" ),
	glowMaterial = RegisterMaterial( "zm_hud_stink_perk_glow" )
}
CoD.Perks.PulseDuration = 200
CoD.Perks.PulseScale = 1.3
CoD.Perks.PausedAlpha = 0.3
LUI.createMenu.PerksArea = function ( f1_arg0 )
	local f1_local0 = CoD.Menu.NewSafeAreaFromState( "PerksArea", f1_arg0 )
	f1_local0:setOwner( f1_arg0 )
	f1_local0.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	f1_local0.scaleContainer:setLeftRight( true, false, 10, 0 )
	f1_local0.scaleContainer:setTopBottom( false, true, 0, 0 )
	f1_local0:addElement( f1_local0.scaleContainer )
	CoD.Perks.MeterBlackMaterial = RegisterMaterial( "zm_hud_stink_ani_black" )
	CoD.Perks.MeterGreenMaterial = RegisterMaterial( "zm_hud_stink_ani_green" )
	local f1_local1, f1_local2 = nil
	local f1_local3 = CoD.Perks.TopStart
	local f1_local4 = f1_local3 + CoD.Perks.IconSize
	f1_local0.perks = {}
	for f1_local5 = 1, #CoD.Perks.ClientFieldNames, 1 do
		f1_local1 = CoD.Perks.LeftStart + (CoD.Perks.IconSize + CoD.Perks.Spacing) * (f1_local5 - 1)
		f1_local2 = f1_local1 + CoD.Perks.IconSize
		local self = LUI.UIElement.new()
		self:setLeftRight( true, false, f1_local1, f1_local2 )
		self:setTopBottom( false, true, f1_local3, f1_local4 )
		self:setScale( 1 )
		self.perkId = nil
		
		local perkIcon = LUI.UIImage.new()
		perkIcon:setLeftRight( true, true, 0, 0 )
		perkIcon:setTopBottom( true, true, 0, 0 )
		perkIcon:setAlpha( 0 )
		self:addElement( perkIcon )
		self.perkIcon = perkIcon
		
		self:registerEventHandler( "transition_complete_pulse", CoD.Perks.IconPulseFinish )
		f1_local0.scaleContainer:addElement( self )
		f1_local0.perks[f1_local5] = self
		f1_local0:registerEventHandler( CoD.Perks.ClientFieldNames[f1_local5].clientFieldName, CoD.Perks.Update )
	end
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		CoD.Perks.UpdateVisibility( f1_local0, f1_arg0 )
	end )
	f1_local0.visible = true
	return f1_local0
end

CoD.Perks.UpdateVisibility = function ( f17_arg0, f17_arg1 )
	if Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f17_arg1, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and (not CoD.IsShoutcaster( f17_arg1 ) or CoD.ShoutcasterProfileVarBool( f17_arg1, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( f17_arg1 )) and CoD.FSM_VISIBILITY( f17_arg1 ) == 0 then
		if f17_arg0.visible ~= true then
			f17_arg0:setAlpha( 1 )
			f17_arg0.m_inputDisabled = nil
			f17_arg0.visible = true
		end
	elseif f17_arg0.visible == true then
		f17_arg0:setAlpha( 0 )
		f17_arg0.m_inputDisabled = true
		f17_arg0.visible = nil
	end
end

CoD.Perks.GetMaterial = function ( f18_arg0, f18_arg1 )
	local f18_local0 = nil
	for f18_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[f18_local1].clientFieldName == f18_arg1 then
			f18_local0 = CoD.Perks.ClientFieldNames[f18_local1].material
			break
		end
	end
	return f18_local0
end

CoD.Perks.GetGlowMaterial = function ( f19_arg0, f19_arg1 )
	local f19_local0 = nil
	for f19_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[f19_local1].clientFieldName == f19_arg1 then
			if CoD.Perks.ClientFieldNames[f19_local1].glowMaterial then
				f19_local0 = CoD.Perks.ClientFieldNames[f19_local1].glowMaterial
				break
			end
		end
	end
	return f19_local0
end

CoD.Perks.RemovePerkIcon = function ( f20_arg0, f20_arg1 )
	local f20_local0, f20_local1 = nil
	for f20_local2 = f20_arg1, #CoD.Perks.ClientFieldNames, 1 do
		f20_local0 = f20_arg0.perks[f20_local2]
		if not f20_local0.perkId then
			break
		elseif f20_local2 ~= #CoD.Perks.ClientFieldNames then
			f20_local1 = f20_arg0.perks[f20_local2 + 1]
		end
		if not f20_local1 then
			f20_local0.perkIcon:setAlpha( 0 )
			if f20_local0.perkGlowIcon then
			
			else
				f20_local0.perkId = nil
				break
			end
			f20_local0.perkGlowIcon:setAlpha( 0 )
		elseif not f20_local1.perkId then
			f20_local0.perkIcon:setAlpha( 0 )
			if f20_local0.perkGlowIcon then
				f20_local0.perkGlowIcon:close()
				f20_local0.perkGlowIcon = nil
			end
			if f20_local0.meterContainer then
			
			else
				f20_local0.perkId = nil
				break
			end
			f20_local0.meterContainer:close()
			f20_local0.meterContainer = nil
		else
			f20_local0.perkIcon:setImage( CoD.Perks.GetMaterial( f20_arg0, f20_local1.perkId ) )
			local f20_local5 = CoD.Perks.GetGlowMaterial( f20_arg0, f20_local1.perkId )
			if f20_local5 and f20_local0.perkGlowIcon then
				f20_local0.perkGlowIcon:setImage( f20_local5 )
			end
		end
		f20_local0.perkId = f20_local1.perkId
	end
end

CoD.Perks.Update = function ( f21_arg0, f21_arg1 )
	local f21_local0 = nil
	for f21_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		f21_local0 = f21_arg0.perks[f21_local1]
		if f21_arg1.newValue == CoD.Perks.STATE_OWNED then
			if not f21_local0.perkId then
				f21_local0.perkId = f21_arg1.name
				f21_local0.perkIcon:setImage( CoD.Perks.GetMaterial( f21_arg0, f21_arg1.name ) )
				f21_local0.perkIcon:setAlpha( 1 )
				if f21_local0.perkId == "perk_vulture" then
				
				else
					local f21_local4 = CoD.Perks.GetGlowMaterial( f21_arg0, f21_arg1.name )
					if f21_local4 and f21_local0.perkGlowIcon then
						f21_local0.perkGlowIcon:setImage( f21_local4 )
						break
					end
				end
				CoD.Perks.AddGlowIcon( f21_arg0, f21_local0 )
				CoD.Perks.AddVultureMeter( f21_arg0, f21_local0 )
			elseif f21_local0.perkId == f21_arg1.name then
				f21_local0:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f21_local0:setScale( CoD.Perks.PulseScale )
				f21_local0.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f21_local0.perkIcon:setAlpha( 1 )
				if f21_local0.perkGlowIcon then
					f21_local0.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					break
				end
			end
		end
		if f21_arg1.newValue == CoD.Perks.STATE_NOTOWNED then
			if f21_local0.perkId == f21_arg1.name then
				CoD.Perks.RemovePerkIcon( f21_arg0, f21_local1 )
				break
			end
		end
		if f21_arg1.newValue == CoD.Perks.STATE_PAUSED then
			if f21_local0.perkId == f21_arg1.name then
				f21_local0:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f21_local0:setScale( CoD.Perks.PulseScale )
				f21_local0.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f21_local0.perkIcon:setAlpha( CoD.Perks.PausedAlpha )
				if f21_local0.perkGlowIcon then
					f21_local0.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					f21_local0.perkGlowIcon:setAlpha( 0 )
					break
				end
			end
		end
		if f21_arg1.newValue == CoD.Perks.STATE_TBD then
			
		end
	end
end

CoD.Perks.IconPulseFinish = function ( f22_arg0, f22_arg1 )
	if f22_arg1.interrupted ~= true then
		f22_arg0:beginAnimation( "pulse_done", CoD.Perks.PulseDuration )
		f22_arg0:setScale( 1 )
	end
end

CoD.Perks.AddGlowIcon = function ( f23_arg0, f23_arg1 )
	if not f23_arg1.perkGlowIcon then
		local self = LUI.UIImage.new()
		self:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		self:setTopBottom( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		self:setAlpha( 0 )
		f23_arg1:addElement( self )
		f23_arg1.perkGlowIcon = self
	end
end

CoD.Perks.AddVultureMeter = function ( f24_arg0, f24_arg1 )
	if not f24_arg1.meterContainer then
		local f24_local0 = CoD.Perks.TopStart + CoD.Perks.IconSize * 2
		local f24_local1 = -CoD.Perks.IconSize
		
		local meterContainer = LUI.UIElement.new()
		meterContainer:setLeftRight( true, false, 0, CoD.Perks.IconSize )
		meterContainer:setTopBottom( false, true, f24_local0 + 5, f24_local1 + 5 )
		meterContainer:setAlpha( 0 )
		meterContainer:setPriority( -10 )
		f24_arg1:addElement( meterContainer )
		f24_arg1.meterContainer = meterContainer
		
		local f24_local3 = LUI.UIImage.new()
		f24_local3:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		f24_local3:setTopBottom( true, true, 0, 0 )
		f24_local3:setImage( CoD.Perks.MeterBlackMaterial )
		meterContainer:addElement( f24_local3 )
		local f24_local4 = LUI.UIImage.new()
		f24_local4:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		f24_local4:setTopBottom( true, true, 0, 0 )
		f24_local4:setImage( CoD.Perks.MeterGreenMaterial )
		meterContainer:addElement( f24_local4 )
		f24_arg1:registerEventHandler( "vulture_perk_disease_meter", CoD.Perks.UpdateVultureDiseaseMeter )
	end
end

CoD.Perks.UpdateVultureDiseaseMeter = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg1.newValue
	if f25_arg0.meterContainer then
		f25_arg0.meterContainer:setAlpha( f25_local0 )
	end
	if f25_arg0.perkGlowIcon then
		f25_arg0.perkGlowIcon:setAlpha( f25_local0 )
	end
end

