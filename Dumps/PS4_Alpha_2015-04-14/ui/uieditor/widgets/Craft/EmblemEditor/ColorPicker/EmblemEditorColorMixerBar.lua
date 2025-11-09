require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemEditorColorMixerPointer" )

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
	barBg:setRGB( 1, 1, 1 )
	barBg:setAlpha( 0.1 )
	barBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( barBg )
	self.barBg = barBg
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, true, 0, 0 )
	bar:setTopBottom( true, true, 0, 0 )
	bar:setRGB( 1, 1, 1 )
	bar:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_dual_color_gradient" ) )
	bar:setShaderVector( 0, 0, 0, 0, 1 )
	bar:setShaderVector( 1, 1, 1, 1, 1 )
	self:addElement( bar )
	self.bar = bar
	
	local pointer = CoD.EmblemEditorColorMixerPointer.new( menu, controller )
	pointer:setLeftRight( true, false, 0, 2 )
	pointer:setTopBottom( true, true, 0, 0 )
	pointer:setRGB( 1, 1, 1 )
	self:addElement( pointer )
	self.pointer = pointer
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, true, -6.5, 25.5 )
	rightArrow:setTopBottom( true, false, -6, 26 )
	rightArrow:setRGB( 1, 1, 1 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	rightArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( true, false, -25, 7 )
	leftArrow:setTopBottom( true, false, -6, 26 )
	leftArrow:setRGB( 1, 1, 1 )
	leftArrow:setZRot( -90 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	leftArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				barBg:completeAnimation()
				self.barBg:setRGB( 1, 1, 1 )
				self.barBg:setAlpha( 0.1 )
				self.clipFinished( barBg, {} )
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
				self:setupElementClipCounter( 3 )
				barBg:completeAnimation()
				self.barBg:setRGB( 1, 0.41, 0 )
				self.barBg:setAlpha( 1 )
				self.clipFinished( barBg, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( rightArrow, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( leftArrow, {} )
			end
		}
	}
	self.close = function ( self )
		self.pointer:close()
		CoD.EmblemEditorColorMixerBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

