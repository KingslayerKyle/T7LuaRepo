local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( self, event )
		local leftContainer, clientList = nil
		local parent = self:getParent()
		while parent do
			if parent.LeftContainer and parent.ClientList then
				leftContainer = parent.LeftContainer
				clientList = parent.ClientList
				break
			end
			parent = parent:getParent()
		end
		if not parent then
			return 
		elseif self.currentState == "Active" then
			self:setState( "Inactive" )
			self:playClip( "Over" )
			parent:setState( "Left" )
			parent.defaultNav = "left"
			leftContainer:processEvent( {
				name = "gain_focus",
				controller = event.controller,
				isMouse = true
			} )
			clientList:processEvent( {
				name = "lose_focus",
				controller = event.controller,
				isMouse = true
			} )
		elseif self.currentState == "Inactive" then
			self:setState( "Active" )
			self:playClip( "Over" )
			parent:setState( "Right" )
			parent.defaultNav = "right"
			leftContainer:processEvent( {
				name = "lose_focus",
				controller = event.controller,
				isMouse = true
			} )
			clientList:processEvent( {
				name = "gain_focus",
				controller = event.controller,
				isMouse = true
			} )
		end
	end )
	self:registerEventHandler( "input_source_changed", function ( self, event )
		if event.source == 0 then
			self:setState( "DefaultState" )
		elseif event.menu.currentState == "Right" then
			self:setState( "Active" )
		else
			self:setState( "Inactive" )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		PCSpecific( self, controller )
	end
end

CoD.fe_InspectionViewButton = InheritFrom( LUI.UIElement )
CoD.fe_InspectionViewButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_InspectionViewButton )
	self.id = "fe_InspectionViewButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 45 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local arrowButton = LUI.UIImage.new()
	arrowButton:setLeftRight( 0, 1, 0, 0 )
	arrowButton:setTopBottom( 0, 1, 0, 0 )
	arrowButton:setZRot( 180 )
	arrowButton:setScale( 0.7 )
	arrowButton:setImage( RegisterImage( "uie_characterminiselectorarrow" ) )
	self:addElement( arrowButton )
	self.arrowButton = arrowButton
	
	self.resetProperties = function ()
		arrowButton:completeAnimation()
		arrowButton:setRGB( 1, 1, 1 )
		arrowButton:setAlpha( 1 )
		arrowButton:setZRot( 180 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setAlpha( 0 )
				self.clipFinished( arrowButton, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setZRot( 0 )
				self.clipFinished( arrowButton, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 0.45, 0 )
				self.arrowButton:setZRot( 0 )
				self.clipFinished( arrowButton, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 0.45, 0 )
				self.clipFinished( arrowButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f12_local0 = IsPC()
				if f12_local0 then
					if not IsGamepad( controller ) then
						f12_local0 = IsMenuInState( menu, "Right" )
					else
						f12_local0 = false
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "Inactive",
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

