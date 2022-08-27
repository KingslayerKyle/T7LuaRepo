-- 938f918d52b46011c41eb5ac4c33fc73
-- This hash is used for caching, delete to decompile the file again

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
	local f3_local1 = self
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
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f3_local1, controller )
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
		f3_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
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
		ShowHeaderKickerAndIcon( f3_local1 )
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
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f3_local1, controller )
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
	
	local ClipsList = LUI.UIList.new( f3_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
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
		CoD.Menu.UpdateButtonShownState( f10_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:linkToElementModel( ClipsList, "fileCategory", true, function ( model )
		local f11_local0 = ClipsList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileCategory"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:linkToElementModel( ClipsList, "isPublishNew", true, function ( model )
		local f12_local0 = ClipsList
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local f13_local0 = ClipsList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f3_local1:AddButtonCallbackFunction( ClipsList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if AlwaysFalse() then
			OpenPopup( self, "FileshareOptions", f19_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( ClipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if FileshareShowcaseIsPublishMode( f21_arg0, f21_arg2 ) and IsSelfModelValueEqualTo( f21_arg0, f21_arg2, "fileCategory", "clip_private" ) and FileshareCanPublish( f21_arg2 ) then
			FileshareShowcasePublishSelectedItem( self, f21_arg0, f21_arg2 )
			return true
		elseif IsSelfModelValueTrue( f21_arg0, f21_arg2, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( f21_arg2, true )
			FileshareSetCurrentCategory( f21_arg2, "clip_private" )
			FileshareSetShowCreateButton( f21_arg2, false )
			FileshareSetDirty( f21_arg2 )
			return true
		elseif not IsSelfModelValueTrue( f21_arg0, f21_arg2, "isPublishNew" ) and FileshareHasContent( f21_arg0, f21_arg2 ) and not FileshareShowcaseIsPublishMode( f21_arg0, f21_arg2 ) then
			ProcessListAction( self, f21_arg0, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if FileshareShowcaseIsPublishMode( f22_arg0, f22_arg2 ) and IsSelfModelValueEqualTo( f22_arg0, f22_arg2, "fileCategory", "clip_private" ) and FileshareCanPublish( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif IsSelfModelValueTrue( f22_arg0, f22_arg2, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif not IsSelfModelValueTrue( f22_arg0, f22_arg2, "isPublishNew" ) and FileshareHasContent( f22_arg0, f22_arg2 ) and not FileshareShowcaseIsPublishMode( f22_arg0, f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	
	local verticalCounter0 = CoD.verticalCounter.new( f3_local1, controller )
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
	
	local SelectedFilmInformation = CoD.SelectedFilmInformation.new( f3_local1, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( f3_local1, controller )
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
		f3_local1:updateElementState( FilesharePublishDetails, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local FileshareNoContent = CoD.FileshareNoContent.new( f3_local1, controller )
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
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
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
		CoD.Menu.UpdateButtonShownState( f35_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f36_local0 = nil
		if not FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( f3_local1 )
			SetHeadingKickerText( "MENU_MY_THEATER" )
		elseif FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( f3_local1 )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, f3_local1, true )
			MediaManagerClearDisplay( self, element, controller )
		end
		if not f36_local0 then
			f36_local0 = element:dispatchEventToChildren( event )
		end
		return f36_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if FileshareShowcaseIsPublishMode( f37_arg0, f37_arg2 ) then
			FileshareSetShowcasePublishMode( f37_arg2, false )
			FileshareSetCurrentCategory( f37_arg2, "clip" )
			FileshareSetShowCreateButton( f37_arg2, true )
			FileshareSetDirty( f37_arg2 )
			return true
		else
			PreserveThumbnails( f37_arg2, true )
			GoBack( self, f37_arg2 )
			ClearMenuSavedState( f37_arg1 )
			PreserveThumbnails( f37_arg2, false )
			FileshareAbortSummaryDownload( self, f37_arg0, f37_arg2 )
			return true
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if FileshareShowcaseIsPublishMode( f38_arg0, f38_arg2 ) then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
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
		menu = f3_local1
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

