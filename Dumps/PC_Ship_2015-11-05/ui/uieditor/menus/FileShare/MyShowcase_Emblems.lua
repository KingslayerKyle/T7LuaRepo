require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemWide" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

local PreLoadFunc = function ( self, controller )
	MediaManagerFetchEmblemsData( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "emblem" )
			CoD.FileshareUtility.SetInShowcaseManager( f2_arg1, false )
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Emblems = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Emblems" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Emblems.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 93, 661 )
	LeftPanel:setTopBottom( true, false, 80, 669 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 53, 689 )
	BlackTint:setTopBottom( true, false, 80, 669 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local MyShowcaseBG = LUI.UIImage.new()
	MyShowcaseBG:setLeftRight( true, false, 64, 181 )
	MyShowcaseBG:setTopBottom( true, false, 11, 32.5 )
	MyShowcaseBG:setAlpha( 0 )
	self:addElement( MyShowcaseBG )
	self.MyShowcaseBG = MyShowcaseBG
	
	local MyShowcase = LUI.UITightText.new()
	MyShowcase:setLeftRight( true, false, 68, 160 )
	MyShowcase:setTopBottom( true, false, 9.5, 34.5 )
	MyShowcase:setRGB( 0, 0, 0 )
	MyShowcase:setAlpha( 0 )
	MyShowcase:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	MyShowcase:setTTF( "fonts/default.ttf" )
	self:addElement( MyShowcase )
	self.MyShowcase = MyShowcase
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local EmblemList = LUI.UIList.new( self, controller, 5, 0, nil, true, false, 0, 0, false, false )
	EmblemList:makeFocusable()
	EmblemList:setLeftRight( true, false, 66, 676 )
	EmblemList:setTopBottom( true, false, 133, 608 )
	EmblemList:setDataSource( "FilesharePublishedList" )
	EmblemList:setWidgetType( CoD.FileshareSelectorItemWide )
	EmblemList:setHorizontalCount( 3 )
	EmblemList:setVerticalCount( 4 )
	EmblemList:setSpacing( 5 )
	EmblemList:linkToElementModel( EmblemList, "isPublishNew", true, function ( model )
		local f6_local0 = EmblemList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	EmblemList:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "EmblemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "EmblemList", "FilesharePublishedList" )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	EmblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f8_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		return f8_local0
	end )
	EmblemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f9_local0 = nil
		FileshareItemLoseFocus( element )
		return f9_local0
	end )
	EmblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f10_local0
	end )
	EmblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( EmblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareOpenPublishMenu( self, element, controller, "", menu )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "true" )
			FileshareOpenFullscreenView( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_START" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( EmblemList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			OpenPopup( self, "FileshareOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			return true
		else
			return false
		end
	end, true )
	EmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, EmblemList, controller )
	end )
	EmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		UpdateDataSource( self, EmblemList, controller )
	end )
	self:addElement( EmblemList )
	self.EmblemList = EmblemList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 268, 468 )
	verticalCounter0:setTopBottom( true, false, 610, 635 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		SetAsListVerticalCounter( self, element, "EmblemList" )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( self, controller )
	FileshareSelectedItemInfo0:setLeftRight( true, false, 765, 1183 )
	FileshareSelectedItemInfo0:setTopBottom( true, false, 487, 571 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			FileshareSelectedItemInfo0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local EmblemBG = LUI.UIImage.new()
	EmblemBG:setLeftRight( true, false, 765, 1183 )
	EmblemBG:setTopBottom( true, false, 134, 391 )
	EmblemBG:setRGB( 0.13, 0.13, 0.13 )
	EmblemBG:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			EmblemBG:setAlpha( showFileDetails )
		end
	end )
	self:addElement( EmblemBG )
	self.EmblemBG = EmblemBG
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 765, 1183 )
	WCFileshareIconExtraCamRender:setTopBottom( true, false, 133, 391 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			WCFileshareIconExtraCamRender:setAlpha( showFileDetails )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( self, controller )
	FilesharePublishDetails:setLeftRight( true, false, 820.79, 1146.79 )
	FilesharePublishDetails:setTopBottom( true, false, 133, 607 )
	FilesharePublishDetails:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local showPublishNewDetails = Engine.GetModelValue( model )
		if showPublishNewDetails then
			FilesharePublishDetails:setAlpha( showPublishNewDetails )
		end
	end )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( true, false, 765, 1183 )
	EmblemName:setTopBottom( true, false, 407.5, 441.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	FileshareSelectedItemInfo0:linkToElementModel( EmblemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	WCFileshareIconExtraCamRender:linkToElementModel( EmblemList, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	EmblemName:linkToElementModel( EmblemList, nil, false, function ( model )
		EmblemName:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( EmblemList, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			EmblemName.weaponNameLabel:setText( Engine.Localize( fileName ) )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f27_local0 = nil
		if not FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetFileshareShowcaseKickerText( controller )
			SetIsInFileshare( controller, "true" )
		elseif FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			MediaManagerClearDisplay( self, self, controller )
			SetIsInFileshare( controller, "true" )
		end
		if not f27_local0 then
			f27_local0 = self:dispatchEventToChildren( event )
		end
		return f27_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	EmblemList.id = "EmblemList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.EmblemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.EmblemList:close()
		element.verticalCounter0:close()
		element.FileshareSelectedItemInfo0:close()
		element.FilesharePublishDetails:close()
		element.EmblemName:close()
		element.EmblemBG:close()
		element.WCFileshareIconExtraCamRender:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Emblems.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

