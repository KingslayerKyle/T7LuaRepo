-- b310215d0d6da3dcebe470becfaf8a18
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Meter = LUI.UIImage.new()
	Meter:setLeftRight( true, false, 0, 180 )
	Meter:setTopBottom( true, false, 0, 32 )
	Meter:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterfill" ) )
	Meter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Meter:setShaderVector( 0, 0.65, 0, 0, 0 )
	Meter:setShaderVector( 1, 0, 0, 0, 0 )
	Meter:setShaderVector( 2, 1, 0, 0, 0 )
	Meter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Meter )
	self.Meter = Meter
	
	local Meter2XP = LUI.UIImage.new()
	Meter2XP:setLeftRight( true, false, 0, 180 )
	Meter2XP:setTopBottom( true, false, 0, 32 )
	Meter2XP:setAlpha( 0 )
	Meter2XP:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterfill_2xp" ) )
	Meter2XP:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Meter2XP:setShaderVector( 0, 0.65, 0, 0, 0 )
	Meter2XP:setShaderVector( 1, 0, 0, 0, 0 )
	Meter2XP:setShaderVector( 2, 1, 0, 0, 0 )
	Meter2XP:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( Meter2XP )
	self.Meter2XP = Meter2XP
	
	local middleBar = LUI.UIImage.new()
	middleBar:setLeftRight( true, false, -3.31, 180 )
	middleBar:setTopBottom( true, false, 16, 17 )
	middleBar:setRGB( 0, 0, 0 )
	middleBar:setAlpha( 0.5 )
	self:addElement( middleBar )
	self.middleBar = middleBar
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, false, -117, 0 )
	glow:setTopBottom( true, false, 0, 32 )
	glow:setRGB( 0.42, 0.05, 1 )
	glow:setAlpha( 0 )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
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
						glow:setLeftRight( true, false, 180, 297 )
						glow:setTopBottom( true, false, 0, 32 )
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
						glow:setLeftRight( true, false, 180, 297 )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setLeftRight( true, false, -117, 0 )
				self.glow:setTopBottom( true, false, -5, 37 )
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

