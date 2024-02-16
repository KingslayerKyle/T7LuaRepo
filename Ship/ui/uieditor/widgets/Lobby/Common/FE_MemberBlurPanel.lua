-- c59d23fa5d9e5a794c99db12db142efa
-- This hash is used for caching, delete to decompile the file again

CoD.FE_MemberBlurPanel = InheritFrom( LUI.UIElement )
CoD.FE_MemberBlurPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_MemberBlurPanel )
	self.id = "FE_MemberBlurPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 984 )
	self:setTopBottom( true, false, 0, 108 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_fe_membersblurpanel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
