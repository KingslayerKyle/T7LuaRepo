CoD.FE_ButtonPanelShader = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanelShader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanelShader )
	self.id = "FE_ButtonPanelShader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 123 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Full = LUI.UIImage.new()
	Full:setLeftRight( 0, 1, -2, 2 )
	Full:setTopBottom( 0, 1, -3, 3 )
	Full:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Full:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1_nineslice" ) )
	Full:setShaderVector( 0, 0, 0, 0, 0 )
	Full:setShaderVector( 1, 3, 3, 0, 0 )
	Full:setupNineSliceShader( 12, 12 )
	self:addElement( Full )
	self.Full = Full
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

