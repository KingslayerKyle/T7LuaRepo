-- 4341f66dd2b93665517e897d81440095
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareScreenshotSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetInShowcaseManager( f1_arg1, false )
			if FileshareShowcaseIsPublishMode( nil, f1_arg1 ) then
				CoD.FileshareUtility.SetCurrentCategory( "screenshot_private" )
			else
				CoD.FileshareUtility.SetCurrentCategory( "screenshot" )
			end
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Screenshots = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Screenshots" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Screenshots.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
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
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SCREENSHOT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCREENSHOT_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local PublishMode = Engine.GetModelValue( model )
		if PublishMode then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, PublishMode ) ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		ShowHeaderKickerAndIcon( f3_local1 )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
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
	
	local FileshareScreenshotList = LUI.UIList.new( f3_local1, controller, 10, 0, nil, true, false, 0, 0, false, false )
	FileshareScreenshotList:makeFocusable()
	FileshareScreenshotList:setLeftRight( true, false, 103, 651 )
	FileshareScreenshotList:setTopBottom( true, false, 129, 591 )
	FileshareScreenshotList:setWidgetType( CoD.FileshareScreenshotSelectorItem )
	FileshareScreenshotList:setHorizontalCount( 3 )
	FileshareScreenshotList:setVerticalCount( 4 )
	FileshareScreenshotList:setSpacing( 10 )
	FileshareScreenshotList:setDataSource( "FilesharePublishedList" )
	FileshareScreenshotList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f8_local0 = FileshareScreenshotList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f8_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareScreenshotList:linkToElementModel( FileshareScreenshotList, "fileCategory", true, function ( model )
		local f9_local0 = FileshareScreenshotList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileCategory"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareScreenshotList:linkToElementModel( FileshareScreenshotList, "isPublishNew", true, function ( model )
		local f10_local0 = FileshareScreenshotList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f10_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareScreenshotList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local f11_local0 = FileshareScreenshotList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareScreenshotList:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareScreenshotList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareScreenshotList", "FilesharePublishedList" )
		end
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	FileshareScreenshotList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
			FileshareDownloadScreenshot( controller, nil )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
			SetElementStateByElementName( self, "ScreenshotName", controller, "NoText" )
		end
		return f13_local0
	end )
	FileshareScreenshotList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f14_local0 = nil
		FileshareItemLoseFocus( element )
		return f14_local0
	end )
	FileshareScreenshotList:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_START )
		return f15_local0
	end )
	FileshareScreenshotList:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	f3_local1:AddButtonCallbackFunction( FileshareScreenshotList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if FileshareShowcaseIsPublishMode( f17_arg0, f17_arg2 ) and IsSelfModelValueEqualTo( f17_arg0, f17_arg2, "fileCategory", "screenshot_private" ) and FileshareCanPublish( f17_arg2 ) then
			FileshareShowcasePublishSelectedItem( self, f17_arg0, f17_arg2 )
			return true
		elseif IsSelfModelValueTrue( f17_arg0, f17_arg2, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( f17_arg2, true )
			FileshareSetCurrentCategory( f17_arg2, "screenshot_private" )
			FileshareSetShowCreateButton( f17_arg2, false )
			FileshareSetDirty( f17_arg2 )
			return true
		elseif not IsSelfModelValueTrue( f17_arg0, f17_arg2, "isPublishNew" ) and FileshareHasContent( f17_arg0, f17_arg2 ) then
			FileshareSetSelectedItem( self, f17_arg0, f17_arg2, "true" )
			PreserveThumbnails( f17_arg2, true )
			FileshareOpenFullscreenView( self, f17_arg0, f17_arg2, f17_arg1 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if FileshareShowcaseIsPublishMode( f18_arg0, f18_arg2 ) and IsSelfModelValueEqualTo( f18_arg0, f18_arg2, "fileCategory", "screenshot_private" ) and FileshareCanPublish( f18_arg2 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif IsSelfModelValueTrue( f18_arg0, f18_arg2, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif not IsSelfModelValueTrue( f18_arg0, f18_arg2, "isPublishNew" ) and FileshareHasContent( f18_arg0, f18_arg2 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	f3_local1:AddButtonCallbackFunction( FileshareScreenshotList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not FileshareShowcaseIsPublishMode( f19_arg0, f19_arg2 ) and not IsSelfModelValueTrue( f19_arg0, f19_arg2, "isPublishNew" ) then
			OpenPopup( self, "FileshareOptions", f19_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if not FileshareShowcaseIsPublishMode( f20_arg0, f20_arg2 ) and not IsSelfModelValueTrue( f20_arg0, f20_arg2, "isPublishNew" ) then
			return true
		else
			return false
		end
	end, true )
	FileshareScreenshotList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, FileshareScreenshotList, controller )
	end )
	FileshareScreenshotList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f22_local0 = FileshareScreenshotList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f22_local0, controller )
		end
	end )
	self:addElement( FileshareScreenshotList )
	self.FileshareScreenshotList = FileshareScreenshotList
	
	local verticalCounter0 = CoD.verticalCounter.new( f3_local1, controller )
	verticalCounter0:setLeftRight( true, false, 271, 471 )
	verticalCounter0:setTopBottom( true, false, 614, 639 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f23_local0 = nil
		SetAsListVerticalCounter( self, element, "FileshareScreenshotList" )
		if not f23_local0 then
			f23_local0 = element:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( f3_local1, controller )
	FileshareSelectedItemInfo0:setLeftRight( true, false, 758, 1185 )
	FileshareSelectedItemInfo0:setTopBottom( true, false, 494, 578 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			FileshareSelectedItemInfo0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( f3_local1, controller )
	FilesharePublishDetails:setLeftRight( true, false, 758, 1084 )
	FilesharePublishDetails:setTopBottom( true, false, 140, 614 )
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
	
	local ScreenshotName = CoD.WeaponNameWidget.new( f3_local1, controller )
	ScreenshotName:setLeftRight( true, false, 759, 1182 )
	ScreenshotName:setTopBottom( true, false, 414, 448 )
	ScreenshotName:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			ScreenshotName:setAlpha( showFileDetails )
		end
	end )
	self:addElement( ScreenshotName )
	self.ScreenshotName = ScreenshotName
	
	local FileshareNoContent = CoD.FileshareNoContent.new( f3_local1, controller )
	FileshareNoContent:setLeftRight( true, false, 246, 496 )
	FileshareNoContent:setTopBottom( true, false, 331, 391 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local BorderBakedBlur1 = CoD.BorderBakedBlur.new( f3_local1, controller )
	BorderBakedBlur1:setLeftRight( false, false, 115, 547 )
	BorderBakedBlur1:setTopBottom( true, false, 133, 406 )
	BorderBakedBlur1:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			BorderBakedBlur1:setAlpha( showFileDetails )
		end
	end )
	self:addElement( BorderBakedBlur1 )
	self.BorderBakedBlur1 = BorderBakedBlur1
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( f3_local1, controller )
	BorderBakedBlur0:setLeftRight( false, false, 115, 547 )
	BorderBakedBlur0:setTopBottom( true, false, 133, 406 )
	BorderBakedBlur0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			BorderBakedBlur0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( f3_local1, controller )
	BorderBakedSolid1:setLeftRight( false, false, 115, 547 )
	BorderBakedSolid1:setTopBottom( true, false, 133, 406 )
	BorderBakedSolid1:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			BorderBakedSolid1:setAlpha( showFileDetails )
		end
	end )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( f3_local1, controller )
	BorderBakedSolid0:setLeftRight( false, false, 115, 547 )
	BorderBakedSolid0:setTopBottom( true, false, 133, 406 )
	BorderBakedSolid0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			BorderBakedSolid0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( true, false, 762, 1180 )
	ImageViewer0:setTopBottom( true, false, 140, 398 )
	ImageViewer0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			ImageViewer0:setAlpha( showFileDetails )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	local FilesharePublishDetails0 = CoD.FilesharePublishDetails.new( f3_local1, controller )
	FilesharePublishDetails0:setLeftRight( true, false, 758, 1084 )
	FilesharePublishDetails0:setTopBottom( true, false, 140, 614 )
	FilesharePublishDetails0:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local showPublishNewDetails = Engine.GetModelValue( model )
		if showPublishNewDetails then
			FilesharePublishDetails0:setAlpha( showPublishNewDetails )
		end
	end )
	FilesharePublishDetails0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FileshareShowcaseIsPublishMode( element, controller )
			end
		}
	} )
	FilesharePublishDetails0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		f3_local1:updateElementState( FilesharePublishDetails0, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( FilesharePublishDetails0 )
	self.FilesharePublishDetails0 = FilesharePublishDetails0
	
	FileshareSelectedItemInfo0:linkToElementModel( FileshareScreenshotList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	ScreenshotName:linkToElementModel( FileshareScreenshotList, nil, false, function ( model )
		ScreenshotName:setModel( model, controller )
	end )
	ScreenshotName:linkToElementModel( FileshareScreenshotList, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ScreenshotName.weaponNameLabel:setText( fileName )
		end
	end )
	ImageViewer0:linkToElementModel( FileshareScreenshotList, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_SCREENSHOT", fileId ) )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f41_local0 = self
		local f41_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f41_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f42_local0 = nil
		if not FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( f3_local1 )
			SetFileshareShowcaseKickerText( controller )
			SetIsInFileshare( controller, "true" )
		elseif FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( f3_local1 )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, f3_local1, true )
			SetIsInFileshare( controller, "true" )
		end
		if not f42_local0 then
			f42_local0 = element:dispatchEventToChildren( event )
		end
		return f42_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if FileshareShowcaseIsPublishMode( f43_arg0, f43_arg2 ) then
			FileshareSetShowcasePublishMode( f43_arg2, false )
			FileshareSetCurrentCategory( f43_arg2, "screenshot" )
			FileshareSetShowCreateButton( f43_arg2, true )
			FileshareSetDirty( f43_arg2 )
			return true
		else
			PreserveThumbnails( f43_arg2, true )
			GoBack( self, f43_arg2 )
			ClearMenuSavedState( f43_arg1 )
			PreserveThumbnails( f43_arg2, false )
			SendClientScriptMenuChangeNotify( f43_arg2, f43_arg1, false )
			MediaManagerClearDisplay( self, f43_arg0, f43_arg2 )
			return true
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "FileshareScreenshotList" )
			HideElement( self, "verticalCounter0" )
			DisableNavigation( self, "FileshareScreenshotList" )
			FileshareSetShowFileDetails( controller, false )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "FileshareScreenshotList" )
			ShowElement( self, "verticalCounter0" )
			EnableNavigation( self, "FileshareScreenshotList" )
			FileshareSetShowFileDetails( controller, true )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	FileshareScreenshotList.id = "FileshareScreenshotList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	if not self:restoreState() then
		self.FileshareScreenshotList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FileshareScreenshotList:close()
		element.verticalCounter0:close()
		element.FileshareSelectedItemInfo0:close()
		element.FilesharePublishDetails:close()
		element.ScreenshotName:close()
		element.FileshareNoContent:close()
		element.BorderBakedBlur1:close()
		element.BorderBakedBlur0:close()
		element.BorderBakedSolid1:close()
		element.BorderBakedSolid0:close()
		element.FilesharePublishDetails0:close()
		element.ImageViewer0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Screenshots.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

