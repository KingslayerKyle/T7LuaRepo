require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Option_IconContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	Engine.ToggleMuteAllButParty( f1_arg2, f1_arg1.value )
end

local f0_local1 = function ( f2_arg0 )
	return {
		models = {
			name = Engine.Localize( "MENU_MUTE_ALL_EXCEPT_PARTY_OPTION" ),
			desc = Engine.Localize( "MENU_MUTE_ALL_EXCEPT_PARTY_OPTION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f2_arg0, "ChatOptions_MuteAllButParty", {
				{
					name = Engine.Localize( "MENU_OFF" ),
					value = 0
				},
				{
					name = Engine.Localize( "MENU_ON" ),
					value = 1
				}
			}, nil, nil, f0_local0 )
		},
		properties = {
			disabled = false
		}
	}
end

DataSources.OptionVoiceList = DataSourceHelpers.ListSetup( "OptionVoiceList", function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, f0_local1( f3_arg0 ) )
	return f3_local0
end, true )
LUI.createMenu.StartMenu_Options_Voice = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Voice" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setText( Engine.Localize( "MENU_VOICE" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 64, 734 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setDataSource( "OptionVoiceList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 1375, 1499 )
	Image:setTopBottom( true, false, -282.79, -158.79 )
	Image:setAlpha( 0 )
	self:addElement( Image )
	self.Image = Image
	
	local DescTitle = LUI.UIText.new()
	DescTitle:setLeftRight( true, false, 841.25, 1212 )
	DescTitle:setTopBottom( true, false, 111.21, 144 )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 842.25, 1183 )
	Desc:setTopBottom( true, false, 151, 172 )
	Desc:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VOICE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VOICE" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local StartMenuOptionIconContainer = CoD.StartMenu_Option_IconContainer.new( self, controller )
	StartMenuOptionIconContainer:setLeftRight( true, false, 724, 831 )
	StartMenuOptionIconContainer:setTopBottom( true, false, 108.5, 215.5 )
	self:addElement( StartMenuOptionIconContainer )
	self.StartMenuOptionIconContainer = StartMenuOptionIconContainer
	
	Image:linkToElementModel( ButtonList, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Image:setImage( RegisterImage( image ) )
		end
	end )
	DescTitle:linkToElementModel( ButtonList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			DescTitle:setText( Engine.Localize( name ) )
		end
	end )
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			Desc:setText( Engine.Localize( desc ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f12_local0 = nil
		ShowHeaderIconOnly( self )
		if not f12_local0 then
			f12_local0 = self:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	ButtonList.id = "ButtonList"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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
		element.StartMenuOptionIconContainer:close()
		element.Image:close()
		element.DescTitle:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Voice.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

