require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantItemND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelector" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "PublishMode", false )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.disablePopupOpenCloseAnim = true
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "variant" )
			CoD.FileshareUtility.SetInShowcaseManager( f2_arg1, false )
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Variants = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Variants" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Variants.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 432 )
	LeftPanel:setTopBottom( true, false, 92.67, 735.67 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local variantList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 77, 415 )
	variantList:setTopBottom( true, false, 134.5, 587.5 )
	variantList:setWidgetType( CoD.GunsmithVariantItemND )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList:setVerticalCounter( CoD.verticalCounter )
	variantList:setDataSource( "ShowcaseVariantList" )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		return f5_local0
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	variantList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, variantList, controller )
	end )
	variantList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Gunsmith_IsVariantOccupied( element, controller )
			end
		}
	} )
	self:addElement( variantList )
	self.variantList = variantList
	
	local FileshareSelector0 = CoD.FileshareSelector.new( self, controller )
	FileshareSelector0:setLeftRight( true, false, 64, 984 )
	FileshareSelector0:setTopBottom( true, false, 123, 684 )
	self:addElement( FileshareSelector0 )
	self.FileshareSelector0 = FileshareSelector0
	
	local FileshareNoContent = CoD.FileshareNoContent.new( self, controller )
	FileshareNoContent:setLeftRight( true, false, 121.5, 362.5 )
	FileshareNoContent:setTopBottom( true, false, 347.67, 414.17 )
	FileshareNoContent:mergeStateConditions( {
		{
			stateName = "Publish",
			condition = function ( menu, element, event )
				local f12_local0 = FileshareIsReady( controller )
				if f12_local0 then
					f12_local0 = FileshareShowcaseIsPublishMode( element, controller )
					if f12_local0 then
						f12_local0 = not ListElementHasElements( self, "variantList" )
					end
				end
				return f12_local0
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
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		self:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local PublishMode = Engine.GetModelValue( model )
		if PublishMode then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, PublishMode ) ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
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
	MyShowcase:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
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
	
	local FETabBar0 = CoD.FE_TabBar.new( self, controller )
	FETabBar0:setLeftRight( true, false, 0, 1567 )
	FETabBar0:setTopBottom( true, false, 84, 119 )
	FETabBar0.Tabs.grid:setHorizontalCount( 9 )
	FETabBar0.Tabs.grid:setDataSource( "FilesharePublishedVariantsTabs" )
	FETabBar0:subscribeToGlobalModel( controller, "FileshareRoot", "shouldShowTabs", function ( model )
		local shouldShowTabs = Engine.GetModelValue( model )
		if shouldShowTabs then
			FETabBar0:setAlpha( shouldShowTabs )
		end
	end )
	FETabBar0:registerEventHandler( "list_active_changed", function ( element, event )
		local f22_local0 = nil
		FilesharePublishedTabChanged( self, element, controller )
		ClearSavedState( self, controller )
		return f22_local0
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 0 )
				self.clipFinished( variantList, {} )
				FileshareSelector0:completeAnimation()
				self.FileshareSelector0:setAlpha( 1 )
				self.clipFinished( FileshareSelector0, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				variantList:completeAnimation()
				self.variantList:setAlpha( 1 )
				self.clipFinished( variantList, {} )
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
		local f27_local0 = self
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f28_local0 = nil
		if not FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			SetFileshareShowcaseKickerText( controller )
			SetIsInFileshare( controller, "true" )
		elseif FileshareIsCommunityMode( self, controller ) then
			ShowHeaderKickerAndIcon( self )
			FileshareSetCommunityKicker( controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			SetIsInFileshare( controller, "true" )
		end
		if not f28_local0 then
			f28_local0 = self:dispatchEventToChildren( event )
		end
		return f28_local0
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		local f31_local0 = self
		if not FileshareHasContent( f31_local0, controller ) then
			MediaManagerClearDisplay( self, f31_local0, controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local f32_local0 = self
		if FileshareShowcaseIsPublishMode( f32_local0, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareSelector0", controller )
			MakeElementNotFocusable( self, "FileshareSelector0", controller )
			MakeElementFocusable( self, "variantList", controller )
			SetFocusToElement( self, "variantList", controller )
		elseif not FileshareShowcaseIsPublishMode( f32_local0, controller ) then
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
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.variantList:close()
		element.FileshareSelector0:close()
		element.FileshareNoContent:close()
		element.TitleDotsWidget0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.FETabBar0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Variants.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

