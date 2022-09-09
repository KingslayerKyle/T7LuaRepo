-- bb983d0829edbff6dd2c666c12f2770c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_VignetteBlurWidget" )

CoD.vhud_dart_VignetteBlur = InheritFrom( LUI.UIElement )
CoD.vhud_dart_VignetteBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_VignetteBlur )
	self.id = "vhud_dart_VignetteBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 458 )
	self:setTopBottom( true, false, 0, 356 )
	
	local vhuddartVignetteBlurWidget = CoD.vhud_dart_VignetteBlurWidget.new( menu, controller )
	vhuddartVignetteBlurWidget:setLeftRight( true, true, 0, 0 )
	vhuddartVignetteBlurWidget:setTopBottom( true, true, 0, 0 )
	vhuddartVignetteBlurWidget:setRGB( 0.89, 0.89, 0.89 )
	vhuddartVignetteBlurWidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	vhuddartVignetteBlurWidget:setShaderVector( 0, 7, 7, 0, 0 )
	self:addElement( vhuddartVignetteBlurWidget )
	self.vhuddartVignetteBlurWidget = vhuddartVignetteBlurWidget
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhuddartVignetteBlurWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
