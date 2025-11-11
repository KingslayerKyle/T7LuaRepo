require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.FileShare.FileshareScreenshotSelectorItem" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			CoD.FileshareUtility.SetInShowcaseManager( controller, false )
			if FileshareShowcaseIsPublishMode( nil, controller ) then
				CoD.FileshareUtility.SetCurrentCategory( "screenshot_private" )
			else
				CoD.FileshareUtility.SetCurrentCategory( "screenshot" )
			end
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Screenshots = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Screenshots" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Screenshots.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 140, 992 )
	LeftPanel:setTopBottom( 0, 0, 120, 1004 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 79, 1033 )
	BlackTint:setTopBottom( 0, 0, 120, 1004 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SCREENSHOT_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SCREENSHOT_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, modelValue ) ) )
		end
	end )
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
	
	local FileshareScreenshotList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	FileshareScreenshotList:makeFocusable()
	FileshareScreenshotList:setLeftRight( 0, 0, 155, 977 )
	FileshareScreenshotList:setTopBottom( 0, 0, 193, 886 )
	FileshareScreenshotList:setWidgetType( CoD.FileshareScreenshotSelectorItem )
	FileshareScreenshotList:setHorizontalCount( 3 )
	FileshareScreenshotList:setVerticalCount( 4 )
	FileshareScreenshotList:setSpacing( 15 )
	FileshareScreenshotList:setDataSource( "FilesharePublishedList" )
	FileshareScreenshotList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local element = FileshareScreenshotList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareScreenshotList:linkToElementModel( FileshareScreenshotList, "fileCategory", true, function ( model )
		local element = FileshareScreenshotList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileCategory"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareScreenshotList:linkToElementModel( FileshareScreenshotList, "isPublishNew", true, function ( model )
		local element = FileshareScreenshotList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareScreenshotList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		local element = FileshareScreenshotList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareScreenshotList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareScreenshotList", "FilesshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareScreenshotList", "FilesharePublishedList" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	FileshareScreenshotList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
			FileshareDownloadScreenshot( controller )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
			SetElementStateByElementName( self, "ScreenshotName", controller, "NoText" )
		end
		return retVal
	end )
	FileshareScreenshotList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	FileshareScreenshotList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	FileshareScreenshotList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( FileshareScreenshotList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareShowcaseIsPublishMode( element, controller ) and IsSelfModelValueEqualTo( element, controller, "fileCategory", "screenshot_private" ) and FileshareCanPublish( controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( controller, true )
			FileshareSetCurrentCategory( controller, "screenshot_private" )
			FileshareSetShowCreateButton( controller, false )
			FileshareSetDirty( controller )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareHasContent( element, controller ) then
			FileshareSetSelectedItem( self, element, controller, "true" )
			PreserveThumbnails( controller, true )
			FileshareOpenFullscreenView( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareShowcaseIsPublishMode( element, controller ) and IsSelfModelValueEqualTo( element, controller, "fileCategory", "screenshot_private" ) and FileshareCanPublish( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH", nil )
			return true
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH", nil )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) and FileshareHasContent( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( FileshareScreenshotList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not FileshareShowcaseIsPublishMode( element, controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		if not FileshareShowcaseIsPublishMode( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	FileshareScreenshotList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = FileshareScreenshotList
		UpdateDataSource( self, element, controller )
	end )
	FileshareScreenshotList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = FileshareScreenshotList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( FileshareScreenshotList )
	self.FileshareScreenshotList = FileshareScreenshotList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( 0, 0, 406, 706 )
	verticalCounter0:setTopBottom( 0, 0, 921, 959 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "FileshareScreenshotList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( self, controller )
	FileshareSelectedItemInfo0:setLeftRight( 0, 0, 1137, 1777 )
	FileshareSelectedItemInfo0:setTopBottom( 0, 0, 741, 867 )
	FileshareSelectedItemInfo0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemInfo0:setAlpha( modelValue )
		end
	end )
	self:addElement( FileshareSelectedItemInfo0 )
	self.FileshareSelectedItemInfo0 = FileshareSelectedItemInfo0
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( self, controller )
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
	FilesharePublishDetails:setLeftRight( 0, 0, 1137, 1626 )
	FilesharePublishDetails:setTopBottom( 0, 0, 210.5, 921.5 )
	FilesharePublishDetails:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FilesharePublishDetails:setAlpha( modelValue )
		end
	end )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local ScreenshotName = CoD.WeaponNameWidget.new( self, controller )
	ScreenshotName:setLeftRight( 0, 0, 1139, 1773 )
	ScreenshotName:setTopBottom( 0, 0, 620.5, 671.5 )
	ScreenshotName:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScreenshotName:setAlpha( modelValue )
		end
	end )
	self:addElement( ScreenshotName )
	self.ScreenshotName = ScreenshotName
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f29_local0
				if not FileshareHasContent( element, controller ) then
					f29_local0 = not FileshareShowcaseIsPublishMode( element, controller )
				else
					f29_local0 = false
				end
				return f29_local0
			end
		}
	} )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	FileshareNoContent:setLeftRight( 0, 0, 368.5, 743.5 )
	FileshareNoContent:setTopBottom( 0, 0, 497, 587 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local BorderBakedBlur1 = CoD.BorderBakedBlur.new( self, controller )
	BorderBakedBlur1:setLeftRight( 0.5, 0.5, 172, 820 )
	BorderBakedBlur1:setTopBottom( 0, 0, 199, 609 )
	BorderBakedBlur1:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BorderBakedBlur1:setAlpha( modelValue )
		end
	end )
	self:addElement( BorderBakedBlur1 )
	self.BorderBakedBlur1 = BorderBakedBlur1
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( self, controller )
	BorderBakedBlur0:setLeftRight( 0.5, 0.5, 172, 820 )
	BorderBakedBlur0:setTopBottom( 0, 0, 199, 609 )
	BorderBakedBlur0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BorderBakedBlur0:setAlpha( modelValue )
		end
	end )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid1:setLeftRight( 0.5, 0.5, 172, 820 )
	BorderBakedSolid1:setTopBottom( 0, 0, 199, 609 )
	BorderBakedSolid1:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BorderBakedSolid1:setAlpha( modelValue )
		end
	end )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( 0.5, 0.5, 172, 820 )
	BorderBakedSolid0:setTopBottom( 0, 0, 199, 609 )
	BorderBakedSolid0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BorderBakedSolid0:setAlpha( modelValue )
		end
	end )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( 0, 0, 1143, 1770 )
	ImageViewer0:setTopBottom( 0, 0, 210, 597 )
	ImageViewer0:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer0:setAlpha( modelValue )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	local FilesharePublishDetails0 = CoD.FilesharePublishDetails.new( self, controller )
	FilesharePublishDetails0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FileshareShowcaseIsPublishMode( element, controller )
			end
		}
	} )
	FilesharePublishDetails0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( FilesharePublishDetails0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	FilesharePublishDetails0:setLeftRight( 0, 0, 1137, 1626 )
	FilesharePublishDetails0:setTopBottom( 0, 0, 210.5, 921.5 )
	FilesharePublishDetails0:subscribeToGlobalModel( controller, "FileshareRoot", "showPublishNewDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FilesharePublishDetails0:setAlpha( modelValue )
		end
	end )
	self:addElement( FilesharePublishDetails0 )
	self.FilesharePublishDetails0 = FilesharePublishDetails0
	
	local LocalFileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	LocalFileshareNoContent:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f40_local0
				if not FileshareHasContent( element, controller ) then
					f40_local0 = FileshareShowcaseIsPublishMode( element, controller )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		}
	} )
	LocalFileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( LocalFileshareNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	LocalFileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( LocalFileshareNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	LocalFileshareNoContent:setLeftRight( 0, 0, 368.5, 743.5 )
	LocalFileshareNoContent:setTopBottom( 0, 0, 495, 585 )
	self:addElement( LocalFileshareNoContent )
	self.LocalFileshareNoContent = LocalFileshareNoContent
	
	FileshareSelectedItemInfo0:linkToElementModel( FileshareScreenshotList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	ScreenshotName:linkToElementModel( FileshareScreenshotList, nil, false, function ( model )
		ScreenshotName:setModel( model, controller )
	end )
	ScreenshotName:linkToElementModel( FileshareScreenshotList, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScreenshotName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	ImageViewer0:linkToElementModel( FileshareScreenshotList, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_SCREENSHOT", modelValue ) )
		end
	end )
	FileshareScreenshotList.navigation = {
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = FileshareScreenshotList
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetFileshareShowcaseKickerText( controller )
			SetIsInFileshare( controller, "true" )
		elseif FileshareIsCommunityMode( element, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			SetIsInFileshare( controller, "true" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if FileshareShowcaseIsPublishMode( element, controller ) then
			FileshareSetShowcasePublishMode( controller, false )
			FileshareSetCurrentCategory( controller, "screenshot" )
			FileshareSetShowCreateButton( controller, true )
			FileshareSetDirty( controller )
			return true
		else
			GoBack( self, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			MediaManagerClearDisplay( self, element, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	FileshareScreenshotList.id = "FileshareScreenshotList"
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
		self.FileshareScreenshotList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FileshareScreenshotList:close()
		self.verticalCounter0:close()
		self.FileshareSelectedItemInfo0:close()
		self.FilesharePublishDetails:close()
		self.ScreenshotName:close()
		self.FileshareNoContent:close()
		self.BorderBakedBlur1:close()
		self.BorderBakedBlur0:close()
		self.BorderBakedSolid1:close()
		self.BorderBakedSolid0:close()
		self.FilesharePublishDetails0:close()
		self.LocalFileshareNoContent:close()
		self.ImageViewer0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Screenshots.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

