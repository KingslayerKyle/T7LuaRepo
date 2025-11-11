local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.FaceButtonWithKeyMouse = InheritFrom( LUI.UIElement )
CoD.FaceButtonWithKeyMouse.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonWithKeyMouse )
	self.id = "FaceButtonWithKeyMouse"
	self.soundSet = "Special_widgets"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	local KeyMouseImage = nil
	if IsPC() then
		KeyMouseImage = LUI.UIImage.new()
		KeyMouseImage:setLeftRight( 0, 1, 0, 0 )
		KeyMouseImage:setTopBottom( 0, 1, 0, 0 )
		KeyMouseImage:setImage( RegisterImage( "uie_smallsquarebutton" ) )
		self:addElement( KeyMouseImage )
		self.KeyMouseImage = KeyMouseImage
		
	else
		KeyMouseImage = LUI.UIElement.createFake()
		self.KeyMouseImage = KeyMouseImage
	end
	local ControllerImage = LUI.UIImage.new()
	ControllerImage:setLeftRight( 0, 1, 0, 0 )
	ControllerImage:setTopBottom( 0, 1, 0, 0 )
	ControllerImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	self.resetProperties = function ()
		KeyMouseImage:completeAnimation()
		ControllerImage:completeAnimation()
		KeyMouseImage:setRGB( 1, 1, 1 )
		KeyMouseImage:setAlpha( 1 )
		ControllerImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 1 or 0 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setAlpha( 0 )
				self.clipFinished( KeyMouseImage, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 2 or 1 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setAlpha( 0 )
				self.clipFinished( KeyMouseImage, {} )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end
		},
		KeyMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 2 or 1 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setRGB( 1, 0.41, 0 )
				self.clipFinished( KeyMouseImage, {} )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsGamepad( controller ) then
					f10_local0 = IsPC()
				else
					f10_local0 = false
				end
				return f10_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ControllerImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

