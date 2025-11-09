CoD.AmmoWidgetMP_AbilityRingBackDeplete = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_AbilityRingBackDeplete.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_AbilityRingBackDeplete )
	self.id = "AmmoWidgetMP_AbilityRingBackDeplete"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 109 )
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, -17, 126 )
	Image00:setTopBottom( true, false, -17, 126 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_waveform1blank" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_comms_radial_distortion" ) )
	Image00:setShaderVector( 0, 0.31, 0.33, 0, 0 )
	Image00:setShaderVector( 1, 0.32, 0.41, 2.14, 10.52 )
	Image00:setShaderVector( 2, 0, 0, 3.32, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image001 = LUI.UIImage.new()
	Image001:setLeftRight( true, false, -9.5, 118.5 )
	Image001:setTopBottom( true, false, -9.5, 118.5 )
	Image001:setAlpha( 0.07 )
	Image001:setZRot( -44 )
	Image001:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_waveform1blank" ) )
	Image001:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_comms_radial_distortion" ) )
	Image001:setShaderVector( 0, 0.31, 0.33, 0, 0 )
	Image001:setShaderVector( 1, 0.32, 0.41, 2.8, 10.52 )
	Image001:setShaderVector( 2, 0, 0, 3.32, 0 )
	self:addElement( Image001 )
	self.Image001 = Image001
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

