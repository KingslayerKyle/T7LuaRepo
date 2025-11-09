require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareCustomGamesSelectorItem" )
require( "ui.uieditor.widgets.CustomGames.CustomGameItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_PublishedCustomGameInfo" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_CustomGameListInfo" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "customgame" )
			CoD.FileshareUtility.SetInShowcaseManager( f1_arg1, false )
			CoD.FileshareUtility.SetDirty()
			if event.occludedBy and event.occludedBy.id == "Menu.FilesharePublish" then
				SetFocusToElement( element, "CustomGamesList", f1_arg1 )
			end
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_CustomGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_CustomGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_CustomGames.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local PublishMode = Engine.GetModelValue( model )
		if PublishMode then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, PublishMode ) ) )
		end
	end )
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
	
	local FileshareCustomGamesList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	FileshareCustomGamesList:makeFocusable()
	FileshareCustomGamesList:setLeftRight( true, false, 103, 651 )
	FileshareCustomGamesList:setTopBottom( true, false, 129, 591 )
	FileshareCustomGamesList:setWidgetType( CoD.FileshareCustomGamesSelectorItem )
	FileshareCustomGamesList:setHorizontalCount( 3 )
	FileshareCustomGamesList:setVerticalCount( 4 )
	FileshareCustomGamesList:setSpacing( 10 )
	FileshareCustomGamesList:setDataSource( "FilesharePublishedList" )
	FileshareCustomGamesList:linkToElementModel( FileshareCustomGamesList, "isPublishNew", true, function ( model )
		local f8_local0 = FileshareCustomGamesList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareCustomGamesList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f9_local0 = FileshareCustomGamesList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FileshareCustomGamesList:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		if FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FileshareCommunityList" )
		elseif not FileshareIsCommunityMode( element, controller ) then
			SetElementDataSource( self, "FileshareEmblemList", "FilesharePublishedList" )
		end
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	FileshareCustomGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f11_local0 = nil
		if not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetSelectedItem( self, element, controller, "" )
			FileshareSetShowFileDetails( controller, true )
			FileshareSetShowPublishNewDetails( controller, false )
		elseif IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowFileDetails( controller, false )
			FileshareSetShowPublishNewDetails( controller, true )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		end
		return f11_local0
	end )
	FileshareCustomGamesList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f12_local0 = nil
		FileshareItemLoseFocus( element )
		return f12_local0
	end )
	FileshareCustomGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
		return f13_local0
	end )
	FileshareCustomGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local f14_local0 = nil
		if element.loseFocus then
			f14_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f14_local0 = element.super:loseFocus( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( FileshareCustomGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) and not FileshareShowcaseIsPublishMode( element, controller ) then
			FileshareSetShowcasePublishMode( controller, true )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) and not FileshareShowcaseIsPublishMode( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( FileshareCustomGamesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
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
	FileshareCustomGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, FileshareCustomGamesList, controller )
	end )
	FileshareCustomGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local f20_local0 = FileshareCustomGamesList
		if FileshareIsReady( controller ) then
			UpdateDataSource( self, f20_local0, controller )
		end
	end )
	self:addElement( FileshareCustomGamesList )
	self.FileshareCustomGamesList = FileshareCustomGamesList
	
	local CustomGamesList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	CustomGamesList:makeFocusable()
	CustomGamesList:setLeftRight( true, false, 103, 651 )
	CustomGamesList:setTopBottom( true, false, 129, 591 )
	CustomGamesList:setAlpha( 0 )
	CustomGamesList:setWidgetType( CoD.CustomGameItem )
	CustomGamesList:setHorizontalCount( 3 )
	CustomGamesList:setVerticalCount( 4 )
	CustomGamesList:setSpacing( 10 )
	CustomGamesList:setDataSource( "MediaManagerCustomGamesList" )
	CustomGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f21_local0 = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		FileshareSetShowFileDetails( controller, false )
		SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		SetSelectedCustomGame( element, controller )
		return f21_local0
	end )
	CustomGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	CustomGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( CustomGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CustomGamesList )
	self.CustomGamesList = CustomGamesList
	
	local verticalCounter = CoD.verticalCounter.new( self, controller )
	verticalCounter:setLeftRight( true, false, 271, 471 )
	verticalCounter:setTopBottom( true, false, 614, 639 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		SetAsListVerticalCounter( self, element, "FileshareCustomGamesList" )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
	local FilesharePublishDetails = CoD.FilesharePublishDetails.new( self, controller )
	FilesharePublishDetails:setLeftRight( true, false, 758, 1084 )
	FilesharePublishDetails:setTopBottom( true, false, 143, 617 )
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
	
	local GameName = CoD.WeaponNameWidget.new( self, controller )
	GameName:setLeftRight( true, false, 759, 1182 )
	GameName:setTopBottom( true, false, 414, 448 )
	self:addElement( GameName )
	self.GameName = GameName
	
	local NoContentLabel = CoD.FileshareNoContent.new( self, controller )
	NoContentLabel:setLeftRight( true, false, 246, 496 )
	NoContentLabel:setTopBottom( true, false, 331, 391 )
	self:addElement( NoContentLabel )
	self.NoContentLabel = NoContentLabel
	
	local PublishedCustomGameInfo = CoD.MyShowcase_PublishedCustomGameInfo.new( self, controller )
	PublishedCustomGameInfo:setLeftRight( true, false, 721.5, 1221.5 )
	PublishedCustomGameInfo:setTopBottom( true, false, 129, 611 )
	PublishedCustomGameInfo:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareHasContent( element, controller )
			end
		}
	} )
	PublishedCustomGameInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( PublishedCustomGameInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	PublishedCustomGameInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( PublishedCustomGameInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( PublishedCustomGameInfo )
	self.PublishedCustomGameInfo = PublishedCustomGameInfo
	
	local MyShowcaseCustomGameListInfo = CoD.MyShowcase_CustomGameListInfo.new( self, controller )
	MyShowcaseCustomGameListInfo:setLeftRight( true, false, 721.5, 1221.5 )
	MyShowcaseCustomGameListInfo:setTopBottom( true, false, 129, 507.5 )
	MyShowcaseCustomGameListInfo:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareHasContent( element, controller )
			end
		}
	} )
	MyShowcaseCustomGameListInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		self:updateElementState( MyShowcaseCustomGameListInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	MyShowcaseCustomGameListInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		self:updateElementState( MyShowcaseCustomGameListInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:addElement( MyShowcaseCustomGameListInfo )
	self.MyShowcaseCustomGameListInfo = MyShowcaseCustomGameListInfo
	
	GameName:linkToElementModel( CustomGamesList, nil, false, function ( model )
		GameName:setModel( model, controller )
	end )
	GameName:linkToElementModel( CustomGamesList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GameName.weaponNameLabel:setText( name )
		end
	end )
	PublishedCustomGameInfo:linkToElementModel( FileshareCustomGamesList, nil, false, function ( model )
		PublishedCustomGameInfo:setModel( model, controller )
	end )
	MyShowcaseCustomGameListInfo:linkToElementModel( CustomGamesList, nil, false, function ( model )
		MyShowcaseCustomGameListInfo:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FileshareCustomGamesList:completeAnimation()
				self.FileshareCustomGamesList:setAlpha( 1 )
				self.clipFinished( FileshareCustomGamesList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				FilesharePublishDetails:completeAnimation()
				self.FilesharePublishDetails:setAlpha( 0 )
				self.clipFinished( FilesharePublishDetails, {} )
				GameName:completeAnimation()
				self.GameName:setAlpha( 0 )
				self.clipFinished( GameName, {} )
				PublishedCustomGameInfo:completeAnimation()
				self.PublishedCustomGameInfo:setAlpha( 1 )
				self.clipFinished( PublishedCustomGameInfo, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		},
		NoContentPublishMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FileshareCustomGamesList:completeAnimation()
				self.FileshareCustomGamesList:setAlpha( 0 )
				self.clipFinished( FileshareCustomGamesList, {} )
				FilesharePublishDetails:completeAnimation()
				self.FilesharePublishDetails:setAlpha( 1 )
				self.clipFinished( FilesharePublishDetails, {} )
				GameName:completeAnimation()
				self.GameName:setAlpha( 0 )
				self.clipFinished( GameName, {} )
				PublishedCustomGameInfo:completeAnimation()
				self.PublishedCustomGameInfo:setAlpha( 0 )
				self.clipFinished( PublishedCustomGameInfo, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FileshareCustomGamesList:completeAnimation()
				self.FileshareCustomGamesList:setAlpha( 0 )
				self.clipFinished( FileshareCustomGamesList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 1 )
				self.clipFinished( CustomGamesList, {} )
				GameName:completeAnimation()
				self.GameName:setAlpha( 1 )
				self.clipFinished( GameName, {} )
				PublishedCustomGameInfo:completeAnimation()
				self.PublishedCustomGameInfo:setAlpha( 0 )
				self.clipFinished( PublishedCustomGameInfo, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 1 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		},
		PublishButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FileshareCustomGamesList:completeAnimation()
				self.FileshareCustomGamesList:setAlpha( 1 )
				self.clipFinished( FileshareCustomGamesList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				FilesharePublishDetails:completeAnimation()
				self.FilesharePublishDetails:setAlpha( 1 )
				self.clipFinished( FilesharePublishDetails, {} )
				GameName:completeAnimation()
				self.GameName:setAlpha( 0 )
				self.clipFinished( GameName, {} )
				PublishedCustomGameInfo:completeAnimation()
				self.PublishedCustomGameInfo:setAlpha( 0 )
				self.clipFinished( PublishedCustomGameInfo, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
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
		},
		{
			stateName = "PublishButton",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "FileshareRoot.showPublishNewDetails", 1 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.showPublishNewDetails" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.showPublishNewDetails"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f49_local0 = self
		local f49_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f49_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f50_local0 = nil
		if not FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetFileshareShowcaseKickerText( controller )
			SetIsInFileshare( controller, "true" )
		elseif FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SetIsInFileshare( controller, "true" )
		end
		if not f50_local0 then
			f50_local0 = self:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if FileshareShowcaseIsPublishMode( element, controller ) then
			FileshareSetShowcasePublishMode( controller, false )
			return true
		else
			GoBack( self, controller )
			ClearSavedState( self, controller )
			SetInCustomGames( false )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local f53_local0 = self
		if FileshareShowcaseIsPublishMode( f53_local0, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareCustomGamesList", controller )
			MakeElementNotFocusable( self, "FileshareCustomGamesList", controller )
			MakeElementFocusable( self, "CustomGamesList", controller )
			SetFocusToElement( self, "CustomGamesList", controller )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		elseif not FileshareShowcaseIsPublishMode( f53_local0, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementFocusable( self, "FileshareCustomGamesList", controller )
			SetFocusToElement( self, "FileshareCustomGamesList", controller )
			SetElementStateByElementName( self, "LocalEmblemName", controller, "NoText" )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		if IsGlobalModelValueEqualTo( self, controller, "FileshareRoot.itemsCount", 0 ) and FileshareIsCheckingPageFetchThreshold( controller ) then
			HideElement( self, "FileshareCustomGamesList" )
			HideElement( self, "verticalCounter" )
			DisableNavigation( self, "FileshareCustomGamesList" )
			FileshareSetShowFileDetails( controller, false )
		elseif FileshareIsCheckingPageFetchThreshold( controller ) then
			ShowElement( self, "FileshareCustomGamesList" )
			ShowElement( self, "verticalCounter" )
			EnableNavigation( self, "FileshareCustomGamesList" )
			FileshareSetShowFileDetails( controller, true )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	FileshareCustomGamesList.id = "FileshareCustomGamesList"
	CustomGamesList.id = "CustomGamesList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FileshareCustomGamesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FileshareCustomGamesList:close()
		element.CustomGamesList:close()
		element.verticalCounter:close()
		element.FilesharePublishDetails:close()
		element.GameName:close()
		element.NoContentLabel:close()
		element.PublishedCustomGameInfo:close()
		element.MyShowcaseCustomGameListInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_CustomGames.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

