require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationListButton_NB" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponCustomizationSelect" )
require( "ui.uieditor.widgets.CAC.Customization.WeaponPreviewPane" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
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
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	CoD.perController[controller].customizationType = Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	if Paintjobs_IsEnabled( self, controller ) then
		CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	end
	self.disableBlur = true
end

local SetStartFocusItem = function ( controller, list, element )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local selectedModel, focusedWidget = nil
	local currentFilter = DataSources.WeaponOptions.getCurrentFilterItem()
	selectedModel = Engine.GetModel( classModel, loadoutSlotName .. currentFilter .. ".itemIndex" )
	if selectedModel then
		local selectedModelItemIndex = Engine.GetModelValue( selectedModel )
		focusedWidget = list:findItem( {
			weaponOptionTypeName = currentFilter,
			weaponOptionSubIndex = selectedModelItemIndex
		}, nil, false, nil )
	else
		local paintjobSlotModel = Engine.GetModel( classModel, loadoutSlotName .. currentFilter .. "slot.itemIndex" )
		local paintjobIndexModel = Engine.GetModel( classModel, loadoutSlotName .. currentFilter .. "index.itemIndex" )
		local attachmentRef = Engine.GetModelValue( element:getModel( controller, "type" ) )
		if paintjobSlotModel and paintjobIndexModel then
			local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
			local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
			focusedWidget = list:findItem( {
				weaponOptionTypeName = currentFilter,
				paintjobSlot = paintjobSlot,
				paintjobIndex = paintjobIndex
			}, nil, false, nil )
		elseif LUI.startswith( attachmentRef, "attachment" ) then
			local slot = CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"]
			focusedWidget = list:findItem( {
				weaponOptionSubIndex = CoD.CACUtility.GetClassItem( controller, CoD.perController[controller].classNum, loadoutSlotName .. slot )
			} )
		else
			local currentFilterNoMode = DataSources.WeaponOptions.getCurrentFilterItemNoMode()
			local weaponOptionIndexModel = Engine.GetModel( classModel, loadoutSlotName .. currentFilterNoMode .. ".itemIndex" )
			if weaponOptionIndexModel then
				local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
				focusedWidget = list:findItem( {
					weaponOptionTypeName = currentFilterNoMode,
					weaponOptionSubIndex = 0
				}, nil, false, nil )
			end
		end
	end
	if focusedWidget then
		list:setActiveItem( focusedWidget )
	end
end

local UpdateSelectionMode = function ( self, event )
	local mode = event.mode
	local element = event.element
	local controller = self:getOwner()
	self.currentMode = mode
	CoD.WC_Category.ModeToOpenIn = mode
	self.tabChanged = CoD.WC_Category.UpdateListFromTabChanged
	if mode == CoD.WC_Category.Modes.SELECTING_CATEGORY then
		self.categoryTabs.Tabs.m_disableNavigation = true
		CoD.SwapFocusableElements( controller, self.frame, self.categoryList )
		self:setState( "DefaultState" )
	elseif mode == CoD.WC_Category.Modes.SELECTING_ITEM then
		local attachmentRef = Engine.GetModelValue( element:getModel( controller, "type" ) )
		CoD.WC_Category.ACV.selectedAttachment = attachmentRef
		CoD.perController[controller].WC_hasTabs = false
		if attachmentRef ~= CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] and not LUI.startswith( attachmentRef, "attachment" ) then
			CoD.perController[controller].WC_hasTabs = true
			self.categoryTabs.Tabs.m_disableNavigation = false
			for f3_local0 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
				local tabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
					filterEnum = f3_local0
				}, false, nil )
				if tabWidget then
					local classModel = CoD.perController[controller].classModel
					local loadoutSlotName = CoD.perController[controller].weaponCategory
					local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" ) )
					local weaponOptionType = CoD.CACUtility.GetWeaponOptionTypeForName( attachmentRef )
					local breadcrumbCountModel = tabWidget:getModel( controller, "breadcrumbCount" )
					if breadcrumbCountModel then
						local newItemCount = 0
						if f3_local0 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							newItemCount = Engine.WeaponOptionNewItemCount( controller, weaponItemIndex, weaponOptionType, tabWidget.filterEnum )
						else
							newItemCount = Engine.WeaponOptionNewModeAgnosticItemCount( controller, weaponItemIndex, weaponOptionType, tabWidget.filterEnum )
						end
						Engine.SetModelValue( breadcrumbCountModel, newItemCount )
					end
				end
			end
			local currentMode = Engine.CurrentSessionMode()
			if currentMode == Enum.eModes.MODE_INVALID then
				currentMode = Enum.eModes.MODE_CAMPAIGN
			end
			local filterItemName = attachmentRef .. "_" .. CoD.WeaponOptionFilterToString( currentMode )
			local tabWidget = self.categoryTabs.Tabs.grid:findItem( nil, {
				filterEnum = currentMode
			}, false, nil )
			self.categoryTabs.Tabs.grid:setActiveItem( tabWidget )
			DataSources.WeaponOptions.setCurrentFilterItem( filterItemName )
			DataSources.WeaponOptions.setCurrentFilterItemNoMode( attachmentRef )
		else
			DataSources.WeaponOptions.setCurrentFilterItem( attachmentRef )
		end
		self.frame:changeFrameWidget( element.viewWidget, true )
		self.frame.framedWidget.selectionList:updateDataSource()
		local list = self.frame.framedWidget.selectionList
		SetStartFocusItem( controller, list, element )
		CoD.SwapFocusableElements( controller, self.categoryList, self.frame )
		if attachmentRef ~= CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] and not LUI.startswith( attachmentRef, "attachment" ) then
			self:setState( "Editing" )
		else
			self:setState( "EditingWithoutTabs" )
		end
	end
