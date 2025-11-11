require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )

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
	self:setLeftRight( 0, 0, 0, 243 )
	self:setTopBottom( 0, 0, 0, 40 )
	
	local PaintshopChooseSide = CoD.PaintshopChooseSide.new( menu, controller )
	PaintshopChooseSide:setLeftRight( 0, 1, 0, 0 )
	PaintshopChooseSide:setTopBottom( 0, 1, 0, 0 )
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
	rightStick:setLeftRight( 0, 0, 4, 42 )
	rightStick:setTopBottom( 0, 1, 0, -6 )
	rightStick:setAlpha( 0 )
	rightStick.label:setText( Engine.Localize( "" ) )
	rightStick:subscribeToGlobalModel( controller, "Controller", "move_right_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightStick.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightStick )
	self.rightStick = rightStick
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 49, 52 )
	Image0:setTopBottom( 0, 0, 0, 38 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( 0.5, 0.5, 96, 120 )
	downArrow:setTopBottom( 0.5, 0.5, -8, 4 )
	downArrow:setRGB( 0, 0, 0 )
	downArrow:setAlpha( 0 )
	downArrow:setZRot( -90 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( 0.5, 0.5, 76, 100 )
	upArrow:setTopBottom( 0.5, 0.5, -8, 4 )
	upArrow:setRGB( 0, 0, 0 )
	upArrow:setAlpha( 0 )
	upArrow:setZRot( 90 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	self.resetProperties = function ()
		rightStick:completeAnimation()
		Image0:completeAnimation()
		downArrow:completeAnimation()
		upArrow:completeAnimation()
		rightStick:setLeftRight( 0, 0, 4, 42 )
		rightStick:setTopBottom( 0, 1, 0, -6 )
		rightStick:setAlpha( 0 )
		Image0:setLeftRight( 0, 0, 49, 52 )
		Image0:setTopBottom( 0, 0, 0, 38 )
		Image0:setAlpha( 0 )
		downArrow:setLeftRight( 0.5, 0.5, 96, 120 )
		downArrow:setTopBottom( 0.5, 0.5, -8, 4 )
		downArrow:setAlpha( 0 )
		downArrow:setScale( 1 )
		upArrow:setLeftRight( 0.5, 0.5, 76, 100 )
		upArrow:setTopBottom( 0.5, 0.5, -8, 4 )
		upArrow:setAlpha( 0 )
		upArrow:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				rightStick:completeAnimation()
				self.rightStick:setLeftRight( 0, 0, 1, 39 )
				self.rightStick:setTopBottom( 0, 1, 0, -6 )
				self.rightStick:setAlpha( 1 )
				self.clipFinished( rightStick, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 43, 46 )
				self.Image0:setTopBottom( 0, 0, 0, 38 )
				self.Image0:setAlpha( 0.47 )
				self.clipFinished( Image0, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( 0.5, 0.5, 98, 122 )
				self.downArrow:setTopBottom( 0.5, 0.5, -8, 4 )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setScale( 0.8 )
				self.clipFinished( downArrow, {} )
				upArrow:completeAnimation()
				self.upArrow:setLeftRight( 0.5, 0.5, -77, -53 )
				self.upArrow:setTopBottom( 0.5, 0.5, -8, 4 )
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

