require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.TabbedWidgets.craftTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_SelectedItemInfo" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_BuyExtraSlots" )
require( "ui.uieditor.widgets.FileShare.FileshareGroupQuotaLine" )

local PreLoadFunc = function ( self, controller )
	MediaManagerUpdateLocalData( controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	Engine.CreateModel( f1_local0, "isBuyMoreSlot", false )
	Engine.CreateModel( f1_local0, "createTime", false )
	Engine.CreateModel( f1_local0, "dirty", false )
end

LUI.createMenu.MediaManager = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MediaManager" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TabBG = LUI.UIImage.new()
	TabBG:setLeftRight( true, false, 44.94, 1289 )
	TabBG:setTopBottom( true, false, 122.5, 653.5 )
	TabBG:setRGB( 0.08, 0.08, 0.08 )
	TabBG:setAlpha( 0.6 )
	self:addElement( TabBG )
	self.TabBG = TabBG
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
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
	
	local tabList = CoD.craftTabList.new( self, controller )
	tabList:setLeftRight( true, false, 39, 1129 )
	tabList:setTopBottom( true, false, 84, 120 )
	tabList:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	tabList.grid:setDataSource( "FileshareShowcaseManagerTabs" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 8 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f3_local0 = nil
		MediaManagerTabChanged( self, element, controller )
		return f3_local0
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
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, -11, -11 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MEDIA_MANAGER" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MEDIA_MANAGER" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( true, false, 133.21, 333.21 )
	verticalCounter0:setTopBottom( true, false, 639.5, 664.5 )
	verticalCounter0:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategory", function ( model )
		local f4_local0 = verticalCounter0
		if IsGlobalModelValueEqualTo( f4_local0, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetAsListVerticalCounter( self, f4_local0, "PaintjobList" )
		elseif IsGlobalModelValueEqualTo( f4_local0, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetAsListVerticalCounter( self, f4_local0, "VariantsList" )
		end
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local EmblemsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	EmblemsList:makeFocusable()
	EmblemsList:setLeftRight( true, false, 93.21, 373.21 )
	EmblemsList:setTopBottom( true, false, 145, 630 )
	EmblemsList:setDataSource( "MediaManagerEmblemList" )
	EmblemsList:setWidgetType( CoD.MediaManager_EmblemListItem )
	EmblemsList:setVerticalCount( 7 )
	EmblemsList:setSpacing( 5 )
	EmblemsList:linkToElementModel( EmblemsList, "isBuyMore", true, function ( model )
		local f5_local0 = EmblemsList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerEmblemFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f6_local0
	end )
	EmblemsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetFocusToElement( self, "EmblemsList", controller )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	EmblemsList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	EmblemsList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( EmblemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerClearEmblem( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenStore( self, element, controller, "MediaManager", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	EmblemsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, EmblemsList, controller )
	end )
	self:addElement( EmblemsList )
	self.EmblemsList = EmblemsList
	
	local VariantsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	VariantsList:makeFocusable()
	VariantsList:setLeftRight( true, false, 93.21, 373.21 )
	VariantsList:setTopBottom( true, false, 145, 630 )
	VariantsList:setDataSource( "MediaManagerVariantList" )
	VariantsList:setWidgetType( CoD.MediaManager_VariantListItem )
	VariantsList:setVerticalCount( 7 )
	VariantsList:setSpacing( 5 )
	VariantsList:setVerticalScrollbar( CoD.verticalScrollbar )
	VariantsList:linkToElementModel( VariantsList, "isBuyMore", true, function ( model )
		local f13_local0 = VariantsList
		local f13_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f13_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	VariantsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f14_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			Gunsmith_FocusOccupiedVariant( self, element, controller )
			MediaManagerVariantFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f14_local0
	end )
	VariantsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f15_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetFocusToElement( self, "VariantsList", controller )
		end
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	VariantsList:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	VariantsList:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( VariantsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerClearVariant( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenStore( self, element, controller, "MediaManager", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	VariantsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, VariantsList, controller )
	end )
	self:addElement( VariantsList )
	self.VariantsList = VariantsList
	
	local PaintjobList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	PaintjobList:makeFocusable()
	PaintjobList:setLeftRight( true, false, 93.21, 373.21 )
	PaintjobList:setTopBottom( true, false, 145, 630 )
	PaintjobList:setDataSource( "MediaManagerPaintjobList" )
	PaintjobList:setWidgetType( CoD.MediaManager_PaintshopListItem )
	PaintjobList:setVerticalCount( 7 )
	PaintjobList:setSpacing( 5 )
	PaintjobList:linkToElementModel( PaintjobList, "isBuyMore", true, function ( model )
		local f21_local0 = PaintjobList
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	PaintjobList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f22_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			PaintjobSelector_GainFocus( self, element, controller )
			MediaManagerPaintjobFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f22_local0
	end )
	PaintjobList:registerEventHandler( "menu_loaded", function ( element, event )
		local f23_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetFocusToElement( self, "PaintjobList", controller )
		end
		if not f23_local0 then
			f23_local0 = element:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	PaintjobList:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f24_local0
	end )
	PaintjobList:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	self:AddButtonCallbackFunction( PaintjobList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerClearPaintjob( self, element, controller, "1", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenStore( self, element, controller, "MediaManager", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	PaintjobList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, PaintjobList, controller )
	end )
	self:addElement( PaintjobList )
	self.PaintjobList = PaintjobList
	
	local MediaManagerEmblemItemLarge = CoD.MediaManager_EmblemItemLarge.new( self, controller )
	MediaManagerEmblemItemLarge:setLeftRight( true, false, 410, 760 )
	MediaManagerEmblemItemLarge:setTopBottom( true, false, 145, 359 )
	self:addElement( MediaManagerEmblemItemLarge )
	self.MediaManagerEmblemItemLarge = MediaManagerEmblemItemLarge
	
	local MediaManagerVariantItemLarge0 = CoD.MediaManager_VariantItemLarge.new( self, controller )
	MediaManagerVariantItemLarge0:setLeftRight( true, false, 410, 760 )
	MediaManagerVariantItemLarge0:setTopBottom( true, false, 145, 495 )
	self:addElement( MediaManagerVariantItemLarge0 )
	self.MediaManagerVariantItemLarge0 = MediaManagerVariantItemLarge0
	
	local MediaManagerPaintshopItemLarge0 = CoD.MediaManager_PaintshopItemLarge.new( self, controller )
	MediaManagerPaintshopItemLarge0:setLeftRight( true, false, 410, 760 )
	MediaManagerPaintshopItemLarge0:setTopBottom( true, false, 145, 495 )
	self:addElement( MediaManagerPaintshopItemLarge0 )
	self.MediaManagerPaintshopItemLarge0 = MediaManagerPaintshopItemLarge0
	
	local MediaManagerSelectedItemInfo0 = CoD.MediaManager_SelectedItemInfo.new( self, controller )
	MediaManagerSelectedItemInfo0:setLeftRight( true, false, 409, 759 )
	MediaManagerSelectedItemInfo0:setTopBottom( true, false, 543.03, 593.03 )
	self:addElement( MediaManagerSelectedItemInfo0 )
	self.MediaManagerSelectedItemInfo0 = MediaManagerSelectedItemInfo0
	
	local MediaManagerBuyExtraSlots = CoD.MediaManager_BuyExtraSlots.new( self, controller )
	MediaManagerBuyExtraSlots:setLeftRight( true, false, 410, 760 )
	MediaManagerBuyExtraSlots:setTopBottom( true, false, 145, 330 )
	self:addElement( MediaManagerBuyExtraSlots )
	self.MediaManagerBuyExtraSlots = MediaManagerBuyExtraSlots
	
	local QuotaListBG = LUI.UIImage.new()
	QuotaListBG:setLeftRight( true, false, 791, 1159 )
	QuotaListBG:setTopBottom( true, false, 144.5, 263 )
	QuotaListBG:setRGB( 0.17, 0.17, 0.17 )
	self:addElement( QuotaListBG )
	self.QuotaListBG = QuotaListBG
	
	local QuotaListHeader = LUI.UIImage.new()
	QuotaListHeader:setLeftRight( true, false, 795, 1155 )
	QuotaListHeader:setTopBottom( true, false, 148.13, 167.13 )
	QuotaListHeader:setRGB( 0.46, 0.46, 0.46 )
	self:addElement( QuotaListHeader )
	self.QuotaListHeader = QuotaListHeader
	
	local QuotaList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	QuotaList:makeFocusable()
	QuotaList:setLeftRight( true, false, 795, 1155 )
	QuotaList:setTopBottom( true, false, 171, 259 )
	QuotaList:setDataSource( "MediaManagerQuotaList" )
	QuotaList:setWidgetType( CoD.FileshareGroupQuotaLine )
	QuotaList:setVerticalCount( 3 )
	QuotaList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, QuotaList, controller )
	end )
	self:addElement( QuotaList )
	self.QuotaList = QuotaList
	
	local QuotaListHeaderLabel = LUI.UITightText.new()
	QuotaListHeaderLabel:setLeftRight( true, false, 797.48, 1133.48 )
	QuotaListHeaderLabel:setTopBottom( true, false, 149, 166 )
	QuotaListHeaderLabel:setRGB( 0, 0, 0 )
	QuotaListHeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_QUOTA_HEADER_CAPS" ) )
	QuotaListHeaderLabel:setTTF( "fonts/default.ttf" )
	self:addElement( QuotaListHeaderLabel )
	self.QuotaListHeaderLabel = QuotaListHeaderLabel
	
	MediaManagerVariantItemLarge0:linkToElementModel( VariantsList, nil, false, function ( model )
		MediaManagerVariantItemLarge0:setModel( model, controller )
	end )
	MediaManagerPaintshopItemLarge0:linkToElementModel( PaintjobList, nil, false, function ( model )
		MediaManagerPaintshopItemLarge0:setModel( model, controller )
	end )
	EmblemsList.navigation = {
		right = QuotaList
	}
	VariantsList.navigation = {
		right = QuotaList
	}
	PaintjobList.navigation = {
		right = QuotaList
	}
	QuotaList.navigation = {
		left = {
			EmblemsList,
			VariantsList,
			PaintjobList
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
			end
		},
		Paintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 1 )
				self.clipFinished( PaintjobList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 1 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
			end
		},
		Variants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 1 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 1 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
			end
		},
		Emblems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 1 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 1 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Paintjobs",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" )
			end
		},
		{
			stateName = "Variants",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" )
			end
		},
		{
			stateName = "Emblems",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.currentCategory" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.currentCategory"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f40_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsMediaManager( self, self, controller, "true", self )
		if not f40_local0 then
			f40_local0 = self:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		MediaManagerClose( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		MediaManagerClearDisplay( self, element, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SetIsMediaManager( self, element, controller, "false", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetFocusToElement( self, "PaintjobList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetFocusToElement( self, "VariantsList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetFocusToElement( self, "EmblemsList", controller )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	EmblemsList.id = "EmblemsList"
	VariantsList.id = "VariantsList"
	PaintjobList.id = "PaintjobList"
	QuotaList.id = "QuotaList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleDotsWidget0:close()
		element.tabList:close()
		element.ElemsSideList:close()
		element.MenuFrame:close()
		element.verticalCounter0:close()
		element.EmblemsList:close()
		element.VariantsList:close()
		element.PaintjobList:close()
		element.MediaManagerEmblemItemLarge:close()
		element.MediaManagerVariantItemLarge0:close()
		element.MediaManagerPaintshopItemLarge0:close()
		element.MediaManagerSelectedItemInfo0:close()
		element.MediaManagerBuyExtraSlots:close()
		element.QuotaList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediaManager.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

