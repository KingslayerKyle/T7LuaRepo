require( "ui.uieditor.widgets.Border" )

CoD.PaintshopWeaponListButton = InheritFrom( LUI.UIElement )
CoD.PaintshopWeaponListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopWeaponListButton )
	self.id = "PaintshopWeaponListButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, -12 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.58, 0.58, 0.6 )
	background:setAlpha( 0.25 )
	self:addElement( background )
	self.background = background
	
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( false, true, -23, 9 )
	arrowImage:setTopBottom( false, false, -16, 16 )
	arrowImage:setRGB( 0.58, 0.58, 0.6 )
	arrowImage:setAlpha( 0 )
	arrowImage:setImage( RegisterImage( "uie_ui_arrow_right" ) )
	self:addElement( arrowImage )
	self.arrowImage = arrowImage
	
	local itemImageBg = LUI.UIImage.new()
	itemImageBg:setLeftRight( true, false, 0, 50 )
	itemImageBg:setTopBottom( false, false, -25, 25 )
	itemImageBg:setAlpha( 0.1 )
	self:addElement( itemImageBg )
	self.itemImageBg = itemImageBg
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 0, 50 )
	itemImage:setTopBottom( false, false, -25, 25 )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 62, 115 )
	itemName:setTopBottom( false, false, -12.5, 12.5 )
	itemName:setText( Engine.Localize( "MENU_NEW" ) )
	itemName:setTTF( "fonts/default.ttf" )
	self:addElement( itemName )
	self.itemName = itemName
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, -12 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.58, 0.58, 0.6 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setRGB( 0.58, 0.58, 0.6 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 0.41, 0 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 0 )
				self.clipFinished( arrowImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 0.47, 0.47, 0.47 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 4 )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 1 )
				self.clipFinished( arrowImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

