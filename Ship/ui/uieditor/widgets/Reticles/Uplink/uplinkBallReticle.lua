-- 8d6cd9a78685d71ed12e551f3cf4d708
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.uplink.uplink_IconandTextArmorbg" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Reticles.Uplink.uplinkReticle" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
	DataSources.ReticleBindings.createModelsForActions( controller, {
		"speed_throw",
		"attack"
	} )
end

CoD.uplinkBallReticle = InheritFrom( LUI.UIElement )
CoD.uplinkBallReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.uplinkBallReticle )
	self.id = "uplinkBallReticle"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( false, false, -136.59, 146 )
	BlackFrame:setTopBottom( false, false, 174.63, 191.63 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0.3 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local BallArmorWidget = CoD.uplink_IconandTextArmorbg.new( menu, controller )
	BallArmorWidget:setLeftRight( false, false, -15.79, 25.21 )
	BallArmorWidget:setTopBottom( false, false, 191.8, 211.8 )
	BallArmorWidget.armorLabel:setText( Engine.Localize( "MP_HUD_UPLINK_ARMOR" ) )
	self:addElement( BallArmorWidget )
	self.BallArmorWidget = BallArmorWidget
	
	local armorBorder = CoD.Border.new( menu, controller )
	armorBorder:setLeftRight( false, false, -91, 90 )
	armorBorder:setTopBottom( false, false, 181.75, 185.25 )
	armorBorder:setAlpha( 0.4 )
	self:addElement( armorBorder )
	self.armorBorder = armorBorder
	
	local armorFill = LUI.UIImage.new()
	armorFill:setLeftRight( false, false, -90, 89 )
	armorFill:setTopBottom( false, false, 183, 184 )
	armorFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	armorFill:setShaderVector( 1, 0, 0, 0, 0 )
	armorFill:setShaderVector( 2, 1, 0, 0, 0 )
	armorFill:setShaderVector( 3, 0, 0, 0, 0 )
	armorFill:subscribeToGlobalModel( controller, "HUDItems", "armorPercent", function ( model )
		local armorPercent = Engine.GetModelValue( model )
		if armorPercent then
			armorFill:setShaderVector( 0, CoD.GetVectorComponentFromString( armorPercent, 1 ), CoD.GetVectorComponentFromString( armorPercent, 2 ), CoD.GetVectorComponentFromString( armorPercent, 3 ), CoD.GetVectorComponentFromString( armorPercent, 4 ) )
		end
	end )
	self:addElement( armorFill )
	self.armorFill = armorFill
	
	local passIcon = LUI.UIImage.new()
	passIcon:setLeftRight( false, false, -203.25, -169 )
	passIcon:setTopBottom( false, false, 168, 201.75 )
	passIcon:subscribeToGlobalModel( controller, "ReticleBindings", "speed_throw", function ( model )
		local speedThrow = Engine.GetModelValue( model )
		if speedThrow then
			passIcon:setImage( RegisterImage( speedThrow ) )
		end
	end )
	self:addElement( passIcon )
	self.passIcon = passIcon
	
	local throwIcon = LUI.UIImage.new()
	throwIcon:setLeftRight( false, false, 168.25, 202.5 )
	throwIcon:setTopBottom( false, false, 168, 202.13 )
	throwIcon:subscribeToGlobalModel( controller, "ReticleBindings", "attack", function ( model )
		local attack = Engine.GetModelValue( model )
		if attack then
			throwIcon:setImage( RegisterImage( attack ) )
		end
	end )
	self:addElement( throwIcon )
	self.throwIcon = throwIcon
	
	local uplinkReticle = CoD.uplinkReticle.new( menu, controller )
	uplinkReticle:setLeftRight( false, false, -65.18, 65.18 )
	uplinkReticle:setTopBottom( false, false, -65.18, 65.18 )
	self:addElement( uplinkReticle )
	self.uplinkReticle = uplinkReticle
	
	local KeyMouseThrow = LUI.UIText.new()
	KeyMouseThrow:setLeftRight( false, false, -296.57, -96.57 )
	KeyMouseThrow:setTopBottom( false, false, 172.63, 192.63 )
	KeyMouseThrow:setText( Engine.Localize( "PLATFORM_BALL_THROW" ) )
	KeyMouseThrow:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	KeyMouseThrow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	KeyMouseThrow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KeyMouseThrow )
	self.KeyMouseThrow = KeyMouseThrow
	
	local KeyMousePass = LUI.UIText.new()
	KeyMousePass:setLeftRight( false, false, 94.43, 294.43 )
	KeyMousePass:setTopBottom( false, false, 172.63, 192.63 )
	KeyMousePass:setText( Engine.Localize( "PLATFORM_BALL_PASS" ) )
	KeyMousePass:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	KeyMousePass:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	KeyMousePass:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KeyMousePass )
	self.KeyMousePass = KeyMousePass
	
	local Trow = LUI.UIText.new()
	Trow:setLeftRight( true, false, 737.96, 807.71 )
	Trow:setTopBottom( true, false, 533, 553.06 )
	Trow:setText( Engine.Localize( "MP_HUD_UPLINK_THROW" ) )
	Trow:setTTF( "fonts/default.ttf" )
	Trow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Trow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Trow )
	self.Trow = Trow
	
	local Pass = LUI.UIText.new()
	Pass:setLeftRight( true, false, 474, 543 )
	Pass:setTopBottom( true, false, 533, 553 )
	Pass:setText( Engine.Localize( "MP_HUD_UPLINK_PASS" ) )
	Pass:setTTF( "fonts/default.ttf" )
	Pass:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Pass:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Pass )
	self.Pass = Pass
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local BlackFrameFrame2 = function ( BlackFrame, event )
					local BlackFrameFrame3 = function ( BlackFrame, event )
						if not event.interrupted then
							BlackFrame:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						BlackFrame:setLeftRight( false, false, -114.27, 114.33 )
						BlackFrame:setTopBottom( false, false, 174.63, 191.63 )
						BlackFrame:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( BlackFrame, event )
						else
							BlackFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackFrameFrame3( BlackFrame, event )
						return 
					else
						BlackFrame:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						BlackFrame:registerEventHandler( "transition_complete_keyframe", BlackFrameFrame3 )
					end
				end
				
				BlackFrame:completeAnimation()
				self.BlackFrame:setLeftRight( false, false, -162.27, 165.33 )
				self.BlackFrame:setTopBottom( false, false, 174.63, 191.63 )
				self.BlackFrame:setAlpha( 0.3 )
				BlackFrameFrame2( BlackFrame, {} )

				BallArmorWidget:completeAnimation()

				BallArmorWidget.armorLabel:completeAnimation()
				self.BallArmorWidget:setAlpha( 1 )
				self.BallArmorWidget.armorLabel:setText( Engine.Localize( "MP_HUD_UPLINK_ARMOR" ) )
				self.clipFinished( BallArmorWidget, {} )

				armorBorder:completeAnimation()
				self.armorBorder:setAlpha( 0.4 )
				self.clipFinished( armorBorder, {} )

				armorFill:completeAnimation()
				self.armorFill:setAlpha( 1 )
				self.clipFinished( armorFill, {} )
				local passIconFrame2 = function ( passIcon, event )
					local passIconFrame3 = function ( passIcon, event )
						if not event.interrupted then
							passIcon:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						passIcon:setLeftRight( false, false, -192.25, -158 )
						passIcon:setTopBottom( false, false, 168, 201.75 )
						passIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( passIcon, event )
						else
							passIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						passIconFrame3( passIcon, event )
						return 
					else
						passIcon:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						passIcon:registerEventHandler( "transition_complete_keyframe", passIconFrame3 )
					end
				end
				
				passIcon:completeAnimation()
				self.passIcon:setLeftRight( false, false, -192.25, -158 )
				self.passIcon:setTopBottom( false, false, 168, 201.75 )
				self.passIcon:setAlpha( 1 )
				passIconFrame2( passIcon, {} )
				local throwIconFrame2 = function ( throwIcon, event )
					local throwIconFrame3 = function ( throwIcon, event )
						if not event.interrupted then
							throwIcon:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						throwIcon:setLeftRight( false, false, 160.25, 194.5 )
						throwIcon:setTopBottom( false, false, 168, 202.13 )
						throwIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( throwIcon, event )
						else
							throwIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						throwIconFrame3( throwIcon, event )
						return 
					else
						throwIcon:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						throwIcon:registerEventHandler( "transition_complete_keyframe", throwIconFrame3 )
					end
				end
				
				throwIcon:completeAnimation()
				self.throwIcon:setLeftRight( false, false, 160.25, 194.5 )
				self.throwIcon:setTopBottom( false, false, 168, 202.13 )
				self.throwIcon:setAlpha( 1 )
				throwIconFrame2( throwIcon, {} )

				uplinkReticle:completeAnimation()
				self.uplinkReticle:setAlpha( 1 )
				self.clipFinished( uplinkReticle, {} )

				KeyMouseThrow:completeAnimation()
				self.KeyMouseThrow:setAlpha( 0 )
				self.clipFinished( KeyMouseThrow, {} )

				KeyMousePass:completeAnimation()
				self.KeyMousePass:setAlpha( 0 )
				self.clipFinished( KeyMousePass, {} )
				local TrowFrame2 = function ( Trow, event )
					local TrowFrame3 = function ( Trow, event )
						if not event.interrupted then
							Trow:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						Trow:setLeftRight( true, false, 726.96, 796.71 )
						Trow:setTopBottom( true, false, 533, 553.06 )
						Trow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Trow, event )
						else
							Trow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TrowFrame3( Trow, event )
						return 
					else
						Trow:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Trow:registerEventHandler( "transition_complete_keyframe", TrowFrame3 )
					end
				end
				
				Trow:completeAnimation()
				self.Trow:setLeftRight( true, false, 726.96, 796.71 )
				self.Trow:setTopBottom( true, false, 533, 553.06 )
				self.Trow:setAlpha( 1 )
				TrowFrame2( Trow, {} )
				local PassFrame2 = function ( Pass, event )
					local PassFrame3 = function ( Pass, event )
						if not event.interrupted then
							Pass:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						Pass:setLeftRight( true, false, 486, 555 )
						Pass:setTopBottom( true, false, 533, 553 )
						Pass:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Pass, event )
						else
							Pass:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PassFrame3( Pass, event )
						return 
					else
						Pass:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Pass:registerEventHandler( "transition_complete_keyframe", PassFrame3 )
					end
				end
				
				Pass:completeAnimation()
				self.Pass:setLeftRight( true, false, 486, 555 )
				self.Pass:setTopBottom( true, false, 533, 553 )
				self.Pass:setAlpha( 1 )
				PassFrame2( Pass, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				BlackFrame:completeAnimation()
				self.BlackFrame:setAlpha( 0 )
				self.clipFinished( BlackFrame, {} )

				BallArmorWidget:completeAnimation()
				self.BallArmorWidget:setAlpha( 0 )
				self.clipFinished( BallArmorWidget, {} )

				armorBorder:completeAnimation()
				self.armorBorder:setAlpha( 0 )
				self.clipFinished( armorBorder, {} )

				armorFill:completeAnimation()
				self.armorFill:setAlpha( 0 )
				self.clipFinished( armorFill, {} )

				passIcon:completeAnimation()
				self.passIcon:setAlpha( 0 )
				self.clipFinished( passIcon, {} )

				throwIcon:completeAnimation()
				self.throwIcon:setAlpha( 0 )
				self.clipFinished( throwIcon, {} )

				uplinkReticle:completeAnimation()
				self.uplinkReticle:setAlpha( 0 )
				self.clipFinished( uplinkReticle, {} )

				KeyMouseThrow:completeAnimation()
				self.KeyMouseThrow:setAlpha( 0 )
				self.clipFinished( KeyMouseThrow, {} )

				KeyMousePass:completeAnimation()
				self.KeyMousePass:setAlpha( 0 )
				self.clipFinished( KeyMousePass, {} )

				Trow:completeAnimation()
				self.Trow:setAlpha( 0 )
				self.clipFinished( Trow, {} )

				Pass:completeAnimation()
				self.Pass:setAlpha( 0 )
				self.clipFinished( Pass, {} )
			end
		},
		HiddenOffhand = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				BlackFrame:completeAnimation()
				self.BlackFrame:setAlpha( 0 )
				self.clipFinished( BlackFrame, {} )

				armorBorder:completeAnimation()
				self.armorBorder:setAlpha( 0 )
				self.clipFinished( armorBorder, {} )

				armorFill:completeAnimation()
				self.armorFill:setAlpha( 0 )
				self.clipFinished( armorFill, {} )

				passIcon:completeAnimation()
				self.passIcon:setAlpha( 0 )
				self.clipFinished( passIcon, {} )

				throwIcon:completeAnimation()
				self.throwIcon:setAlpha( 0 )
				self.clipFinished( throwIcon, {} )

				uplinkReticle:completeAnimation()
				self.uplinkReticle:setAlpha( 0 )
				self.clipFinished( uplinkReticle, {} )

				KeyMouseThrow:completeAnimation()
				self.KeyMouseThrow:setAlpha( 0 )
				self.clipFinished( KeyMouseThrow, {} )

				KeyMousePass:completeAnimation()
				self.KeyMousePass:setAlpha( 0 )
				self.clipFinished( KeyMousePass, {} )

				Trow:completeAnimation()
				self.Trow:setAlpha( 0 )
				self.clipFinished( Trow, {} )

				Pass:completeAnimation()
				self.Pass:setAlpha( 0 )
				self.clipFinished( Pass, {} )
			end
		},
		KeyMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				local BlackFrameFrame2 = function ( BlackFrame, event )
					local BlackFrameFrame3 = function ( BlackFrame, event )
						if not event.interrupted then
							BlackFrame:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						BlackFrame:setLeftRight( false, false, -120, 120 )
						BlackFrame:setTopBottom( false, false, 174.63, 191.63 )
						BlackFrame:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( BlackFrame, event )
						else
							BlackFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackFrameFrame3( BlackFrame, event )
						return 
					else
						BlackFrame:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
						BlackFrame:registerEventHandler( "transition_complete_keyframe", BlackFrameFrame3 )
					end
				end
				
				BlackFrame:completeAnimation()
				self.BlackFrame:setLeftRight( false, false, -180, 180 )
				self.BlackFrame:setTopBottom( false, false, 174.63, 191.63 )
				self.BlackFrame:setAlpha( 0.3 )
				BlackFrameFrame2( BlackFrame, {} )

				BallArmorWidget:completeAnimation()

				BallArmorWidget.armorLabel:completeAnimation()
				self.BallArmorWidget:setAlpha( 1 )
				self.BallArmorWidget.armorLabel:setText( Engine.Localize( "MP_HUD_UPLINK_ARMOR" ) )
				self.clipFinished( BallArmorWidget, {} )

				passIcon:completeAnimation()
				self.passIcon:setAlpha( 0 )
				self.clipFinished( passIcon, {} )

				throwIcon:completeAnimation()
				self.throwIcon:setAlpha( 0 )
				self.clipFinished( throwIcon, {} )
				local KeyMouseThrowFrame2 = function ( KeyMouseThrow, event )
					local KeyMouseThrowFrame3 = function ( KeyMouseThrow, event )
						if not event.interrupted then
							KeyMouseThrow:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						KeyMouseThrow:setLeftRight( false, false, -308.57, -108.57 )
						KeyMouseThrow:setTopBottom( false, false, 172.63, 192.63 )
						KeyMouseThrow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( KeyMouseThrow, event )
						else
							KeyMouseThrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KeyMouseThrowFrame3( KeyMouseThrow, event )
						return 
					else
						KeyMouseThrow:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
						KeyMouseThrow:registerEventHandler( "transition_complete_keyframe", KeyMouseThrowFrame3 )
					end
				end
				
				KeyMouseThrow:completeAnimation()
				self.KeyMouseThrow:setLeftRight( false, false, -308.57, -108.57 )
				self.KeyMouseThrow:setTopBottom( false, false, 172.63, 192.63 )
				self.KeyMouseThrow:setAlpha( 1 )
				KeyMouseThrowFrame2( KeyMouseThrow, {} )
				local KeyMousePassFrame2 = function ( KeyMousePass, event )
					local KeyMousePassFrame3 = function ( KeyMousePass, event )
						if not event.interrupted then
							KeyMousePass:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						KeyMousePass:setLeftRight( false, false, 107.5, 307.5 )
						KeyMousePass:setTopBottom( false, false, 172.63, 192.63 )
						KeyMousePass:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( KeyMousePass, event )
						else
							KeyMousePass:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						KeyMousePassFrame3( KeyMousePass, event )
						return 
					else
						KeyMousePass:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
						KeyMousePass:registerEventHandler( "transition_complete_keyframe", KeyMousePassFrame3 )
					end
				end
				
				KeyMousePass:completeAnimation()
				self.KeyMousePass:setLeftRight( false, false, 107.5, 307.5 )
				self.KeyMousePass:setTopBottom( false, false, 172.63, 192.63 )
				self.KeyMousePass:setAlpha( 1 )
				KeyMousePassFrame2( KeyMousePass, {} )

				Trow:completeAnimation()
				self.Trow:setAlpha( 0 )
				self.clipFinished( Trow, {} )

				Pass:completeAnimation()
				self.Pass:setAlpha( 0 )
				self.clipFinished( Pass, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD )
				if not f26_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_RETICLE ) then
						f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f26_local0 then
							f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
							if not f26_local0 then
								if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
									f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
									if not f26_local0 then
										f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE )
										if not f26_local0 then
											f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
											if not f26_local0 then
												f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON )
												if not f26_local0 then
													f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_PLAYER_DEAD )
													if not f26_local0 then
														f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
														if not f26_local0 then
															f26_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
														end
													end
												end
											end
										end
									end
								else
									f26_local0 = true
								end
							else
								return f26_local0
							end
						else
							return f26_local0
						end
					end
					f26_local0 = true
				end
				return f26_local0
			end
		},
		{
			stateName = "HiddenOffhand",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.usingOffhand" )
			end
		},
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.usingOffhand" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.usingOffhand"
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f2_local12 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local12( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BallArmorWidget:close()
		element.armorBorder:close()
		element.uplinkReticle:close()
		element.armorFill:close()
		element.passIcon:close()
		element.throwIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
