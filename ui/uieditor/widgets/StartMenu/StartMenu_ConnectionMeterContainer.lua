-- 6cc4f91ac9d7374f8fc733cc09f32aa8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_ConnectionMeter" )

CoD.StartMenu_ConnectionMeterContainer = InheritFrom( LUI.UIElement )
CoD.StartMenu_ConnectionMeterContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_ConnectionMeterContainer )
	self.id = "StartMenu_ConnectionMeterContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuConnectionMeter0 = CoD.StartMenu_ConnectionMeter.new( menu, controller )
	StartMenuConnectionMeter0:setLeftRight( true, false, 0, 310 )
	StartMenuConnectionMeter0:setTopBottom( true, false, 30, 195 )
	self:addElement( StartMenuConnectionMeter0 )
	self.StartMenuConnectionMeter0 = StartMenuConnectionMeter0
	
	local ConnectionMeterLabel = LUI.UITightText.new()
	ConnectionMeterLabel:setLeftRight( true, false, 0, 121 )
	ConnectionMeterLabel:setTopBottom( true, false, 0, 25 )
	ConnectionMeterLabel:setText( Engine.Localize( "MPUI_CONNECTION_METER_CAPS" ) )
	ConnectionMeterLabel:setTTF( "fonts/default.ttf" )
	self:addElement( ConnectionMeterLabel )
	self.ConnectionMeterLabel = ConnectionMeterLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuConnectionMeter0:completeAnimation()
				self.StartMenuConnectionMeter0:setAlpha( 0 )
				self.clipFinished( StartMenuConnectionMeter0, {} )
				ConnectionMeterLabel:completeAnimation()
				self.ConnectionMeterLabel:setAlpha( 0 )
				self.clipFinished( ConnectionMeterLabel, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuConnectionMeter0:completeAnimation()
				self.StartMenuConnectionMeter0:setAlpha( 1 )
				self.clipFinished( StartMenuConnectionMeter0, {} )
				ConnectionMeterLabel:completeAnimation()
				self.ConnectionMeterLabel:setAlpha( 1 )
				self.clipFinished( ConnectionMeterLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ConnectionMeter_isEnabled( element, controller ) and not IsLobbyGameHost()
			end
		}
	} )
	if self.m_eventHandlers.on_session_start then
		local f1_local3 = self.m_eventHandlers.on_session_start
		self:registerEventHandler( "on_session_start", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local3( element, event )
		end )
	else
		self:registerEventHandler( "on_session_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.on_session_end then
		local f1_local3 = self.m_eventHandlers.on_session_end
		self:registerEventHandler( "on_session_end", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local3( element, event )
		end )
	else
		self:registerEventHandler( "on_session_end", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuConnectionMeter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

