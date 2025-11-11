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
	self:setLeftRight( 0, 0, 0, 321 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 0, 36 )
	buttonPromptImage:setTopBottom( 0, 0, 0, 36 )
	buttonPromptImage:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 62, 197 )
	label:setTopBottom( 0, 0, 3, 31 )
	label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		label:completeAnimation()
		label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_BLEND" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_STICKER" ) )
				self.clipFinished( label, {} )
			end
		},
		Blend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Sticker = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonPromptImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

