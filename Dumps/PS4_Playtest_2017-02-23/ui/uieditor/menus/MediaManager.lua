require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.FileShare.FileshareGroupQuotaLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_BuyExtraSlots" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_EmblemListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_NoContent" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_PaintshopListItem" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_SelectedItemInfo" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantItemLarge" )
require( "ui.uieditor.widgets.MediaManager.MediaManager_VariantListItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	MediaManagerUpdateLocalData( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	Engine.CreateModel( rootModel, "isBuyMoreSlot", false )
	Engine.CreateModel( rootModel, "createTime", false )
	Engine.CreateModel( rootModel, "dirty", false )
	Engine.CreateModel( rootModel, "slotsUsed", false )
end

LUI.createMenu.MediaManager = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MediaManager" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 123, 576 )
	BG:setTopBottom( 0, 0, 179, 1021 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.6 )
	BG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BG:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( BG )
	self.BG = BG
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( 0, 1, 0, 0 )
	TitleBacking0:setTopBottom( 0, 0, -8, 124 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
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
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( 0, 1, 0, 0 )
	HelpBacking0:setTopBottom( 1, 1, -102, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setAlpha( 0 )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( 0, 0, 16, 118 )
	ElemsSideList:setTopBottom( 0, 0, 10.5, 1015.5 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, -16, -16 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_FILESHARE_MEDIA_MANAGER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FILESHARE_MEDIA_MANAGER_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local verticalCounter0 = CoD.verticalCounter.new( self, controller )
	verticalCounter0:setLeftRight( 0, 0, 200, 500 )
	verticalCounter0:setTopBottom( 0, 0, 959, 997 )
	verticalCounter0:subscribeToGlobalModel( controller, "MediaManager", "slotsUsed", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			verticalCounter0:setAlpha( modelValue )
		end
	end )
	verticalCounter0:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategory", function ( model )
		local element = verticalCounter0
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetAsListVerticalCounter( self, element, "PaintjobList" )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetAsListVerticalCounter( self, element, "VariantsList" )
		end
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local EmblemsList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	EmblemsList:makeFocusable()
	EmblemsList:setLeftRight( 0, 0, 140, 560 )
	EmblemsList:setTopBottom( 0, 0, 217.5, 944.5 )
	EmblemsList:setWidgetType( CoD.MediaManager_EmblemListItem )
	EmblemsList:setVerticalCount( 7 )
	EmblemsList:setSpacing( 8 )
	EmblemsList:setVerticalCounter( CoD.verticalCounter )
	EmblemsList:setDataSource( "MediaManagerEmblemList" )
	EmblemsList:linkToElementModel( EmblemsList, "isBuyMore", true, function ( model )
		local element = EmblemsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	EmblemsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerEmblemFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return retVal
	end )
	EmblemsList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetFocusToElement( self, "EmblemsList", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	EmblemsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	EmblemsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( EmblemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Emblems" ) then
			MediaManagerClearEmblem( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Emblems" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE", nil )
			return true
		else
			return false
		end
	end, false )
	EmblemsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local element = EmblemsList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( EmblemsList )
	self.EmblemsList = EmblemsList
	
	local VariantsList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	VariantsList:makeFocusable()
	VariantsList:setLeftRight( 0, 0, 140, 560 )
	VariantsList:setTopBottom( 0, 0, 217.5, 944.5 )
	VariantsList:setWidgetType( CoD.MediaManager_VariantListItem )
	VariantsList:setVerticalCount( 7 )
	VariantsList:setSpacing( 8 )
	VariantsList:setVerticalCounter( CoD.verticalCounter )
	VariantsList:setDataSource( "MediaManagerVariantList" )
	VariantsList:linkToElementModel( VariantsList, "isBuyMore", true, function ( model )
		local element = VariantsList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	VariantsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			Gunsmith_FocusOccupiedVariant( self, element, controller )
			MediaManagerVariantFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return retVal
	end )
	VariantsList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetFocusToElement( self, "VariantsList", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	VariantsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	VariantsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( VariantsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Variants" ) then
			MediaManagerClearVariant( self, element, controller, "", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Variants" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE", nil )
			return true
		else
			return false
		end
	end, false )
	VariantsList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local element = VariantsList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( VariantsList )
	self.VariantsList = VariantsList
	
	local PaintjobList = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	PaintjobList:makeFocusable()
	PaintjobList:setLeftRight( 0, 0, 140, 560 )
	PaintjobList:setTopBottom( 0, 0, 217.5, 944.5 )
	PaintjobList:setWidgetType( CoD.MediaManager_PaintshopListItem )
	PaintjobList:setVerticalCount( 7 )
	PaintjobList:setSpacing( 8 )
	PaintjobList:setDataSource( "MediaManagerPaintjobList" )
	PaintjobList:linkToElementModel( PaintjobList, "isBuyMore", true, function ( model )
		local element = PaintjobList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBuyMore"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	PaintjobList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			PaintjobSelector_GainFocus( self, element, controller )
			MediaManagerPaintjobFocusChanged( self, element, controller )
			MediaManagerClearDisplay( self, element, controller )
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			MediaManagerBuyMoreSlotOnFocus( self, element, controller )
		end
		return retVal
	end )
	PaintjobList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetFocusToElement( self, "PaintjobList", controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	PaintjobList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	PaintjobList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( PaintjobList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Paintjobs" ) then
			MediaManagerClearPaintjob( self, element, controller, "1", menu )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			OpenBuyExtraSlotsPackDialog( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) and IsMenuInState( menu, "Paintjobs" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_DELETE", nil )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "isBuyMore", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_INGAMESTORE", nil )
			return true
		else
			return false
		end
	end, false )
	PaintjobList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local element = PaintjobList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( PaintjobList )
	self.PaintjobList = PaintjobList
	
	local MediaManagerEmblemItemLarge = CoD.MediaManager_EmblemItemLarge.new( self, controller )
	MediaManagerEmblemItemLarge:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerIsBuyMoreSlot()
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
	MediaManagerEmblemItemLarge:setLeftRight( 0, 0, 616.5, 1141.5 )
	MediaManagerEmblemItemLarge:setTopBottom( 0, 0, 217, 538 )
	self:addElement( MediaManagerEmblemItemLarge )
	self.MediaManagerEmblemItemLarge = MediaManagerEmblemItemLarge
	
	local MediaManagerVariantItemLarge0 = CoD.MediaManager_VariantItemLarge.new( self, controller )
	MediaManagerVariantItemLarge0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerIsBuyMoreSlot()
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
	MediaManagerVariantItemLarge0:setLeftRight( 0, 0, 615.5, 1140.5 )
	MediaManagerVariantItemLarge0:setTopBottom( 0, 0, 217.5, 742.5 )
	self:addElement( MediaManagerVariantItemLarge0 )
	self.MediaManagerVariantItemLarge0 = MediaManagerVariantItemLarge0
	
	local MediaManagerPaintshopItemLarge0 = CoD.MediaManager_PaintshopItemLarge.new( self, controller )
	MediaManagerPaintshopItemLarge0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerIsBuyMoreSlot()
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
	MediaManagerPaintshopItemLarge0:setLeftRight( 0, 0, 615.5, 1140.5 )
	MediaManagerPaintshopItemLarge0:setTopBottom( 0, 0, 217.5, 742.5 )
	self:addElement( MediaManagerPaintshopItemLarge0 )
	self.MediaManagerPaintshopItemLarge0 = MediaManagerPaintshopItemLarge0
	
	local MediaManagerSelectedItemInfo0 = CoD.MediaManager_SelectedItemInfo.new( self, controller )
	MediaManagerSelectedItemInfo0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f35_local0
				if not MediaManagerIsBuyMoreSlot() then
					f35_local0 = MediaManagerSlotsUsed( controller )
				else
					f35_local0 = false
				end
				return f35_local0
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
	MediaManagerSelectedItemInfo0:setLeftRight( 0, 0, 613.5, 1138.5 )
	MediaManagerSelectedItemInfo0:setTopBottom( 0, 0, 814.5, 889.5 )
	self:addElement( MediaManagerSelectedItemInfo0 )
	self.MediaManagerSelectedItemInfo0 = MediaManagerSelectedItemInfo0
	
	local MediaManagerBuyExtraSlots = CoD.MediaManager_BuyExtraSlots.new( self, controller )
	MediaManagerBuyExtraSlots:setLeftRight( 0, 0, 615.5, 1140.5 )
	MediaManagerBuyExtraSlots:setTopBottom( 0, 0, 217, 495 )
	self:addElement( MediaManagerBuyExtraSlots )
	self.MediaManagerBuyExtraSlots = MediaManagerBuyExtraSlots
	
	local QuotaListHeader = LUI.UIImage.new()
	QuotaListHeader:setLeftRight( 0, 0, 1192, 1732 )
	QuotaListHeader:setTopBottom( 0, 0, 222, 250 )
	QuotaListHeader:setRGB( 0, 0, 0 )
	self:addElement( QuotaListHeader )
	self.QuotaListHeader = QuotaListHeader
	
	local QuotaList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	QuotaList:makeFocusable()
	QuotaList:setLeftRight( 0, 0, 1192, 1732 )
	QuotaList:setTopBottom( 0, 0, 257, 387 )
	QuotaList:setWidgetType( CoD.FileshareGroupQuotaLine )
	QuotaList:setVerticalCount( 3 )
	QuotaList:setDataSource( "MediaManagerQuotaList" )
	QuotaList:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		local element = QuotaList
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( QuotaList )
	self.QuotaList = QuotaList
	
	local QuotaListHeaderLabel = LUI.UITightText.new()
	QuotaListHeaderLabel:setLeftRight( 0, 0, 1196, 1700 )
	QuotaListHeaderLabel:setTopBottom( 0, 0, 223.5, 248.5 )
	QuotaListHeaderLabel:setText( Engine.Localize( "MENU_FILESHARE_QUOTA_HEADER_CAPS" ) )
	QuotaListHeaderLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( QuotaListHeaderLabel )
	self.QuotaListHeaderLabel = QuotaListHeaderLabel
	
	local MediaManagerNoContent = CoD.MediaManager_NoContent.new( self, controller )
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
	MediaManagerNoContent:setLeftRight( 0, 0, 162.5, 537.5 )
	MediaManagerNoContent:setTopBottom( 0, 0, 480, 570 )
	self:addElement( MediaManagerNoContent )
	self.MediaManagerNoContent = MediaManagerNoContent
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( self, controller )
	EmblemEditorFrame0:setLeftRight( 0, 0, 1189, 1735 )
	EmblemEditorFrame0:setTopBottom( 0, 0, 249, 397 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	local tabList = CoD.FE_TabBar.new( self, controller )
	tabList:setLeftRight( 0, 0, 0, 7500 )
	tabList:setTopBottom( 0, 0, 126, 188 )
	tabList.Tabs.grid:setHorizontalCount( 8 )
	tabList.Tabs.grid:setDataSource( "FileshareShowcaseManagerTabs" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		MediaManagerTabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	MediaManagerVariantItemLarge0:linkToElementModel( VariantsList, nil, false, function ( model )
		MediaManagerVariantItemLarge0:setModel( model, controller )
	end )
	MediaManagerPaintshopItemLarge0:linkToElementModel( PaintjobList, nil, false, function ( model )
		MediaManagerPaintshopItemLarge0:setModel( model, controller )
	end )
	verticalCounter0.navigation = {
		up = {
			EmblemsList,
			VariantsList,
			PaintjobList
		}
	}
	EmblemsList.navigation = {
		right = QuotaList,
		down = verticalCounter0
	}
	VariantsList.navigation = {
		right = QuotaList,
		down = verticalCounter0
	}
	PaintjobList.navigation = {
		right = QuotaList,
		down = verticalCounter0
	}
	QuotaList.navigation = {
		left = {
			EmblemsList,
			VariantsList,
			PaintjobList
		}
	}
	self.resetProperties = function ()
		PaintjobList:completeAnimation()
		VariantsList:completeAnimation()
		EmblemsList:completeAnimation()
		MediaManagerVariantItemLarge0:completeAnimation()
		MediaManagerPaintshopItemLarge0:completeAnimation()
		MediaManagerEmblemItemLarge:completeAnimation()
		PaintjobList:setAlpha( 1 )
		VariantsList:setAlpha( 1 )
		EmblemsList:setAlpha( 1 )
		MediaManagerVariantItemLarge0:setAlpha( 1 )
		MediaManagerPaintshopItemLarge0:setAlpha( 1 )
		MediaManagerEmblemItemLarge:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerVariantItemLarge0:completeAnimation()
				self.MediaManagerVariantItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerVariantItemLarge0, {} )
			end
		},
		Variants = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				EmblemsList:completeAnimation()
				self.EmblemsList:setAlpha( 0 )
				self.clipFinished( EmblemsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
				MediaManagerEmblemItemLarge:completeAnimation()
				self.MediaManagerEmblemItemLarge:setAlpha( 0 )
				self.clipFinished( MediaManagerEmblemItemLarge, {} )
				MediaManagerPaintshopItemLarge0:completeAnimation()
				self.MediaManagerPaintshopItemLarge0:setAlpha( 0 )
				self.clipFinished( MediaManagerPaintshopItemLarge0, {} )
			end
		},
		Emblems = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				VariantsList:completeAnimation()
				self.VariantsList:setAlpha( 0 )
				self.clipFinished( VariantsList, {} )
				PaintjobList:completeAnimation()
				self.PaintjobList:setAlpha( 0 )
				self.clipFinished( PaintjobList, {} )
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
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsMediaManager( self, element, controller, "true", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "paintjob" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementFocusable( self, "PaintjobList", controller )
			SetFocusToElement( self, "PaintjobList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "variant" ) then
			SetLoseFocusToElement( self, "EmblemsList", controller )
			SetLoseFocusToElement( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "EmblemsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementFocusable( self, "VariantsList", controller )
			SetFocusToElement( self, "VariantsList", controller )
		elseif IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "emblem" ) then
			SetLoseFocusToElement( self, "PaintjobList", controller )
			SetLoseFocusToElement( self, "VariantsList", controller )
			MakeElementNotFocusable( self, "PaintjobList", controller )
			MakeElementNotFocusable( self, "VariantsList", controller )
			MakeElementFocusable( self, "EmblemsList", controller )
			SetFocusToElement( self, "EmblemsList", controller )
		end
	end )
	MenuFrame:setModel( self.buttonModel, controller )
	verticalCounter0.id = "verticalCounter0"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleDotsWidget0:close()
		self.ElemsSideList:close()
		self.MenuFrame:close()
		self.verticalCounter0:close()
		self.EmblemsList:close()
		self.VariantsList:close()
		self.PaintjobList:close()
		self.MediaManagerEmblemItemLarge:close()
		self.MediaManagerVariantItemLarge0:close()
		self.MediaManagerPaintshopItemLarge0:close()
		self.MediaManagerSelectedItemInfo0:close()
		self.MediaManagerBuyExtraSlots:close()
		self.QuotaList:close()
		self.MediaManagerNoContent:close()
		self.EmblemEditorFrame0:close()
		self.tabList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediaManager.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

