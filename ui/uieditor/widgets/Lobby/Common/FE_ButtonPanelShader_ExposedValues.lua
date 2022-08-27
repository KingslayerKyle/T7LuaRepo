-- edfd6980b01dc7014496b657dd319d63
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ButtonPanelShader_ExposedValues = InheritFrom( LUI.UIElement )
CoD.FE_ButtonPanelShader_ExposedValues.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonPanelShader_ExposedValues )
	self.id = "FE_ButtonPanelShader_ExposedValues"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Full = LUI.UIImage.new()
	Full:setLeftRight( true, true, -1, 1 )
	Full:setTopBottom( true, true, -2, 2 )
	Full:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Full:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1_nineslice" ) )
	Full:setShaderVector( 0, 0.33, 0.33, 0, 0 )
	Full:setShaderVector( 1, 10, 10, 0, 0 )
	Full:setupNineSliceShader( 10, 10 )
	self:addElement( Full )
	self.Full = Full
	
	local NineSliceShaderImage0 = LUI.UIImage.new()
	NineSliceShaderImage0:setLeftRight( true, true, -1, 1 )
	NineSliceShaderImage0:setTopBottom( true, true, -2, 2 )
	NineSliceShaderImage0:setAlpha( 0 )
	NineSliceShaderImage0:setImage( RegisterImage( "uie_t7_menu_fe_scoreboardbuttonblur" ) )
	NineSliceShaderImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	NineSliceShaderImage0:setShaderVector( 0, 0, 20, 0, 0 )
	NineSliceShaderImage0:setupNineSliceShader( 8, 8 )
	self:addElement( NineSliceShaderImage0 )
	self.NineSliceShaderImage0 = NineSliceShaderImage0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

