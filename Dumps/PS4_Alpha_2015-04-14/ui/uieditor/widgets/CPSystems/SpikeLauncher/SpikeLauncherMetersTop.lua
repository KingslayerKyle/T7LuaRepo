CoD.SpikeLauncherMetersTop = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherMetersTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherMetersTop )
	self.id = "SpikeLauncherMetersTop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 47 )
	self:setTopBottom( true, false, 0, 90 )
	
	local MeterUpper = LUI.UIImage.new()
	MeterUpper:setLeftRight( true, true, 0, 0.33 )
	MeterUpper:setTopBottom( true, true, 0, -0.5 )
	MeterUpper:setRGB( 1, 1, 1 )
	MeterUpper:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmetertop" ) )
	MeterUpper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterUpper )
	self.MeterUpper = MeterUpper
	
	local MeterUpperColor = LUI.UIImage.new()
	MeterUpperColor:setLeftRight( true, true, 0, 0.33 )
	MeterUpperColor:setTopBottom( true, true, 0, -0.5 )
	MeterUpperColor:setRGB( 1, 1, 1 )
	MeterUpperColor:setAlpha( 0 )
	MeterUpperColor:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmetertopcolor" ) )
	MeterUpperColor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterUpperColor )
	self.MeterUpperColor = MeterUpperColor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MeterUpper:completeAnimation()
				self.MeterUpper:setAlpha( 1 )
				self.clipFinished( MeterUpper, {} )
				MeterUpperColor:completeAnimation()
				self.MeterUpperColor:setAlpha( 0 )
				self.clipFinished( MeterUpperColor, {} )
			end
		},
		StrongArea = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MeterUpper:completeAnimation()
				self.MeterUpper:setAlpha( 0 )
				self.clipFinished( MeterUpper, {} )
				MeterUpperColor:completeAnimation()
				self.MeterUpperColor:setAlpha( 1 )
				self.clipFinished( MeterUpperColor, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

