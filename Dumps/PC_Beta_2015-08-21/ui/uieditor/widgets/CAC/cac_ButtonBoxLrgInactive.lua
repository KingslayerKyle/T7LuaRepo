CoD.cac_ButtonBoxLrgInactive = InheritFrom( LUI.UIElement )
CoD.cac_ButtonBoxLrgInactive.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ButtonBoxLrgInactive )
	self.id = "cac_ButtonBoxLrgInactive"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 16 )
	Image0:setTopBottom( false, true, -16, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivell" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 16, -16 )
	Image1:setTopBottom( false, true, -16, 0 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivelm" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -16, 0 )
	Image2:setTopBottom( false, true, -16, 0 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivelr" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 0, 16 )
	Image3:setTopBottom( true, true, 16, -16 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactiveml" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 16, -16 )
	Image4:setTopBottom( true, true, 16, -16 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivemm" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, true, -16, 0 )
	Image5:setTopBottom( true, true, 16, -16 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivemr" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 0, 16 )
	Image6:setTopBottom( true, false, 0, 16 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactiveul" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, true, 16, -16 )
	Image7:setTopBottom( true, false, 0, 16 )
	Image7:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactiveum" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -16, 0 )
	Image8:setTopBottom( true, false, 0, 16 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactiveur" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
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

