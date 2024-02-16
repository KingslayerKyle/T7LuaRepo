-- 5ac8095c24b552b94fa11a2eba10f644
-- This hash is used for caching, delete to decompile the file again

CoD.PaintshopBlendButtonPrompt = InheritFrom( LUI.UIElement )
CoD.PaintshopBlendButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.PaintshopBlendButtonPrompt )
	self.id = "PaintshopBlendButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 24 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 0, 24 )
	buttonPromptImage:setTopBottom( true, false, 0, 24 )
	buttonPromptImage:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 41, 131 )
	label:setTopBottom( true, false, 2, 21 )
	label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_STICKER" ) )
				self.clipFinished( label, {} )
			end
		},
		Blend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				label:completeAnimation()
				self.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
				self.clipFinished( label, {} )
			end
		},
		Sticker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				label:completeAnimation()
				self.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_STICKER" ) )
				self.clipFinished( label, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Blend",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "blend", 0 )
			end
		},
		{
			stateName = "Sticker",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "blend", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "blend", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "blend"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonPromptImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
