-- 1005e23e79a970b22173fae5ac16acf5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

LUI.createMenu.GroupsMemberDetailsPopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupsMemberDetailsPopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupsMemberDetailsPopup.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 2, 720 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local Buttons = LUI.UIList.new( f1_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Buttons:makeFocusable()
	Buttons:setLeftRight( true, false, 64, 344 )
	Buttons:setTopBottom( true, false, 180, 484 )
	Buttons:setDataSource( "GroupsMemberDetailsButtons" )
	Buttons:setWidgetType( CoD.List1ButtonLarge_PH )
	Buttons:setVerticalCount( 9 )
	Buttons:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	Buttons:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( Buttons, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Buttons )
	self.Buttons = Buttons
	
	local playerInfo = CoD.Social_InfoPane.new( f1_local1, controller )
	playerInfo:setLeftRight( false, true, -811, -64 )
	playerInfo:setTopBottom( true, false, 180, 480 )
	playerInfo.friendship:setAlpha( 0 )
	playerInfo:subscribeToGlobalModel( controller, "SocialPlayerInfo", nil, function ( model )
		playerInfo:setModel( model, controller )
	end )
	playerInfo:mergeStateConditions( {
		{
			stateName = "PlayerDetails",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 0, 0 )
	Image1:setTopBottom( false, true, -188.84, -182.84 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 0, 0 )
	Image2:setTopBottom( false, true, -592.84, -586.84 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	Buttons.navigation = {
		right = playerInfo
	}
	playerInfo.navigation = {
		left = Buttons
	}
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	Buttons.id = "Buttons"
	playerInfo.id = "playerInfo"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.Buttons:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Buttons:close()
		element.playerInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupsMemberDetailsPopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

