CoD.cac_WpnLvlMeter = InheritFrom( LUI.UIElement )
CoD.cac_WpnLvlMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_WpnLvlMeter )
	self.id = "cac_WpnLvlMeter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 270 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local Meter = LUI.UIImage.new()
	Meter:setLeftRight( 0, 0, 0, 270 )
	Meter:setTopBottom( 0, 0, 0, 48 )
	Meter:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterfill" ) )
	Meter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Meter:setShaderVector( 0, 0.65, 0, 0, 0 )
	Meter:setShaderVector( 1, 0, 0, 0, 0 )
	Meter:setShaderVector( 2, 1, 0, 0, 0 )
	Meter:setShaderVector( 3, 0, 0, 0, 0 )
	Meter:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Meter )
	self.Meter = Meter
	
	local Meter2XP = LUI.UIImage.new()
	Meter2XP:setLeftRight( 0, 0, 0, 270 )
	Meter2XP:setTopBottom( 0, 0, 0, 48 )
	Meter2XP:setAlpha( 0 )
	Meter2XP:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterfill_2xp" ) )
	Meter2XP:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Meter2XP:setShaderVector( 0, 0.65, 0, 0, 0 )
	Meter2XP:setShaderVector( 1, 0, 0, 0, 0 )
	Meter2XP:setShaderVector( 2, 1, 0, 0, 0 )
	Meter2XP:setShaderVector( 3, 0, 0, 0, 0 )
	Meter2XP:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Meter2XP )
	self.Meter2XP = Meter2XP
	
	local middleBar = LUI.UIImage.new()
	middleBar:setLeftRight( 0, 0, -5, 270 )
	middleBar:setTopBottom( 0, 0, 24, 26 )
	middleBar:setRGB( 0, 0, 0 )
	middleBar:setAlpha( 0.5 )
	self:addElement( middleBar )
	self.middleBar = middleBar
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 0, -176, 0 )
	glow:setTopBottom( 0, 0, 0, 48 )
	glow:setRGB( 0.42, 0.05, 1 )
	glow:setAlpha( 0 )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.resetProperties = function ()
		Meter:completeAnimation()
		Meter2XP:completeAnimation()
		glow:completeAnimation()
		Meter:setAlpha( 1 )
		Meter2XP:setAlpha( 0 )
		glow:setLeftRight( 0, 0, -176, 0 )
		glow:setTopBottom( 0, 0, 0, 48 )
		glow:setAlpha( 0 )
		glow:setXRot( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setAlpha( 0 )
				self.clipFinished( Meter, {} )
				Meter2XP:completeAnimation()
				self.Meter2XP:setAlpha( 1 )
				self.clipFinished( Meter2XP, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 1420, false, false, CoD.TweenType.Linear )
						end
						glow:setLeftRight( 0, 0, 270, 446 )
						glow:setTopBottom( 0, 0, 0, 48 )
						glow:setAlpha( 0.8 )
						glow:setXRot( 0 )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Linear )
						glow:setLeftRight( 0, 0, 270, 446 )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setLeftRight( 0, 0, -176, 0 )
				self.glow:setTopBottom( 0, 0, -7.5, 55.5 )
				self.glow:setAlpha( 0.8 )
				self.glow:setXRot( 0 )
				glowFrame2( glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsDoubleWeaponXP( controller )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

