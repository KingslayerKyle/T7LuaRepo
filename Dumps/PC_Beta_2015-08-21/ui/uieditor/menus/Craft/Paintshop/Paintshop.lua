require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopWeaponListButtonNew" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelector" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopSlotsFull" )

local f0_local0 = function ( f1_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "Paintshop.Mode" ) )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	return Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_arg0 ), "Paintshop.Mode" ), f2_arg1 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 1
	if CoD.perController[f3_arg1].paintshopWeaponListIndex ~= nil then
		f3_local0 = CoD.perController[f3_arg1].paintshopWeaponListIndex
	end
	local f3_local1 = f3_arg0.weaponList:getItemAtPosition( f3_local0, 1, false )
	if f3_local1 then
		f3_arg0.weaponList:setActiveItem( f3_local1 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = 2
	local f4_local1 = CoD.GetCustomization( f4_arg1, "category_index" )
	if f4_local1 ~= nil then
		f4_local0 = f4_local1
	end
	local f4_local2 = f4_arg0.tabList.grid:getItemAtPosition( 1, f4_local0, false )
	if f4_local2 then
		f4_arg0.tabList.grid:setActiveItem( f4_local2 )
	end
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.disableDarkenElement = true
	f5_arg0.disableBlur = true
	local f5_local0 = f5_arg0.m_ownerController
	CoD.Menu.SetButtonLabel( f5_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	f5_arg0.updateMode = function ( f6_arg0, f6_arg1, f6_arg2 )
		f0_local1( f5_local0, f6_arg1 )
		if f6_arg1 == Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST then
			f6_arg0.tabList.m_disableNavigation = false
			f0_local3( f6_arg0, f5_local0 )
			CoD.SwapFocusableElements( f5_local0, f6_arg0.paintjobSelector, f6_arg0.weaponList )
			f0_local2( f6_arg0, f5_local0 )
			f6_arg0:setState( "DefaultState" )
		elseif f6_arg1 == Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS then
			f6_arg0.tabList.m_disableNavigation = true
			CoD.SwapFocusableElements( f5_local0, f6_arg0.weaponList, f6_arg0.paintjobSelector )
			f6_arg0:setState( "ShowPaintjobs" )
		end
	end
	
	f5_arg0:updateMode( f0_local0( f5_local0 ) )
end

local PreLoadFunc = function ( self, controller )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.UpdateDataSource" ), function ( model )
		local f8_local0 = CoD.perController[controller].selectedpaintjobModel
		if f8_local0 then
			local f8_local1 = Engine.GetModelValue( Engine.GetModel( f8_local0, "paintjobIndex" ) )
			local f8_local2 = Engine.GetModelValue( Engine.GetModel( f8_local0, "paintjobSlot" ) )
			if self.paintjobSelector ~= nil then
				self.paintjobSelector.paintjobsList:updateDataSource( true )
				self.paintjobSelector.paintjobsList:findItem( {
					paintjobIndex = f8_local1,
					paintjobSlot = f8_local2
				}, nil, true, nil )
			end
		end
	end )
end

LUI.createMenu.Paintshop = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Paintshop" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Paintshop"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 367 )
	LeftPanel:setTopBottom( true, false, 91, 718 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 78.87, 379.37 )
	WeaponListBacking:setTopBottom( true, false, 176, 674 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0 )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local weaponList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 83.5, 422.5 )
	weaponList:setTopBottom( true, false, 159, 714 )
	weaponList:setDataSource( "Unlockables" )
	weaponList:setWidgetType( CoD.PaintshopWeaponListButtonNew )
	weaponList:setVerticalCount( 8 )
	weaponList:setSpacing( 5 )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		PaintshopWeaponList_GainFocus( self, element, controller )
		return f10_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	weaponList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	self:AddButtonCallbackFunction( weaponList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PaintshopWeaponList_ChooseWeapon( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local paintjobSelector = CoD.PaintjobSelector.new( self, controller )
	paintjobSelector:setLeftRight( true, false, 20, 356 )
	paintjobSelector:setTopBottom( true, false, 140.5, 652 )
	paintjobSelector:setAlpha( 0 )
	paintjobSelector:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		UpdateElementState( self, "slotsFull", controller )
		return f15_local0
	end )
	self:addElement( paintjobSelector )
	self.paintjobSelector = paintjobSelector
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local tabList = CoD.craftTabList.new( self, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList.grid:setDataSource( "PaintshopWeaponTabType" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f16_local0 = nil
		PaintshopWeaponList_TabChanged( self, element, controller )
		return f16_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:setLeftRight( true, false, 386.5, 767.5 )
	itemName:setTopBottom( true, false, 159, 193 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( itemName )
	self.itemName = itemName
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local slotsFull = CoD.PaintshopSlotsFull.new( self, controller )
	slotsFull:setLeftRight( true, false, 441.37, 987.37 )
	slotsFull:setTopBottom( true, false, 588, 682 )
	slotsFull:setAlpha( 0 )
	slotsFull:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		UpdateSelfElementState( self, slotsFull, controller )
	end )
	slotsFull:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return Paintjobs_SlotsFull()
			end
		}
	} )
	self:addElement( slotsFull )
	self.slotsFull = slotsFull
	
	itemName:linkToElementModel( weaponList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemName:linkToElementModel( paintjobSelector.paintjobsList, "paintjobName", true, function ( model )
		local paintjobName = Engine.GetModelValue( model )
		if paintjobName then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( paintjobName ) )
		end
	end )
	weaponList.navigation = {
		left = paintjobSelector,
		up = paintjobSelector
	}
	paintjobSelector.navigation = {
		right = weaponList,
		down = weaponList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 367 )
				self.LeftPanel:setTopBottom( true, false, 91, 680 )
				self.clipFinished( LeftPanel, {} )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 79.5, 380 )
				self.WeaponListBacking:setTopBottom( true, false, 174.5, 672.5 )
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 422.5 )
				self.weaponList:setTopBottom( true, false, 159, 714 )
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 400 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 652 )
				self.paintjobSelector:setAlpha( 0 )
				self.clipFinished( paintjobSelector, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 386.5, 767.5 )
				self.itemName:setTopBottom( true, false, 159, 193 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setAlpha( 0 )
				self.clipFinished( slotsFull, {} )
			end,
			ShowPaintjobs = function ()
				self:setupElementClipCounter( 4 )
				local WeaponListBackingFrame2 = function ( WeaponListBacking, event )
					if not event.interrupted then
						WeaponListBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					WeaponListBacking:setLeftRight( true, false, 79.5, 340.5 )
					WeaponListBacking:setTopBottom( true, false, 174.5, 634.5 )
					WeaponListBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( WeaponListBacking, event )
					else
						WeaponListBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setLeftRight( true, false, 78.87, 373.87 )
				self.WeaponListBacking:setTopBottom( true, false, 171, 665 )
				self.WeaponListBacking:setAlpha( 0 )
				WeaponListBackingFrame2( WeaponListBacking, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					weaponList:setLeftRight( true, false, 83.5, 316.5 )
					weaponList:setTopBottom( true, false, 159, 265 )
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setLeftRight( true, false, 83.5, 316.5 )
				self.weaponList:setTopBottom( true, false, 159, 265 )
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					local paintjobSelectorFrame3 = function ( paintjobSelector, event )
						if not event.interrupted then
							paintjobSelector:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						paintjobSelector:setLeftRight( true, false, -36.5, 386.5 )
						paintjobSelector:setTopBottom( true, false, 159, 545 )
						paintjobSelector:setRGB( 1, 1, 1 )
						paintjobSelector:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( paintjobSelector, event )
						else
							paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						paintjobSelectorFrame3( paintjobSelector, event )
						return 
					else
						paintjobSelector:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						paintjobSelector:setLeftRight( true, false, -222.5, 200.5 )
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", paintjobSelectorFrame3 )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, -599, -176 )
				self.paintjobSelector:setTopBottom( true, false, 159, 545 )
				self.paintjobSelector:setRGB( 1, 1, 1 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				tabListFrame2( tabList, {} )
			end
		},
		ShowPaintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 428 )
				self.LeftPanel:setTopBottom( true, false, 91, 680 )
				self.clipFinished( LeftPanel, {} )
				WeaponListBacking:completeAnimation()
				self.WeaponListBacking:setAlpha( 0 )
				self.clipFinished( WeaponListBacking, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 52, 388 )
				self.paintjobSelector:setTopBottom( true, false, 150.5, 664 )
				self.paintjobSelector:setAlpha( 1 )
				self.clipFinished( paintjobSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 456.75, 837.75 )
				self.itemName:setTopBottom( true, false, 159, 193 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( true, false, 443.37, 989.37 )
				self.slotsFull:setTopBottom( true, false, 557, 651 )
				self.slotsFull:setAlpha( 1 )
				self.clipFinished( slotsFull, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local f34_local0 = function ( f35_arg0, f35_arg1 )
					if not f35_arg1.interrupted then
						f35_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f35_arg0:setAlpha( 0.03 )
					if f35_arg1.interrupted then
						self.clipFinished( f35_arg0, f35_arg1 )
					else
						f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WeaponListBacking:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				WeaponListBacking:setAlpha( 0 )
				WeaponListBacking:registerEventHandler( "transition_complete_keyframe", f34_local0 )
				local f34_local1 = function ( f36_arg0, f36_arg1 )
					if not f36_arg1.interrupted then
						f36_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f36_arg0:setAlpha( 1 )
					if f36_arg1.interrupted then
						self.clipFinished( f36_arg0, f36_arg1 )
					else
						f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				weaponList:setAlpha( 0 )
				weaponList:registerEventHandler( "transition_complete_keyframe", f34_local1 )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( true, false, -420, 3 )
					paintjobSelector:setTopBottom( true, false, 141.5, 561 )
					paintjobSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 64, 487 )
				self.paintjobSelector:setTopBottom( true, false, 141.5, 561 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local f34_local3 = function ( f38_arg0, f38_arg1 )
					if not f38_arg1.interrupted then
						f38_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					f38_arg0:setAlpha( 1 )
					if f38_arg1.interrupted then
						self.clipFinished( f38_arg0, f38_arg1 )
					else
						f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				tabList:setAlpha( 0 )
				tabList:registerEventHandler( "transition_complete_keyframe", f34_local3 )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.Mode" ), function ( model )
		local f39_local0 = self
		local f39_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.Mode"
		}
		CoD.Menu.UpdateButtonShownState( f39_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f40_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f40_local0 then
			f40_local0 = self:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			PaintshopWeaponList_Back( self, element, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
			PlaySoundSetSound( self, "list_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			return true
		elseif IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	weaponList.id = "weaponList"
	paintjobSelector.id = "paintjobSelector"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.weaponList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.LeftPanel:close()
		element.weaponList:close()
		element.paintjobSelector:close()
		element.tabList:close()
		element.ElemsSideList:close()
		element.itemName:close()
		element.MenuFrame:close()
		element.slotsFull:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

