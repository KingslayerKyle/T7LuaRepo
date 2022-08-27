-- f1b6107e4f0f32edffaea9a2a246a044
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationListButton_NB" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponCustomizationSelect" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponPreviewPane" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.WeaponGroupsTabWidget" )

CoD.WC_Category = {}
CoD.WC_Category.Modes = {
	SELECTING_CATEGORY = 1,
	SELECTING_ITEM = 2
}
CoD.WC_Category.ModeToOpenIn = CoD.WC_Category.Modes.SELECTING_CATEGORY
CoD.WC_Category.DefaultFrameWidget = CoD.WeaponPreviewPane
CoD.WC_Category.ACV = {}
local PreLoadFunc = function ( self, controller )
	local f1_local0 = CoD.perController[controller].classModel
	local f1_local1 = CoD.perController[controller].classNum
	local f1_local2 = CoD.perController[controller].weaponCategory
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO
	CoD.SetCustomization( controller, Engine.GetModelValue( Engine.GetModel( f1_local0, f1_local2 .. ".itemIndex" ) ), "weapon_index" )
	if Paintjobs_IsEnabled( self, controller ) then
		CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		local f1_local3 = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	end
	self.disableBlur = true
	Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "StoreRoot" ), "InventoryItemPurchaseSuccessful" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = CoD.perController[f2_arg0].classModel
	local f2_local1 = CoD.perController[f2_arg0].weaponCategory
	local f2_local2, f2_local3 = nil
	local f2_local4 = DataSources.WeaponOptions.getCurrentFilterItem()
	f2_local2 = Engine.GetModel( f2_local0, f2_local1 .. f2_local4 .. ".itemIndex" )
	if f2_local2 then
		f2_local3 = f2_arg1:findItem( {
			weaponOptionTypeName = f2_local4,
			weaponOptionSubIndex = Engine.GetModelValue( f2_local2 )
		}, nil, false, false )
	else
		local f2_local5 = Engine.GetModel( f2_local0, f2_local1 .. f2_local4 .. "slot.itemIndex" )
		local f2_local6 = Engine.GetModel( f2_local0, f2_local1 .. f2_local4 .. "index.itemIndex" )
		local f2_local7 = Engine.GetModelValue( f2_arg2:getModel( f2_arg0, "type" ) )
		if f2_local5 and f2_local6 then
			f2_local3 = f2_arg1:findItem( {
				weaponOptionTypeName = f2_local4,
				paintjobSlot = Engine.GetModelValue( f2_local5 ),
				paintjobIndex = Engine.GetModelValue( f2_local6 )
			}, nil, false, false )
		elseif LUI.startswith( f2_local7, "attachment" ) then
			f2_local3 = f2_arg1:findItem( {
				weaponOptionSubIndex = CoD.GetClassItem( f2_arg0, CoD.perController[f2_arg0].classNum, f2_local1 .. CoD.CACUtility[f2_local1 .. "WeaponPrestigeSlot"] )
			} )
		else
			local f2_local8 = DataSources.WeaponOptions.getCurrentFilterItemNoMode()
			local f2_local9 = Engine.GetModel( f2_local0, f2_local1 .. f2_local8 .. ".itemIndex" )
			if f2_local9 then
				local f2_local10 = Engine.GetModelValue( f2_local9 )
				f2_local3 = f2_arg1:findItem( {
					weaponOptionTypeName = f2_local8,
					weaponOptionSubIndex = 0
				}, nil, false, false )
			end
		end
	end
	if f2_local3 then
		f2_arg1:setActiveItem( f2_local3 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.mode
	local f3_local1 = f3_arg1.element
	local f3_local2 = f3_arg0:getOwner()
	f3_arg0.currentMode = f3_local0
	CoD.WC_Category.ModeToOpenIn = f3_local0
	f3_arg0.tabChanged = CoD.WC_Category.UpdateListFromTabChanged
	if f3_local0 == CoD.WC_Category.Modes.SELECTING_CATEGORY then
		f3_arg0.categoryTabs.Tabs.m_disableNavigation = true
		CoD.SwapFocusableElements( f3_local2, f3_arg0.frame, f3_arg0.categoryList )
		f3_arg0:setState( "DefaultState" )
	elseif f3_local0 == CoD.WC_Category.Modes.SELECTING_ITEM then
		local f3_local3 = Engine.GetModelValue( f3_local1:getModel( f3_local2, "type" ) )
		CoD.WC_Category.ACV.selectedAttachment = f3_local3
		CoD.perController[f3_local2].WC_hasTabs = false
		if f3_local3 ~= CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] and not LUI.startswith( f3_local3, "attachment" ) then
			CoD.perController[f3_local2].WC_hasTabs = true
			f3_arg0.categoryTabs.Tabs.m_disableNavigation = false
			for f3_local4 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
				local f3_local7 = f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
					filterEnum = f3_local4
				}, false, false )
				if f3_local7 then
					local f3_local8 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f3_local2].classModel, CoD.perController[f3_local2].weaponCategory .. ".itemIndex" ) )
					local f3_local9 = CoD.CACUtility.GetWeaponOptionTypeForName( f3_local3 )
					local f3_local10 = f3_local7:getModel( f3_local2, "breadcrumbCount" )
					if f3_local10 then
						local f3_local11 = 0
						if f3_local4 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							f3_local11 = Engine.WeaponOptionNewItemCount( f3_local2, f3_local8, f3_local9, f3_local7.filterEnum )
						else
							f3_local11 = Engine.WeaponOptionNewModeAgnosticItemCount( f3_local2, f3_local8, f3_local9, f3_local7.filterEnum )
						end
						Engine.SetModelValue( f3_local10, f3_local11 )
					end
				end
			end
			local f3_local4 = Engine.CurrentSessionMode()
			if f3_local4 == Enum.eModes.MODE_INVALID then
				f3_local4 = Enum.eModes.MODE_CAMPAIGN
			end
			local f3_local5 = f3_local3 .. "_" .. CoD.WeaponOptionFilterToString( f3_local4 )
			f3_arg0.categoryTabs.Tabs.grid:setActiveItem( f3_arg0.categoryTabs.Tabs.grid:findItem( nil, {
				filterEnum = f3_local4
			}, false, false ) )
			DataSources.WeaponOptions.setCurrentFilterItem( f3_local5 )
			DataSources.WeaponOptions.setCurrentFilterItemNoMode( f3_local3 )
		else
			DataSources.WeaponOptions.setCurrentFilterItem( f3_local3 )
		end
		f3_arg0.frame:changeFrameWidget( f3_local1.viewWidget, true )
		f3_arg0.frame.framedWidget.selectionList:updateDataSource()
		f0_local1( f3_local2, f3_arg0.frame.framedWidget.selectionList, f3_local1 )
		CoD.SwapFocusableElements( f3_local2, f3_arg0.categoryList, f3_arg0.frame )
		if f3_local3 ~= CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] and not LUI.startswith( f3_local3, "attachment" ) then
			f3_arg0:setState( "Editing" )
		else
			f3_arg0:setState( "EditingWithoutTabs" )
		end
	end
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	local f4_local0 = CoD.perController[f4_arg1].classModel
	CoD.WeaponOptionsTable = nil
	CoD.WeaponOptionsTable = CoD.GetWeaponOptionsTable( f4_arg1 )
	CoD.CACUtility.UpdateWeaponOptions( f4_arg1, f4_local0 )
	f4_arg0.updateMode = f0_local2
	f4_arg0:updateMode( {
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
	f4_arg0:registerEventHandler( "update_selection_mode", f0_local2 )
	f4_arg0:playClip( "FadeIn" )
	f4_arg0.originalOcclusionChange = f4_arg0.m_eventHandlers.occlusion_change
	f4_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and event.occludedBy and event.occludedBy.id == "Menu.PurchaseInventoryItemComplete" then
			local f5_local0 = CoD.GetCustomization( f4_arg1, "weapon_index" )
			CoD.WeaponOptionsTable = {}
			CoD.GetWeaponOptionsTableForCategory( f4_arg1, CoD.WeaponOptionsTable, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, f5_local0, 0, true )
			ForceNotifyControllerModel( f4_arg1, "StoreRoot.InventoryItemPurchaseSuccessful" )
			local f5_local1 = element.categoryTabs.Tabs.grid:findItem( nil, {
				filterEnum = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS
			}, false, false )
			if f5_local1 then
				Engine.SetModelValue( f5_local1:getModel( f4_arg1, "breadcrumbCount" ), Engine.WeaponOptionNewModeAgnosticItemCount( f4_arg1, f5_local0, CoD.CACUtility.GetWeaponOptionTypeForName( "camo" ), f5_local1.filterEnum ) )
			end
		end
		element:originalOcclusionChange( event )
	end )
end

CoD.WC_Category.UpdateListFromTabChanged = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = CoD.WC_Category.ACV.selectedAttachment
	if f6_arg0.frame.framedWidget.selectionList and f6_local0 and f6_arg1.filterString then
		DataSources.WeaponOptions.setCurrentFilterItem( f6_local0 .. "_" .. f6_arg1.filterString )
		f6_arg0.frame.framedWidget.selectionList:updateDataSource()
		f6_arg0.frame.framedWidget.selectionList:findItem( {
			weaponOptionSubIndex = 0
		}, nil, true, nil )
	end
end

LUI.createMenu.WeaponCustomization = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WeaponCustomization" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_EditLoadout"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponCustomization.buttonPrompts" )
	local f7_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, false, -16, 1300 )
	Fade:setTopBottom( true, false, -23, 739 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.79 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f7_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 310 )
	LeftPanel:setTopBottom( true, false, 85, 674 )
	LeftPanel:setRGB( 0.67, 0.67, 0.67 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local background = CoD.CACBackgroundNew.new( f7_local1, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background.classAllocation:setAlpha( 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetWeaponCustomizationMenuHeaderName( controller, "MPUI_PERSONALIZE_CAPS" ) ) )
	self:addElement( background )
	self.background = background
	
	local categoryList = LUI.UIList.new( f7_local1, controller, 5, 0, nil, true, false, 0, 0, false, false )
	categoryList:makeFocusable()
	categoryList:setLeftRight( true, false, 74.5, 299.5 )
	categoryList:setTopBottom( true, false, 135.5, 550.5 )
	categoryList:setDataSource( "WeaponCustomCategory" )
	categoryList:setWidgetType( CoD.CustomizationListButton_NB )
	categoryList:setVerticalCount( 6 )
	categoryList:setSpacing( 5 )
	categoryList:linkToElementModel( categoryList, "disabled", true, function ( model )
		local f8_local0 = categoryList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	categoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		WC_WeaponCustomizationGainFocus( self, element, controller )
		return f9_local0
	end )
	categoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f7_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	categoryList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	f7_local1:AddButtonCallbackFunction( categoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			WC_SetSelectingItem( self, f12_arg0, f12_arg2 )
			PlaySoundAlias( "uin_select" )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local frame = LUI.UIFrame.new( f7_local1, controller, 0, 0, false )
	frame:setLeftRight( true, false, 65.5, 2070 )
	frame:setTopBottom( true, false, 125, 630 )
	frame:setAlpha( 0 )
	frame:changeFrameWidget( CoD.WeaponCustomizationSelect )
	self:addElement( frame )
	self.frame = frame
	
	local previewPane = CoD.WeaponPreviewPane.new( f7_local1, controller )
	previewPane:setLeftRight( true, false, 279, 1135 )
	previewPane:setTopBottom( true, false, 116, 621 )
	self:addElement( previewPane )
	self.previewPane = previewPane
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( f7_local1, controller )
	ElemsSideList:setLeftRight( true, false, 4.13, 72 )
	ElemsSideList:setTopBottom( true, false, -12, 658 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( f7_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		SizeToSafeArea( element, controller )
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local categoryTabs = CoD.FE_TabBar.new( f7_local1, controller )
	categoryTabs:setLeftRight( true, false, 0, 2497 )
	categoryTabs:setTopBottom( true, false, 85, 126 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local f15_local0 = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return f15_local0
	end )
	self:addElement( categoryTabs )
	self.categoryTabs = categoryTabs
	
	frame:linkToElementModel( categoryList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	previewPane:linkToElementModel( categoryList, nil, false, function ( model )
		previewPane:setModel( model, controller )
	end )
	categoryList.navigation = {
		right = frame,
		down = frame
	}
	frame.navigation = {
		left = categoryList,
		up = categoryList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 310 )
					LeftPanel:setTopBottom( true, false, 85, 674 )
					LeftPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 310 )
				self.LeftPanel:setTopBottom( true, false, 85, 674 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				categoryListFrame2( categoryList, {} )
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				self.clipFinished( frame, {} )
				local previewPaneFrame2 = function ( previewPane, event )
					if not event.interrupted then
						previewPane:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					previewPane:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( previewPane, event )
					else
						previewPane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewPane:completeAnimation()
				self.previewPane:setAlpha( 0 )
				previewPaneFrame2( previewPane, {} )
				categoryTabs:completeAnimation()
				self.categoryTabs:setAlpha( 0 )
				self.clipFinished( categoryTabs, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
			end,
			Editing = function ()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 425 )
					LeftPanel:setTopBottom( true, false, 85, 674 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 310 )
				self.LeftPanel:setTopBottom( true, false, 85, 674 )
				LeftPanelFrame2( LeftPanel, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				categoryListFrame2( categoryList, {} )
				local frameFrame2 = function ( frame, event )
					if not event.interrupted then
						frame:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					frame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( frame, event )
					else
						frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				frameFrame2( frame, {} )
				local previewPaneFrame2 = function ( previewPane, event )
					if not event.interrupted then
						previewPane:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					previewPane:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( previewPane, event )
					else
						previewPane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewPane:completeAnimation()
				self.previewPane:setAlpha( 1 )
				previewPaneFrame2( previewPane, {} )
				local categoryTabsFrame2 = function ( categoryTabs, event )
					if not event.interrupted then
						categoryTabs:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					categoryTabs:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryTabs, event )
					else
						categoryTabs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryTabs:completeAnimation()
				self.categoryTabs:setAlpha( 0 )
				categoryTabsFrame2( categoryTabs, {} )
			end,
			EditingWithoutTabs = function ()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 425 )
					LeftPanel:setTopBottom( true, false, 85, 674 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 310 )
				self.LeftPanel:setTopBottom( true, false, 85, 674 )
				LeftPanelFrame2( LeftPanel, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				categoryListFrame2( categoryList, {} )
				local frameFrame2 = function ( frame, event )
					if not event.interrupted then
						frame:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					frame:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( frame, event )
					else
						frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				frameFrame2( frame, {} )
				local previewPaneFrame2 = function ( previewPane, event )
					if not event.interrupted then
						previewPane:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					previewPane:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( previewPane, event )
					else
						previewPane:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				previewPane:completeAnimation()
				self.previewPane:setAlpha( 1 )
				previewPaneFrame2( previewPane, {} )
				categoryTabs:completeAnimation()
				self.categoryTabs:setAlpha( 0 )
				self.clipFinished( categoryTabs, {} )
			end
		},
		Editing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 310 )
					LeftPanel:setTopBottom( true, false, 85, 674 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 425 )
				self.LeftPanel:setTopBottom( true, false, 85, 674 )
				LeftPanelFrame2( LeftPanel, {} )
			end
		},
		EditingWithoutTabs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 310 )
					LeftPanel:setTopBottom( true, false, 85, 674 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 425 )
				self.LeftPanel:setTopBottom( true, false, 85, 674 )
				LeftPanelFrame2( LeftPanel, {} )
				categoryTabs:completeAnimation()
				self.categoryTabs:setAlpha( 0 )
				self.clipFinished( categoryTabs, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f7_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f41_local0 = nil
		PlaySoundSetSound( self, "navigate" )
		ShowHeaderKickerAndIcon( f7_local1 )
		if not f41_local0 then
			f41_local0 = element:dispatchEventToChildren( event )
		end
		return f41_local0
	end )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
		return true
	end, function ( f43_arg0, f43_arg1, f43_arg2 )
		CoD.Menu.SetButtonLabel( f43_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f7_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if IsListSelectionMode( f44_arg1, CoD.WC_Category.Modes.SELECTING_CATEGORY ) then
			GoBack( self, f44_arg2 )
			ClearSavedState( self, f44_arg2 )
			PlaySoundSetSound( self, "menu_go_back" )
			SendClientScriptNotifyForAdjustedClient( f44_arg2, "cam_customization_closed", "" )
			GetCustomClassModel( f44_arg2 )
			SetPerControllerTableProperty( f44_arg2, "customizationType", nil )
			return true
		elseif IsListSelectionMode( f44_arg1, CoD.WC_Category.Modes.SELECTING_ITEM ) then
			WC_SetChoosingCategory( self, f44_arg0, f44_arg2 )
			WC_VariantSelectionCancel( self, f44_arg0, f44_arg2 )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsListSelectionMode( f45_arg1, CoD.WC_Category.Modes.SELECTING_CATEGORY ) then
			return true
		elseif IsListSelectionMode( f45_arg1, CoD.WC_Category.Modes.SELECTING_ITEM ) then
			return true
		else
			return false
		end
	end, false )
	categoryList.id = "categoryList"
	frame.id = "frame"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f7_local1
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.background:close()
		element.categoryList:close()
		element.previewPane:close()
		element.ElemsSideList:close()
		element.feFooterContainer:close()
		element.categoryTabs:close()
		element.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponCustomization.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

