require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CustomGames.CustomGameItem" )
require( "ui.uieditor.widgets.FileShare.FileshareCustomGamesSelectorItem" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.FileShare.FilesharePublishDetails" )
require( "ui.uieditor.widgets.FileShare.MyShowcase_CustomGameListInfo" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "customgame" )
			CoD.FileshareUtility.SetInShowcaseManager( controller, false )
			CoD.FileshareUtility.SetDirty()
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_CustomGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_CustomGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_CustomGames.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
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
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_CUSTOMGAMES_CAPS" ) )
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
	
	local FileshareCustomGamesList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	FileshareCustomGamesList:makeFocusable()
	FileshareCustomGamesList:setLeftRight( 0, 0, 155, 977 )
	FileshareCustomGamesList:setTopBottom( 0, 0, 193, 886 )
	FileshareCustomGamesList:setWidgetType( CoD.FileshareCustomGamesSelectorItem )
	FileshareCustomGamesList:setHorizontalCount( 3 )
	FileshareCustomGamesList:setVerticalCount( 4 )
	FileshareCustomGamesList:setSpacing( 15 )
	FileshareCustomGamesList:setDataSource( "FilesharePublishedList" )
	FileshareCustomGamesList:linkToElementModel( FileshareCustomGamesList, "isPublishNew", true, function ( model )
		local element = FileshareCustomGamesList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	FileshareCustomGamesList:registerEventHandler( "menu_loaded", function ( element, event )
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
	FileshareCustomGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
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
	FileshareCustomGamesList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		FileshareItemLoseFocus( element )
		return retVal
	end )
	FileshareCustomGamesList:registerEventHandler( "gain_focus", function ( element, event )
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
	FileshareCustomGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( FileshareCustomGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			FileshareSetShowcasePublishMode( controller, true )
			return true
		elseif not IsSelfModelValueTrue( element, controller, "isPublishNew" ) then
			ProcessListAction( self, element, controller )
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
	self:AddButtonCallbackFunction( FileshareCustomGamesList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
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
	FileshareCustomGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = FileshareCustomGamesList
		UpdateDataSource( self, element, controller )
	end )
	FileshareCustomGamesList:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local element = FileshareCustomGamesList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( FileshareCustomGamesList )
	self.FileshareCustomGamesList = FileshareCustomGamesList
	
	local CustomGamesList = LUI.UIList.new( self, controller, 15, 0, nil, true, false, 0, 0, false, false )
	CustomGamesList:makeFocusable()
	CustomGamesList:setLeftRight( 0, 0, 155, 977 )
	CustomGamesList:setTopBottom( 0, 0, 193, 886 )
	CustomGamesList:setAlpha( 0 )
	CustomGamesList:setWidgetType( CoD.CustomGameItem )
	CustomGamesList:setHorizontalCount( 3 )
	CustomGamesList:setVerticalCount( 4 )
	CustomGamesList:setSpacing( 15 )
	CustomGamesList:setDataSource( "MediaManagerCustomGamesList" )
	CustomGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		FileshareSetShowFileDetails( controller, false )
		SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		SetSelectedCustomGame( element, controller )
		return retVal
	end )
	CustomGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	CustomGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( CustomGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			FileshareShowcasePublishSelectedItem( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanPublish( controller ) and FileshareCanPublishItem( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CustomGamesList )
	self.CustomGamesList = CustomGamesList
	
	local verticalCounter = CoD.verticalCounter.new( self, controller )
	verticalCounter:setLeftRight( 0, 0, 406, 706 )
	verticalCounter:setTopBottom( 0, 0, 921, 959 )
	verticalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListVerticalCounter( self, element, "FileshareCustomGamesList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( verticalCounter )
	self.verticalCounter = verticalCounter
	
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
	FilesharePublishDetails:setTopBottom( 0, 0, 214.5, 925.5 )
	self:addElement( FilesharePublishDetails )
	self.FilesharePublishDetails = FilesharePublishDetails
	
	local GameName = CoD.WeaponNameWidget.new( self, controller )
	GameName:setLeftRight( 0, 0, 1139, 1773 )
	GameName:setTopBottom( 0, 0, 620.5, 671.5 )
	self:addElement( GameName )
	self.GameName = GameName
	
	local NoContentLabel = CoD.FileshareNoContent.new( self, controller )
	NoContentLabel:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	NoContentLabel:setLeftRight( 0, 0, 368.5, 743.5 )
	NoContentLabel:setTopBottom( 0, 0, 497, 587 )
	NoContentLabel:setAlpha( 0 )
	self:addElement( NoContentLabel )
	self.NoContentLabel = NoContentLabel
	
	local MyShowcaseCustomGameListInfo = CoD.MyShowcase_CustomGameListInfo.new( self, controller )
	MyShowcaseCustomGameListInfo:setLeftRight( 0, 0, 1082, 1832 )
	MyShowcaseCustomGameListInfo:setTopBottom( 0, 0, 193, 761 )
	self:addElement( MyShowcaseCustomGameListInfo )
	self.MyShowcaseCustomGameListInfo = MyShowcaseCustomGameListInfo
	
	GameName:linkToElementModel( CustomGamesList, nil, false, function ( model )
		GameName:setModel( model, controller )
	end )
	GameName:linkToElementModel( CustomGamesList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	MyShowcaseCustomGameListInfo:linkToElementModel( CustomGamesList, nil, false, function ( model )
		MyShowcaseCustomGameListInfo:setModel( model, controller )
	end )
	FileshareCustomGamesList.navigation = {
		down = verticalCounter
	}
	CustomGamesList.navigation = {
		down = verticalCounter
	}
	verticalCounter.navigation = {
		up = {
			FileshareCustomGamesList,
			CustomGamesList
		}
	}
	self.resetProperties = function ()
		FilesharePublishDetails:completeAnimation()
		GameName:completeAnimation()
		MyShowcaseCustomGameListInfo:completeAnimation()
		NoContentLabel:completeAnimation()
		CustomGamesList:completeAnimation()
		FileshareCustomGamesList:completeAnimation()
		FilesharePublishDetails:setAlpha( 1 )
		GameName:setAlpha( 1 )
		MyShowcaseCustomGameListInfo:setAlpha( 1 )
		NoContentLabel:setAlpha( 0 )
		CustomGamesList:setAlpha( 0 )
		FileshareCustomGamesList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FilesharePublishDetails:completeAnimation()
				self.FilesharePublishDetails:setAlpha( 0 )
				self.clipFinished( FilesharePublishDetails, {} )
				GameName:completeAnimation()
				self.GameName:setAlpha( 0 )
				self.clipFinished( GameName, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		},
		NoContent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				NoContentLabel:completeAnimation()
				self.NoContentLabel:setAlpha( 1 )
				self.clipFinished( NoContentLabel, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FileshareCustomGamesList:completeAnimation()
				self.FileshareCustomGamesList:setAlpha( 0 )
				self.clipFinished( FileshareCustomGamesList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 1 )
				self.clipFinished( CustomGamesList, {} )
			end
		},
		PublishButton = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GameName:completeAnimation()
				self.GameName:setAlpha( 0 )
				self.clipFinished( GameName, {} )
				MyShowcaseCustomGameListInfo:completeAnimation()
				self.MyShowcaseCustomGameListInfo:setAlpha( 0 )
				self.clipFinished( MyShowcaseCustomGameListInfo, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoContent",
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
			SetInCustomGames( false )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local element = self
		if FileshareShowcaseIsPublishMode( element, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareCustomGamesList", controller )
			MakeElementNotFocusable( self, "FileshareCustomGamesList", controller )
			MakeElementFocusable( self, "CustomGamesList", controller )
			SetFocusToElement( self, "CustomGamesList", controller )
			SetElementStateByElementName( self, "EmblemName", controller, "NoText" )
		elseif not FileshareShowcaseIsPublishMode( element, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementFocusable( self, "FileshareCustomGamesList", controller )
			SetFocusToElement( self, "FileshareCustomGamesList", controller )
			SetElementStateByElementName( self, "LocalEmblemName", controller, "NoText" )
		else
			
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	FileshareCustomGamesList.id = "FileshareCustomGamesList"
	CustomGamesList.id = "CustomGamesList"
	verticalCounter.id = "verticalCounter"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FileshareCustomGamesList:close()
		self.CustomGamesList:close()
		self.verticalCounter:close()
		self.FilesharePublishDetails:close()
		self.GameName:close()
		self.NoContentLabel:close()
		self.MyShowcaseCustomGameListInfo:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_CustomGames.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

