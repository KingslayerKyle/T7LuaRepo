require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.menus.CPLevels.CPSelectDifficulty" )
require( "ui.uieditor.widgets.Heroes.chooseFaceOption" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

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
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseHead.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 425 )
	LeftPanel:setTopBottom( true, true, 80, 0 )
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
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_CREATE_OPERATIVE_CAPS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CREATE_OPERATIVE_CAPS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 144, 344 )
	verticalCounter0:setTopBottom( true, false, 611.49, 636.49 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		SetAsListVerticalCounter( self, element, "selectionList" )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local SelectFaceTxt = LUI.UIText.new()
	SelectFaceTxt:setLeftRight( true, false, 75, 275 )
	SelectFaceTxt:setTopBottom( true, false, 96.23, 120.23 )
	SelectFaceTxt:setText( Engine.Localize( "MENU_SELECT_FACE_CAPS" ) )
	SelectFaceTxt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SelectFaceTxt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SelectFaceTxt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelectFaceTxt )
	self.SelectFaceTxt = SelectFaceTxt
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f11_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame0", controller, "update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerTextToGameMode( "MENU_CP_OUTFITS" )
		SetHeadingKickerText( "MENU_CP_OUTFITS" )
		if not f11_local0 then
			f11_local0 = self:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	selectionList.id = "selectionList"
	GenericMenuFrame:setModel( self.buttonModel, controller )
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
		element.GenericMenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.verticalCounter0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseHead.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

