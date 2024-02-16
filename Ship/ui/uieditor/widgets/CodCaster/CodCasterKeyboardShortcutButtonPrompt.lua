-- 09223bf2c505e2b87c67f881b6ba0e58
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FooterButtonPromptWithPCKey" )

CoD.CodCasterKeyboardShortcutButtonPrompt = InheritFrom( LUI.UIElement )
CoD.CodCasterKeyboardShortcutButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterKeyboardShortcutButtonPrompt )
	self.id = "CodCasterKeyboardShortcutButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 140 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local FooterButtonPromptWithPCKey0 = CoD.FooterButtonPromptWithPCKey.new( menu, controller )
	FooterButtonPromptWithPCKey0:setLeftRight( true, false, 0, 140 )
	FooterButtonPromptWithPCKey0:setTopBottom( true, false, 0, 32 )
	FooterButtonPromptWithPCKey0.label:setText( Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS" ) )
	FooterButtonPromptWithPCKey0.keyPrompt.keybind:setText( Engine.Localize( "K" ) )
	FooterButtonPromptWithPCKey0:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			FooterButtonPromptWithPCKey0.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	FooterButtonPromptWithPCKey0:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FooterButtonPromptWithPCKey0 )
	self.FooterButtonPromptWithPCKey0 = FooterButtonPromptWithPCKey0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FooterButtonPromptWithPCKey0:completeAnimation()
				self.FooterButtonPromptWithPCKey0:setAlpha( 0 )
				self.clipFinished( FooterButtonPromptWithPCKey0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FooterButtonPromptWithPCKey0:completeAnimation()
				self.FooterButtonPromptWithPCKey0:setAlpha( 1 )
				self.clipFinished( FooterButtonPromptWithPCKey0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "consoleKeyboardConnected" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "consoleKeyboardConnected" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "consoleKeyboardConnected"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FooterButtonPromptWithPCKey0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
