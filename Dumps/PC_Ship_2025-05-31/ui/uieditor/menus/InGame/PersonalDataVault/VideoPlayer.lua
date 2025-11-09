require( "ui.uieditor.widgets.Terminal.VideoPlayerWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = self
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VideoPlayer.buttonPrompts" )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		return false
	end, false )
	f1_local0:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
end

LUI.createMenu.VideoPlayer = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VideoPlayer" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VideoPlayer.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local VideoPlayerWidget0 = CoD.VideoPlayerWidget.new( self, controller )
	VideoPlayerWidget0:setLeftRight( false, false, -380, 520 )
	VideoPlayerWidget0:setTopBottom( true, false, 85, 685 )
	Engine.SetupUI3DWindow( controller, 5, 900, 600 )
	VideoPlayerWidget0:setUI3DWindow( 5 )
	self:addElement( VideoPlayerWidget0 )
	self.VideoPlayerWidget0 = VideoPlayerWidget0
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SizeToSafeArea( element, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	VideoPlayerWidget0.id = "VideoPlayerWidget0"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.VideoPlayerWidget0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VideoPlayerWidget0:close()
		element.feFooterContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VideoPlayer.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

