require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.menus.CPLevels.CPSelectDifficulty" )
require( "ui.uieditor.widgets.Heroes.chooseFaceOption" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
	Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" )
end

LUI.createMenu.ChooseHead = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseHead" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseHead.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 425 )
	LeftPanel:setTopBottom( true, false, 78, 666 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 75, 413 )
	selectionList:setTopBottom( true, false, 138, 591 )
	selectionList:setDataSource( "HeroFaceButtonList" )
	selectionList:setWidgetType( CoD.chooseFaceOption )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:linkToElementModel( selectionList, "disabled", true, function ( model )
		local f3_local0 = selectionList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" ), function ( model )
		local f4_local0 = selectionList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowCPConfirm"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		HeadHighlighted( self, element, controller )
		return f5_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) and not IsInGame() and IsGlobalModelValueTrue( element, controller, "firstTimeFlowCPConfirm" ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SelectHead( self, element, controller )
			SaveLoadout( self, controller )
			RefreshCharacterCustomization( self, element, controller )
			GoBackToMenu( menu, controller, "CPConfirmSelection" )
			return true
		elseif not IsDisabled( element, controller ) and IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and not IsInGame() then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SelectHead( self, element, controller )
			SaveLoadout( self, controller )
			RefreshCharacterCustomization( self, element, controller )
			NavigateToMenu( self, "CPSelectDifficulty", true, controller )
			return true
		elseif not IsDisabled( element, controller ) then
			SendClientScriptMenuChangeNotify( controller, menu, false )
			SelectHead( self, element, controller )
			UploadStats( self, controller )
			RefreshCharacterCustomization( self, element, controller )
			GoBackToMenu( menu, controller, "PersonalizeCharacter" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) and not IsInGame() and IsGlobalModelValueTrue( element, controller, "firstTimeFlowCPConfirm" ) then
			return true
		elseif not IsDisabled( element, controller ) and IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) and not IsInGame() then
			return true
		elseif not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "HEROES_SELECT_HEAD" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_CHOOSE_HEAD" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f10_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f10_local0 then
			f10_local0 = self:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	selectionList.id = "selectionList"
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.selectionList:close()
		element.GenericMenuFrame0:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseHead.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

