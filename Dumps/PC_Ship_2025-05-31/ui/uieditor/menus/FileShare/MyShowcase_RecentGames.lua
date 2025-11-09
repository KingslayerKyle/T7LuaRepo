require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemWide" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.SelectedFilmInformation" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "recentgames" )
			CoD.FileshareUtility.SetInShowcaseManager( f1_arg1, false )
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_RecentGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_RecentGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_RecentGames.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 53, 693 )
	BlackTint:setTopBottom( true, true, 0, 0 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_RECENTGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_RECENTGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_theater" ) )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
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
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local RecentGamesList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	RecentGamesList:makeFocusable()
	RecentGamesList:setLeftRight( true, false, 66, 680 )
	RecentGamesList:setTopBottom( true, false, 135, 616 )
	RecentGamesList:setWidgetType( CoD.FileshareSelectorItemWide )
	RecentGamesList:setHorizontalCount( 3 )
	RecentGamesList:setVerticalCount( 4 )
	RecentGamesList:setSpacing( 7 )
	RecentGamesList:setDataSource( "FilesharePublishedList" )
	RecentGamesList:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SetElementDataSource( self, "RecentGamesList", "FilesharePublishedList" )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	RecentGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		FileshareDownloadSummary( self, element, controller )
		return f10_local0
	end )
	RecentGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	RecentGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( RecentGamesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if AlwaysFalse() then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( RecentGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		GoBackMultiple( self, controller, "2" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	RecentGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, RecentGamesList, controller )
	end )
	RecentGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f18_local0 = RecentGamesList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f18_local0, controller )
		end
	end )
	self:addElement( RecentGamesList )
	self.RecentGamesList = RecentGamesList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 263, 463 )
	verticalCounter0:setTopBottom( true, false, 622, 647 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f19_local0 = nil
		SetAsListVerticalCounter( self, element, "RecentGamesList" )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local SelectedFilmInformation = CoD.SelectedFilmInformation.new( self, controller )
	SelectedFilmInformation:setLeftRight( true, false, 770, 1188 )
	SelectedFilmInformation:setTopBottom( true, false, 135, 672 )
	self:addElement( SelectedFilmInformation )
	self.SelectedFilmInformation = SelectedFilmInformation
	
	local FileshareSpinner0 = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner0:setLeftRight( true, false, 947, 1011 )
	FileshareSpinner0:setTopBottom( true, false, 218.6, 282.6 )
	FileshareSpinner0:setScale( 0.8 )
	self:addElement( FileshareSpinner0 )
	self.FileshareSpinner0 = FileshareSpinner0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:setLeftRight( true, false, 248, 498 )
	FileshareNoContent:setTopBottom( true, false, 315, 375 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	SelectedFilmInformation:linkToElementModel( RecentGamesList, nil, false, function ( model )
		SelectedFilmInformation:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				SelectedFilmInformation:completeAnimation()
				self.SelectedFilmInformation:setAlpha( 1 )
				self.clipFinished( SelectedFilmInformation, {} )
				FileshareSpinner0:completeAnimation()
				self.FileshareSpinner0:setAlpha( 0 )
				self.clipFinished( FileshareSpinner0, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				SelectedFilmInformation:completeAnimation()
				self.SelectedFilmInformation:setAlpha( 0 )
				self.clipFinished( SelectedFilmInformation, {} )
				FileshareSpinner0:completeAnimation()
				self.FileshareSpinner0:setAlpha( 1 )
				self.clipFinished( FileshareSpinner0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return not IsGlobalModelValueGreaterThan( controller, "fileshareRoot.itemsCount", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f25_local0 = nil
		if not FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerText( "MENU_MY_THEATER" )
		elseif FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			MediaManagerClearDisplay( self, self, controller )
		end
		if not f25_local0 then
			f25_local0 = self:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		FileshareAbortSummaryDownload( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "RecentGamesList" )
			HideElement( self, "verticalCounter0" )
			DisableNavigation( self, "RecentGamesList" )
			FileshareSetShowFileDetails( controller, false )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "RecentGamesList" )
			ShowElement( self, "verticalCounter0" )
			EnableNavigation( self, "RecentGamesList" )
			FileshareSetShowFileDetails( controller, true )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	RecentGamesList.id = "RecentGamesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.RecentGamesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FadeForStreamer:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.RecentGamesList:close()
		element.verticalCounter0:close()
		element.SelectedFilmInformation:close()
		element.FileshareSpinner0:close()
		element.FEMenuLeftGraphics:close()
		element.FileshareNoContent:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_RecentGames.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

