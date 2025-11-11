CoD.chooseCharacterLoadoutBumper_Internal = InheritFrom( LUI.UIElement )
CoD.chooseCharacterLoadoutBumper_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.chooseCharacterLoadoutBumper_Internal )
	self.id = "chooseCharacterLoadoutBumper_Internal"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local button = LUI.UIImage.new()
	button:setLeftRight( 0, 1, 0, 0 )
	button:setTopBottom( 0, 1, 0, 0 )
	self:addElement( button )
	self.button = button
	
	self.resetProperties = function ()
		button:completeAnimation()
		button:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HiddenPC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				button:completeAnimation()
				self.button:setAlpha( 0 )
				self.clipFinished( button, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HiddenPC",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

