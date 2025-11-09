require( "ui.uieditor.menus.CharacterCustomization.ChooseHead" )
require( "ui.uieditor.widgets.Heroes.chooseGenderButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Guide" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

LUI.createMenu.ChooseGender = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseGender" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseGender.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local genderList = LUI.UIList.new( self, controller, 25, 0, nil, false, false, 0, 0, false, false )
	genderList:makeFocusable()
	genderList:setLeftRight( false, false, -795, 815 )
	genderList:setTopBottom( false, true, -636, 0 )
	genderList:setDataSource( "GendersList" )
	genderList:setWidgetType( CoD.chooseGenderButton )
	genderList:setHorizontalCount( 3 )
	genderList:setSpacing( 25 )
	genderList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f3_local0 = nil
		SetElementProperty( element, "lostFocus", true )
		UpdateSelfElementState( self, element, controller )
		return f3_local0
	end )
	genderList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	genderList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( genderList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementPropertyEnumValue( element, "gender", Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID ) then
			SetCharacterModeToSessionMode( self, element, controller, Enum.eModes.MODE_CAMPAIGN )
			SelectGender( self, element, controller )
			SaveLoadout( self, controller )
			SetEdittingHeroFromStats( controller )
			RefreshCharacterCustomization( self, element, controller )
			NavigateToMenu( self, "ChooseHead", true, controller )
			ClearMenuSavedState( menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsElementPropertyEnumValue( element, "gender", Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( genderList )
	self.genderList = genderList
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_CREATE_OPERATIVE_CAPS" ) ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CREATE_OPERATIVE_CAPS" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FEGuide0 = CoD.FE_Guide.new( self, controller )
	FEGuide0:setLeftRight( true, false, 0, 1096 )
	FEGuide0:setTopBottom( true, false, 131.93, 610.93 )
	FEGuide0:setAlpha( 0 )
	self:addElement( FEGuide0 )
	self.FEGuide0 = FEGuide0
	
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f8_local0 = nil
		ShowHeaderKickerAndIcon( self )
		SetElementStateByElementName( self, "GenericMenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "GenericMenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		SetHeadingKickerTextToGameMode( "MENU_CP_OUTFITS" )
		SetHeadingKickerText( "MENU_CP_OUTFITS" )
		if not f8_local0 then
			f8_local0 = self:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	genderList.id = "genderList"
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
		self.genderList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.genderList:close()
		element.GenericMenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.FEGuide0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseGender.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

