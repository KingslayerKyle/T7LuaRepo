CoD.FE_FocusBarSolid = InheritFrom( LUI.UIElement )
CoD.FE_FocusBarSolid.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FocusBarSolid )
	self.id = "FE_FocusBarSolid"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 8 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 4 )
	Image1:setTopBottom( false, false, -4, 4 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidl" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 4, -4 )
	Image3:setTopBottom( false, false, -4, 4 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidm" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -4, 0 )
	Image4:setTopBottom( false, false, -4, 4 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidr" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

