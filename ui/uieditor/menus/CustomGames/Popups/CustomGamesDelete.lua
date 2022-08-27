-- 9e297f8f4786b8557de61e7840bce7d4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_ND" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.CustomGamesDelete = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CustomGamesDelete" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomGamesDelete.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( f1_local1, controller )
	FullscreenPopupTemplate:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate.RedLine:setRGB( ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b )
	FullscreenPopupTemplate.ButtonList:setDataSource( "CustomGamesOptionsDeleteButtonList" )
	FullscreenPopupTemplate.WorkingTitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_DELETE" ) )
	FullscreenPopupTemplate.Title:setText( Engine.Localize( "MENU_CUSTOMGAMES_DELETE" ) )
	FullscreenPopupTemplate.Subtitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_DELETE_DESC" ) )
	FullscreenPopupTemplate.DoneTitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_DELETE_DONE" ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( Engine.Localize( "MENU_CUSTOMGAMES_DELETE_ERROR" ) )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local BtnPublish = CoD.List1ButtonLarge_Left_ND.new( f1_local1, controller )
	BtnPublish:setLeftRight( true, false, 457.96, 737.96 )
	BtnPublish:setTopBottom( true, false, 487, 518 )
	BtnPublish:setAlpha( 0 )
	BtnPublish.btnDisplayText:setText( Engine.Localize( "MENU_SAVE" ) )
	BtnPublish.btnDisplayTextStroke:setText( Engine.Localize( "MENU_SAVE" ) )
	BtnPublish:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	BtnPublish:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( BtnPublish, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		SaveCustomGameYes( self, f4_arg0, f4_arg2, "", f4_arg1 )
		Close( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	BtnPublish:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( BtnPublish )
	self.BtnPublish = BtnPublish
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	FullscreenPopupTemplate.navigation = {
		left = BtnPublish,
		down = BtnPublish
	}
	BtnPublish.navigation = {
		up = FullscreenPopupTemplate,
		right = FullscreenPopupTemplate
	}
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		GoBack( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	BtnPublish.id = "BtnPublish"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate:close()
		element.BtnPublish:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CustomGamesDelete.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

