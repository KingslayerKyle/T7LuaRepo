-- e99c5c487af5712dd478f597b0e4e03b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CPLevels.CPSelectPublicGameInfo" )

LUI.createMenu.CPPublicGameSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPPublicGameSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPPublicGameSelect.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.85 )
	self:addElement( black )
	self.black = black
	
	local Smoke = LUI.UIImage.new()
	Smoke:setLeftRight( true, true, 0, 0 )
	Smoke:setTopBottom( true, true, 0, 0 )
	Smoke:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( Smoke )
	self.Smoke = Smoke
	
	local ButtonList = LUI.UIList.new( f1_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 75, 307 )
	ButtonList:setTopBottom( true, false, 146, 620 )
	ButtonList:setDataSource( "CPPublicGameSelectionList" )
	ButtonList:setWidgetType( CoD.list1ButtonNewStyle )
	ButtonList:setVerticalCount( 14 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	ButtonList:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsElementPropertyValue( element, "classified", true )
			end
		}
	} )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PUBLIC_GAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PUBLIC_GAMES_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CPSelectPublicGameInfo = CoD.CPSelectPublicGameInfo.new( f1_local1, controller )
	CPSelectPublicGameInfo:setLeftRight( true, false, 347, 1216 )
	CPSelectPublicGameInfo:setTopBottom( true, false, 135, 552 )
	self:addElement( CPSelectPublicGameInfo )
	self.CPSelectPublicGameInfo = CPSelectPublicGameInfo
	
	CPSelectPublicGameInfo:linkToElementModel( ButtonList, nil, false, function ( model )
		CPSelectPublicGameInfo:setModel( model, controller )
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.CPSelectPublicGameInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPPublicGameSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