end

local PostLoadFunc = function ( self, controller )
	local classModel = CoD.perController[controller].classModel
	CoD.CACUtility.WeaponOptionsTable = nil
	CoD.CACUtility.WeaponOptionsTable = CoD.CACUtility.GetWeaponOptionsTable( controller )
	CoD.CACUtility.UpdateWeaponOptions( controller, classModel )
	self.updateMode = UpdateSelectionMode
	self:updateMode( {
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
	self:registerEventHandler( "update_selection_mode", UpdateSelectionMode )
	self:playClip( "FadeIn" )
end

CoD.WC_Category.UpdateListFromTabChanged = function ( self, element, controller )
	local filterCategory = CoD.WC_Category.ACV.selectedAttachment
	if self.frame.framedWidget.selectionList and filterCategory and element.filterString then
		DataSources.WeaponOptions.setCurrentFilterItem( filterCategory .. "_" .. element.filterString )
		self.frame.framedWidget.selectionList:updateDataSource()
		self.frame.framedWidget.selectionList:findItem( {
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponCustomization.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( 0, 0, -24, 1950 )
	Fade:setTopBottom( 0, 0, -34, 1109 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.79 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 465 )
	LeftPanel:setTopBottom( 0, 0, 127, 1011 )
	LeftPanel:setRGB( 0.67, 0.67, 0.67 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local background = CoD.CACBackgroundNew.new( self, controller )
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background.classAllocation:setAlpha( 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetWeaponCustomizationMenuHeaderName( controller, "MPUI_PERSONALIZE_CAPS" ) ) )
	self:addElement( background )
	self.background = background
	
	local categoryList = LUI.UIList.new( self, controller, 8, 0, nil, true, false, 0, 0, false, false )
	categoryList:makeFocusable()
	categoryList:setLeftRight( 0, 0, 112, 449 )
	categoryList:setTopBottom( 0, 0, 203, 825 )
	categoryList:setWidgetType( CoD.CustomizationListButton_NB )
	categoryList:setVerticalCount( 6 )
	categoryList:setSpacing( 8 )
	categoryList:setDataSource( "WeaponCustomCategory" )
	categoryList:linkToElementModel( categoryList, "disabled", true, function ( model )
		local element = categoryList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	categoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		WC_WeaponCustomizationGainFocus( self, element, controller )
		return retVal
	end )
	categoryList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	categoryList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( categoryList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			WC_SetSelectingItem( self, element, controller )
			PlaySoundAlias( "uin_select" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local frame = LUI.UIFrame.new( self, controller, 0, 0, false )
	frame:setLeftRight( 0, 0, 98, 3105 )
	frame:setTopBottom( 0, 0, 187, 945 )
	frame:setAlpha( 0 )
	frame:changeFrameWidget( CoD.WeaponCustomizationSelect )
	self:addElement( frame )
	self.frame = frame
	
	local previewPane = CoD.WeaponPreviewPane.new( self, controller )
	previewPane:setLeftRight( 0, 0, 419, 1703 )
	previewPane:setTopBottom( 0, 0, 174, 932 )
	self:addElement( previewPane )
	self.previewPane = previewPane
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 6, 108 )
	ElemsSideList:setTopBottom( 0, 0, -18.5, 986.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -98, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local categoryTabs = CoD.FE_TabBar.new( self, controller )
	categoryTabs:setLeftRight( 0, 0, 0, 3746 )
	categoryTabs:setTopBottom( 0, 0, 127, 189 )
	categoryTabs.Tabs.grid:setWidgetType( CoD.WeaponGroupsTabWidget )
	categoryTabs.Tabs.grid:setHorizontalCount( 8 )
	categoryTabs.Tabs.grid:setDataSource( "CACCustomizationTabs" )
	categoryTabs:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CallCustomElementFunction_Self( self, "tabChanged", element, controller )
		return retVal
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
	self.resetProperties = function ()
		categoryList:completeAnimation()
		previewPane:completeAnimation()
		LeftPanel:completeAnimation()
		categoryTabs:completeAnimation()
		Fade:completeAnimation()
		frame:completeAnimation()
		categoryList:setAlpha( 1 )
		previewPane:setAlpha( 1 )
		LeftPanel:setLeftRight( 0, 0, 96, 465 )
		LeftPanel:setTopBottom( 0, 0, 127, 1011 )
		LeftPanel:setAlpha( 1 )
		categoryTabs:setAlpha( 1 )
		Fade:setAlpha( 0.79 )
		frame:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 465 )
					LeftPanel:setTopBottom( 0, 0, 127, 1011 )
					LeftPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 465 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1011 )
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
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 95.5, 637.5 )
					LeftPanel:setTopBottom( 0, 0, 127, 1011 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 465 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1011 )
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
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 95.5, 637.5 )
					LeftPanel:setTopBottom( 0, 0, 127, 1011 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 96, 465 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1011 )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 465 )
					LeftPanel:setTopBottom( 0, 0, 127, 1011 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 95.5, 637.5 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1011 )
				LeftPanelFrame2( LeftPanel, {} )
			end
		},
		EditingWithoutTabs = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( 0, 0, 96, 465 )
					LeftPanel:setTopBottom( 0, 0, 127, 1011 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( 0, 0, 95.5, 637.5 )
				self.LeftPanel:setTopBottom( 0, 0, 127, 1011 )
				LeftPanelFrame2( LeftPanel, {} )
				categoryTabs:completeAnimation()
				self.categoryTabs:setAlpha( 0 )
				self.clipFinished( categoryTabs, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlaySoundSetSound( self, "navigate" )
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		PlaySoundSetSound( self, "cac_enter_wpn_cust_sub" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsListSelectionMode( menu, CoD.WC_Category.Modes.SELECTING_CATEGORY ) then
			GoBack( self, controller )
			ClearSavedState( self, controller )
			PlaySoundSetSound( self, "menu_go_back" )
			SendClientScriptNotifyForAdjustedClient( controller, "cam_customization_closed", "" )
			GetCustomClassModel( controller )
			SetPerControllerTableProperty( controller, "customizationType", nil )
			return true
		elseif IsListSelectionMode( menu, CoD.WC_Category.Modes.SELECTING_ITEM ) then
			WC_SetChoosingCategory( self, element, controller )
			WC_VariantSelectionCancel( self, element, controller )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsListSelectionMode( menu, CoD.WC_Category.Modes.SELECTING_CATEGORY ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsListSelectionMode( menu, CoD.WC_Category.Modes.SELECTING_ITEM ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.background:close()
		self.categoryList:close()
		self.previewPane:close()
		self.ElemsSideList:close()
		self.feFooterContainer:close()
		self.categoryTabs:close()
		self.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "WeaponCustomization.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

