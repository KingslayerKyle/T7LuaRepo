CoD.FE_ListHeaderGlow = InheritFrom( LUI.UIElement )
CoD.FE_ListHeaderGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHeaderGlow )
	self.id = "FE_ListHeaderGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Image56 = LUI.UIImage.new()
	Image56:setLeftRight( true, false, -8, 8 )
	Image56:setTopBottom( false, true, -2, 2 )
	Image56:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowll" ) )
	Image56:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image56 )
	self.Image56 = Image56
	
	local Image57 = LUI.UIImage.new()
	Image57:setLeftRight( true, true, 8, -8 )
	Image57:setTopBottom( false, true, -2, 2 )
	Image57:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowlm" ) )
	Image57:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image57 )
	self.Image57 = Image57
	
	local Image58 = LUI.UIImage.new()
	Image58:setLeftRight( false, true, -8, 8 )
	Image58:setTopBottom( false, true, -2, 2 )
	Image58:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowlr" ) )
	Image58:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image58 )
	self.Image58 = Image58
	
	local Image59 = LUI.UIImage.new()
	Image59:setLeftRight( true, false, -8, 8 )
	Image59:setTopBottom( true, true, 2, -2 )
	Image59:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowml" ) )
	Image59:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image59 )
	self.Image59 = Image59
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( false, true, -8, 8 )
	Image60:setTopBottom( true, true, 2, -2 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowmr" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image61 = LUI.UIImage.new()
	Image61:setLeftRight( true, false, -8, 8 )
	Image61:setTopBottom( true, false, -2, 2 )
	Image61:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowul" ) )
	Image61:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image61 )
	self.Image61 = Image61
	
	local Image62 = LUI.UIImage.new()
	Image62:setLeftRight( true, true, 8, -8 )
	Image62:setTopBottom( true, false, -2, 2 )
	Image62:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowum" ) )
	Image62:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image62 )
	self.Image62 = Image62
	
	local Image63 = LUI.UIImage.new()
	Image63:setLeftRight( false, true, -8, 8 )
	Image63:setTopBottom( true, false, -2, 2 )
	Image63:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowur" ) )
	Image63:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image63 )
	self.Image63 = Image63
	
	local Image64 = LUI.UIImage.new()
	Image64:setLeftRight( true, true, 8, -8 )
	Image64:setTopBottom( true, true, 2, -2 )
	Image64:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderglowmm" ) )
	Image64:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image64 )
	self.Image64 = Image64
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

