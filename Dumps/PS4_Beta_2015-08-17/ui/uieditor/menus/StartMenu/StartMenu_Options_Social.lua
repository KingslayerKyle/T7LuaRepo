require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local CreateModels_Link_YouTube = function ()
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_YOUTUBE" ),
			desc = Engine.Localize( "MENU_LINK_YOUTUBE_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( controller )
				if not Engine.IsYouTubeAccountChecked( controller ) or not Engine.IsYouTubeAccountRegistered( controller ) then
					self:openPopup( "YouTube_Connect", controller )
				else
					self:openPopup( "YouTube_UnRegister", controller )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	end
	return listInfo
end

local CreateModels_Link_Twitter = function ()
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_TWITTER" ),
			desc = Engine.Localize( "MENU_LINK_TWITTER_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( controller )
				if not Engine.IsTwitterAccountChecked( controller ) or not Engine.IsTwitterAccountRegistered( controller ) then
					self:openPopup( "Twitter_Connect", controller )
				else
					self:openPopup( "Twitter_UnRegister", controller )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	end
	return listInfo
end

local CreateModels_Link_Twitch = function ()
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_TWITCH" ),
			desc = Engine.Localize( "MENU_LINK_TWITCH_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( controller )
				if not Engine.IsTwitchAccountRegistered( controller ) then
					self:openPopup( "Twitch_Connect", controller )
				else
					self:openPopup( "Twitch_UnRegister", controller )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	end
	return listInfo
end

local PrepareSocialOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, CreateModels_Link_YouTube() )
	table.insert( optionsTable, CreateModels_Link_Twitter() )
	table.insert( optionsTable, CreateModels_Link_Twitch() )
	return optionsTable
end

DataSources.OptionSocialList = DataSourceHelpers.ListSetup( "OptionSocialList ", PrepareSocialOptions, true )
LUI.createMenu.StartMenu_Options_Social = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Social" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Social.buttonPrompts" )
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
	TitleText:setText( Engine.Localize( "MENU_SOCIAL_" ) )
	TitleText:setTTF( "fonts/escom.ttf" )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TitleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 64, 734 )
	ButtonList:setTopBottom( true, false, 107.5, 675.5 )
	ButtonList:setDataSource( "OptionSocialList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 10 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
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
	Image:setLeftRight( true, false, 706.39, 830.39 )
	Image:setTopBottom( true, false, 109.21, 233.21 )
	self:addElement( Image )
	self.Image = Image
	
	local DescTitle = LUI.UIText.new()
	DescTitle:setLeftRight( true, false, 845.25, 1216 )
	DescTitle:setTopBottom( true, false, 108.21, 141 )
	DescTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DescTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 845.25, 1216 )
	Desc:setTopBottom( true, false, 141, 162 )
	Desc:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.MenuFrame:close()
		self.Image:close()
		self.DescTitle:close()
		self.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Social.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

