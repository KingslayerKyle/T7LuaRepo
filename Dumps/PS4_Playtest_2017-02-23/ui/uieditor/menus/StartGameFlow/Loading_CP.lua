require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenSharedCPZM" )

LUI.createMenu.Loading_CP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Loading_CP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Loading_CP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LoadingScreenSharedCPZM = CoD.LoadingScreenSharedCPZM.new( self, controller )
	LoadingScreenSharedCPZM:setLeftRight( 0, 0, 0, 1920 )
	LoadingScreenSharedCPZM:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( LoadingScreenSharedCPZM )
	self.LoadingScreenSharedCPZM = LoadingScreenSharedCPZM
	
	self:registerEventHandler( "loading_startplay", function ( element, event )
		local retVal = nil
		CoD.HUDUtility.StartPlay( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ESCAPE", function ( element, menu, controller, model )
		CoD.HUDUtility.StartPlay( element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	LoadingScreenSharedCPZM.id = "LoadingScreenSharedCPZM"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenSharedCPZM:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Loading_CP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

