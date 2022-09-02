-- 91c72d6a49bfb5fdef4dc5fd4c90d55b
-- This hash is used for caching, delete to decompile the file again

CoD.WearableBenefitsWidget = InheritFrom( LUI.UIElement )
CoD.WearableBenefitsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WearableBenefitsWidget )
	self.id = "WearableBenefitsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 654 )
	self:setTopBottom( true, false, 0, 25 )
	
	local wearableBenefits = LUI.UIText.new()
	wearableBenefits:setLeftRight( false, false, -327, 327 )
	wearableBenefits:setTopBottom( true, false, 0, 25 )
	wearableBenefits:setText( "" )
	wearableBenefits:setTTF( "fonts/default.ttf" )
	wearableBenefits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	wearableBenefits:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( wearableBenefits )
	self.wearableBenefits = wearableBenefits
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				wearableBenefits:completeAnimation()
				self.wearableBenefits:setAlpha( 0 )
				self.clipFinished( wearableBenefits, {} )
			end,
			ShowEffects = function ()
				self:setupElementClipCounter( 1 )

				local wearableBenefitsFrame2 = function ( wearableBenefits, event )
					local wearableBenefitsFrame3 = function ( wearableBenefits, event )
						local wearableBenefitsFrame4 = function ( wearableBenefits, event )
							if not event.interrupted then
								wearableBenefits:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							wearableBenefits:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( wearableBenefits, event )
							else
								wearableBenefits:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							wearableBenefitsFrame4( wearableBenefits, event )
							return 
						else
							wearableBenefits:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
							wearableBenefits:registerEventHandler( "transition_complete_keyframe", wearableBenefitsFrame4 )
						end
					end
					
					if event.interrupted then
						wearableBenefitsFrame3( wearableBenefits, event )
						return 
					else
						wearableBenefits:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						wearableBenefits:setAlpha( 1 )
						wearableBenefits:registerEventHandler( "transition_complete_keyframe", wearableBenefitsFrame3 )
					end
				end
				
				wearableBenefits:completeAnimation()
				self.wearableBenefits:setAlpha( 0 )
				wearableBenefitsFrame2( wearableBenefits, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				wearableBenefits:completeAnimation()
				self.wearableBenefits:setAlpha( 0 )
				self.clipFinished( wearableBenefits, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f8_local0 then
					f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f8_local0 then
						if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
							f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
						else
							f8_local0 = true
						end
					end
				end
				return f8_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
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
	self:subscribeToGlobalModel( controller, "PerController", "PlayerList.0.zombieWearableIcon", function ( model )
		local f13_local0 = self
		if not IsModelValueEqualTo( controller, "PlayerList.0.zombieWearableIcon", "blacktransparent" ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
			PlayClip( self, "ShowEffects", controller )
		end
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

