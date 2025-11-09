require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

local CreateOptionDataSource = function ( dataSourceName, options )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

local CreateChatModels = function ()
	local toggle = {
		{
			name = Engine.Localize( "MENU_NORMAL" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_MUTE_ALL" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_CHAT_OPTION" ),
			desc = Engine.Localize( "MENU_CHAT_OPTION_DESC" ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CreateOptionDataSource( "ChatOptions_Mute", toggle )
		},
		properties = {
			disabled = true
		}
	}
	return listInfo
end

local PrepareChatOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateChatModels() )
	return optionsTable
end

DataSources.OptionVoiceList = DataSourceHelpers.ListSetup( "OptionVoiceList", PrepareChatOptions, true )
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
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( true, true, 0, 0 )
	MenuTitleBackground:setTopBottom( false, false, -336, -276 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local TitleText = LUI.UIText.new()
	TitleText:setLeftRight( true, false, 64, 1280 )
	TitleText:setTopBottom( true, false, 31, 75 )
	TitleText:setRGB( 1, 1, 1 )
	TitleText:setText( Engine.Localize( "MENU_VOICE" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( true, true, -3.63, 0 )
	ButtonBarBackground:setTopBottom( false, false, 295, 325 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 64, 734 )
	ButtonList:setTopBottom( true, false, 107.5, 618.5 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "OptionVoiceList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 706.39, 830.39 )
	Image:setTopBottom( true, false, 109.21, 233.21 )
	Image:setRGB( 1, 1, 1 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image )
	self.Image = Image
	
	local DescTitle = LUI.UIText.new()
	DescTitle:setLeftRight( true, false, 845.25, 1216 )
	DescTitle:setTopBottom( true, false, 108.21, 141 )
	DescTitle:setRGB( 1, 1, 1 )
	DescTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 845.25, 1216 )
	Desc:setTopBottom( true, false, 141, 162 )
	Desc:setRGB( 1, 1, 1 )
	Desc:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	Image:linkToElementModel( ButtonList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	DescTitle:linkToElementModel( ButtonList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DescTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	Desc:linkToElementModel( ButtonList, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.start = function ( menu, element, event )
		menu:addButtonPrompt( "start", Engine.Localize( "MENU_DISMISS_MENU" ), "M", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.start( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "start" or event.button == "key_shortcut" and event.key == "M") then
			CloseStartMenu( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ButtonList.id = "ButtonList"
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
	self.close = function ( self )
		self.ButtonList:close()
		self.Image:close()
		self.DescTitle:close()
		self.Desc:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

