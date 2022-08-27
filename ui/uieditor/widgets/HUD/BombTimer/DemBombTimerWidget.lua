-- 2267749c8a2cc6dbcbedcb3b7a9f497f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.DemBombTimerWidget = InheritFrom( LUI.UIElement )
CoD.DemBombTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemBombTimerWidget )
	self.id = "DemBombTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( true, true, -2, 2 )
	Panel:setTopBottom( false, false, -14, 14 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local backgroundDisabled = LUI.UIImage.new()
	backgroundDisabled:setLeftRight( true, false, 0, 27 )
	backgroundDisabled:setTopBottom( true, false, 0, 24 )
	backgroundDisabled:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
	backgroundDisabled:setAlpha( 0 )
	backgroundDisabled:setImage( RegisterImage( "uie_t7_hud_waypoints_snd_empty" ) )
	backgroundDisabled:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( backgroundDisabled )
	self.backgroundDisabled = backgroundDisabled
	
	local backgroundFriendly = LUI.UIImage.new()
	backgroundFriendly:setLeftRight( true, false, 0, 27 )
	backgroundFriendly:setTopBottom( true, false, 0, 24 )
	backgroundFriendly:setAlpha( 0 )
	backgroundFriendly:setImage( RegisterImage( "uie_t7_hud_waypoints_snd_empty" ) )
	backgroundFriendly:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	backgroundFriendly:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveFriendlyColor", function ( model )
		local colorBlindSensitiveFriendlyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveFriendlyColor then
			backgroundFriendly:setRGB( colorBlindSensitiveFriendlyColor )
		end
	end )
	self:addElement( backgroundFriendly )
	self.backgroundFriendly = backgroundFriendly
	
	local backgroundEnemy = LUI.UIImage.new()
	backgroundEnemy:setLeftRight( true, false, 0, 27 )
	backgroundEnemy:setTopBottom( true, false, 0, 24 )
	backgroundEnemy:setImage( RegisterImage( "uie_t7_hud_waypoints_snd_empty" ) )
	backgroundEnemy:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	backgroundEnemy:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveEnemyColor", function ( model )
		local colorBlindSensitiveEnemyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveEnemyColor then
			backgroundEnemy:setRGB( colorBlindSensitiveEnemyColor )
		end
	end )
	self:addElement( backgroundEnemy )
	self.backgroundEnemy = backgroundEnemy
	
	local BombTimerBackground = LUI.UIImage.new()
	BombTimerBackground:setLeftRight( true, false, 27, 73 )
	BombTimerBackground:setTopBottom( true, false, 0, 24 )
	BombTimerBackground:setRGB( 0, 0, 0 )
	BombTimerBackground:setAlpha( 0 )
	BombTimerBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( BombTimerBackground )
	self.BombTimerBackground = BombTimerBackground
	
	local BombTimer = LUI.UITightText.new()
	BombTimer:setLeftRight( true, false, 35, 67 )
	BombTimer:setTopBottom( true, false, 2, 22 )
	BombTimer:setTTF( "fonts/escom.ttf" )
	BombTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BombTimer:setShaderVector( 0, 0, 1, 0, 0 )
	BombTimer:setShaderVector( 1, 0, 0, 0, 0 )
	BombTimer:setShaderVector( 2, 0.05, 0, 0, 0 )
	BombTimer:setShaderVector( 3, 0, 0, 0, 0 )
	BombTimer:setShaderVector( 4, 0, 0, 0, 0 )
	BombTimer:setupBombTimer( 0, true )
	self:addElement( BombTimer )
	self.BombTimer = BombTimer
	
	local AOrBText = LUI.UIText.new()
	AOrBText:setLeftRight( true, false, 0, 27 )
	AOrBText:setTopBottom( true, false, 2, 22 )
	AOrBText:setRGB( 0, 0, 0 )
	AOrBText:setText( Engine.Localize( "C" ) )
	AOrBText:setTTF( "fonts/escom.ttf" )
	AOrBText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AOrBText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AOrBText )
	self.AOrBText = AOrBText
	
	local InactiveText = LUI.UIText.new()
	InactiveText:setLeftRight( true, false, 38, 63 )
	InactiveText:setTopBottom( true, false, -1, 23 )
	InactiveText:setAlpha( 0 )
	InactiveText:setText( Engine.Localize( "-:--" ) )
	InactiveText:setTTF( "fonts/default.ttf" )
	InactiveText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	InactiveText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( InactiveText )
	self.InactiveText = InactiveText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 0 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 0 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 0 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 0 )
				self.clipFinished( InactiveText, {} )
			end
		},
		HiddenSpectator = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 0 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 0 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 0 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 0 )
				self.clipFinished( InactiveText, {} )
			end
		},
		HiddenNoBombSite = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 0 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 0 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 0 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 0 )
				self.clipFinished( InactiveText, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 1 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 0 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 1 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 1 )
				self.InactiveText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.InactiveText:setShaderVector( 0, 0, 1, 0, 0 )
				self.InactiveText:setShaderVector( 1, 0, 0, 0, 0 )
				self.InactiveText:setShaderVector( 2, 0.05, 0, 0, 0 )
				self.InactiveText:setShaderVector( 3, 0, 0, 0, 0 )
				self.InactiveText:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( InactiveText, {} )
			end
		},
		Attacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 0 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 1 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 1 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 1 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 0 )
				self.clipFinished( InactiveText, {} )
			end
		},
		Defending = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				backgroundDisabled:completeAnimation()
				self.backgroundDisabled:setAlpha( 0 )
				self.clipFinished( backgroundDisabled, {} )
				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )
				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 1 )
				self.clipFinished( backgroundEnemy, {} )
				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )
				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 1 )
				self.clipFinished( BombTimer, {} )
				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 1 )
				self.clipFinished( AOrBText, {} )
				InactiveText:completeAnimation()
				self.InactiveText:setAlpha( 0 )
				self.clipFinished( InactiveText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f11_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f11_local0 then
						f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f11_local0 then
							f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f11_local0 then
								f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f11_local0 then
									f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f11_local0 then
										f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f11_local0 then
											f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f11_local0 then
												f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
												if not f11_local0 then
													f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
													if not f11_local0 then
														f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
														if not f11_local0 then
															f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f11_local0 then
																f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																if not f11_local0 then
																	f11_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				else
					f11_local0 = true
				end
				return f11_local0
			end
		},
		{
			stateName = "HiddenSpectator",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
			end
		},
		{
			stateName = "HiddenNoBombSite",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Attacking",
			condition = function ( menu, element, event )
				return not IsModelValueTrue( controller, "Demolition.defending" )
			end
		},
		{
			stateName = "Defending",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.defending" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.defending"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.backgroundFriendly:close()
		element.backgroundEnemy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

