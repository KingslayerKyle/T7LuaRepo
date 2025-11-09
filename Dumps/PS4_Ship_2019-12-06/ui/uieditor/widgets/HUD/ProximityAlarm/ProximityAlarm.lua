local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "hudItems.proximityAlarm" ) then
		Engine.CreateModel( f1_local0, "hudItems.proximityAlarm" )
	end
end

CoD.ProximityAlarm = InheritFrom( LUI.UIElement )
CoD.ProximityAlarm.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ProximityAlarm )
	self.id = "ProximityAlarm"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 32 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -58.19, -33.81 )
	icon:setTopBottom( false, false, -13, 13 )
	icon:setImage( RegisterImage( "uie_hud_satchelcharge_32" ) )
	icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( icon )
	self.icon = icon
	
	local text = LUI.UITightText.new()
	text:setLeftRight( false, false, -19.81, 49.19 )
	text:setTopBottom( false, false, -10, 10 )
	text:setText( Engine.Localize( "WEAPON_C4_ARMED" ) )
	text:setTTF( "fonts/escom.ttf" )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setLeftRight( false, false, -70.5, -38.5 )
				self.icon:setTopBottom( false, false, -16, 16 )
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				text:completeAnimation()
				self.text:setLeftRight( false, false, -22.5, 65.5 )
				self.text:setTopBottom( false, false, -12.5, 12.5 )
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		},
		AlarmDeployed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						if not event.interrupted then
							icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						icon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( icon, event )
						else
							icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				iconFrame2( icon, {} )
				local textFrame2 = function ( text, event )
					local textFrame3 = function ( text, event )
						if not event.interrupted then
							text:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						text:setAlpha( 0 )
						text:setText( Engine.Localize( "WEAPON_C4_ARMED" ) )
						if event.interrupted then
							self.clipFinished( text, event )
						else
							text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textFrame3( text, event )
						return 
					else
						text:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						text:registerEventHandler( "transition_complete_keyframe", textFrame3 )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "WEAPON_C4_ARMED" ) )
				textFrame2( text, {} )
			end
		},
		AlarmOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local iconFrame2 = function ( icon, event )
					local iconFrame3 = function ( icon, event )
						local iconFrame4 = function ( icon, event )
							if not event.interrupted then
								icon:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							icon:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( icon, event )
							else
								icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							iconFrame4( icon, event )
							return 
						else
							icon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							icon:setAlpha( 0 )
							icon:registerEventHandler( "transition_complete_keyframe", iconFrame4 )
						end
					end
					
					if event.interrupted then
						iconFrame3( icon, event )
						return 
					else
						icon:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						icon:registerEventHandler( "transition_complete_keyframe", iconFrame3 )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				iconFrame2( icon, {} )
				local textFrame2 = function ( text, event )
					local textFrame3 = function ( text, event )
						local textFrame4 = function ( text, event )
							if not event.interrupted then
								text:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							text:setAlpha( 1 )
							text:setText( Engine.Localize( "WEAPON_C4_ALARM" ) )
							if event.interrupted then
								self.clipFinished( text, event )
							else
								text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							textFrame4( text, event )
							return 
						else
							text:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							text:setAlpha( 0 )
							text:registerEventHandler( "transition_complete_keyframe", textFrame4 )
						end
					end
					
					if event.interrupted then
						textFrame3( text, event )
						return 
					else
						text:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						text:registerEventHandler( "transition_complete_keyframe", textFrame3 )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "WEAPON_C4_ALARM" ) )
				textFrame2( text, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AlarmDeployed",
			condition = function ( menu, element, event )
				local f17_local0 = IsModelValueEqualTo( controller, "hudItems.proximityAlarm", 1 )
				if f17_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
						f17_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					else
						f17_local0 = false
					end
				end
				return f17_local0
			end
		},
		{
			stateName = "AlarmOn",
			condition = function ( menu, element, event )
				local f18_local0 = IsModelValueEqualTo( controller, "hudItems.proximityAlarm", 2 )
				if f18_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
						f18_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					else
						f18_local0 = false
					end
				end
				return f18_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.proximityAlarm" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.proximityAlarm"
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

