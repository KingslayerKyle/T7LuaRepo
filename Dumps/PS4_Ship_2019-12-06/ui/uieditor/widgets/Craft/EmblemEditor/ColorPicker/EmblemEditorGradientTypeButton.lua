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
	self:setLeftRight( true, false, 0, 423 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local toggleRadial = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleRadial:setLeftRight( true, false, 6, 417 )
	toggleRadial:setTopBottom( true, false, 5.5, 31.5 )
	toggleRadial:setAlpha( 0 )
	toggleRadial.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_RADIAL_GRADIENT" ) )
	toggleRadial:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local moveLeftStickButtonImage = Engine.GetModelValue( model )
		if moveLeftStickButtonImage then
			toggleRadial.buttonPromptImage:setImage( RegisterImage( moveLeftStickButtonImage ) )
		end
	end )
	self:addElement( toggleRadial )
	self.toggleRadial = toggleRadial
	
	local toggleLinear = CoD.PaintshopButtonPrompt.new( menu, controller )
	toggleLinear:setLeftRight( true, false, 6, 417 )
	toggleLinear:setTopBottom( true, false, 5.5, 31.5 )
	toggleLinear.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_LINAR_GRADIENT" ) )
	toggleLinear:subscribeToGlobalModel( controller, "Controller", "move_left_stick_button_image", function ( model )
		local moveLeftStickButtonImage = Engine.GetModelValue( model )
		if moveLeftStickButtonImage then
			toggleLinear.buttonPromptImage:setImage( RegisterImage( moveLeftStickButtonImage ) )
		end
	end )
	self:addElement( toggleLinear )
	self.toggleLinear = toggleLinear
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		RadialState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				toggleRadial:completeAnimation()
				self.toggleRadial:setAlpha( 0 )
				self.clipFinished( toggleRadial, {} )
				toggleLinear:completeAnimation()
				self.toggleLinear:setAlpha( 1 )
				self.clipFinished( toggleLinear, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.toggleRadial:close()
		element.toggleLinear:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

