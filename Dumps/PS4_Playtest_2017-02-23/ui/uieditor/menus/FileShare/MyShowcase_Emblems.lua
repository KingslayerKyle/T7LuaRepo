require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.FileShare.FileshareEmblemSelectorItem" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	MediaManagerFetchEmblemsData( controller )
end

local PostLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "emblem" )
			CoD.FileshareUtility.SetInShowcaseManager( controller, false )
			CoD.FileshareUtility.SetDirty()
		end
		self:originalOcclusionChange( event )
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if self.EmblemName then
			if FileshareHasContent( nil, controller ) == true then
				self.EmblemName:setAlpha( 1 )
			else
				self.EmblemName:setAlpha( 0 )
			end
		end
		if FileshareShowcaseIsPublishMode( self, controller ) then
			self.EmblemName:setAlpha( 0 )
		end
	end )
end

LUI.createMenu.MyShowcase_Emblems = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Emblems" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Emblems.buttonPrompts" )
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
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
	
	local FileshareEmblemList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	FileshareEmblemList:makeFocusable()
	FileshareEmblemList:setLeftRight( 0, 0, 155, 977 )
	FileshareEmblemList:setTopBottom( 0, 0, 193, 886 )
	FileshareEmblemList:setWidgetType( CoD.FileshareEmblemSelectorItem )
	FileshareEmblemList:setHorizontalCount( 3 )
	FileshareEmblemList:setVerticalCount( 4 )
	FileshareEmblemList:setSpacing( 15 )
	FileshareEmblemList:setDataSource( "FilesharePublishedList" )
	FileshareEmblemList:linkToElementModel( FileshareEmblemList, "isPublishNew", true, function ( model )
		local element = FileshareEmblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareEmblemList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FilesharePublishedList" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	FileshareEmblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		end
		return retVal
	end )
	FileshareEmblemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	FileshareEmblemList:registerEventHandler( "gain_focus", function ( element, event )
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
	FileshareEmblemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( FileshareEmblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( controller, true )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "true" )
			FileshareOpenFullscreenView( self, element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH", nil )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( FileshareEmblemList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			return true
		else
			return false
		end
	end, true )
	FileshareEmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = FileshareEmblemList
		UpdateDataSource( self, element, controller )
	end )
	FileshareEmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = FileshareEmblemList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( FileshareEmblemList )
	self.FileshareEmblemList = FileshareEmblemList
	
	local emblemList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		},
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Emblems_IsDefaultEmblemEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "NonClickableEmptySlot",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "isNonClickableEmblem", 1 )
			end
		}
	} )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "emblemIndex", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "emblemIndex"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	emblemList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "isNonClickableEmblem", true, function ( model )
		self:updateElementState( emblemList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNonClickableEmblem"
		} )
	end )
	emblemList:setLeftRight( 0, 0, 155, 977 )
	emblemList:setTopBottom( 0, 0, 193, 886 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 15 )
	emblemList:setDataSource( "ShowcaseEmblemList" )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		local element = emblemList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		FileshareSetShowFileDetails( controller, false )
		SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		return retVal
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH", nil )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			EmblemSelect_SetAsEmblem( self, element, controller )
			PlaySoundSetSound( self, "toggle" )
			UpdateSelfState( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( 0, 0, 406, 706 )
	verticalCounter0:setTopBottom( 0, 0, 921, 959 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "FileshareEmblemList" )
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
	
	local LocalEmblemName = CoD.WeaponNameWidget.new( self, controller )
	LocalEmblemName:setLeftRight( 0, 0, 1139, 1773 )
	LocalEmblemName:setTopBottom( 0, 0, 620.5, 671.5 )
	self:addElement( LocalEmblemName )
	self.LocalEmblemName = LocalEmblemName
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( 0, 0, 1139, 1773 )
	EmblemName:setTopBottom( 0, 0, 620.5, 671.5 )
	EmblemName:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName:setAlpha( modelValue )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f44_local0
				if not FileshareHasContent( element, controller ) then
					f44_local0 = not FileshareShowcaseIsPublishMode( element, controller )
				else
					f44_local0 = false
				end
				return f44_local0
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
	BorderBakedBlur1:setAlpha( 0.4 )
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
	BorderBakedSolid1:setAlpha( 0.5 )
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
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 1143, 1770 )
	WCFileshareIconExtraCamRender:setTopBottom( 0, 0, 210, 597 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setAlpha( modelValue )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local DrawEmblem = LUI.UIElement.new()
	DrawEmblem:setLeftRight( 0, 0, 1143, 1770 )
	DrawEmblem:setTopBottom( 0, 0, 210, 597 )
	DrawEmblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DrawEmblem:setupEmblem( modelValue )
		end
	end )
	self:addElement( DrawEmblem )
	self.DrawEmblem = DrawEmblem
	
	FileshareSelectedItemInfo0:linkToElementModel( FileshareEmblemList, nil, false, function ( model )
		FileshareSelectedItemInfo0:setModel( model, controller )
	end )
	LocalEmblemName:linkToElementModel( emblemList, nil, false, function ( model )
		LocalEmblemName:setModel( model, controller )
	end )
	LocalEmblemName:linkToElementModel( emblemList, "emblemName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LocalEmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	EmblemName:linkToElementModel( FileshareEmblemList, nil, false, function ( model )
		EmblemName:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( FileshareEmblemList, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	WCFileshareIconExtraCamRender:linkToElementModel( FileshareEmblemList, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, modelValue ) )
		end
	end )
	FileshareEmblemList.navigation = {
		down = verticalCounter0
	}
	emblemList.navigation = {
		down = verticalCounter0
	}
	verticalCounter0.navigation = {
		up = {
			FileshareEmblemList,
			emblemList
		}
	}
	self.resetProperties = function ()
		emblemList:completeAnimation()
		DrawEmblem:completeAnimation()
		BorderBakedSolid1:completeAnimation()
		BorderBakedBlur1:completeAnimation()
		LocalEmblemName:completeAnimation()
		FileshareEmblemList:completeAnimation()
		emblemList:setAlpha( 1 )
		DrawEmblem:setAlpha( 1 )
		BorderBakedSolid1:setAlpha( 0.5 )
		BorderBakedBlur1:setAlpha( 0.4 )
		LocalEmblemName:setAlpha( 1 )
		FileshareEmblemList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				emblemList:completeAnimation()
				self.emblemList:setAlpha( 0 )
				self.clipFinished( emblemList, {} )
				LocalEmblemName:completeAnimation()
				self.LocalEmblemName:setAlpha( 0 )
				self.clipFinished( LocalEmblemName, {} )
				BorderBakedBlur1:completeAnimation()
				self.BorderBakedBlur1:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur1, {} )
				BorderBakedSolid1:completeAnimation()
				self.BorderBakedSolid1:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid1, {} )
				DrawEmblem:completeAnimation()
				self.DrawEmblem:setAlpha( 0 )
				self.clipFinished( DrawEmblem, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FileshareEmblemList:completeAnimation()
				self.FileshareEmblemList:setAlpha( 0 )
				self.clipFinished( FileshareEmblemList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Publish",
			condition = function ( menu, element, event )
				return FileshareShowcaseIsPublishMode( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
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
			MediaManagerClearDisplay( self, element, controller )
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
			return true
		else
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		if FileshareShowcaseIsPublishMode( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local element = self
		if FileshareShowcaseIsPublishMode( element, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareEmblemList", controller )
			MakeElementNotFocusable( self, "FileshareEmblemList", controller )
			MakeElementFocusable( self, "emblemList", controller )
			SetFocusToElement( self, "emblemList", controller )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		elseif not FileshareShowcaseIsPublishMode( element, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "emblemList", controller )
			MakeElementNotFocusable( self, "emblemList", controller )
			MakeElementFocusable( self, "FileshareEmblemList", controller )
			SetFocusToElement( self, "FileshareEmblemList", controller )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	FileshareEmblemList.id = "FileshareEmblemList"
	emblemList.id = "emblemList"
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
		self.emblemList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FileshareEmblemList:close()
		self.emblemList:close()
		self.verticalCounter0:close()
		self.FileshareSelectedItemInfo0:close()
		self.FilesharePublishDetails:close()
		self.LocalEmblemName:close()
		self.EmblemName:close()
		self.FileshareNoContent:close()
		self.BorderBakedBlur1:close()
		self.BorderBakedBlur0:close()
		self.BorderBakedSolid1:close()
		self.BorderBakedSolid0:close()
		self.WCFileshareIconExtraCamRender:close()
		self.DrawEmblem:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Emblems.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

