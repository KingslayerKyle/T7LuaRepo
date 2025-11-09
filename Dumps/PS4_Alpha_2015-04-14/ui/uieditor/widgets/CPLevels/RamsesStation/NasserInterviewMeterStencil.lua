CoD.NasserInterviewMeterStencil = InheritFrom( LUI.UIElement )
CoD.NasserInterviewMeterStencil.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.NasserInterviewMeterStencil )
	self.id = "NasserInterviewMeterStencil"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 5 )
	self:setTopBottom( true, false, 0, 171 )
	
	local LeftMeter = LUI.UIImage.new()
	LeftMeter:setLeftRight( false, false, -2.5, 2.5 )
	LeftMeter:setTopBottom( false, true, -171, 0 )
	LeftMeter:setRGB( 1, 1, 1 )
	LeftMeter:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_meter" ) )
	LeftMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftMeter )
	self.LeftMeter = LeftMeter
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

