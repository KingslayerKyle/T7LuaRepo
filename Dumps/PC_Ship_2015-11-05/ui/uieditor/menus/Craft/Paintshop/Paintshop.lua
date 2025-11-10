require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopWeaponListButtonNew" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelector" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopSlotsFull" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

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
	local f4_local2 = f4_arg0.tabList.Tabs.grid:getItemAtPosition( 1, f4_local0, false )
	if f4_local2 then
		f4_arg0.tabList.Tabs.grid:setActiveItem( f4_local2 )
	end
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.disableDarkenElement = true
	f5_arg0.disableBlur = true
	f5_arg0.disablePopupOpenCloseAnim = true
	local f5_local0 = f5_arg0.m_ownerController
	CoD.Menu.SetButtonLabel( f5_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
	f5_arg0.updateMode = function ( f6_arg0, f6_arg1, f6_arg2 )
		f0_local1( f5_local0, f6_arg1 )
		if f6_arg1 == Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST then
			f6_arg0.tabList.Tabs.m_disableNavigation = false
			f0_local3( f6_arg0, f5_local0 )
			CoD.SwapFocusableElements( f5_local0, f6_arg0.paintjobSelector, f6_arg0.weaponList )
			f0_local2( f6_arg0, f5_local0 )
			f6_arg0:setState( "DefaultState" )
		elseif f6_arg1 == Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS then
			f6_arg0.tabList.Tabs.m_disableNavigation = true
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 368 )
	LeftPanel:setTopBottom( true, false, 91, 718 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local weaponList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	weaponList:makeFocusable()
	weaponList:setLeftRight( true, false, 75.5, 355.5 )
	weaponList:setTopBottom( true, false, 137, 622 )
	weaponList:setDataSource( "CraftWeaponList" )
	weaponList:setWidgetType( CoD.PaintshopWeaponListButtonNew )
	weaponList:setVerticalCount( 7 )
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
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	local paintjobSelector = CoD.PaintjobSelector.new( self, controller )
	paintjobSelector:setLeftRight( true, false, 75.5, 411.5 )
	paintjobSelector:setTopBottom( true, false, 137, 662 )
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
	CategoryListPanel:setTopBottom( false, false, -275, -236 )
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
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:setLeftRight( true, false, 388, 769.5 )
	itemName:setTopBottom( true, false, 137, 171 )
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
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local slotsFull = CoD.PaintshopSlotsFull.new( self, controller )
	slotsFull:setLeftRight( true, false, 449.5, 567.5 )
	slotsFull:setTopBottom( true, false, 594.25, 648 )
	slotsFull:setAlpha( 0 )
	slotsFull:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		UpdateSelfElementState( self, slotsFull, controller )
	end )
	slotsFull:mergeStateConditions( {
		{
			stateName = "SlotsFull",
			condition = function ( menu, element, event )
				return CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
			end
		}
	} )
	self:addElement( slotsFull )
	self.slotsFull = slotsFull
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( true, false, 0, 2496 )
	tabList:setTopBottom( true, false, 85, 126 )
	tabList.Tabs.grid:setDataSource( "PaintshopWeaponTabType" )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f23_local0 = nil
		PaintshopWeaponList_TabChanged( self, element, controller )
		return f23_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 388, 644.5 )
	categoryName:setTopBottom( true, false, 114.5, 133.5 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setAlpha( 0 )
	categoryName:setText( Engine.Localize( LocalizeToUpperString( "MENU_PAINTJOB" ) ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local xcamMouse = CoD.XCamMouseControl.new( self, controller )
	xcamMouse:setLeftRight( true, false, 394, 1216 )
	xcamMouse:setTopBottom( true, false, 183, 600 )
	self:addElement( xcamMouse )
	self.xcamMouse = xcamMouse
	
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 91, 680 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 76, 415 )
				self.paintjobSelector:setTopBottom( true, false, 137, 662 )
				self.paintjobSelector:setAlpha( 0 )
				self.clipFinished( paintjobSelector, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 388, 767.5 )
				self.itemName:setTopBottom( true, false, 138, 172 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setAlpha( 0 )
				self.clipFinished( slotsFull, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 1 )
				self.clipFinished( tabList, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
			end,
			ShowPaintjobs = function ()
				self:setupElementClipCounter( 8 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 426 )
					LeftPanel:setTopBottom( true, false, 86, 718 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 368 )
				self.LeftPanel:setTopBottom( true, false, 86, 718 )
				LeftPanelFrame2( LeftPanel, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 1 )
				weaponListFrame2( weaponList, {} )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( true, false, 76, 415 )
					paintjobSelector:setTopBottom( true, false, 137, 662 )
					paintjobSelector:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, -314, 0 )
				self.paintjobSelector:setTopBottom( true, false, 137, 662 )
				self.paintjobSelector:setAlpha( 0 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
					end
					CategoryListPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CategoryListPanel, event )
					else
						CategoryListPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 1 )
				CategoryListPanelFrame2( CategoryListPanel, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 449, 827.44 )
					itemName:setTopBottom( true, false, 138, 172 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setLeftRight( true, false, 388, 769.5 )
				self.itemName:setTopBottom( true, false, 138, 172 )
				itemNameFrame2( itemName, {} )
				local slotsFullFrame2 = function ( slotsFull, event )
					if not event.interrupted then
						slotsFull:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsFull:setLeftRight( true, false, 449.5, 567.5 )
					slotsFull:setTopBottom( true, false, 594.25, 648 )
					slotsFull:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( slotsFull, event )
					else
						slotsFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( true, false, 388, 506 )
				self.slotsFull:setTopBottom( true, false, 595.13, 648.88 )
				self.slotsFull:setAlpha( 0 )
				slotsFullFrame2( slotsFull, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
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
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( true, false, 449.5, 706 )
						categoryName:setTopBottom( true, false, 114.5, 133.5 )
						categoryName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( true, false, 418.75, 675.25 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 388, 644.5 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowPaintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 426 )
				self.LeftPanel:setTopBottom( true, false, 86, 680 )
				self.clipFinished( LeftPanel, {} )
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				self.clipFinished( weaponList, {} )
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 76, 415 )
				self.paintjobSelector:setTopBottom( true, false, 137, 662 )
				self.paintjobSelector:setAlpha( 1 )
				self.clipFinished( paintjobSelector, {} )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449, 837.75 )
				self.itemName:setTopBottom( true, false, 138, 172 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( true, false, 449.5, 567.5 )
				self.slotsFull:setTopBottom( true, false, 594.25, 648 )
				self.slotsFull:setAlpha( 1 )
				self.slotsFull:setScale( 1 )
				self.clipFinished( slotsFull, {} )
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				self.clipFinished( tabList, {} )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449.5, 706 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					if not event.interrupted then
						LeftPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					LeftPanel:setLeftRight( true, false, 64, 368 )
					LeftPanel:setTopBottom( true, false, 86, 718 )
					if event.interrupted then
						self.clipFinished( LeftPanel, event )
					else
						LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 426 )
				self.LeftPanel:setTopBottom( true, false, 86, 718 )
				LeftPanelFrame2( LeftPanel, {} )
				local weaponListFrame2 = function ( weaponList, event )
					if not event.interrupted then
						weaponList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					weaponList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponList, event )
					else
						weaponList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponList:completeAnimation()
				self.weaponList:setAlpha( 0 )
				weaponListFrame2( weaponList, {} )
				local paintjobSelectorFrame2 = function ( paintjobSelector, event )
					if not event.interrupted then
						paintjobSelector:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					paintjobSelector:setLeftRight( true, false, -314, 0 )
					paintjobSelector:setTopBottom( true, false, 137, 662 )
					paintjobSelector:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( paintjobSelector, event )
					else
						paintjobSelector:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				paintjobSelector:completeAnimation()
				self.paintjobSelector:setLeftRight( true, false, 76, 415 )
				self.paintjobSelector:setTopBottom( true, false, 137, 662 )
				self.paintjobSelector:setAlpha( 1 )
				paintjobSelectorFrame2( paintjobSelector, {} )
				local CategoryListPanelFrame2 = function ( CategoryListPanel, event )
					if not event.interrupted then
						CategoryListPanel:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					CategoryListPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CategoryListPanel, event )
					else
						CategoryListPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				CategoryListPanelFrame2( CategoryListPanel, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					itemName:setLeftRight( true, false, 388, 669.75 )
					itemName:setTopBottom( true, false, 138, 172 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setLeftRight( true, false, 449, 830.75 )
				self.itemName:setTopBottom( true, false, 138, 172 )
				itemNameFrame2( itemName, {} )
				local slotsFullFrame2 = function ( slotsFull, event )
					if not event.interrupted then
						slotsFull:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					slotsFull:setLeftRight( true, false, 388, 506 )
					slotsFull:setTopBottom( true, false, 595.13, 648.88 )
					slotsFull:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( slotsFull, event )
					else
						slotsFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				slotsFull:completeAnimation()
				self.slotsFull:setLeftRight( true, false, 449.5, 567.5 )
				self.slotsFull:setTopBottom( true, false, 594.25, 648 )
				self.slotsFull:setAlpha( 1 )
				slotsFullFrame2( slotsFull, {} )
				local tabListFrame2 = function ( tabList, event )
					if not event.interrupted then
						tabList:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					tabList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tabList, event )
					else
						tabList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tabList:completeAnimation()
				self.tabList:setAlpha( 0 )
				tabListFrame2( tabList, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					local categoryNameFrame3 = function ( categoryName, event )
						if not event.interrupted then
							categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						end
						categoryName:setLeftRight( true, false, 388, 644.5 )
						categoryName:setTopBottom( true, false, 114.5, 133.5 )
						categoryName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( categoryName, event )
						else
							categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						categoryNameFrame3( categoryName, event )
						return 
					else
						categoryName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						categoryName:setLeftRight( true, false, 418.75, 675.25 )
						categoryName:setAlpha( 0 )
						categoryName:registerEventHandler( "transition_complete_keyframe", categoryNameFrame3 )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 449.5, 706 )
				self.categoryName:setTopBottom( true, false, 114.5, 133.5 )
				self.categoryName:setAlpha( 1 )
				categoryNameFrame2( categoryName, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.Mode" ), function ( model )
		local f49_local0 = self
		local f49_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Paintshop.Mode"
		}
		CoD.Menu.UpdateButtonShownState( f49_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f50_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderIconOnly( self )
		SetElementStateByElementName( self, "MenuFrame", controller, "Update" )
		PlayClipOnElement( self, {
			elementName = "MenuFrame",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f50_local0 then
			f50_local0 = self:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsModelValueEqualToEnum( controller, "Paintshop.Mode", Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST ) then
			PaintshopWeaponList_Back( self, element, controller )
			ClearSavedState( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			SendClientScriptNotifyForAdjustedClient( controller, "CustomClass_closed", "" )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
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
		element.ElemsSideList:close()
		element.itemName:close()
		element.MenuFrame:close()
		element.slotsFull:close()
		element.tabList:close()
		element.xcamMouse:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

