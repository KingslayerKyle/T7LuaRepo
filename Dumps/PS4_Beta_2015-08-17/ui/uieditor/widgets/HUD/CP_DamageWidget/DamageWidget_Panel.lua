CoD.DamageWidget_Panel = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Panel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_Panel )
	self.id = "DamageWidget_Panel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 35 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 8 )
	Image1:setTopBottom( false, true, -8.33, -0.33 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelll" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image1:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 8, -7.67 )
	Image2:setTopBottom( false, true, -8.33, -0.33 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panellm" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image2:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -7.67, 0.33 )
	Image3:setTopBottom( false, true, -8.33, -0.33 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panellr" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image3:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 8 )
	Image4:setTopBottom( true, true, 8, -8.33 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelml" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image4:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 8, -7.67 )
	Image5:setTopBottom( true, true, 8, -8.33 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelmm" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image5:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -7.67, 0.33 )
	Image6:setTopBottom( true, true, 8.01, -8.33 )
	Image6:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelmr" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image6:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 8 )
	Image7:setTopBottom( true, false, 0, 8 )
	Image7:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelul" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image7:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 8, -7.67 )
	Image8:setTopBottom( true, false, 0, 8 )
	Image8:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelum" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image8:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -7.67, 0.33 )
	Image9:setTopBottom( true, false, 0, 8 )
	Image9:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_panelur" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image9:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

