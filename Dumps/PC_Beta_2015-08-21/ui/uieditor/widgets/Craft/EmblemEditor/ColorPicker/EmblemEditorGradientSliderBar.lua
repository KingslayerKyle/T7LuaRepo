require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerPointer" )

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
	self:setLeftRight( true, false, 0, 551 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local barBg = CoD.EmblemEditorFrame.new( menu, controller )
	barBg:setLeftRight( true, true, -2, 2 )
	barBg:setTopBottom( true, true, -3, 3 )
	self:addElement( barBg )
	self.barBg = barBg
	
	local barBg1 = LUI.UIImage.new()
	barBg1:setLeftRight( true, true, -2, 2 )
	barBg1:setTopBottom( true, true, -3, -20 )
	barBg1:setRGB( 1, 0.41, 0 )
	barBg1:setAlpha( 0 )
	self:addElement( barBg1 )
	self.barBg1 = barBg1
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, true, 0, 0 )
	bar:setTopBottom( true, true, 0, 0 )
	bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_gradient" ) )
	bar:setShaderVector( 0, 0, 0, 0, 1 )
	bar:setShaderVector( 1, 1, 1, 1, 1 )
	bar:setShaderVector( 2, 0.5, 0, 0, 0 )
	self:addElement( bar )
	self.bar = bar
	
	local pointer = CoD.EmblemEditorColorMixerPointer.new( menu, controller )
	pointer:setLeftRight( true, false, 0, 2 )
	pointer:setTopBottom( true, true, 0, 0 )
	self:addElement( pointer )
	self.pointer = pointer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, true, -6.5, 25.5 )
	rightArrow:setTopBottom( true, false, 0, 32 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( true, false, -25, 7 )
	leftArrow:setTopBottom( true, false, 0, 32 )
	leftArrow:setZRot( -90 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local barBg2 = LUI.UIImage.new()
	barBg2:setLeftRight( true, true, -2, 2 )
	barBg2:setTopBottom( true, true, 20, 3 )
	barBg2:setRGB( 1, 0.41, 0 )
	barBg2:setAlpha( 0 )
	self:addElement( barBg2 )
	self.barBg2 = barBg2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				barBg:completeAnimation()
				self.barBg:setRGB( 1, 1, 1 )
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				barBg1:completeAnimation()
				self.barBg1:setAlpha( 0 )
				self.clipFinished( barBg1, {} )
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
				barBg2:completeAnimation()
				self.barBg2:setAlpha( 0 )
				self.clipFinished( barBg2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				barBg:completeAnimation()
				self.barBg:setLeftRight( true, true, -4, 4 )
				self.barBg:setTopBottom( true, true, -3, 4 )
				self.barBg:setRGB( 1, 0.41, 0 )
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				barBg1:completeAnimation()
				self.barBg1:setLeftRight( true, true, -2, 2 )
				self.barBg1:setTopBottom( true, true, -3, -32 )
				self.barBg1:setAlpha( 1 )
				self.clipFinished( barBg1, {} )
				pointer:completeAnimation()
				self.pointer:setRGB( 1, 0.41, 0 )
				self.clipFinished( pointer, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setRGB( 1, 0.41, 0 )
				self.rightArrow:setAlpha( 1 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setRGB( 1, 0.41, 0 )
				self.leftArrow:setAlpha( 1 )
				self.clipFinished( leftArrow, {} )
				barBg2:completeAnimation()
				self.barBg2:setLeftRight( true, true, -2, 2 )
				self.barBg2:setTopBottom( true, true, 32, 3 )
				self.barBg2:setAlpha( 1 )
				self.clipFinished( barBg2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.barBg:close()
		element.pointer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

