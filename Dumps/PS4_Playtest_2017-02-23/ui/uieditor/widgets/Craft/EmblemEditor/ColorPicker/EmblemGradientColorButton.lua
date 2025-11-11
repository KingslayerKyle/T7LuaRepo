require( "ui.uieditor.widgets.Border" )

CoD.EmblemGradientColorButton = InheritFrom( LUI.UIElement )
CoD.EmblemGradientColorButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemGradientColorButton )
	self.id = "EmblemGradientColorButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 472 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local barBg = LUI.UIImage.new()
	barBg:setLeftRight( 0, 1, 0, 0 )
	barBg:setTopBottom( 0, 1, -3, 3 )
	barBg:setRGB( 1, 0.41, 0 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 0, 0, 472 )
	Black:setTopBottom( 0, 0, 1, 48 )
	Black:setRGB( 0, 0, 0 )
	self:addElement( Black )
	self.Black = Black
	
	local color = LUI.UIImage.new()
	color:setLeftRight( 0, 0, 5, 131 )
	color:setTopBottom( 0, 0, 5, 43 )
	self:addElement( color )
	self.color = color
	
	local colorName = LUI.UIText.new()
	colorName:setLeftRight( 0, 0, 138, 459 )
	colorName:setTopBottom( 0, 0, 3, 41 )
	colorName:setText( Engine.Localize( "MENU_NEW" ) )
	colorName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	colorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	colorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( colorName )
	self.colorName = colorName
	
	local buttonBorder = CoD.Border.new( menu, controller )
	buttonBorder:setLeftRight( 0, 0, 0, 472 )
	buttonBorder:setTopBottom( 0, 0, 1, 47 )
	buttonBorder:setAlpha( 0.7 )
	self:addElement( buttonBorder )
	self.buttonBorder = buttonBorder
	
	local noColorImage = LUI.UIImage.new()
	noColorImage:setLeftRight( 0, 0, 5, 131 )
	noColorImage:setTopBottom( 0, 0, 5, 43 )
	noColorImage:setImage( RegisterImage( "uie_t7_menu_paintshop_transparent_hori" ) )
	self:addElement( noColorImage )
	self.noColorImage = noColorImage
	
	self.resetProperties = function ()
		noColorImage:completeAnimation()
		barBg:completeAnimation()
		buttonBorder:completeAnimation()
		color:completeAnimation()
		noColorImage:setAlpha( 1 )
		barBg:setAlpha( 1 )
		buttonBorder:setRGB( 1, 1, 1 )
		buttonBorder:setAlpha( 0.7 )
		color:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 0 )
				self.clipFinished( barBg, {} )
				noColorImage:completeAnimation()
				self.noColorImage:setAlpha( 0 )
				self.clipFinished( noColorImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( 1, 0.41, 0 )
				self.buttonBorder:setAlpha( 1 )
				self.clipFinished( buttonBorder, {} )
			end
		},
		NoColor = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 0 )
				self.clipFinished( barBg, {} )
				color:completeAnimation()
				self.color:setAlpha( 0 )
				self.clipFinished( color, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.buttonBorder:setAlpha( 1 )
				self.clipFinished( buttonBorder, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonBorder:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

