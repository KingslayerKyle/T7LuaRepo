-- 7fac64e32afe9dc509bbd168d4b44f1d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Full = LUI.UIImage.new()
	Full:setLeftRight( true, true, -1, 1 )
	Full:setTopBottom( true, true, -2, 2 )
	Full:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Full:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1_nineslice" ) )
	Full:setShaderVector( 0, 0.02, 0.2, 0, 0 )
	Full:setShaderVector( 1, 3, 3, 0, 0 )
	Full:setupNineSliceShader( 8, 8 )
	self:addElement( Full )
	self.Full = Full
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

