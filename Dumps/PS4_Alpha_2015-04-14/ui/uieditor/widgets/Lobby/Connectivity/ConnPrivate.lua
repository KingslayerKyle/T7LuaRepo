require( "ui.uieditor.widgets.Lobby.Connectivity.ConnBlip" )

CoD.ConnPrivate = InheritFrom( LUI.UIElement )
CoD.ConnPrivate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ConnPrivate )
	self.id = "ConnPrivate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local ConnectivityBlip0 = CoD.ConnBlip.new( menu, controller )
	ConnectivityBlip0:setLeftRight( true, false, 12, 21 )
	ConnectivityBlip0:setTopBottom( true, false, 2, 10 )
	ConnectivityBlip0:setRGB( 1, 1, 1 )
	ConnectivityBlip0:registerEventHandler( "lobby_data_host_privateLobby", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "ConnectivityBlip0",
			clipName = "DataTransmitted"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ConnectivityBlip0:registerEventHandler( "lobby_data_silent_privateLobby", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "ConnectivityBlip0",
			clipName = "ServerSilent"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ConnectivityBlip0 )
	self.ConnectivityBlip0 = ConnectivityBlip0
	
	local ConnectivityBlip1 = CoD.ConnBlip.new( menu, controller )
	ConnectivityBlip1:setLeftRight( true, false, 1, 10 )
	ConnectivityBlip1:setTopBottom( true, false, 11, 19 )
	ConnectivityBlip1:setRGB( 1, 1, 1 )
	ConnectivityBlip1:registerEventHandler( "lobby_data_client_privateLobby", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "ConnectivityBlip1",
			clipName = "DataTransmitted"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ConnectivityBlip1 )
	self.ConnectivityBlip1 = ConnectivityBlip1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 10, 16 )
	Image0:setTopBottom( true, false, 15, 16 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.14 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 16, 17 )
	Image1:setTopBottom( true, false, 10, 16 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0.14 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.close = function ( self )
		self.ConnectivityBlip0:close()
		self.ConnectivityBlip1:close()
		CoD.ConnPrivate.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

