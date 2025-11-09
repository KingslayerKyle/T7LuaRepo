CoD.cac_ButtonBoxLrgInactiveDiags = InheritFrom( LUI.UIElement )
CoD.cac_ButtonBoxLrgInactiveDiags.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ButtonBoxLrgInactiveDiags )
	self.id = "cac_ButtonBoxLrgInactiveDiags"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -22, 2 )
	Image9:setTopBottom( true, false, -1, 23 )
	Image9:setAlpha( 0.3 )
	Image9:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediag" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, -2, 22 )
	Image10:setTopBottom( true, false, -1, 23 )
	Image10:setAlpha( 0.3 )
	Image10:setYRot( -185 )
	Image10:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediag" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -24, 0 )
	Image11:setTopBottom( false, true, -23, 1 )
	Image11:setAlpha( 0.3 )
	Image11:setYRot( -180 )
	Image11:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediag" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, -2, 22 )
	Image12:setTopBottom( false, true, -23, 1 )
	Image12:setAlpha( 0.3 )
	Image12:setXRot( 180 )
	Image12:setYRot( -185 )
	Image12:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediag" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

