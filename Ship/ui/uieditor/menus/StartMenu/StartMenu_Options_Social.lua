-- 2a3e251cb55ddd2bab16dded9466ee55
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local f0_local0 = function ()
	local f1_local0 = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_YOUTUBE" ),
			desc = Engine.Localize( "MENU_LINK_YOUTUBE_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( f2_arg0 )
				if not Engine.IsYouTubeAccountChecked( f2_arg0 ) or not Engine.IsYouTubeAccountRegistered( f2_arg0 ) then
					self:openPopup( "YouTube_Connect", f2_arg0 )
				else
					self:openPopup( "YouTube_UnRegister", f2_arg0 )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	end
	return f1_local0
end

local f0_local1 = function ()
	local f3_local0 = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_TWITTER" ),
			desc = Engine.Localize( "MENU_LINK_TWITTER_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( f4_arg0 )
				if not Engine.IsTwitterAccountChecked( f4_arg0 ) or not Engine.IsTwitterAccountRegistered( f4_arg0 ) then
					self:openPopup( "Twitter_Connect", f4_arg0 )
				else
					self:openPopup( "Twitter_UnRegister", f4_arg0 )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
		f3_local0.properties.disabled = true
	end
	return f3_local0
end

local f0_local2 = function ()
	local f5_local0 = {
		models = {
			name = Engine.Localize( "MENU_LINK_TO_TWITCH" ),
			desc = Engine.Localize( "MENU_LINK_TWITCH_DESC" ),
			image = RegisterMaterial( "" )
		},
		properties = {
			disabled = true,
			action = function ( f6_arg0 )
				if not Engine.IsTwitchAccountRegistered( f6_arg0 ) then
					self:openPopup( "Twitch_Connect", f6_arg0 )
				else
					self:openPopup( "Twitch_UnRegister", f6_arg0 )
				end
			end
		}
	}
	if Engine.IsPlayerUnderage( controller ) then
		listinfo.models.desc = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
		f5_local0.properties.disabled = true
	end
	return f5_local0
end

DataSources.OptionSocialList = DataSourceHelpers.ListSetup( "OptionSocialList ", function ( f7_arg0 )
	local f7_local0 = {}
	table.insert( f7_local0, f0_local0() )
	table.insert( f7_local0, f0_local1() )
	table.insert( f7_local0, f0_local2() )
	return f7_local0
end, true )
LUI.createMenu.StartMenu_Options_Social = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Social" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Social.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonList = LUI.UIList.new( f8_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 64, 734 )
	ButtonList:setTopBottom( true, false, 107.5, 675.5 )
	ButtonList:setDataSource( "OptionSocialList" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 10 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f8_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		ProcessListAction( self, f11_arg0, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( f8_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		ShowHeaderIconOnly( f8_local1 )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f8_local1
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
		element.Image:close()
		element.DescTitle:close()
		element.Desc:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Social.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

