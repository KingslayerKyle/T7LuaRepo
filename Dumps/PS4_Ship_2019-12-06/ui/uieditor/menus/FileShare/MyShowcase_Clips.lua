require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemWide" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.SelectedFilmInformation" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "clip_private" )
			CoD.FileshareUtility.SetInShowcaseManager( f1_arg1, false )
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Clips = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Clips" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Clips.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_CATEGORY_CLIP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_CATEGORY_CLIP_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local PublishMode = Engine.GetModelValue( model )
		if PublishMode then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, PublishMode ) ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
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
	
	local ClipsList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	ClipsList:makeFocusable()
	ClipsList:setLeftRight( true, false, 66, 680 )
	ClipsList:setTopBottom( true, false, 135, 616 )
	ClipsList:setWidgetType( CoD.FileshareSelectorItemWide )
	ClipsList:setHorizontalCount( 3 )
	ClipsList:setVerticalCount( 4 )
	ClipsList:setSpacing( 7 )
	ClipsList:setDataSource( "FilesharePublishedList" )
	ClipsList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f10_local0 = ClipsList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:linkToElementModel( ClipsList, "fileCategory", true, function ( model )
		local f11_local0 = ClipsList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileCategory"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:linkToElementModel( ClipsList, "isPublishNew", true, function ( model )
		local f12_local0 = ClipsList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local f13_local0 = ClipsList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "ClipsList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "ClipsList", "FilesharePublishedList" )
		end
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	ClipsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f15_local0 = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
		end
		return f15_local0
	end )
	ClipsList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f16_local0 = nil
		FileshareItemLoseFocus( element )
		return f16_local0
	end )
	ClipsList:registerEventHandler( "gain_focus", function ( element, event )
		local f17_local0 = nil
		if element.gainFocus then
			f17_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f17_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f17_local0
	end )
	ClipsList:registerEventHandler( "lose_focus", function ( element, event )
		local f18_local0 = nil
		if element.loseFocus then
			f18_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f18_local0 = element.super:loseFocus( event )
		end
		return f18_local0
	end )
	self:AddButtonCallbackFunction( ClipsList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
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
	self:AddButtonCallbackFunction( ClipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareShowcaseIsPublishMode( element, controller ) and IsSelfModelValueEqualTo( element, controller, "fileCategory", "clip_private" ) and FileshareCanPublish( controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( controller, true )
			FileshareSetCurrentCategory( controller, "clip_private" )
			FileshareSetShowCreateButton( controller, false )
			FileshareSetDirty( controller )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareHasContent( element, controller ) and not FileshareShowcaseIsPublishMode( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareShowcaseIsPublishMode( element, controller ) and IsSelfModelValueEqualTo( element, controller, "fileCategory", "clip_private" ) and FileshareCanPublish( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareHasContent( element, controller ) and not FileshareShowcaseIsPublishMode( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	ClipsList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, ClipsList, controller )
	end )
	ClipsList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f24_local0 = ClipsList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f24_local0, controller )
		end
	end )
	self:addElement( ClipsList )
	self.ClipsList = ClipsList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 263, 463 )
	verticalCounter0:setTopBottom( true, false, 622, 647 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f25_local0 = nil
		SetAsListVerticalCounter( self, element, "ClipsList" )
		if not f25_local0 then
			f25_local0 = element:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local SelectedFilmInformation = CoD.SelectedFilmInformation.new( self, controller )
	SelectedFilmInformation:setLeftRight( true, false, 770, 1188 )
	SelectedFilmInformation:setTopBottom( true, false, 135, 672 )
	SelectedFilmInformation:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			SelectedFilmInformation:setAlpha( showFileDetails )
		end
	end )
	self:addElement( SelectedFilmInformation )
	self.SelectedFilmInformation = SelectedFilmInformation
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( self, controller )
	FilesharePublishDetails:setLeftRight( true, false, 770, 1096 )
	FilesharePublishDetails:setTopBottom( true, false, 138, 612 )
	FilesharePublishDetails:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local showPublishNewDetails = Engine.GetModelValue( model )
		if showPublishNewDetails then
			FilesharePublishDetails:setAlpha( showPublishNewDetails )
		end
	end )
	FilesharePublishDetails:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FileshareShowcaseIsPublishMode( element, controller )
			end
		}
	} )
	FilesharePublishDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( FilesharePublishDetails, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:setLeftRight( true, false, 248, 498 )
	FileshareNoContent:setTopBottom( true, false, 315, 375 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	SelectedFilmInformation:linkToElementModel( ClipsList, nil, false, function ( model )
		SelectedFilmInformation:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SelectedFilmInformation:completeAnimation()
				self.clipFinished( SelectedFilmInformation, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SelectedFilmInformation:completeAnimation()
				self.clipFinished( SelectedFilmInformation, {} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f35_local0 = self
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f36_local0 = nil
		if not FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerText( "MENU_MY_THEATER" )
		elseif FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			MediaManagerClearDisplay( self, self, controller )
		end
		if not f36_local0 then
			f36_local0 = self:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if FileshareShowcaseIsPublishMode( element, controller ) then
			FileshareSetShowcasePublishMode( controller, false )
			FileshareSetCurrentCategory( controller, "clip" )
			FileshareSetShowCreateButton( controller, true )
			FileshareSetDirty( controller )
			return true
		else
			PreserveThumbnails( controller, true )
			GoBack( self, controller )
			ClearMenuSavedState( menu )
			PreserveThumbnails( controller, false )
			FileshareAbortSummaryDownload( self, element, controller )
			return true
		end
	end, function ( element, menu, controller )
		if FileshareShowcaseIsPublishMode( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "ClipsList" )
			HideElement( self, "verticalCounter0" )
			DisableNavigation( self, "ClipsList" )
			FileshareSetShowFileDetails( controller, false )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "ClipsList" )
			ShowElement( self, "verticalCounter0" )
			EnableNavigation( self, "ClipsList" )
			FileshareSetShowFileDetails( controller, true )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	ClipsList.id = "ClipsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ClipsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FadeForStreamer:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.ClipsList:close()
		element.verticalCounter0:close()
		element.SelectedFilmInformation:close()
		element.FEMenuLeftGraphics:close()
		element.FilesharePublishDetails:close()
		element.FileshareNoContent:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Clips.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

