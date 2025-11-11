require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemWide" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.FileShare.SelectedFilmInformation" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "recentgames" )
			CoD.FileshareUtility.SetInShowcaseManager( controller, false )
			CoD.FileshareUtility.SetDirty()
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_RecentGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_RecentGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_RecentGames.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 80, 1040 )
	BlackTint:setTopBottom( 0, 1, 0, 0 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
	FadeForStreamer:setLeftRight( 0, 1, 0, 0 )
	FadeForStreamer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_RECENTGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_RECENTGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_theater" ) )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local MyShowcaseBG = LUI.UIImage.new()
	MyShowcaseBG:setLeftRight( 0, 0, 96, 272 )
	MyShowcaseBG:setTopBottom( 0, 0, 17, 49 )
	MyShowcaseBG:setAlpha( 0 )
	self:addElement( MyShowcaseBG )
	self.MyShowcaseBG = MyShowcaseBG
	
	local MyShowcase = LUI.UITightText.new()
	MyShowcase:setLeftRight( 0, 0, 102, 240 )
	MyShowcase:setTopBottom( 0, 0, 14, 52 )
	MyShowcase:setRGB( 0, 0, 0 )
	MyShowcase:setAlpha( 0 )
	MyShowcase:setText( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	MyShowcase:setTTF( "fonts/default.ttf" )
	self:addElement( MyShowcase )
	self.MyShowcase = MyShowcase
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local RecentGamesList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	RecentGamesList:makeFocusable()
	RecentGamesList:setLeftRight( 0, 0, 99.5, 1019.5 )
	RecentGamesList:setTopBottom( 0, 0, 204, 922 )
	RecentGamesList:setWidgetType( CoD.FileshareSelectorItemWide )
	RecentGamesList:setHorizontalCount( 3 )
	RecentGamesList:setVerticalCount( 4 )
	RecentGamesList:setSpacing( 10 )
	RecentGamesList:setDataSource( "FilesharePublishedList" )
	RecentGamesList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetElementDataSource( self, "RecentGamesList", "FilesharePublishedList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	RecentGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareSetSelectedItem( self, element, controller, "" )
		FileshareDownloadSummary( self, element, controller )
		return retVal
	end )
	RecentGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	RecentGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( RecentGamesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if AlwaysFalse() then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	RecentGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = RecentGamesList
		UpdateDataSource( self, element, controller )
	end )
	RecentGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = RecentGamesList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( RecentGamesList )
	self.RecentGamesList = RecentGamesList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( 0, 0, 395, 695 )
	verticalCounter0:setTopBottom( 0, 0, 933, 971 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "RecentGamesList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local SelectedFilmInformation = CoD.SelectedFilmInformation.new( self, controller )
	SelectedFilmInformation:setLeftRight( 0, 0, 1155, 1782 )
	SelectedFilmInformation:setTopBottom( 0, 0, 202, 1008 )
	self:addElement( SelectedFilmInformation )
	self.SelectedFilmInformation = SelectedFilmInformation
	
	local FileshareSpinner = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner:setLeftRight( 0, 0, 504, 600 )
	FileshareSpinner:setTopBottom( 0, 0, 514, 610 )
	FileshareSpinner:setScale( 0.8 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local FileshareSpinner0 = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner0:setLeftRight( 0, 0, 1420, 1516 )
	FileshareSpinner0:setTopBottom( 0, 0, 328, 424 )
	FileshareSpinner0:setScale( 0.8 )
	self:addElement( FileshareSpinner0 )
	self.FileshareSpinner0 = FileshareSpinner0
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	SelectedFilmInformation:linkToElementModel( RecentGamesList, nil, false, function ( model )
		SelectedFilmInformation:setModel( model, controller )
	end )
	RecentGamesList.navigation = {
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = RecentGamesList
	}
	self.resetProperties = function ()
		FileshareSpinner0:completeAnimation()
		FileshareSpinner:completeAnimation()
		SelectedFilmInformation:completeAnimation()
		FileshareSpinner0:setAlpha( 1 )
		FileshareSpinner:setLeftRight( 0, 0, 504, 600 )
		FileshareSpinner:setTopBottom( 0, 0, 514, 610 )
		FileshareSpinner:setAlpha( 1 )
		SelectedFilmInformation:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setAlpha( 0 )
				self.clipFinished( FileshareSpinner, {} )
				FileshareSpinner0:completeAnimation()
				self.FileshareSpinner0:setAlpha( 0 )
				self.clipFinished( FileshareSpinner0, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				SelectedFilmInformation:completeAnimation()
				self.SelectedFilmInformation:setAlpha( 0 )
				self.clipFinished( SelectedFilmInformation, {} )
				FileshareSpinner:completeAnimation()
				self.FileshareSpinner:setLeftRight( 0, 0, 518, 614 )
				self.FileshareSpinner:setTopBottom( 0, 0, 498, 594 )
				self.clipFinished( FileshareSpinner, {} )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerText( "MENU_MY_THEATER" )
		elseif FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			MediaManagerClearDisplay( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		FileshareAbortSummaryDownload( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	RecentGamesList.id = "RecentGamesList"
	verticalCounter0.id = "verticalCounter0"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FadeForStreamer:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.RecentGamesList:close()
		self.verticalCounter0:close()
		self.SelectedFilmInformation:close()
		self.FileshareSpinner:close()
		self.FileshareSpinner0:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_RecentGames.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

