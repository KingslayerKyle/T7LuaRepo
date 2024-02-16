require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )

CoD.PaintshopChoosePaintSide = InheritFrom( LUI.UIElement )
CoD.PaintshopChoosePaintSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopChoosePaintSide )
	self.id = "PaintshopChoosePaintSide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 162 )
	self:setTopBottom( true, false, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local PaintshopChooseSide = CoD.PaintshopChooseSide.new( menu, controller )
	PaintshopChooseSide:setLeftRight( true, true, 0, 0 )
	PaintshopChooseSide:setTopBottom( true, true, 0, 0 )
	PaintshopChooseSide.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PaintshopChooseSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PaintshopChooseSide )
	self.PaintshopChooseSide = PaintshopChooseSide
	
	local rightStick = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightStick:setLeftRight( true, false, 3, 28 )
	rightStick:setTopBottom( true, true, 0, -4 )
	rightStick:setAlpha( 0 )
	rightStick.label:setText( Engine.Localize( "" ) )
	rightStick:subscribeToGlobalModel( controller, "Controller", "right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStick.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightStick )
	self.rightStick = rightStick
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 32.88, 34.88 )
	Image0:setTopBottom( true, false, 0, 25 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, 64, 80 )
	downArrow:setTopBottom( false, false, -5, 3 )
	downArrow:setRGB( 0, 0, 0 )
	downArrow:setAlpha( 0 )
	downArrow:setZRot( -90 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, 51, 67 )
	upArrow:setTopBottom( false, false, -5, 3 )
	upArrow:setRGB( 0, 0, 0 )
	upArrow:setAlpha( 0 )
	upArrow:setZRot( 90 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				rightStick:completeAnimation()
				self.rightStick:setAlpha( 0 )
				self.clipFinished( rightStick, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				downArrow:completeAnimation()
				self.downArrow:setAlpha( 0 )
				self.clipFinished( downArrow, {} )
				upArrow:completeAnimation()
				self.upArrow:setAlpha( 0 )
				self.clipFinished( upArrow, {} )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				rightStick:completeAnimation()
				self.rightStick:setLeftRight( true, false, 1, 26 )
				self.rightStick:setTopBottom( true, true, 0, -4 )
				self.rightStick:setAlpha( 1 )
				self.clipFinished( rightStick, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 28.88, 30.88 )
				self.Image0:setTopBottom( true, false, 0, 25 )
				self.Image0:setAlpha( 0.47 )
				self.clipFinished( Image0, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, 65, 81 )
				self.downArrow:setTopBottom( false, false, -5, 3 )
				self.downArrow:setRGB( 0, 0, 0 )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setScale( 0.8 )
				self.clipFinished( downArrow, {} )
				upArrow:completeAnimation()
				self.upArrow:setLeftRight( false, false, -51.13, -35.13 )
				self.upArrow:setTopBottom( false, false, -5, 3 )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setScale( 0.8 )
				self.clipFinished( upArrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PaintshopChooseSide:close()
		self.rightStick:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

