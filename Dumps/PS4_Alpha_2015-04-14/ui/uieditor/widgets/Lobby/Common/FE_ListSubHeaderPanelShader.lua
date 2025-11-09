CoD.FE_ListSubHeaderPanelShader = InheritFrom( LUI.UIElement )
CoD.FE_ListSubHeaderPanelShader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListSubHeaderPanelShader )
	self.id = "FE_ListSubHeaderPanelShader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 30 )
	
	local Image74 = LUI.UIImage.new()
	Image74:setLeftRight( true, false, -7, 9 )
	Image74:setTopBottom( false, true, -3, 1 )
	Image74:setRGB( 1, 1, 1 )
	Image74:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelll" ) )
	Image74:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image74:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image74 )
	self.Image74 = Image74
	
	local Image75 = LUI.UIImage.new()
	Image75:setLeftRight( true, true, 9, -7 )
	Image75:setTopBottom( false, true, -3, 1 )
	Image75:setRGB( 1, 1, 1 )
	Image75:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanellm" ) )
	Image75:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image75:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image75 )
	self.Image75 = Image75
	
	local Image76 = LUI.UIImage.new()
	Image76:setLeftRight( false, true, -7, 9 )
	Image76:setTopBottom( false, true, -3, 1 )
	Image76:setRGB( 1, 1, 1 )
	Image76:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanellr" ) )
	Image76:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image76:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image76 )
	self.Image76 = Image76
	
	local Image77 = LUI.UIImage.new()
	Image77:setLeftRight( true, false, -7, 9 )
	Image77:setTopBottom( true, true, 3, -3 )
	Image77:setRGB( 1, 1, 1 )
	Image77:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelml" ) )
	Image77:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image77:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image77 )
	self.Image77 = Image77
	
	local Image78 = LUI.UIImage.new()
	Image78:setLeftRight( false, true, -7, 9 )
	Image78:setTopBottom( true, true, 3, -3 )
	Image78:setRGB( 1, 1, 1 )
	Image78:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelmr" ) )
	Image78:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image78:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image78 )
	self.Image78 = Image78
	
	local Image79 = LUI.UIImage.new()
	Image79:setLeftRight( true, false, -7, 9 )
	Image79:setTopBottom( true, false, -1, 3 )
	Image79:setRGB( 1, 1, 1 )
	Image79:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelul" ) )
	Image79:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image79:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image79 )
	self.Image79 = Image79
	
	local Image80 = LUI.UIImage.new()
	Image80:setLeftRight( true, true, 9, -7 )
	Image80:setTopBottom( true, false, -1, 3 )
	Image80:setRGB( 1, 1, 1 )
	Image80:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelum" ) )
	Image80:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image80:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image80 )
	self.Image80 = Image80
	
	local Image81 = LUI.UIImage.new()
	Image81:setLeftRight( false, true, -7, 9 )
	Image81:setTopBottom( true, false, -1, 3 )
	Image81:setRGB( 1, 1, 1 )
	Image81:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelur" ) )
	Image81:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image81:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image81 )
	self.Image81 = Image81
	
	local Image82 = LUI.UIImage.new()
	Image82:setLeftRight( true, true, 9, -7 )
	Image82:setTopBottom( true, true, 3, -3 )
	Image82:setRGB( 1, 1, 1 )
	Image82:setImage( RegisterImage( "uie_t7_menu_frontend_listsubheadpanelmm" ) )
	Image82:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image82:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( Image82 )
	self.Image82 = Image82
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

