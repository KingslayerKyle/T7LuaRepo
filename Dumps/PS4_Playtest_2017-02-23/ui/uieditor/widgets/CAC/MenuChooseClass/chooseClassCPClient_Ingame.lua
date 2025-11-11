require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassCPClientPip_Ingame" )

local PreLoadFunc = function ( self, controller )
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local cpClientLoadoutMenuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	local myClientIndex = 1
	local numActiveClients = 0
	for index = 1, #clients, 1 do
		local client = clients[index]
		if Engine.IsSharedLoadoutAvailableForClient( controller, client.xuid ) then
			local clientModel = Engine.CreateModel( cpClientLoadoutMenuModel, "client" .. index )
			local clientXuidModel = Engine.CreateModel( clientModel, "xuid" )
			Engine.SetModelValue( clientXuidModel, client.xuid )
			local clientGamertagModel = Engine.CreateModel( clientModel, "gamertag" )
			Engine.SetModelValue( clientGamertagModel, client.gamertag )
			if client.isLocal == 1 and client.localController == controller then
				myClientIndex = index
				local myClientModel = Engine.CreateModel( cpClientLoadoutMenuModel, "myClientIndex" )
				Engine.SetModelValue( myClientModel, myClientIndex )
			end
			numActiveClients = numActiveClients + 1
		end
	end
	local numClientsModel = Engine.CreateModel( cpClientLoadoutMenuModel, "numActiveClients" )
	Engine.SetModelValue( numClientsModel, numActiveClients )
	local selectedClientModel = Engine.CreateModel( cpClientLoadoutMenuModel, "selectedClientIndex" )
	Engine.SetModelValue( selectedClientModel, myClientIndex )
	CoD.CACUtility.ResetCPCustomClasses( controller )
end

local PostLoadFunc = function ( self, controller )
	local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	if cpClientLoadoutMenuModel then
		local selectedClientModel = Engine.GetModel( cpClientLoadoutMenuModel, "selectedClientIndex" )
		if selectedClientModel then
			local myClientIndex = Engine.GetModelValue( selectedClientModel )
			local clientModel = Engine.GetModel( cpClientLoadoutMenuModel, "client" .. myClientIndex )
			if clientModel then
				self:setModel( clientModel )
			end
		end
	end
end

CoD.chooseClassCPClient_Ingame = InheritFrom( LUI.UIElement )
CoD.chooseClassCPClient_Ingame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassCPClient_Ingame )
	self.id = "chooseClassCPClient_Ingame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local LBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LBBumperButtonWithKeyMouse:setLeftRight( 0, 0, 0, 68 )
	LBBumperButtonWithKeyMouse:setTopBottom( 0, 0, -0.5, 44.5 )
	LBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LBBumperButtonWithKeyMouse )
	self.LBBumperButtonWithKeyMouse = LBBumperButtonWithKeyMouse
	
	local RBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RBBumperButtonWithKeyMouse:setLeftRight( 1, 1, -68, 0 )
	RBBumperButtonWithKeyMouse:setTopBottom( 0, 0, -0.5, 44.5 )
	RBBumperButtonWithKeyMouse.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RBBumperButtonWithKeyMouse )
	self.RBBumperButtonWithKeyMouse = RBBumperButtonWithKeyMouse
	
	local clientTitle = LUI.UIText.new()
	clientTitle:setLeftRight( 0, 0, 67, 352 )
	clientTitle:setTopBottom( 0, 0, 9, 36 )
	clientTitle:setTTF( "fonts/default.ttf" )
	clientTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	clientTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	clientTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			clientTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( clientTitle )
	self.clientTitle = clientTitle
	
	local pipList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	pipList:setLeftRight( 0, 0, 183, 237 )
	pipList:setTopBottom( 0, 0, 46, 58 )
	pipList:setWidgetType( CoD.chooseClassCPClientPip_Ingame )
	pipList:setHorizontalCount( 4 )
	pipList:setDataSource( "ChooseClassClients" )
	self:addElement( pipList )
	self.pipList = pipList
	
	self.resetProperties = function ()
		LBBumperButtonWithKeyMouse:completeAnimation()
		RBBumperButtonWithKeyMouse:completeAnimation()
		clientTitle:completeAnimation()
		pipList:completeAnimation()
		LBBumperButtonWithKeyMouse:setAlpha( 1 )
		RBBumperButtonWithKeyMouse:setAlpha( 1 )
		clientTitle:setAlpha( 1 )
		pipList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				LBBumperButtonWithKeyMouse:completeAnimation()
				self.LBBumperButtonWithKeyMouse:setAlpha( 0 )
				self.clipFinished( LBBumperButtonWithKeyMouse, {} )
				RBBumperButtonWithKeyMouse:completeAnimation()
				self.RBBumperButtonWithKeyMouse:setAlpha( 0 )
				self.clipFinished( RBBumperButtonWithKeyMouse, {} )
				clientTitle:completeAnimation()
				self.clientTitle:setAlpha( 0 )
				self.clipFinished( clientTitle, {} )
				pipList:completeAnimation()
				self.pipList:setAlpha( 0 )
				self.clipFinished( pipList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CanUseSharedLoadouts( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LBBumperButtonWithKeyMouse:close()
		self.RBBumperButtonWithKeyMouse:close()
		self.pipList:close()
		self.clientTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

