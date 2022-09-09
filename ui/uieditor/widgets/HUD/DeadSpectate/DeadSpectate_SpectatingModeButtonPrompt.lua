-- e9733c93a7a1da1cf96f269878fbc2a2
-- This hash is used for caching, delete to decompile the file again

CoD.DeadSpectate_SpectatingModeButtonPrompt = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingModeButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DeadSpectate_SpectatingModeButtonPrompt )
	self.id = "DeadSpectate_SpectatingModeButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 25 )
	self:setTopBottom( true, false, 0, 25 )
	
	local button = LUI.UIImage.new()
	button:setLeftRight( false, false, -12.5, 12.5 )
	button:setTopBottom( false, false, -12.5, 12.5 )
	button:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			button:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( button )
	self.button = button
	
	local buttonMouse = LUI.UIImage.new()
	buttonMouse:setLeftRight( false, false, -12.5, 12.5 )
	buttonMouse:setTopBottom( false, false, -17.5, 12.5 )
	buttonMouse:setAlpha( 0 )
	buttonMouse:subscribeToGlobalModel( controller, "Controller", "mouse_middle_button_image", function ( model )
		local mouseMiddleButtonImage = Engine.GetModelValue( model )
		if mouseMiddleButtonImage then
			buttonMouse:setImage( RegisterImage( mouseMiddleButtonImage ) )
		end
	end )
	self:addElement( buttonMouse )
	self.buttonMouse = buttonMouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				button:completeAnimation()
				self.button:setAlpha( 1 )
				self.clipFinished( button, {} )

				buttonMouse:completeAnimation()
				self.buttonMouse:setAlpha( 0 )
				self.clipFinished( buttonMouse, {} )
			end
		},
		KeyMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				button:completeAnimation()
				self.button:setAlpha( 0 )
				self.clipFinished( button, {} )

				buttonMouse:completeAnimation()
				self.buttonMouse:setAlpha( 1 )
				self.clipFinished( buttonMouse, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local3( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.button:close()
		element.buttonMouse:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
