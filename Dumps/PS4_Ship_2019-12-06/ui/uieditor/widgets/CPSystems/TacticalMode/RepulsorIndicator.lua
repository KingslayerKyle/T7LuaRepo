CoD.RepulsorIndicator = InheritFrom( LUI.UIElement )
CoD.RepulsorIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RepulsorIndicator )
	self.id = "RepulsorIndicator"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 384 )
	
	local IndicatorOn = LUI.UIImage.new()
	IndicatorOn:setLeftRight( true, false, 0, 192 )
	IndicatorOn:setTopBottom( true, false, -136, -40 )
	IndicatorOn:setImage( RegisterImage( "uie_t7_hud_hit_direction_blue_on" ) )
	IndicatorOn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IndicatorOn )
	self.IndicatorOn = IndicatorOn
	
	local IndicatorGlow = LUI.UIImage.new()
	IndicatorGlow:setLeftRight( true, false, 0, 192 )
	IndicatorGlow:setTopBottom( true, false, -136, -40 )
	IndicatorGlow:setImage( RegisterImage( "uie_t7_hud_hit_direction_glow_blue" ) )
	IndicatorGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IndicatorGlow )
	self.IndicatorGlow = IndicatorGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				IndicatorOn:completeAnimation()
				self.IndicatorOn:setAlpha( 0 )
				self.clipFinished( IndicatorOn, {} )
				IndicatorGlow:completeAnimation()
				self.IndicatorGlow:setAlpha( 0 )
				self.clipFinished( IndicatorGlow, {} )
			end
		},
		Glow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				IndicatorOn:completeAnimation()
				self.IndicatorOn:setAlpha( 0 )
				self.clipFinished( IndicatorOn, {} )
				IndicatorGlow:completeAnimation()
				self.IndicatorGlow:setAlpha( 1 )
				self.clipFinished( IndicatorGlow, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				IndicatorOn:completeAnimation()
				self.IndicatorOn:setAlpha( 1 )
				self.clipFinished( IndicatorOn, {} )
				IndicatorGlow:completeAnimation()
				self.IndicatorGlow:setAlpha( 0 )
				self.clipFinished( IndicatorGlow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

