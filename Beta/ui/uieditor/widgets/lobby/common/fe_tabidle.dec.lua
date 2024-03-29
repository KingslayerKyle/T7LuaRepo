CoD.FE_TabIdle = InheritFrom( LUI.UIElement )
CoD.FE_TabIdle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TabIdle )
	self.id = "FE_TabIdle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 152 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -8, 0 )
	Image1:setTopBottom( true, false, 0, 8 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidleur" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 8, -8 )
	Image2:setTopBottom( true, false, 0, 8 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidleum" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 0, 8 )
	Image3:setTopBottom( true, false, 0, 8 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidleul" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 8 )
	Image4:setTopBottom( true, true, 8, -8 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidleml" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 8, -8 )
	Image5:setTopBottom( true, true, 8, -8 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlemm" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -8, 0 )
	Image6:setTopBottom( true, true, 8, -8 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlemr" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 0, 8 )
	Image7:setTopBottom( false, true, -8, 0 )
	Image7:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlell" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 8, -8 )
	Image8:setTopBottom( false, true, -8, 0 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlelm" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -8, 0 )
	Image9:setTopBottom( false, true, -8, 0 )
	Image9:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlelr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainActive = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseActive = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

