require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_CustomGameListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_TheaterListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_CustomGameItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_TheaterFileItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_SelectedItemInfo" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_BuyExtraSlots" )
require( "ui.uieditor.widgets.FileShare.FileshareCategoryQuotas" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_NoContent" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	CoD.perController[controller].wasGunsmithVariantModelNil = CoD.perController[controller].gunsmithVariantModel == nil
	CoD.perController[controller].wasSelectedPaintjobModelNil = CoD.perController[controller].selectedpaintjobModel == nil
	MediaManagerUpdateLocalData( controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	Engine.CreateModel( f1_local0, "isBuyMoreSlot", false )
	Engine.CreateModel( f1_local0, "createTime", false )
	Engine.CreateModel( f1_local0, "dirty", false )
	Engine.CreateModel( f1_local0, "slotsUsed", false )
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
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 82.21, 384.21 )
	BG:setTopBottom( true, false, 119, 680.5 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.6 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
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
	ElemsSideList:setTopBottom( true, false, 7, 677 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, -11, -11 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_MEDIA_MANAGER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_MEDIA_MANAGER_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local EmblemsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	EmblemsList:makeFocusable()
	EmblemsList:setLeftRight( true, false, 93.21, 373.21 )
	EmblemsList:setTopBottom( true, false, 145, 630 )
	EmblemsList:setWidgetType( CoD.MediaManager_EmblemListItem )
	EmblemsList:setVerticalCount( 7 )
	EmblemsList:setSpacing( 5 )
	EmblemsList:setVerticalCounter( CoD.verticalCounter )
	EmblemsList:setDataSource( "MediaManagerEmblemList" )
	EmblemsList:linkToElementModel( EmblemsList, "isBuyMore", true, function ( model )
		local f3_local0 = EmblemsList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerEmblemFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f4_local0
	end )
	EmblemsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetFocusToElement( self, "EmblemsList", controller )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	EmblemsList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	EmblemsList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( EmblemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Emblems" ) and ListHasElements( element ) then
			MediaManagerClearEmblem( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Emblems" ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	EmblemsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local f10_local0 = EmblemsList
		UpdateDataSource( self, f10_local0, controller )
		UpdateButtonPromptState( self, f10_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( EmblemsList )
	self.EmblemsList = EmblemsList
	
	local VariantsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	VariantsList:makeFocusable()
	VariantsList:setLeftRight( true, false, 93.21, 373.21 )
	VariantsList:setTopBottom( true, false, 145, 630 )
	VariantsList:setWidgetType( CoD.MediaManager_VariantListItem )
	VariantsList:setVerticalCount( 7 )
	VariantsList:setSpacing( 5 )
	VariantsList:setVerticalCounter( CoD.verticalCounter )
	VariantsList:setDataSource( "MediaManagerVariantList" )
	VariantsList:linkToElementModel( VariantsList, "isBuyMore", true, function ( model )
		local f11_local0 = VariantsList
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	VariantsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f12_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			Gunsmith_FocusOccupiedVariant( self, element, controller )
			MediaManagerVariantFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f12_local0
	end )
	VariantsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetFocusToElement( self, "VariantsList", controller )
		end
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	VariantsList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	VariantsList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( VariantsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Variants" ) and ListHasElements( element ) then
			MediaManagerClearVariant( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Variants" ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	VariantsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local f18_local0 = VariantsList
		UpdateDataSource( self, f18_local0, controller )
		UpdateButtonPromptState( self, f18_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( VariantsList )
	self.VariantsList = VariantsList
	
	local PaintjobList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	PaintjobList:makeFocusable()
	PaintjobList:setLeftRight( true, false, 93.21, 373.21 )
	PaintjobList:setTopBottom( true, false, 145, 630 )
	PaintjobList:setWidgetType( CoD.MediaManager_PaintshopListItem )
	PaintjobList:setVerticalCount( 7 )
	PaintjobList:setSpacing( 5 )
	PaintjobList:setVerticalCounter( CoD.verticalCounter )
	PaintjobList:setDataSource( "MediaManagerPaintjobList" )
	PaintjobList:linkToElementModel( PaintjobList, "isBuyMore", true, function ( model )
		local f19_local0 = PaintjobList
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	PaintjobList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f20_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			PaintjobSelector_GainFocus( self, element, controller )
			MediaManagerPaintjobFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f20_local0
	end )
	PaintjobList:registerEventHandler( "menu_loaded", function ( element, event )
		local f21_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetFocusToElement( self, "PaintjobList", controller )
		end
		if not f21_local0 then
			f21_local0 = element:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	PaintjobList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	PaintjobList:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( PaintjobList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Paintjobs" ) and ListHasElements( element ) then
			MediaManagerClearPaintjob( self, element, controller, "1", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Paintjobs" ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	PaintjobList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local f26_local0 = PaintjobList
		UpdateDataSource( self, f26_local0, controller )
		UpdateButtonPromptState( self, f26_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( PaintjobList )
	self.PaintjobList = PaintjobList
	
	local CustomGamesList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	CustomGamesList:makeFocusable()
	CustomGamesList:setLeftRight( true, false, 93.21, 373.21 )
	CustomGamesList:setTopBottom( true, false, 145, 630 )
	CustomGamesList:setWidgetType( CoD.MediaManager_CustomGameListItem )
	CustomGamesList:setVerticalCount( 7 )
	CustomGamesList:setSpacing( 5 )
	CustomGamesList:setVerticalCounter( CoD.verticalCounter )
	CustomGamesList:setDataSource( "MediaManagerCustomGamesList" )
	CustomGamesList:linkToElementModel( CustomGamesList, "isBuyMore", true, function ( model )
		local f27_local0 = CustomGamesList
		local f27_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f27_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CustomGamesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f28_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerCustomGameFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f28_local0
	end )
	CustomGamesList:registerEventHandler( "menu_loaded", function ( element, event )
		local f29_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "customgame" ) then
			SetFocusToElement( self, "CustomGamesList", controller )
		end
		if not f29_local0 then
			f29_local0 = element:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	CustomGamesList:registerEventHandler( "gain_focus", function ( element, event )
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f30_local0
	end )
	CustomGamesList:registerEventHandler( "lose_focus", function ( element, event )
		local f31_local0 = nil
		if element.loseFocus then
			f31_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f31_local0 = element.super:loseFocus( event )
		end
		return f31_local0
	end )
	self:AddButtonCallbackFunction( CustomGamesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "CustomGames" ) and ListHasElements( element ) then
			MediaManagerClearCustomGame( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "CustomGames" ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	CustomGamesList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local f34_local0 = CustomGamesList
		UpdateDataSource( self, f34_local0, controller )
		UpdateButtonPromptState( self, f34_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( CustomGamesList )
	self.CustomGamesList = CustomGamesList
	
	local ScreenshotsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	ScreenshotsList:makeFocusable()
	ScreenshotsList:setLeftRight( true, false, 93.21, 373.21 )
	ScreenshotsList:setTopBottom( true, false, 145, 630 )
	ScreenshotsList:setWidgetType( CoD.MediaManager_TheaterListItem )
	ScreenshotsList:setVerticalCount( 7 )
	ScreenshotsList:setSpacing( 5 )
	ScreenshotsList:setVerticalCounter( CoD.verticalCounter )
	ScreenshotsList:setDataSource( "MediaManagerTheaterFilesList" )
	ScreenshotsList:linkToElementModel( ScreenshotsList, "isBuyMore", true, function ( model )
		local f35_local0 = ScreenshotsList
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ScreenshotsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f36_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerTheaterFileFocusChanged( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f36_local0
	end )
	ScreenshotsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f37_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "screenshot_private" ) then
			SetFocusToElement( self, "ScreenshotsList", controller )
		end
		if not f37_local0 then
			f37_local0 = element:dispatchEventToChildren( event )
		end
		return f37_local0
	end )
	ScreenshotsList:registerEventHandler( "gain_focus", function ( element, event )
		local f38_local0 = nil
		if element.gainFocus then
			f38_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f38_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f38_local0
	end )
	ScreenshotsList:registerEventHandler( "lose_focus", function ( element, event )
		local f39_local0 = nil
		if element.loseFocus then
			f39_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f39_local0 = element.super:loseFocus( event )
		end
		return f39_local0
	end )
	self:AddButtonCallbackFunction( ScreenshotsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Screenshots" ) and ListHasElements( element ) then
			MediaManagerDeleteTheaterFile( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Screenshots" ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	ScreenshotsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, ScreenshotsList, controller )
	end )
	ScreenshotsList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local f43_local0 = ScreenshotsList
		UpdateDataSource( self, f43_local0, controller )
		UpdateButtonPromptState( self, f43_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( ScreenshotsList )
	self.ScreenshotsList = ScreenshotsList
	
	local ClipsList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, true )
	ClipsList:makeFocusable()
	ClipsList:setLeftRight( true, false, 93.21, 373.21 )
	ClipsList:setTopBottom( true, false, 145, 630 )
	ClipsList:setWidgetType( CoD.MediaManager_TheaterListItem )
	ClipsList:setVerticalCount( 7 )
	ClipsList:setSpacing( 5 )
	ClipsList:setVerticalCounter( CoD.verticalCounter )
	ClipsList:setDataSource( "MediaManagerTheaterFilesList" )
	ClipsList:linkToElementModel( ClipsList, "isBuyMore", true, function ( model )
		local f44_local0 = ClipsList
		local f44_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( f44_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ClipsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f45_local0 = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerTheaterFileFocusChanged( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return f45_local0
	end )
	ClipsList:registerEventHandler( "menu_loaded", function ( element, event )
		local f46_local0 = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "clip_private" ) then
			SetFocusToElement( self, "ClipsList", controller )
		end
		if not f46_local0 then
			f46_local0 = element:dispatchEventToChildren( event )
		end
		return f46_local0
	end )
	ClipsList:registerEventHandler( "gain_focus", function ( element, event )
		local f47_local0 = nil
		if element.gainFocus then
			f47_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f47_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f47_local0
	end )
	ClipsList:registerEventHandler( "lose_focus", function ( element, event )
		local f48_local0 = nil
		if element.loseFocus then
			f48_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f48_local0 = element.super:loseFocus( event )
		end
		return f48_local0
	end )
	self:AddButtonCallbackFunction( ClipsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			MediaManagerDeleteTheaterFile( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			OpenPurchaseExtraSlotsOverlay( self, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and ListHasElements( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE" )
			return true
		else
			return false
		end
	end, false )
	ClipsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, ClipsList, controller )
	end )
	ClipsList:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local f52_local0 = ClipsList
		UpdateDataSource( self, f52_local0, controller )
		UpdateButtonPromptState( self, f52_local0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:addElement( ClipsList )
	self.ClipsList = ClipsList
	
	local MediaManagerEmblemItemLarge = CoD.MediaManager_EmblemItemLarge.new( self, controller )
	MediaManagerEmblemItemLarge:setLeftRight( true, false, 411, 761 )
	MediaManagerEmblemItemLarge:setTopBottom( true, false, 145, 359 )
	MediaManagerEmblemItemLarge:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerEmblemItemLarge:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerEmblemItemLarge, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerEmblemItemLarge:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerEmblemItemLarge, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerEmblemItemLarge )
	self.MediaManagerEmblemItemLarge = MediaManagerEmblemItemLarge
	
	local MediaManagerVariantItemLarge0 = CoD.MediaManager_VariantItemLarge.new( self, controller )
	MediaManagerVariantItemLarge0:setLeftRight( true, false, 410, 760 )
	MediaManagerVariantItemLarge0:setTopBottom( true, false, 145, 495 )
	MediaManagerVariantItemLarge0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerVariantItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerVariantItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerVariantItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerVariantItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerVariantItemLarge0 )
	self.MediaManagerVariantItemLarge0 = MediaManagerVariantItemLarge0
	
	local MediaManagerPaintshopItemLarge0 = CoD.MediaManager_PaintshopItemLarge.new( self, controller )
	MediaManagerPaintshopItemLarge0:setLeftRight( true, false, 410, 760 )
	MediaManagerPaintshopItemLarge0:setTopBottom( true, false, 145, 495 )
	MediaManagerPaintshopItemLarge0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerPaintshopItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerPaintshopItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerPaintshopItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerPaintshopItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerPaintshopItemLarge0 )
	self.MediaManagerPaintshopItemLarge0 = MediaManagerPaintshopItemLarge0
	
	local MediaManagerCustomGameItemLarge0 = CoD.MediaManager_CustomGameItemLarge.new( self, controller )
	MediaManagerCustomGameItemLarge0:setLeftRight( true, false, 410, 760 )
	MediaManagerCustomGameItemLarge0:setTopBottom( true, false, 149, 409 )
	MediaManagerCustomGameItemLarge0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerCustomGameItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerCustomGameItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerCustomGameItemLarge0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerCustomGameItemLarge0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerCustomGameItemLarge0 )
	self.MediaManagerCustomGameItemLarge0 = MediaManagerCustomGameItemLarge0
	
	local MediaManagerTheaterFileItemScreenshot = CoD.MediaManager_TheaterFileItemLarge.new( self, controller )
	MediaManagerTheaterFileItemScreenshot:setLeftRight( true, false, 410, 760 )
	MediaManagerTheaterFileItemScreenshot:setTopBottom( true, false, 145, 405 )
	MediaManagerTheaterFileItemScreenshot:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerTheaterFileItemScreenshot:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerTheaterFileItemScreenshot, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerTheaterFileItemScreenshot:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerTheaterFileItemScreenshot, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerTheaterFileItemScreenshot )
	self.MediaManagerTheaterFileItemScreenshot = MediaManagerTheaterFileItemScreenshot
	
	local MediaManagerTheaterFileItemClip = CoD.MediaManager_TheaterFileItemLarge.new( self, controller )
	MediaManagerTheaterFileItemClip:setLeftRight( true, false, 410, 760 )
	MediaManagerTheaterFileItemClip:setTopBottom( true, false, 145, 405 )
	MediaManagerTheaterFileItemClip:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerShouldHideItemPreview( controller )
			end
		}
	} )
	MediaManagerTheaterFileItemClip:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerTheaterFileItemClip, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerTheaterFileItemClip:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerTheaterFileItemClip, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerTheaterFileItemClip )
	self.MediaManagerTheaterFileItemClip = MediaManagerTheaterFileItemClip
	
	local MediaManagerSelectedItemInfo0 = CoD.MediaManager_SelectedItemInfo.new( self, controller )
	MediaManagerSelectedItemInfo0:setLeftRight( true, false, 409, 759 )
	MediaManagerSelectedItemInfo0:setTopBottom( true, false, 543.03, 593.03 )
	MediaManagerSelectedItemInfo0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f71_local0
				if not MediaManagerIsBuyMoreSlot() then
					f71_local0 = MediaManagerSlotsUsed( controller )
				else
					f71_local0 = false
				end
				return f71_local0
			end
		}
	} )
	MediaManagerSelectedItemInfo0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		self:updateElementState( MediaManagerSelectedItemInfo0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	MediaManagerSelectedItemInfo0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerSelectedItemInfo0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerSelectedItemInfo0 )
	self.MediaManagerSelectedItemInfo0 = MediaManagerSelectedItemInfo0
	
	local MediaManagerBuyExtraSlots = CoD.MediaManager_BuyExtraSlots.new( self, controller )
	MediaManagerBuyExtraSlots:setLeftRight( true, false, 410, 760 )
	MediaManagerBuyExtraSlots:setTopBottom( true, false, 145, 330 )
	self:addElement( MediaManagerBuyExtraSlots )
	self.MediaManagerBuyExtraSlots = MediaManagerBuyExtraSlots
	
	local QuotaListHeader = LUI.UIImage.new()
	QuotaListHeader:setLeftRight( true, false, 795, 1165 )
	QuotaListHeader:setTopBottom( true, false, 148.13, 167.13 )
	QuotaListHeader:setRGB( 0, 0, 0 )
	self:addElement( QuotaListHeader )
	self.QuotaListHeader = QuotaListHeader
	
	local FileshareCategoryQuotas0 = CoD.FileshareCategoryQuotas.new( self, controller )
	FileshareCategoryQuotas0:setLeftRight( true, false, 795, 1165 )
	FileshareCategoryQuotas0:setTopBottom( true, false, 166, 356 )
	FileshareCategoryQuotas0.List0:setDataSource( "MediaManagerQuotaList" )
	self:addElement( FileshareCategoryQuotas0 )
	self.FileshareCategoryQuotas0 = FileshareCategoryQuotas0
	
	local QuotaListHeaderLabel = LUI.UITightText.new()
	QuotaListHeaderLabel:setLeftRight( true, false, 797.48, 1165 )
	QuotaListHeaderLabel:setTopBottom( true, false, 149, 166 )
	QuotaListHeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_QUOTA_HEADER_CAPS" ) )
	QuotaListHeaderLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( QuotaListHeaderLabel )
	self.QuotaListHeaderLabel = QuotaListHeaderLabel
	
	local MediaManagerNoContent = CoD.MediaManager_NoContent.new( self, controller )
	MediaManagerNoContent:setLeftRight( true, false, 108.21, 358.21 )
	MediaManagerNoContent:setTopBottom( true, false, 320, 380 )
	MediaManagerNoContent:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not MediaManagerSlotsUsed( controller )
			end
		}
	} )
	MediaManagerNoContent:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.slotsUsed" ), function ( model )
		self:updateElementState( MediaManagerNoContent, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.slotsUsed"
		} )
	end )
	self:addElement( MediaManagerNoContent )
	self.MediaManagerNoContent = MediaManagerNoContent
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( true, false, 0, 5000 )
	tabList:setTopBottom( true, false, 84, 125 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "MediaManagerTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f76_local0 = nil
		MediaManagerTabChanged( self, element, controller )
		return f76_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	MediaManagerVariantItemLarge0:linkToElementModel( VariantsList, nil, false, function ( model )
		MediaManagerVariantItemLarge0:setModel( model, controller )
	end )
	MediaManagerPaintshopItemLarge0:linkToElementModel( PaintjobList, nil, false, function ( model )
		MediaManagerPaintshopItemLarge0:setModel( model, controller )
	end )
	MediaManagerCustomGameItemLarge0:linkToElementModel( CustomGamesList, nil, false, function ( model )
		MediaManagerCustomGameItemLarge0:setModel( model, controller )
	end )
	MediaManagerTheaterFileItemScreenshot:linkToElementModel( ScreenshotsList, nil, false, function ( model )
		MediaManagerTheaterFileItemScreenshot:setModel( model, controller )
	end )
	MediaManagerTheaterFileItemClip:linkToElementModel( ClipsList, nil, false, function ( model )
		MediaManagerTheaterFileItemClip:setModel( model, controller )
	end )
	EmblemsList.navigation = {
		right = FileshareCategoryQuotas0
	}
	VariantsList.navigation = {
		right = FileshareCategoryQuotas0
	}
	PaintjobList.navigation = {
		right = FileshareCategoryQuotas0
	}
	CustomGamesList.navigation = {
		right = FileshareCategoryQuotas0
	}
	ScreenshotsList.navigation = {
		right = FileshareCategoryQuotas0
	}
	ClipsList.navigation = {
		right = FileshareCategoryQuotas0
	}
	FileshareCategoryQuotas0.navigation = {
		left = {
			EmblemsList,
			VariantsList,
			PaintjobList,
			CustomGamesList,
			ScreenshotsList,
			ClipsList
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 0 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		Paintjobs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 1 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 1 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 1 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		Variants = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 1 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 1 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 1 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		Emblems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 1 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 1 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 1 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		CustomGames = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 1 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 1 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 0 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		Screenshots = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 1 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 0 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 1 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 0 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
			end
		},
		Clips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				CustomGamesList:completeAnimation()
				self.CustomGamesList:setAlpha( 0 )
				self.clipFinished( CustomGamesList, {} )
				ScreenshotsList:completeAnimation()
				self.ScreenshotsList:setAlpha( 0 )
				self.clipFinished( ScreenshotsList, {} )
				ClipsList:completeAnimation()
				self.ClipsList:setAlpha( 1 )
				self.clipFinished( ClipsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
				MediaManagerCustomGameItemLarge0:completeAnimation()
				self.MediaManagerCustomGameItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerCustomGameItemLarge0, {} )
				MediaManagerTheaterFileItemScreenshot:completeAnimation()
				self.MediaManagerTheaterFileItemScreenshot:setAlpha( 0 )
				self.clipFinished( MediaManagerTheaterFileItemScreenshot, {} )
				MediaManagerTheaterFileItemClip:completeAnimation()
				self.MediaManagerTheaterFileItemClip:setAlpha( 1 )
				self.clipFinished( MediaManagerTheaterFileItemClip, {} )
				MediaManagerSelectedItemInfo0:completeAnimation()
				self.MediaManagerSelectedItemInfo0:setAlpha( 0 )
				self.clipFinished( MediaManagerSelectedItemInfo0, {} )
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
		},
		{
			stateName = "CustomGames",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "customgame" )
			end
		},
		{
			stateName = "Screenshots",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "screenshot_private" )
			end
		},
		{
			stateName = "Clips",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "clip_private" )
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
		local f96_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsMediaManager( self, self, controller, "true", self )
		if not f96_local0 then
			f96_local0 = self:dispatchEventToChildren( event )
		end
		return f96_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		MediaManagerClose( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		MediaManagerClearDisplay( self, element, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		SetIsMediaManager( self, element, controller, "false", menu )
		MediaManagerReloadWeaponModelIfNeeded( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			SetLoseFocusToElement( self, "ScreenshotsList", controller )
			SetLoseFocusToElement( self, "ClipsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "ScreenshotsList", controller )
			MakeElementNotFocusable( self, "ClipsList", controller )
			MakeElementFocusable( self, "PaintjobList", controller )
			SetFocusToElement( self, "PaintjobList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			SetLoseFocusToElement( self, "ScreenshotsList", controller )
			SetLoseFocusToElement( self, "ClipsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "ScreenshotsList", controller )
			MakeElementNotFocusable( self, "ClipsList", controller )
			MakeElementFocusable( self, "VariantsList", controller )
			SetFocusToElement( self, "VariantsList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetLoseFocusToElement( self, "VariantsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			SetLoseFocusToElement( self, "ScreenshotsList", controller )
			SetLoseFocusToElement( self, "ClipsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "ScreenshotsList", controller )
			MakeElementNotFocusable( self, "ClipsList", controller )
			MakeElementFocusable( self, "EmblemsList", controller )
			SetFocusToElement( self, "EmblemsList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "customgame" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "ScreenshotsList", controller )
			SetLoseFocusToElement( self, "ClipsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "ScreenshotsList", controller )
			MakeElementNotFocusable( self, "ClipsList", controller )
			MakeElementFocusable( self, "CustomGamesList", controller )
			SetFocusToElement( self, "CustomGamesList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "screenshot_private" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			SetLoseFocusToElement( self, "ClipsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "ClipsList", controller )
			MakeElementFocusable( self, "ScreenshotsList", controller )
			SetFocusToElement( self, "ScreenshotsList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "clip_private" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "CustomGamesList", controller )
			SetLoseFocusToElement( self, "ScreenshotsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "CustomGamesList", controller )
			MakeElementNotFocusable( self, "ScreenshotsList", controller )
			MakeElementFocusable( self, "ClipsList", controller )
			SetFocusToElement( self, "ClipsList", controller )
		end
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local f100_local0 = self
		UpdateMenuState( self, event )
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	EmblemsList.id = "EmblemsList"
	VariantsList.id = "VariantsList"
	PaintjobList.id = "PaintjobList"
	CustomGamesList.id = "CustomGamesList"
	ScreenshotsList.id = "ScreenshotsList"
	ClipsList.id = "ClipsList"
	FileshareCategoryQuotas0.id = "FileshareCategoryQuotas0"
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
		element.ElemsSideList:close()
		element.MenuFrame:close()
		element.EmblemsList:close()
		element.VariantsList:close()
		element.PaintjobList:close()
		element.CustomGamesList:close()
		element.ScreenshotsList:close()
		element.ClipsList:close()
		element.MediaManagerEmblemItemLarge:close()
		element.MediaManagerVariantItemLarge0:close()
		element.MediaManagerPaintshopItemLarge0:close()
		element.MediaManagerCustomGameItemLarge0:close()
		element.MediaManagerTheaterFileItemScreenshot:close()
		element.MediaManagerTheaterFileItemClip:close()
		element.MediaManagerSelectedItemInfo0:close()
		element.MediaManagerBuyExtraSlots:close()
		element.FileshareCategoryQuotas0:close()
		element.MediaManagerNoContent:close()
		element.tabList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediaManager.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

