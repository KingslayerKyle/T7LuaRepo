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
	PaintshopChooseSide:setRGB( 1, 1, 1 )
	PaintshopChooseSide.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PaintshopChooseSide:subscribeToGlobalModel( controller, "Customization", "view_string_ref", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PaintshopChooseSide.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PaintshopChooseSide )
	self.PaintshopChooseSide = PaintshopChooseSide
	
	local leftBumper = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	leftBumper:setLeftRight( true, false, 4, 29 )
	leftBumper:setTopBottom( true, true, 1, -3 )
	leftBumper:setRGB( 1, 1, 1 )
	leftBumper.label:setText( Engine.Localize( "" ) )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftBumper.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local rightBumper = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rightBumper:setLeftRight( false, true, -30, -5 )
	rightBumper:setTopBottom( true, true, 1, -3 )
	rightBumper:setRGB( 1, 1, 1 )
	rightBumper.label:setText( Engine.Localize( "" ) )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBumper.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 0 )
				self.clipFinished( leftBumper, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 0 )
				self.clipFinished( rightBumper, {} )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 1 )
				self.clipFinished( leftBumper, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 1 )
				self.clipFinished( rightBumper, {} )
			end
		}
	}
	self.close = function ( self )
		self.PaintshopChooseSide:close()
		self.leftBumper:close()
		self.rightBumper:close()
		CoD.PaintshopChoosePaintSide.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

