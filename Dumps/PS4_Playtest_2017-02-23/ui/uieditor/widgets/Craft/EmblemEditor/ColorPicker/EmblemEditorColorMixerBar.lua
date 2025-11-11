require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerPointer" )

local SetupPC = function ( self, controller, menu )
	self.m_forceMouseEventDispatch = true
	local GetMouseBarValue = function ( element, event )
		local gleft, gtop, gright, gbottom = self:getRect()
		local barWidth = gright - gleft
		local xPos = CoD.ColorUtility.ClampColor( event.x - gleft, 0, barWidth )
		local value = xPos / barWidth * 255
		return math.floor( value + 0.5 )
	end
	
	self:registerEventHandler( "leftmouseup", function ( element, event )
		local newColorValue = GetMouseBarValue( element, event )
		EmblemChooseColor_SetColorComponent( element.m_colorMixer, element, controller, element.m_color, newColorValue )
		return true
	end )
	self:registerEventHandler( "mousedrag", function ( element, event )
		local newColorValue = GetMouseBarValue( element, event )
		EmblemChooseColor_SetColorComponent( element.m_colorMixer, element, controller, element.m_color, newColorValue )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.EmblemEditorColorMixerBar = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorMixerBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorMixerBar )
	self.id = "EmblemEditorColorMixerBar"
	self.soundSet = "SelectColor_ColorMixer"
	self:setLeftRight( 0, 0, 0, 826 )
	self:setTopBottom( 0, 0, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local barBg = LUI.UIImage.new()
	barBg:setLeftRight( 0, 1, -3, 3 )
	barBg:setTopBottom( 0, 1, -3, 3 )
	barBg:setAlpha( 0.1 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( 0, 1, 0, 0 )
	bar:setTopBottom( 0, 1, 0, 0 )
	bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_dual_gradient" ) )
	bar:setShaderVector( 0, 0, 0, 0, 1 )
	bar:setShaderVector( 1, 1, 1, 1, 1 )
	self:addElement( bar )
	self.bar = bar
	
	local pointer = CoD.EmblemEditorColorMixerPointer.new( menu, controller )
	pointer:setLeftRight( 0, 0, 0.5, 3.5 )
	pointer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( pointer )
	self.pointer = pointer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( 1, 1, -10, 38 )
	rightArrow:setTopBottom( 0, 0, -9, 39 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( 0, 0, -38, 10 )
	leftArrow:setTopBottom( 0, 0, -9, 39 )
	leftArrow:setZRot( -90 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	self.resetProperties = function ()
		rightArrow:completeAnimation()
		leftArrow:completeAnimation()
		barBg:completeAnimation()
		pointer:completeAnimation()
		rightArrow:setRGB( 1, 1, 1 )
		rightArrow:setAlpha( 1 )
		leftArrow:setRGB( 1, 1, 1 )
		leftArrow:setAlpha( 1 )
		barBg:setLeftRight( 0, 1, -3, 3 )
		barBg:setTopBottom( 0, 1, -3, 3 )
		barBg:setRGB( 1, 1, 1 )
		barBg:setAlpha( 0.1 )
		pointer:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				barBg:completeAnimation()
				self.barBg:setLeftRight( 0, 1, 0, 0 )
				self.barBg:setTopBottom( 0, 1, -3, 3 )
				self.barBg:setRGB( 1, 0.41, 0 )
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				pointer:completeAnimation()
				self.pointer:setRGB( 1, 0.41, 0 )
				self.clipFinished( pointer, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( leftArrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.pointer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

