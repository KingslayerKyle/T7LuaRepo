CoD.CustomClassCategoryHeader = InheritFrom( LUI.UIElement )
CoD.CustomClassCategoryHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomClassCategoryHeader )
	self.id = "CustomClassCategoryHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 16 )
	Image0:setTopBottom( true, false, 0, 26.67 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitlel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -16, 0 )
	Image1:setTopBottom( true, false, 0, 26.67 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitler" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 16, -16 )
	Image2:setTopBottom( true, false, 0, 26.67 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitlem" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 13, 508 )
	text:setTopBottom( true, false, 5, 22 )
	text:setRGB( 0.86, 0.88, 0.75 )
	text:setAlpha( 0.66 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/UnitedSansSmExMd.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

