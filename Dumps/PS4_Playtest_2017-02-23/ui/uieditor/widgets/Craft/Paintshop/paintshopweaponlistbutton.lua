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
	self:setLeftRight( 0, 0, 0, 349 )
	self:setTopBottom( 0, 0, 0, 76 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, -18 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0.58, 0.58, 0.6 )
	background:setAlpha( 0.25 )
	self:addElement( background )
	self.background = background
	
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( 1, 1, -34, 14 )
	arrowImage:setTopBottom( 0.5, 0.5, -24, 24 )
	arrowImage:setRGB( 0.58, 0.58, 0.6 )
	arrowImage:setAlpha( 0 )
	self:addElement( arrowImage )
	self.arrowImage = arrowImage
	
	local itemImageBg = LUI.UIImage.new()
	itemImageBg:setLeftRight( 0, 0, 0, 75 )
	itemImageBg:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	itemImageBg:setAlpha( 0.1 )
	self:addElement( itemImageBg )
	self.itemImageBg = itemImageBg
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0, 0, 0, 75 )
	itemImage:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( 0, 0, 93, 173 )
	itemName:setTopBottom( 0.5, 0.5, -19, 19 )
	itemName:setText( Engine.Localize( "MENU_NEW" ) )
	itemName:setTTF( "fonts/default.ttf" )
	self:addElement( itemName )
	self.itemName = itemName
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, 0, -18 )
	border:setTopBottom( 0, 1, 0, 0 )
	border:setRGB( 0.58, 0.58, 0.6 )
	self:addElement( border )
	self.border = border
	
	self.resetProperties = function ()
		border:completeAnimation()
		itemName:completeAnimation()
		itemImage:completeAnimation()
		arrowImage:completeAnimation()
		border:setRGB( 0.58, 0.58, 0.6 )
		border:setAlpha( 1 )
		itemName:setRGB( 1, 1, 1 )
		itemImage:setAlpha( 1 )
		arrowImage:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 0.41, 0 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				arrowImage:completeAnimation()
				self.arrowImage:setAlpha( 1 )
				self.clipFinished( arrowImage, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
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

