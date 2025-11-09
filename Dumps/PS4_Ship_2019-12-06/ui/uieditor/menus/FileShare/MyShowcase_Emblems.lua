require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareEmblemSelectorItem" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )

local PreLoadFunc = function ( self, controller )
	MediaManagerFetchEmblemsData( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disablePopupOpenCloseAnim = true
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "emblem" )
			CoD.FileshareUtility.SetInShowcaseManager( f2_arg1, false )
			CoD.FileshareUtility.SetDirty()
			if event.occludedBy and event.occludedBy.id == "Menu.FilesharePublish" then
				SetFocusToElement( element, "emblemList", f2_arg1 )
			end
		end
		element:originalOcclusionChange( event )
	end )
	f2_arg0:subscribeToGlobalModel( f2_arg1, "FileshareRoot", "itemsCount", function ( model )
		if f2_arg0.EmblemName then
			if FileshareHasContent( nil, f2_arg1 ) == true then
				f2_arg0.EmblemName:setAlpha( 1 )
			else
				f2_arg0.EmblemName:setAlpha( 0 )
			end
		end
		if FileshareShowcaseIsPublishMode( f2_arg0, f2_arg1 ) then
			f2_arg0.EmblemName:setAlpha( 0 )
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
	
	local FileshareEmblemList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	FileshareEmblemList:makeFocusable()
	FileshareEmblemList:setLeftRight( true, false, 103, 651 )
	FileshareEmblemList:setTopBottom( true, false, 129, 591 )
	FileshareEmblemList:setWidgetType( CoD.FileshareEmblemSelectorItem )
	FileshareEmblemList:setHorizontalCount( 3 )
	FileshareEmblemList:setVerticalCount( 4 )
	FileshareEmblemList:setSpacing( 10 )
	FileshareEmblemList:setDataSource( "FilesharePublishedList" )
	FileshareEmblemList:linkToElementModel( FileshareEmblemList, "isPublishNew", true, function ( model )
		local f10_local0 = FileshareEmblemList
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f10_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareEmblemList:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FilesharePublishedList" )
		end
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	FileshareEmblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f12_local0 = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		end
		return f12_local0
	end )
	FileshareEmblemList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f13_local0 = nil
		FileshareItemLoseFocus( element )
		return f13_local0
	end )
	FileshareEmblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f14_local0
	end )
	FileshareEmblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			return true
		else
			return false
		end
	end, true )
	FileshareEmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, FileshareEmblemList, controller )
	end )
	FileshareEmblemList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f21_local0 = FileshareEmblemList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f21_local0, controller )
		end
	end )
	self:addElement( FileshareEmblemList )
	self.FileshareEmblemList = FileshareEmblemList
	
	local emblemList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:setLeftRight( true, false, 103, 651 )
	emblemList:setTopBottom( true, false, 129, 591 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 4 )
	emblemList:setSpacing( 10 )
	emblemList:setDataSource( "ShowcaseEmblemList" )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		local f22_local0 = emblemList
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f23_local0 = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		FileshareSetShowFileDetails( controller, false )
		SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		return f23_local0
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f24_local0
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
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
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 271, 471 )
	verticalCounter0:setTopBottom( true, false, 614, 639 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f38_local0 = nil
		SetAsListVerticalCounter( self, element, "FileshareEmblemList" )
		if not f38_local0 then
			f38_local0 = element:dispatchEventToChildren( event )
		end
		return f38_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local FileshareSelectedItemInfo0 = CoD.FileshareSelectedItemInfo.new( self, controller )
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
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( self, controller )
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
		self:updateElementState( FilesharePublishDetails, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local LocalEmblemName = CoD.WeaponNameWidget.new( self, controller )
	LocalEmblemName:setLeftRight( true, false, 759, 1182 )
	LocalEmblemName:setTopBottom( true, false, 414, 448 )
	self:addElement( LocalEmblemName )
	self.LocalEmblemName = LocalEmblemName
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( true, false, 759, 1182 )
	EmblemName:setTopBottom( true, false, 414, 448 )
	EmblemName:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			EmblemName:setAlpha( showFileDetails )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:setLeftRight( true, false, 246, 496 )
	FileshareNoContent:setTopBottom( true, false, 331, 391 )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local BorderBakedBlur1 = CoD.BorderBakedBlur.new( self, controller )
	BorderBakedBlur1:setLeftRight( false, false, 115, 547 )
	BorderBakedBlur1:setTopBottom( true, false, 133, 406 )
	BorderBakedBlur1:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur1 )
	self.BorderBakedBlur1 = BorderBakedBlur1
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( self, controller )
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
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid1:setLeftRight( false, false, 115, 547 )
	BorderBakedSolid1:setTopBottom( true, false, 133, 406 )
	BorderBakedSolid1:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
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
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 762, 1180 )
	WCFileshareIconExtraCamRender:setTopBottom( true, false, 140, 398 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareRoot", "showFileDetails", function ( model )
		local showFileDetails = Engine.GetModelValue( model )
		if showFileDetails then
			WCFileshareIconExtraCamRender:setAlpha( showFileDetails )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local DrawEmblem = LUI.UIElement.new()
	DrawEmblem:setLeftRight( true, false, 762, 1180 )
	DrawEmblem:setTopBottom( true, false, 140, 398 )
	DrawEmblem:setAlpha( 0 )
	DrawEmblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			DrawEmblem:setupEmblem( type )
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
		local emblemName = Engine.GetModelValue( model )
		if emblemName then
			LocalEmblemName.weaponNameLabel:setText( Engine.Localize( emblemName ) )
		end
	end )
	EmblemName:linkToElementModel( FileshareEmblemList, nil, false, function ( model )
		EmblemName:setModel( model, controller )
	end )
	EmblemName:linkToElementModel( FileshareEmblemList, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			EmblemName.weaponNameLabel:setText( fileName )
		end
	end )
	WCFileshareIconExtraCamRender:linkToElementModel( FileshareEmblemList, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FileshareEmblemList:completeAnimation()
				self.FileshareEmblemList:setAlpha( 1 )
				self.clipFinished( FileshareEmblemList, {} )
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
				self:setupElementClipCounter( 6 )
				FileshareEmblemList:completeAnimation()
				self.FileshareEmblemList:setAlpha( 0 )
				self.clipFinished( FileshareEmblemList, {} )
				emblemList:completeAnimation()
				self.emblemList:setAlpha( 1 )
				self.clipFinished( emblemList, {} )
				LocalEmblemName:completeAnimation()
				self.LocalEmblemName:setAlpha( 1 )
				self.clipFinished( LocalEmblemName, {} )
				BorderBakedBlur1:completeAnimation()
				self.BorderBakedBlur1:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur1, {} )
				BorderBakedSolid1:completeAnimation()
				self.BorderBakedSolid1:setAlpha( 0.5 )
				self.clipFinished( BorderBakedSolid1, {} )
				DrawEmblem:completeAnimation()
				self.DrawEmblem:setAlpha( 1 )
				self.clipFinished( DrawEmblem, {} )
			end
		},
		NoContentPublishMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FileshareEmblemList:completeAnimation()
				self.FileshareEmblemList:setAlpha( 0 )
				self.clipFinished( FileshareEmblemList, {} )
				emblemList:completeAnimation()
				self.emblemList:setAlpha( 1 )
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
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoContentPublishMode",
			condition = function ( menu, element, event )
				return FileshareShowcaseIsPublishMode( element, controller ) and not FileshareHasContent( element, controller )
			end
		},
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f61_local0 = self
		local f61_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f61_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f62_local0 = nil
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
		if not f62_local0 then
			f62_local0 = self:dispatchEventToChildren( event )
		end
		return f62_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local f65_local0 = self
		if FileshareShowcaseIsPublishMode( f65_local0, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareEmblemList", controller )
			MakeElementNotFocusable( self, "FileshareEmblemList", controller )
			MakeElementFocusable( self, "emblemList", controller )
			SetFocusToElement( self, "emblemList", controller )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		elseif not FileshareShowcaseIsPublishMode( f65_local0, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "emblemList", controller )
			MakeElementNotFocusable( self, "emblemList", controller )
			MakeElementFocusable( self, "FileshareEmblemList", controller )
			SetFocusToElement( self, "FileshareEmblemList", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "FileshareEmblemList" )
			HideElement( self, "verticalCounter0" )
			DisableNavigation( self, "FileshareEmblemList" )
			FileshareSetShowFileDetails( controller, false )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "FileshareEmblemList" )
			ShowElement( self, "verticalCounter0" )
			EnableNavigation( self, "FileshareEmblemList" )
			FileshareSetShowFileDetails( controller, true )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	FileshareEmblemList.id = "FileshareEmblemList"
	emblemList.id = "emblemList"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FileshareEmblemList:close()
		element.emblemList:close()
		element.verticalCounter0:close()
		element.FileshareSelectedItemInfo0:close()
		element.FilesharePublishDetails:close()
		element.LocalEmblemName:close()
		element.EmblemName:close()
		element.FileshareNoContent:close()
		element.BorderBakedBlur1:close()
		element.BorderBakedBlur0:close()
		element.BorderBakedSolid1:close()
		element.BorderBakedSolid0:close()
		element.WCFileshareIconExtraCamRender:close()
		element.DrawEmblem:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Emblems.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

