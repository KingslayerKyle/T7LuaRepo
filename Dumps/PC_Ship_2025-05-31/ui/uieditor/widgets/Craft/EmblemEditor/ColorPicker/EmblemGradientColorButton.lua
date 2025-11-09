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
	self:setLeftRight( true, false, 0, 315 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local barBg = LUI.UIImage.new()
	barBg:setLeftRight( true, true, 0, 0 )
	barBg:setTopBottom( true, true, -2, 2 )
	barBg:setRGB( 1, 0.41, 0 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, false, 0, 315 )
	Black:setTopBottom( true, false, 0.5, 32 )
	Black:setRGB( 0, 0, 0 )
	self:addElement( Black )
	self.Black = Black
	
	local color = LUI.UIImage.new()
	color:setLeftRight( true, false, 3, 87 )
	color:setTopBottom( true, false, 3.5, 28.5 )
	self:addElement( color )
	self.color = color
	
	local colorName = LUI.UIText.new()
	colorName:setLeftRight( true, false, 92, 306 )
	colorName:setTopBottom( true, false, 2.5, 27.5 )
	colorName:setText( Engine.Localize( "MENU_NEW" ) )
	colorName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	colorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	colorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( colorName )
	self.colorName = colorName
	
	local buttonBorder = CoD.Border.new( menu, controller )
	buttonBorder:setLeftRight( true, false, 0, 315 )
	buttonBorder:setTopBottom( true, false, 0.5, 31.5 )
	buttonBorder:setAlpha( 0.7 )
	self:addElement( buttonBorder )
	self.buttonBorder = buttonBorder
	
	local noColorImage = LUI.UIImage.new()
	noColorImage:setLeftRight( true, false, 3, 87 )
	noColorImage:setTopBottom( true, false, 3.5, 28.5 )
	noColorImage:setImage( RegisterImage( "uie_t7_menu_paintshop_transparent_hori" ) )
	self:addElement( noColorImage )
	self.noColorImage = noColorImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 0 )
				self.clipFinished( barBg, {} )
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				self.clipFinished( Black, {} )
				color:completeAnimation()
				self.color:setAlpha( 1 )
				self.clipFinished( color, {} )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( 1, 1, 1 )
				self.buttonBorder:setAlpha( 0.7 )
				self.clipFinished( buttonBorder, {} )
				noColorImage:completeAnimation()
				self.noColorImage:setAlpha( 0 )
				self.clipFinished( noColorImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				self.clipFinished( Black, {} )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( 1, 0.41, 0 )
				self.buttonBorder:setAlpha( 1 )
				self.clipFinished( buttonBorder, {} )
			end
		},
		NoColor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 0 )
				self.clipFinished( barBg, {} )
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				self.clipFinished( Black, {} )
				color:completeAnimation()
				self.color:setAlpha( 0 )
				self.clipFinished( color, {} )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( 1, 1, 1 )
				self.buttonBorder:setAlpha( 0.7 )
				self.clipFinished( buttonBorder, {} )
				noColorImage:completeAnimation()
				self.noColorImage:setAlpha( 1 )
				self.clipFinished( noColorImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				barBg:completeAnimation()
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				Black:completeAnimation()
				self.Black:setAlpha( 1 )
				self.clipFinished( Black, {} )
				buttonBorder:completeAnimation()
				self.buttonBorder:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.buttonBorder:setAlpha( 1 )
				self.clipFinished( buttonBorder, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

