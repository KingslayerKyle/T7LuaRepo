require( "ui.uieditor.widgets.HUD.Flag.AllyFlag" )
require( "ui.uieditor.widgets.HUD.Flag.AxisFlag" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_SDBomb" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Ball" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_CleanCarryCount" )

CoD.AmmoWidgetMP_HeldItem = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_HeldItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_HeldItem )
	self.id = "AmmoWidgetMP_HeldItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 92 )
	self:setTopBottom( true, false, 0, 123 )
	self.anyChildUsesUpdateState = true
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( true, false, -5.88, 94.94 )
	Glow00:setTopBottom( true, false, -45, 123 )
	Glow00:setRGB( 0.07, 0.27, 0.31 )
	Glow00:setAlpha( 0 )
	Glow00:setImage( RegisterImage( "uie_lui_score_feed_glow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -8.5, 100.5 )
	Glow:setTopBottom( true, false, -16.25, 96.75 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_lui_score_feed_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AllyFlag = CoD.AllyFlag.new( menu, controller )
	AllyFlag:setLeftRight( true, false, 23, 69 )
	AllyFlag:setTopBottom( true, false, 0, 80 )
	AllyFlag:setAlpha( 0 )
	self:addElement( AllyFlag )
	self.AllyFlag = AllyFlag
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, -5.88, 94.94 )
	Glow0:setTopBottom( true, false, -45, 123 )
	Glow0:setRGB( 0.07, 0.27, 0.31 )
	Glow0:setAlpha( 0 )
	Glow0:setImage( RegisterImage( "uie_lui_score_feed_glow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local AxisFlag = CoD.AxisFlag.new( menu, controller )
	AxisFlag:setLeftRight( true, false, 23, 69 )
	AxisFlag:setTopBottom( true, false, 0, 80 )
	AxisFlag:setAlpha( 0 )
	self:addElement( AxisFlag )
	self.AxisFlag = AxisFlag
	
	local AmmoWidgetSDBomb = CoD.AmmoWidget_SDBomb.new( menu, controller )
	AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
	AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
	AmmoWidgetSDBomb:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				local f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f2_local0 then
					f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f2_local0 then
						f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
						if not f2_local0 then
							f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
							if not f2_local0 then
								if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
									f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
									if not f2_local0 then
										f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
										if not f2_local0 then
											f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
											if not f2_local0 then
												f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
												if not f2_local0 then
													f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
													if not f2_local0 then
														f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
														if not f2_local0 then
															f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f2_local0 then
																f2_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
																if not f2_local0 then
																	f2_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
																end
															end
														end
													end
												end
											end
										end
									end
								else
									f2_local0 = true
								end
							end
						end
					end
				end
				return f2_local0
			end
		}
	} )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.SDBombClient" ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.SDBombClient"
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.defending" ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.defending"
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "SearchAndDestroy.defending" ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "SearchAndDestroy.defending"
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A
		} )
	end )
	AmmoWidgetSDBomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ), function ( model )
		menu:updateElementState( AmmoWidgetSDBomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B
		} )
	end )
	self:addElement( AmmoWidgetSDBomb )
	self.AmmoWidgetSDBomb = AmmoWidgetSDBomb
	
	local AmmoWidgetBall = CoD.AmmoWidget_Ball.new( menu, controller )
	AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
	AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
	AmmoWidgetBall:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				local f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f23_local0 then
					f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f23_local0 then
						f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
						if not f23_local0 then
							f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
							if not f23_local0 then
								if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
									f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
									if not f23_local0 then
										f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
										if not f23_local0 then
											f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
											if not f23_local0 then
												f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
												if not f23_local0 then
													f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
													if not f23_local0 then
														f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
														if not f23_local0 then
															f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f23_local0 then
																f23_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
																if not f23_local0 then
																	f23_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
																end
															end
														end
													end
												end
											end
										end
									end
								else
									f23_local0 = true
								end
							end
						end
					end
				end
				return f23_local0
			end
		}
	} )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	AmmoWidgetBall:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( AmmoWidgetBall, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	self:addElement( AmmoWidgetBall )
	self.AmmoWidgetBall = AmmoWidgetBall
	
	local CleanCarryCount = CoD.AmmoWidget_CleanCarryCount.new( menu, controller )
	CleanCarryCount:setLeftRight( true, false, -5, 71 )
	CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
	self:addElement( CleanCarryCount )
	self.CleanCarryCount = CleanCarryCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.Glow00:setRGB( 0.07, 0.27, 0.31 )
				self.Glow00:setAlpha( 0 )
				self.clipFinished( Glow00, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -8.5, 100.5 )
				self.Glow:setTopBottom( true, false, -16.25, 96.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 0 )
				self.clipFinished( AllyFlag, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.Glow0:setRGB( 0.07, 0.27, 0.31 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
			end,
			ShowAllyFlag = function ()
				self:setupElementClipCounter( 3 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											if not event.interrupted then
												Glow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
											end
											Glow:setLeftRight( true, false, -4.5, 96.5 )
											Glow:setTopBottom( true, false, -41, 123 )
											Glow:setRGB( 0.18, 0.33, 0.36 )
											Glow:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Glow, event )
											else
												Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										Glow:setLeftRight( true, false, -4.5, 96.5 )
										Glow:setTopBottom( true, false, -41, 123 )
										Glow:setRGB( 0.18, 0.33, 0.36 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, -15, 101 )
									Glow:setTopBottom( true, false, -51.5, 127.5 )
									Glow:setRGB( 0.07, 0.27, 0.31 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, -12.25, 99.63 )
								Glow:setTopBottom( true, false, -44.11, 123.2 )
								Glow:setRGB( 0.12, 0.29, 0.34 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -8.63, 97.81 )
							Glow:setTopBottom( true, false, -34.37, 117.54 )
							Glow:setRGB( 0.18, 0.33, 0.37 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( true, false, -7, 97 )
						Glow:setTopBottom( true, false, -30, 115 )
						Glow:setRGB( 1, 1, 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4, 96 )
				self.Glow:setTopBottom( true, false, 46, 46 )
				self.Glow:setRGB( 0, 0, 0 )
				self.Glow:setAlpha( 1 )
				GlowFrame2( Glow, {} )
				local AllyFlagFrame2 = function ( AllyFlag, event )
					if not event.interrupted then
						AllyFlag:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					AllyFlag:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AllyFlag, event )
					else
						AllyFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AllyFlag:completeAnimation()
				self.AllyFlag:setAlpha( 0 )
				AllyFlagFrame2( AllyFlag, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
			end,
			ShowAxisFlag = function ()
				self:setupElementClipCounter( 3 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											if not event.interrupted then
												Glow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
											end
											Glow:setLeftRight( true, false, -4.5, 96.5 )
											Glow:setTopBottom( true, false, -41, 123 )
											Glow:setRGB( 0.06, 0, 0.13 )
											Glow:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Glow, event )
											else
												Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										Glow:setLeftRight( true, false, -4.5, 96.5 )
										Glow:setTopBottom( true, false, -41, 123 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, -15, 101 )
									Glow:setTopBottom( true, false, -51.5, 127.5 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, -10.13, 98.56 )
								Glow:setTopBottom( true, false, -32, 110.44 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -8.63, 97.81 )
							Glow:setTopBottom( true, false, -31.04, 112.63 )
							Glow:setRGB( 0.06, 0, 0.13 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( true, false, -7, 97 )
						Glow:setTopBottom( true, false, -30, 115 )
						Glow:setRGB( 1, 1, 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4, 96 )
				self.Glow:setTopBottom( true, false, 46, 46 )
				self.Glow:setRGB( 0, 0, 0 )
				self.Glow:setAlpha( 1 )
				GlowFrame2( Glow, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						Glow0:setRGB( 0.06, 0, 0.13 )
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setRGB( 0.06, 0, 0.13 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local AxisFlagFrame2 = function ( AxisFlag, event )
					if not event.interrupted then
						AxisFlag:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AxisFlag:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AxisFlag, event )
					else
						AxisFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 0 )
				AxisFlagFrame2( AxisFlag, {} )
			end
		},
		ShowAllyFlagDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							if not event.interrupted then
								Glow00:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Linear )
							end
							Glow00:setLeftRight( true, false, -100.82, 0 )
							Glow00:setTopBottom( true, false, -45, 123 )
							Glow00:setRGB( 0.07, 0.27, 0.31 )
							Glow00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow00, event )
							else
								Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 289, true, true, CoD.TweenType.Linear )
							Glow00:setAlpha( 1 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Glow00:setAlpha( 0.01 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -100.82, 0 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.Glow00:setRGB( 0.07, 0.27, 0.31 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 689, true, true, CoD.TweenType.Linear )
						end
						Glow:setLeftRight( true, false, -79.44, -14.44 )
						Glow:setTopBottom( true, false, -16.25, 96.75 )
						Glow:setRGB( 1, 1, 1 )
						Glow:setAlpha( 0 )
						Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
						Glow:setAlpha( 0.63 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -79.44, -14.44 )
				self.Glow:setTopBottom( true, false, -16.25, 96.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, -71.94, -25.94 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 1 )
				self.clipFinished( AllyFlag, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 689, true, true, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( true, false, -100.82, 0 )
						Glow0:setTopBottom( true, false, -45, 123 )
						Glow0:setRGB( 0.07, 0.27, 0.31 )
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -100.82, 0 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.Glow0:setRGB( 0.07, 0.27, 0.31 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
				self.nextClip = "DefaultClip"
			end,
			Hide = function ()
				self:setupElementClipCounter( 4 )
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -100.82, 0 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.clipFinished( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, -99.44, 1.56 )
									Glow:setTopBottom( true, false, 39, 58 )
									Glow:setRGB( 0, 0, 0 )
									Glow:setAlpha( 1 )
									Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow:setRGB( 1, 1, 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:setRGB( 0.18, 0.33, 0.37 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setRGB( 0.07, 0.27, 0.31 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -99.44, 1.56 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				local AllyFlagFrame2 = function ( AllyFlag, event )
					if not event.interrupted then
						AllyFlag:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AllyFlag:setLeftRight( true, false, -71.94, -25.94 )
					AllyFlag:setTopBottom( true, false, 0, 80 )
					AllyFlag:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AllyFlag, event )
					else
						AllyFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, -71.94, -25.94 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 1 )
				AllyFlagFrame2( AllyFlag, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -100.82, 0 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.clipFinished( Glow0, {} )
			end
		},
		ShowAxisFlagDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						if not event.interrupted then
							Glow00:beginAnimation( "keyframe", 430, true, true, CoD.TweenType.Linear )
						end
						Glow00:setLeftRight( true, false, -100.82, 0 )
						Glow00:setTopBottom( true, false, -48, 120 )
						Glow00:setRGB( 0.54, 0.12, 0.16 )
						Glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow00, event )
						else
							Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow00:setRGB( 0.54, 0.12, 0.16 )
						Glow00:setAlpha( 1 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -100.82, 0 )
				self.Glow00:setTopBottom( true, false, -48, 120 )
				self.Glow00:setRGB( 0.06, 0, 0.13 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 180, true, true, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( true, false, -80.44, -15.44 )
							Glow:setTopBottom( true, false, -19.25, 93.75 )
							Glow:setRGB( 1, 1, 1 )
							Glow:setAlpha( 0 )
							Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 519, true, true, CoD.TweenType.Linear )
							Glow:setAlpha( 0 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -80.44, -15.44 )
				self.Glow:setTopBottom( true, false, -19.25, 93.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 0 )
				self.clipFinished( AllyFlag, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 519, true, true, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( true, false, -100.82, 0 )
						Glow0:setTopBottom( true, false, -55, 113 )
						Glow0:setRGB( 0.54, 0.12, 0.16 )
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.8 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -100.82, 0 )
				self.Glow0:setTopBottom( true, false, -55, 113 )
				self.Glow0:setRGB( 0.54, 0.12, 0.16 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, -71.94, -25.94 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 1 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
				self.nextClip = "DefaultClip"
			end,
			Hide = function ()
				self:setupElementClipCounter( 4 )
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -100.82, 0 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.clipFinished( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, -99.44, 1.56 )
									Glow:setTopBottom( true, false, 39, 61.5 )
									Glow:setRGB( 0, 0, 0 )
									Glow:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow:setRGB( 1, 1, 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setRGB( 0.06, 0, 0.13 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -99.44, 1.56 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -100.82, 0 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.clipFinished( Glow0, {} )
				local AxisFlagFrame2 = function ( AxisFlag, event )
					if not event.interrupted then
						AxisFlag:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
					end
					AxisFlag:setLeftRight( true, false, -73.94, -21.94 )
					AxisFlag:setTopBottom( true, false, 0, 80.5 )
					AxisFlag:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AxisFlag, event )
					else
						AxisFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, -73.94, -21.94 )
				self.AxisFlag:setTopBottom( true, false, 0, 80.5 )
				self.AxisFlag:setAlpha( 1 )
				AxisFlagFrame2( AxisFlag, {} )
			end
		},
		ShowAllyFlag = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							if not event.interrupted then
								Glow00:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Linear )
							end
							Glow00:setLeftRight( true, false, -5.88, 94.94 )
							Glow00:setTopBottom( true, false, -45, 123 )
							Glow00:setRGB( 0.07, 0.27, 0.31 )
							Glow00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow00, event )
							else
								Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 289, true, true, CoD.TweenType.Linear )
							Glow00:setAlpha( 1 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Glow00:setAlpha( 0.01 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.Glow00:setRGB( 0.07, 0.27, 0.31 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 689, true, true, CoD.TweenType.Linear )
						end
						Glow:setLeftRight( true, false, 15.5, 80.5 )
						Glow:setTopBottom( true, false, -16.25, 96.75 )
						Glow:setRGB( 1, 1, 1 )
						Glow:setAlpha( 0 )
						Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
						Glow:setAlpha( 0.63 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 15.5, 80.5 )
				self.Glow:setTopBottom( true, false, -16.25, 96.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				local AllyFlagFrame2 = function ( AllyFlag, event )
					local AllyFlagFrame3 = function ( AllyFlag, event )
						if not event.interrupted then
							AllyFlag:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Linear )
						end
						AllyFlag:setLeftRight( true, false, 23, 69 )
						AllyFlag:setTopBottom( true, false, 0, 80 )
						AllyFlag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AllyFlag, event )
						else
							AllyFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AllyFlagFrame3( AllyFlag, event )
						return 
					else
						AllyFlag:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
						AllyFlag:setLeftRight( true, false, 21, 72 )
						AllyFlag:setTopBottom( true, false, 0, 87 )
						AllyFlag:registerEventHandler( "transition_complete_keyframe", AllyFlagFrame3 )
					end
				end
				
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 1 )
				AllyFlagFrame2( AllyFlag, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 689, true, true, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( true, false, -5.88, 94.94 )
						Glow0:setTopBottom( true, false, -45, 123 )
						Glow0:setRGB( 0.07, 0.27, 0.31 )
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.Glow0:setRGB( 0.07, 0.27, 0.31 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
				self.nextClip = "DefaultClip"
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, -4, 96 )
									Glow:setTopBottom( true, false, 46.5, 46.5 )
									Glow:setRGB( 0, 0, 0 )
									Glow:setAlpha( 1 )
									Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, -7, 97 )
									Glow:setTopBottom( true, false, -19.5, 99.5 )
									Glow:setRGB( 1, 1, 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, -7.17, 97.09 )
								Glow:setTopBottom( true, false, -20.2, 100.11 )
								Glow:setRGB( 0.18, 0.33, 0.37 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -15, 101 )
							Glow:setTopBottom( true, false, -51.5, 127.5 )
							Glow:setRGB( 0.07, 0.27, 0.31 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4.5, 96.5 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				local AllyFlagFrame2 = function ( AllyFlag, event )
					if not event.interrupted then
						AllyFlag:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AllyFlag:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AllyFlag, event )
					else
						AllyFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AllyFlag:completeAnimation()
				self.AllyFlag:setAlpha( 1 )
				AllyFlagFrame2( AllyFlag, {} )
			end
		},
		ShowAxisFlag = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						if not event.interrupted then
							Glow00:beginAnimation( "keyframe", 430, true, true, CoD.TweenType.Linear )
						end
						Glow00:setLeftRight( true, false, -5.88, 94.94 )
						Glow00:setTopBottom( true, false, -53, 115 )
						Glow00:setRGB( 0.54, 0.12, 0.16 )
						Glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow00, event )
						else
							Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow00:setTopBottom( true, false, -53, 115 )
						Glow00:setRGB( 0.54, 0.12, 0.16 )
						Glow00:setAlpha( 1 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow00:setTopBottom( true, false, -48, 120 )
				self.Glow00:setRGB( 0.06, 0, 0.13 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 180, true, true, CoD.TweenType.Linear )
							end
							Glow:setLeftRight( true, false, 12.5, 77.5 )
							Glow:setTopBottom( true, false, -18.25, 94.75 )
							Glow:setRGB( 1, 1, 1 )
							Glow:setAlpha( 0 )
							Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 519, true, true, CoD.TweenType.Linear )
							Glow:setAlpha( 0 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow:setLeftRight( true, false, 12.5, 77.5 )
						Glow:setTopBottom( true, false, -18.25, 94.75 )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 14.5, 79.5 )
				self.Glow:setTopBottom( true, false, -19.25, 93.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowFrame2( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 0 )
				self.clipFinished( AllyFlag, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 519, true, true, CoD.TweenType.Linear )
						end
						Glow0:setLeftRight( true, false, -14.88, 104.94 )
						Glow0:setTopBottom( true, false, -73, 137 )
						Glow0:setRGB( 0.54, 0.12, 0.16 )
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Glow0:setLeftRight( true, false, -14.88, 104.94 )
						Glow0:setTopBottom( true, false, -73, 137 )
						Glow0:setAlpha( 0.8 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow0:setTopBottom( true, false, -55, 113 )
				self.Glow0:setRGB( 0.54, 0.12, 0.16 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local AxisFlagFrame2 = function ( AxisFlag, event )
					local AxisFlagFrame3 = function ( AxisFlag, event )
						if not event.interrupted then
							AxisFlag:beginAnimation( "keyframe", 430, true, true, CoD.TweenType.Linear )
						end
						AxisFlag:setLeftRight( true, false, 23, 69 )
						AxisFlag:setTopBottom( true, false, 0, 80 )
						AxisFlag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AxisFlag, event )
						else
							AxisFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AxisFlagFrame3( AxisFlag, event )
						return 
					else
						AxisFlag:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						AxisFlag:setLeftRight( true, false, 21, 72 )
						AxisFlag:setTopBottom( true, false, 0, 87 )
						AxisFlag:registerEventHandler( "transition_complete_keyframe", AxisFlagFrame3 )
					end
				end
				
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 1 )
				AxisFlagFrame2( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
				self.nextClip = "DefaultClip"
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, -4, 96 )
									Glow:setTopBottom( true, false, 46.5, 46.5 )
									Glow:setRGB( 0, 0, 0 )
									Glow:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, -7, 97 )
									Glow:setTopBottom( true, false, -19.5, 99.5 )
									Glow:setRGB( 1, 1, 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, -7.17, 97.09 )
								Glow:setTopBottom( true, false, -20.2, 100.11 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -15, 101 )
							Glow:setTopBottom( true, false, -51.5, 127.5 )
							Glow:setRGB( 0.06, 0, 0.13 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4.5, 96.5 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local AxisFlagFrame2 = function ( AxisFlag, event )
					if not event.interrupted then
						AxisFlag:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
					end
					AxisFlag:setLeftRight( true, false, 21, 73 )
					AxisFlag:setTopBottom( true, false, 0, 80.5 )
					AxisFlag:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AxisFlag, event )
					else
						AxisFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 21, 73 )
				self.AxisFlag:setTopBottom( true, false, 0, 80.5 )
				self.AxisFlag:setAlpha( 1 )
				AxisFlagFrame2( AxisFlag, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.Glow00:setRGB( 0.07, 0.27, 0.31 )
				self.Glow00:setAlpha( 0 )
				self.clipFinished( Glow00, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -8.5, 100.5 )
				self.Glow:setTopBottom( true, false, -16.25, 96.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 0 )
				self.clipFinished( AllyFlag, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.Glow0:setRGB( 0.07, 0.27, 0.31 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, -71, -1 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 26.5, 96.5 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, -71, -1 )
				self.AmmoWidgetBall:setTopBottom( true, false, 26.5, 96.5 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -72, 4 )
				self.CleanCarryCount:setTopBottom( true, false, 13.13, 109.88 )
				self.clipFinished( CleanCarryCount, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow00:setTopBottom( true, false, -45, 123 )
				self.Glow00:setRGB( 0.07, 0.27, 0.31 )
				self.Glow00:setAlpha( 0 )
				self.clipFinished( Glow00, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -8.5, 100.5 )
				self.Glow:setTopBottom( true, false, -16.25, 96.75 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				self.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( Glow, {} )
				AllyFlag:completeAnimation()
				self.AllyFlag:setLeftRight( true, false, 23, 69 )
				self.AllyFlag:setTopBottom( true, false, 0, 80 )
				self.AllyFlag:setAlpha( 0 )
				self.clipFinished( AllyFlag, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -5.88, 94.94 )
				self.Glow0:setTopBottom( true, false, -45, 123 )
				self.Glow0:setRGB( 0.07, 0.27, 0.31 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setLeftRight( true, false, 23, 69 )
				self.AxisFlag:setTopBottom( true, false, 0, 80 )
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
				AmmoWidgetSDBomb:completeAnimation()
				self.AmmoWidgetSDBomb:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetSDBomb:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetSDBomb, {} )
				AmmoWidgetBall:completeAnimation()
				self.AmmoWidgetBall:setLeftRight( true, false, 10, 80 )
				self.AmmoWidgetBall:setTopBottom( true, false, 25, 95 )
				self.clipFinished( AmmoWidgetBall, {} )
				CleanCarryCount:completeAnimation()
				self.CleanCarryCount:setLeftRight( true, false, -5, 71 )
				self.CleanCarryCount:setTopBottom( true, false, 11.63, 108.38 )
				self.clipFinished( CleanCarryCount, {} )
			end,
			ShowAllyFlag = function ()
				self:setupElementClipCounter( 2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, 44.53, 44.53 )
									Glow:setTopBottom( true, false, -10.9, 117.55 )
									Glow:setRGB( 0.18, 0.33, 0.36 )
									Glow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, 25.4, 66.6 )
									Glow:setTopBottom( true, false, -10.9, 117.55 )
									Glow:setRGB( 0.18, 0.33, 0.36 )
									Glow:setAlpha( 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, 22.1, 69.41 )
								Glow:setTopBottom( true, false, -14.21, 118.36 )
								Glow:setRGB( 0.18, 0.33, 0.37 )
								Glow:setAlpha( 0.05 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -15, 101 )
							Glow:setTopBottom( true, false, -51.5, 127.5 )
							Glow:setRGB( 0.07, 0.27, 0.31 )
							Glow:setAlpha( 0.59 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4.5, 96.5 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local f128_local1 = function ( f134_arg0, f134_arg1 )
					if not f134_arg1.interrupted then
						f134_arg0:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
					end
					f134_arg0:setAlpha( 0 )
					if f134_arg1.interrupted then
						self.clipFinished( f134_arg0, f134_arg1 )
					else
						f134_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AllyFlag:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				AllyFlag:setAlpha( 1 )
				AllyFlag:registerEventHandler( "transition_complete_keyframe", f128_local1 )
			end,
			ShowAxisFlag = function ()
				self:setupElementClipCounter( 2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, 44.53, 44.53 )
									Glow:setTopBottom( true, false, -10.9, 117.55 )
									Glow:setRGB( 0.06, 0, 0.13 )
									Glow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, 25.4, 66.6 )
									Glow:setTopBottom( true, false, -10.9, 117.55 )
									Glow:setAlpha( 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, 23.68, 68.06 )
								Glow:setTopBottom( true, false, -12.63, 117.97 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, -15, 101 )
							Glow:setTopBottom( true, false, -51.5, 127.5 )
							Glow:setRGB( 0.06, 0, 0.13 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -4.5, 96.5 )
				self.Glow:setTopBottom( true, false, -41, 123 )
				self.Glow:setRGB( 1, 1, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local f135_local1 = function ( f141_arg0, f141_arg1 )
					if not f141_arg1.interrupted then
						f141_arg0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
					end
					f141_arg0:setAlpha( 0 )
					if f141_arg1.interrupted then
						self.clipFinished( f141_arg0, f141_arg1 )
					else
						f141_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AxisFlag:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
				AxisFlag:setAlpha( 1 )
				AxisFlag:registerEventHandler( "transition_complete_keyframe", f135_local1 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowAllyFlagDual",
			condition = function ( menu, element, event )
				local f142_local0 = AmICarryingEnemyFlag( controller )
				if f142_local0 then
					f142_local0 = IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" )
					if f142_local0 then
						f142_local0 = IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
					end
				end
				return f142_local0
			end
		},
		{
			stateName = "ShowAxisFlagDual",
			condition = function ( menu, element, event )
				local f143_local0 = AmICarryingEnemyFlag( controller )
				if f143_local0 then
					f143_local0 = IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" )
					if f143_local0 then
						f143_local0 = IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
					end
				end
				return f143_local0
			end
		},
		{
			stateName = "ShowAllyFlag",
			condition = function ( menu, element, event )
				return AmICarryingEnemyFlag( controller ) and IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" )
			end
		},
		{
			stateName = "ShowAxisFlag",
			condition = function ( menu, element, event )
				return AmICarryingEnemyFlag( controller ) and IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" )
			end
		},
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.enemyFlagCarrier"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.friendlyFlagCarrier" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.friendlyFlagCarrier"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.playerFactionName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.playerFactionName"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AllyFlag:close()
		element.AxisFlag:close()
		element.AmmoWidgetSDBomb:close()
		element.AmmoWidgetBall:close()
		element.CleanCarryCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

