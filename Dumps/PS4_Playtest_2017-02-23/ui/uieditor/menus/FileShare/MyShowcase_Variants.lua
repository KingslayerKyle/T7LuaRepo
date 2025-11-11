require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantItemND" )
require( "ui.uieditor.widgets.FileShare.FileshareSelector" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	Engine.CreateModel( rootModel, "PublishMode", false )
end

local PostLoadFunc = function ( self, controller )
	self.originalOcclusionChange = self.m_eventHandlers.occlusion_change
	self:registerEventHandler( "occlusion_change", function ( self, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "variant" )
			CoD.FileshareUtility.SetInShowcaseManager( controller, false )
			CoD.FileshareUtility.SetShowCreateButton( true )
			CoD.FileshareUtility.SetDirty()
		end
		self:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Variants = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Variants" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Variants.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 648 )
	LeftPanel:setTopBottom( 0, 0, 139, 1103 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local variantList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Gunsmith_IsVariantOccupied( element, controller )
			end
		}
	} )
	variantList:setLeftRight( 0, 0, 116.5, 622.5 )
	variantList:setTopBottom( 0, 0, 203, 881 )
	variantList:setWidgetType( CoD.GunsmithVariantItemND )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 10 )
	variantList:setVerticalCounter( CoD.verticalCounter )
	variantList:setDataSource( "ShowcaseVariantList" )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		return retVal
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	variantList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = variantList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( variantList )
	self.variantList = variantList
	
	local FileshareSelector0 = CoD.FileshareSelector.new( self, controller )
	FileshareSelector0:setLeftRight( 0, 0, 96, 1476 )
	FileshareSelector0:setTopBottom( 0, 0, 184, 1026 )
	self:addElement( FileshareSelector0 )
	self.FileshareSelector0 = FileshareSelector0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( 0, 0, 5, 793 )
	TitleDotsWidget0:setTopBottom( 0, 0, -97.5, 139.5 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
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
	MyShowcase:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	
	local FETabBar0 = CoD.FE_TabBar.new( self, controller )
	FETabBar0:setLeftRight( 0, 0, 0, 2350 )
	FETabBar0:setTopBottom( 0, 0, 126, 178 )
	FETabBar0.Tabs.grid:setHorizontalCount( 9 )
	FETabBar0.Tabs.grid:setDataSource( "FilesharePublishedVariantsTabs" )
	FETabBar0:subscribeToGlobalModel( controller, "FileshareRoot", "shouldShowTabs", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FETabBar0:setAlpha( modelValue )
		end
	end )
	FETabBar0:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		FilesharePublishedTabChanged( self, element, controller )
		ClearSavedState( self, controller )
		return retVal
	end )
	self:addElement( FETabBar0 )
	self.FETabBar0 = FETabBar0
	
	variantList.navigation = {
		right = FileshareSelector0,
		down = FileshareSelector0
	}
	FileshareSelector0.navigation = {
		left = variantList,
		up = variantList
	}
	SelfIdentityBadge.navigation = {
		down = FileshareSelector0
	}
	self.resetProperties = function ()
		variantList:completeAnimation()
		LeftPanel:completeAnimation()
		FileshareSelector0:completeAnimation()
		variantList:setAlpha( 1 )
		LeftPanel:setAlpha( 1 )
		FileshareSelector0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 0 )
				self.clipFinished( variantList, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FileshareSelector0:completeAnimation()
				self.FileshareSelector0:setAlpha( 0 )
				self.clipFinished( FileshareSelector0, {} )
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
		if FileshareShowcaseIsPublishMode( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		local element = self
		if not FileshareHasContent( element, controller ) then
			MediaManagerClearDisplay( self, element, controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local element = self
		if FileshareShowcaseIsPublishMode( element, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareSelector0", controller )
			MakeElementNotFocusable( self, "FileshareSelector0", controller )
			MakeElementFocusable( self, "variantList", controller )
			SetFocusToElement( self, "variantList", controller )
		elseif not FileshareShowcaseIsPublishMode( element, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "variantList", controller )
			MakeElementNotFocusable( self, "variantList", controller )
			MakeElementFocusable( self, "FileshareSelector0", controller )
			SetFocusToElement( self, "FileshareSelector0", controller )
		end
	end )
	variantList.id = "variantList"
	FileshareSelector0.id = "FileshareSelector0"
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.variantList:close()
		self.FileshareSelector0:close()
		self.TitleDotsWidget0:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FETabBar0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Variants.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

