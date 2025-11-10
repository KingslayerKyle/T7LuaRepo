local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		local f2_local0, f2_local1 = nil
		local f2_local2 = element:getParent()
		while f2_local2 do
			if f2_local2.LeftContainer and f2_local2.ClientList then
				f2_local0 = f2_local2.LeftContainer
				f2_local1 = f2_local2.ClientList
				break
			end
			f2_local2 = f2_local2:getParent()
		end
		if not f2_local2 then
			return 
		elseif element.currentState == "Active" then
			element:setState( "Inactive" )
			element:playClip( "Over" )
			f2_local2:setState( "Left" )
			f2_local2.defaultNav = "left"
			f2_local0:processEvent( {
				name = "gain_focus",
				controller = event.controller,
				isMouse = true
			} )
			f2_local1:processEvent( {
				name = "lose_focus",
				controller = event.controller,
				isMouse = true
			} )
		elseif element.currentState == "Inactive" then
			element:setState( "Active" )
			element:playClip( "Over" )
			f2_local2:setState( "Right" )
			f2_local2.defaultNav = "right"
			f2_local0:processEvent( {
				name = "lose_focus",
				controller = event.controller,
				isMouse = true
			} )
			f2_local1:processEvent( {
				name = "gain_focus",
				controller = event.controller,
				isMouse = true
			} )
		end
	end )
	f1_arg0:registerEventHandler( "input_source_changed", function ( element, event )
		if event.source == 0 then
			element:setState( "DefaultState" )
		elseif event.menu.currentState == "Right" then
			element:setState( "Active" )
		else
			element:setState( "Inactive" )
		end
	end )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	if CoD.isPC then
		f0_local0( f4_arg0, f4_arg1 )
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
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 30 )
	
	local arrowButton = LUI.UIImage.new()
	arrowButton:setLeftRight( true, true, 0, 0 )
	arrowButton:setTopBottom( true, true, 0, 0 )
	arrowButton:setZRot( 180 )
	arrowButton:setScale( 0.7 )
	arrowButton:setImage( RegisterImage( "uie_characterminiselectorarrow" ) )
	self:addElement( arrowButton )
	self.arrowButton = arrowButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setAlpha( 0 )
				self.clipFinished( arrowButton, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 1, 1 )
				self.arrowButton:setAlpha( 1 )
				self.arrowButton:setZRot( 0 )
				self.clipFinished( arrowButton, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 0.45, 0 )
				self.arrowButton:setAlpha( 1 )
				self.arrowButton:setZRot( 0 )
				self.clipFinished( arrowButton, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 1, 1 )
				self.arrowButton:setAlpha( 1 )
				self.arrowButton:setZRot( 180 )
				self.clipFinished( arrowButton, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 0.45, 0 )
				self.arrowButton:setAlpha( 1 )
				self.arrowButton:setZRot( 180 )
				self.clipFinished( arrowButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f11_local0 = IsPC()
				if f11_local0 then
					if not IsGamepad( controller ) then
						f11_local0 = IsMenuInState( menu, "Right" )
					else
						f11_local0 = false
					end
				end
				return f11_local0
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
		local f5_local2 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f5_local2( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

