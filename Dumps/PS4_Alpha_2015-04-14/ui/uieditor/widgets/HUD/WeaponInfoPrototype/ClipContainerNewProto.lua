require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipContainerValueProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipContainerPressProto" )

local PostLoadFunc = function ( self, controller, menu )
	self.ClipContainerPress.previousPulseValue = 0
	self.ClipContainerPress:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoAmmo" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.ClipContainerPress.previousPulseValue == modelValue then
			return 
		else
			self.ClipContainerPress.previousPulseValue = modelValue
			if modelValue == 0 or modelValue == nil then
				return 
			else
				local ClipContainerPressCopy = CoD.ClipContainerPressProto.new( menu, controller )
				ClipContainerPressCopy:setLeftRight( false, false, -31.5, 39.5 )
				ClipContainerPressCopy:setTopBottom( false, true, -42, -2 )
				ClipContainerPressCopy:setRGB( 1, 1, 1 )
				ClipContainerPressCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				ClipContainerPressCopy:setState( "NoAmmoPress" )
				self:addElement( ClipContainerPressCopy )
			end
		end
	end )
end

CoD.ClipContainerNewProto = InheritFrom( LUI.UIElement )
CoD.ClipContainerNewProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipContainerNewProto )
	self.id = "ClipContainerNewProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.ClipContainerValueProto.new( menu, controller )
	Clip:setLeftRight( false, false, -48.5, 59.5 )
	Clip:setTopBottom( false, true, -40, 2 )
	Clip:setRGB( 1, 1, 1 )
	Clip:mergeStateConditions( {
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponHasAmmo( controller )
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	local ClipContainerPress = CoD.ClipContainerPressProto.new( menu, controller )
	ClipContainerPress:setLeftRight( false, false, -31.5, 39.5 )
	ClipContainerPress:setTopBottom( false, true, -42, -2 )
	ClipContainerPress:setRGB( 1, 1, 1 )
	self:addElement( ClipContainerPress )
	self.ClipContainerPress = ClipContainerPress
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 1, 1 )
				self.clipFinished( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							if not event.interrupted then
								Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							Clip:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( Clip, event )
							else
								Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							Clip:setRGB( 1, 1, 1 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 1, 0.25, 0 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0, 0.17 )
				ClipFrame2( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Clip:completeAnimation()
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				self.clipFinished( ClipContainerPress, {} )
			end
		}
	}
	self.close = function ( self )
		self.Clip:close()
		self.ClipContainerPress:close()
		CoD.ClipContainerNewProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

