-- 97558ca95d38315947d9541bfac955f4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.FileShare.FileshareSelector" )
require( "ui.uieditor.widgets.FileShare.FileshareNoContent" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
	f1_arg0.originalOcclusionChange = f1_arg0.m_eventHandlers.occlusion_change
	f1_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded then
			CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
			CoD.FileshareUtility.SetInShowcaseManager( f1_arg1, false )
			CoD.FileshareUtility.SetDirty()
		end
		element:originalOcclusionChange( event )
	end )
end

LUI.createMenu.MyShowcase_Paintjobs = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MyShowcase_Paintjobs" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MyShowcase_Paintjobs.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f3_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 432 )
	LeftPanel:setTopBottom( true, false, 92.67, 735.67 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local paintjobsList = LUI.UIList.new( f3_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 78, 416 )
	paintjobsList:setTopBottom( true, false, 137.5, 590.5 )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 3 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setSpacing( 7 )
	paintjobsList:setVerticalCounter( CoD.verticalCounter )
	paintjobsList:setDataSource( "ShowcasePaintjobList" )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		FileshareShowcasePublishSetSelectedItem( self, element, controller )
		return f4_local0
	end )
	paintjobsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	paintjobsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f3_local1:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if FileshareCanPublish( f7_arg2 ) and FileshareCanPublishItem( self, f7_arg0, f7_arg2 ) then
			FileshareShowcasePublishSelectedItem( self, f7_arg0, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if FileshareCanPublish( f8_arg2 ) and FileshareCanPublishItem( self, f8_arg0, f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_PUBLISH" )
			return true
		else
			return false
		end
	end, false )
	paintjobsList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, paintjobsList, controller )
	end )
	paintjobsList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Paintjobs_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( paintjobsList )
	self.paintjobsList = paintjobsList
	
	local FileshareSelector0 = CoD.FileshareSelector.new( f3_local1, controller )
	FileshareSelector0:setLeftRight( true, false, 64, 984 )
	FileshareSelector0:setTopBottom( true, false, 125, 684 )
	self:addElement( FileshareSelector0 )
	self.FileshareSelector0 = FileshareSelector0
	
	local FileshareNoContent = CoD.FileshareNoContent.new( f3_local1, controller )
	FileshareNoContent:setLeftRight( true, false, 121.5, 362.5 )
	FileshareNoContent:setTopBottom( true, false, 347.67, 414.17 )
	FileshareNoContent:mergeStateConditions( {
		{
			stateName = "Publish",
			condition = function ( menu, element, event )
				local f11_local0 = FileshareIsReady( controller )
				if f11_local0 then
					f11_local0 = FileshareShowcaseIsPublishMode( element, controller )
					if f11_local0 then
						f11_local0 = not ListElementHasElements( self, "paintjobsList" )
					end
				end
				return f11_local0
			end
		}
	} )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		f3_local1:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		f3_local1:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	FileshareNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		f3_local1:updateElementState( FileshareNoContent, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	self:addElement( FileshareNoContent )
	self.FileshareNoContent = FileshareNoContent
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( f3_local1, controller )
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
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local MenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_PAINTJOBS_CAPS" ) )
	MenuFrame:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local PublishMode = Engine.GetModelValue( model )
		if PublishMode then
			MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( FileshareGetShowcaseHeaderIcon( controller, PublishMode ) ) )
		end
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
	
	local TabList = CoD.FE_TabBar.new( f3_local1, controller )
	TabList:setLeftRight( true, false, -1, 2495 )
	TabList:setTopBottom( true, false, 84, 125 )
	TabList.Tabs.grid:setHorizontalCount( 11 )
	TabList.Tabs.grid:setDataSource( "FilesharePublishedPaintjobTabs" )
	TabList:subscribeToGlobalModel( controller, "FileshareRoot", "shouldShowTabs", function ( model )
		local shouldShowTabs = Engine.GetModelValue( model )
		if shouldShowTabs then
			TabList:setAlpha( shouldShowTabs )
		end
	end )
	TabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f19_local0 = nil
		FilesharePublishedTabChanged( self, element, controller )
		return f19_local0
	end )
	self:addElement( TabList )
	self.TabList = TabList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f3_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	paintjobsList.navigation = {
		right = FileshareSelector0,
		down = FileshareSelector0
	}
	FileshareSelector0.navigation = {
		left = paintjobsList,
		up = paintjobsList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				paintjobsList:completeAnimation()
				self.paintjobsList:setAlpha( 0 )
				self.clipFinished( paintjobsList, {} )
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
				paintjobsList:completeAnimation()
				self.paintjobsList:setAlpha( 1 )
				self.clipFinished( paintjobsList, {} )
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
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		local f24_local0 = self
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f3_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f25_local0 = nil
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
		if not f25_local0 then
			f25_local0 = element:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if FileshareShowcaseIsPublishMode( f26_arg0, f26_arg2 ) then
			FileshareSetShowcasePublishMode( f26_arg2, false )
			FileshareSetDirty( f26_arg2 )
			return true
		else
			GoBack( self, f26_arg2 )
			ClearSavedState( self, f26_arg2 )
			SendClientScriptMenuChangeNotify( f26_arg2, f26_arg1, false )
			MediaManagerClearDisplay( self, f26_arg0, f26_arg2 )
			return true
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if FileshareShowcaseIsPublishMode( f27_arg0, f27_arg2 ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		end
	end, false )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "itemsCount", function ( model )
		local f28_local0 = self
		if not FileshareHasContent( f28_local0, controller ) then
			MediaManagerClearDisplay( self, f28_local0, controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "PublishMode", function ( model )
		local f29_local0 = self
		if FileshareShowcaseIsPublishMode( f29_local0, controller ) then
			SetHeadingKickerText( "MENU_PUBLISH" )
			SetLoseFocusToElement( self, "FileshareSelector0", controller )
			MakeElementNotFocusable( self, "FileshareSelector0", controller )
			MakeElementFocusable( self, "paintjobsList", controller )
			SetFocusToElement( self, "paintjobsList", controller )
		elseif not FileshareShowcaseIsPublishMode( f29_local0, controller ) then
			SetFileshareShowcaseKickerText( controller )
			SetLoseFocusToElement( self, "paintjobsList", controller )
			MakeElementNotFocusable( self, "paintjobsList", controller )
			MakeElementFocusable( self, "FileshareSelector0", controller )
			SetFocusToElement( self, "FileshareSelector0", controller )
		end
	end )
	paintjobsList.id = "paintjobsList"
	FileshareSelector0.id = "FileshareSelector0"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.paintjobsList:close()
		element.FileshareSelector0:close()
		element.FileshareNoContent:close()
		element.TitleDotsWidget0:close()
		element.MenuFrame:close()
		element.SelfIdentityBadge:close()
		element.TabList:close()
		element.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MyShowcase_Paintjobs.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

