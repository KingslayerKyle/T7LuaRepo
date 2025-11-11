require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerPointer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

local SetupPC = function ( self, controller, menu )
	self.m_forceMouseEventDispatch = true
	local GetMouseBarValue = function ( element, event )
		local gleft, gtop, gright, gbottom = self:getRect()
		local barWidth = gright - gleft
		local xPos = CoD.ColorUtility.ClampColor( event.x - gleft, 0, barWidth )
		return xPos / barWidth
	end
	
	self:registerEventHandler( "leftmouseup", function ( element, event )
		local newValue = GetMouseBarValue( element, event )
		EmblemGradient_SetGradientFill( element, element, newValue, controller )
		return true
	end )
	self:registerEventHandler( "mousedrag", function ( element, event )
		local newValue = GetMouseBarValue( element, event )
		EmblemGradient_SetGradientFill( element, element, newValue, controller )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

CoD.EmblemEditorGradientSliderBar = InheritFrom( LUI.UIElement )
CoD.EmblemEditorGradientSliderBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorGradientSliderBar )
	self.id = "EmblemEditorGradientSliderBar"
	self.soundSet = "SelectColor_ColorMixer"
	self:setLeftRight( 0, 0, 0, 826 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local barBg = CoD.EmblemEditorFrame.new( menu, controller )
	barBg:setLeftRight( 0, 1, -3, 3 )
	barBg:setTopBottom( 0, 1, -4, 4 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local barBg1 = LUI.UIImage.new()
	barBg1:setLeftRight( 0, 1, -3, 3 )
	barBg1:setTopBottom( 0, 1, -4, -30 )
	barBg1:setRGB( 1, 0.41, 0 )
	barBg1:setAlpha( 0 )
	self:addElement( barBg1 )
	self.barBg1 = barBg1
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( 0, 1, 0, 0 )
	bar:setTopBottom( 0, 1, 0, 0 )
	self:addElement( bar )
	self.bar = bar
	
	local pointer = CoD.EmblemEditorColorMixerPointer.new( menu, controller )
	pointer:setLeftRight( 0, 0, 0.5, 3.5 )
	pointer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( pointer )
	self.pointer = pointer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( 1, 1, -10, 38 )
	rightArrow:setTopBottom( 0, 0, 0, 48 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( 0, 0, -38, 10 )
	leftArrow:setTopBottom( 0, 0, 0, 48 )
	leftArrow:setZRot( -90 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local barBg2 = LUI.UIImage.new()
	barBg2:setLeftRight( 0, 1, -3, 3 )
	barBg2:setTopBottom( 0, 1, 30, 4 )
	barBg2:setRGB( 1, 0.41, 0 )
	barBg2:setAlpha( 0 )
	self:addElement( barBg2 )
	self.barBg2 = barBg2
	
	self.resetProperties = function ()
		rightArrow:completeAnimation()
		leftArrow:completeAnimation()
		barBg:completeAnimation()
		pointer:completeAnimation()
		barBg1:completeAnimation()
		barBg2:completeAnimation()
		rightArrow:setRGB( 1, 1, 1 )
		rightArrow:setAlpha( 1 )
		leftArrow:setRGB( 1, 1, 1 )
		leftArrow:setAlpha( 1 )
		barBg:setLeftRight( 0, 1, -3, 3 )
		barBg:setTopBottom( 0, 1, -4, 4 )
		barBg:setRGB( 1, 1, 1 )
		pointer:setRGB( 1, 1, 1 )
		barBg1:setLeftRight( 0, 1, -3, 3 )
		barBg1:setTopBottom( 0, 1, -4, -30 )
		barBg1:setAlpha( 0 )
		barBg2:setLeftRight( 0, 1, -3, 3 )
		barBg2:setTopBottom( 0, 1, 30, 4 )
		barBg2:setAlpha( 0 )
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
				self:setupElementClipCounter( 6 )
				barBg:completeAnimation()
				self.barBg:setLeftRight( 0, 1, -6, 6 )
				self.barBg:setTopBottom( 0, 1, -4, 6 )
				self.barBg:setRGB( 1, 0.41, 0 )
				self.clipFinished( barBg, {} )
				barBg1:completeAnimation()
				self.barBg1:setLeftRight( 0, 1, -3, 3 )
				self.barBg1:setTopBottom( 0, 1, -4, -48 )
				self.barBg1:setAlpha( 1 )
				self.clipFinished( barBg1, {} )
				pointer:completeAnimation()
				self.pointer:setRGB( 1, 0.41, 0 )
				self.clipFinished( pointer, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( leftArrow, {} )
				barBg2:completeAnimation()
				self.barBg2:setLeftRight( 0, 1, -3, 3 )
				self.barBg2:setTopBottom( 0, 1, 48, 4 )
				self.barBg2:setAlpha( 1 )
				self.clipFinished( barBg2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.barBg:close()
		self.pointer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

