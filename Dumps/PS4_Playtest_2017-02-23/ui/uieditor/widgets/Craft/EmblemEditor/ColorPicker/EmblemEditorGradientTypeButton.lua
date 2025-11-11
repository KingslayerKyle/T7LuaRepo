require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )

CoD.EmblemEditorGradientTypeButton = InheritFrom( LUI.UIElement )
CoD.EmblemEditorGradientTypeButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorGradientTypeButton )
	self.id = "EmblemEditorGradientTypeButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 634 )
	self:setTopBottom( 0, 0, 0, 55 )
	
	local toggleRadial = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleRadial:setLeftRight( 0, 0, 9, 625 )
	toggleRadial:setTopBottom( 0, 0, 8, 47 )
	toggleRadial:setAlpha( 0 )
	toggleRadial.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_RADIAL_GRADIENT" ) )
	toggleRadial:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleRadial.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleRadial )
	self.toggleRadial = toggleRadial
	
	local toggleLinear = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleLinear:setLeftRight( 0, 0, 9, 625 )
	toggleLinear:setTopBottom( 0, 0, 8, 47 )
	toggleLinear.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_LINAR_GRADIENT" ) )
	toggleLinear:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleLinear.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleLinear )
	self.toggleLinear = toggleLinear
	
	self.resetProperties = function ()
		toggleRadial:completeAnimation()
		toggleLinear:completeAnimation()
		toggleRadial:setAlpha( 0 )
		toggleLinear:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		RadialState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				toggleRadial:completeAnimation()
				self.toggleRadial:setAlpha( 1 )
				self.clipFinished( toggleRadial, {} )
				toggleLinear:completeAnimation()
				self.toggleLinear:setAlpha( 0 )
				self.clipFinished( toggleLinear, {} )
			end
		},
		LinearState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.toggleRadial:close()
		self.toggleLinear:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

