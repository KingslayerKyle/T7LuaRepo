require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerPointer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.m_forceMouseEventDispatch = true
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f1_arg0:getRect()
		local f2_local4 = f2_local2 - f2_local0
		return math.floor( CoD.ClampColor( f2_arg1.x - f2_local0, 0, f2_local4 ) / f2_local4 * 255 + 0.5 )
	end
	
	f1_arg0:registerEventHandler( "leftmouseup", function ( element, event )
		EmblemChooseColor_SetColorComponent( element.m_colorMixer, element, f1_arg1, element.m_color, f1_local0( element, event ) )
		return true
	end )
	f1_arg0:registerEventHandler( "mousedrag", function ( element, event )
		EmblemChooseColor_SetColorComponent( element.m_colorMixer, element, f1_arg1, element.m_color, f1_local0( element, event ) )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
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
	self:setLeftRight( true, false, 0, 551 )
	self:setTopBottom( true, false, 0, 20 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local barBg = LUI.UIImage.new()
	barBg:setLeftRight( true, true, -2, 2 )
	barBg:setTopBottom( true, true, -2, 2 )
	barBg:setAlpha( 0.1 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, true, 0, 0 )
	bar:setTopBottom( true, true, 0, 0 )
	bar:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_dual_color_gradient" ) )
	bar:setShaderVector( 0, 0, 0, 0, 1 )
	bar:setShaderVector( 1, 1, 1, 1, 1 )
	self:addElement( bar )
	self.bar = bar
	
	local pointer = CoD.EmblemEditorColorMixerPointer.new( menu, controller )
	pointer:setLeftRight( true, false, 0, 2 )
	pointer:setTopBottom( true, true, 0, 0 )
	self:addElement( pointer )
	self.pointer = pointer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, true, -6.5, 25.5 )
	rightArrow:setTopBottom( true, false, -6, 26 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( true, false, -25, 7 )
	leftArrow:setTopBottom( true, false, -6, 26 )
	leftArrow:setZRot( -90 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				barBg:completeAnimation()
				self.barBg:setRGB( 1, 1, 1 )
				self.barBg:setAlpha( 0.1 )
				self.clipFinished( barBg, {} )
				bar:completeAnimation()
				self.bar:setAlpha( 1 )
				self.clipFinished( bar, {} )
				pointer:completeAnimation()
				self.pointer:setAlpha( 1 )
				self.clipFinished( pointer, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setRGB( 1, 1, 1 )
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setRGB( 1, 1, 1 )
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				barBg:completeAnimation()
				self.barBg:setLeftRight( true, true, 0, 0 )
				self.barBg:setTopBottom( true, true, -2, 2 )
				self.barBg:setRGB( 1, 0.41, 0 )
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				bar:completeAnimation()
				self.bar:setAlpha( 1 )
				self.clipFinished( bar, {} )
				pointer:completeAnimation()
				self.pointer:setRGB( 1, 0.41, 0 )
				self.pointer:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.pointer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

