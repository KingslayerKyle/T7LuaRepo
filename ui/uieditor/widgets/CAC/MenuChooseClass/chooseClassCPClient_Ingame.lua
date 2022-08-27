-- 25fe0c553057b14c9b397258293e5319
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassCPClientPip_Ingame" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local1 = f1_local0.sessionClients
	local f1_local2 = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	local f1_local3 = 1
	local f1_local4 = 0
	for f1_local5 = 1, #f1_local1, 1 do
		local f1_local8 = f1_local1[f1_local5]
		if Engine.IsSharedLoadoutAvailableForClient( controller, f1_local8.xuid ) then
			local f1_local9 = Engine.CreateModel( f1_local2, "client" .. f1_local5 )
			Engine.SetModelValue( Engine.CreateModel( f1_local9, "xuid" ), f1_local8.xuid )
			Engine.SetModelValue( Engine.CreateModel( f1_local9, "gamertag" ), f1_local8.gamertag )
			if f1_local8.isLocal == 1 and f1_local8.localController == controller then
				Engine.SetModelValue( Engine.CreateModel( f1_local2, "myClientIndex" ), f1_local5 )
			end
			f1_local4 = f1_local4 + 1
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f1_local2, "numActiveClients" ), f1_local4 )
	Engine.SetModelValue( Engine.CreateModel( f1_local2, "selectedClientIndex" ), f1_local3 )
	CoD.CACUtility.ResetCPCustomClasses( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "ChooseClassCPClientMenu" )
	if f2_local0 then
		local f2_local1 = Engine.GetModel( f2_local0, "selectedClientIndex" )
		if f2_local1 then
			local f2_local2 = Engine.GetModel( f2_local0, "client" .. Engine.GetModelValue( f2_local1 ) )
			if f2_local2 then
				f2_arg0:setModel( f2_local2 )
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
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local LBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LBBumperButtonWithKeyMouse:setLeftRight( true, false, 0, 45 )
	LBBumperButtonWithKeyMouse:setTopBottom( true, false, 0, 30 )
	LBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LBBumperButtonWithKeyMouse:registerEventHandler( "button_action", function ( element, event )
		local f5_local0 = nil
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( LBBumperButtonWithKeyMouse )
	self.LBBumperButtonWithKeyMouse = LBBumperButtonWithKeyMouse
	
	local RBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RBBumperButtonWithKeyMouse:setLeftRight( false, true, -45, 0 )
	RBBumperButtonWithKeyMouse:setTopBottom( true, false, 0, 30 )
	RBBumperButtonWithKeyMouse.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RBBumperButtonWithKeyMouse:registerEventHandler( "button_action", function ( element, event )
		local f7_local0 = nil
		if IsCampaign() and CanUseSharedLoadouts( controller ) then
			SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( RBBumperButtonWithKeyMouse )
	self.RBBumperButtonWithKeyMouse = RBBumperButtonWithKeyMouse
	
	local clientTitle = LUI.UIText.new()
	clientTitle:setLeftRight( true, false, 45, 235 )
	clientTitle:setTopBottom( true, false, 6, 24 )
	clientTitle:setTTF( "fonts/default.ttf" )
	clientTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	clientTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	clientTitle:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			clientTitle:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( clientTitle )
	self.clientTitle = clientTitle
	
	local pipList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	pipList:setLeftRight( true, false, 121, 159 )
	pipList:setTopBottom( true, false, 31, 39 )
	pipList:setDataSource( "ChooseClassClients" )
	pipList:setWidgetType( CoD.chooseClassCPClientPip_Ingame )
	pipList:setHorizontalCount( 4 )
	self:addElement( pipList )
	self.pipList = pipList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LBBumperButtonWithKeyMouse:completeAnimation()
				self.LBBumperButtonWithKeyMouse:setAlpha( 1 )
				self.clipFinished( LBBumperButtonWithKeyMouse, {} )
				RBBumperButtonWithKeyMouse:completeAnimation()
				self.RBBumperButtonWithKeyMouse:setAlpha( 1 )
				self.clipFinished( RBBumperButtonWithKeyMouse, {} )
				clientTitle:completeAnimation()
				self.clientTitle:setAlpha( 1 )
				self.clipFinished( clientTitle, {} )
				pipList:completeAnimation()
				self.pipList:setAlpha( 1 )
				self.clipFinished( pipList, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LBBumperButtonWithKeyMouse:close()
		element.RBBumperButtonWithKeyMouse:close()
		element.pipList:close()
		element.clientTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

