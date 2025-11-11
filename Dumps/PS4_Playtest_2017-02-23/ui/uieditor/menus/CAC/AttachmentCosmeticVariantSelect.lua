require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	self:setModel( classModel )
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponSlotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	local weaponPlusAttachments = Engine.GetWeaponString( controller, classNum, weaponSlotName )
	local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlotName .. ".itemIndex" ) )
	CoD.WC_Category.ACV.selectedAttachmentWeaponIndex = weaponItemIndex
	CoD.WC_Category.ACV.attachmentTable = Engine.GetAttachmentCosmeticVariantTable( weaponPlusAttachments )
	self.restoreState = function ( self )
		local weaponCategory = CoD.perController[controller].weaponCategory
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, weaponCategory .. "cosmeticvariant.itemIndex" ) )
		local selectedWidget = self.selectionList:findItem( {
			variantIndex = selectedItemIndex
		}, nil, true, nil )
		if selectedWidget then
			local variantInfo = {
				itemIndex = selectedWidget.itemIndex,
				acvIndex = selectedItemIndex,
				getModel = CoD.NullFunction
			}
			FocusClassItem( self, variantInfo, controller )
		end
	end
	
end

local UpdateCosmeticVariant = function ( self, element, controller )
	if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
		element.acvIndex = element.variantIndex
		FocusClassItem( self, element, controller )
	end
end

local PostLoadFunc = function ( self, controller )
	self.updateFocus = UpdateCosmeticVariant
end

LUI.createMenu.AttachmentCosmeticVariantSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AttachmentCosmeticVariantSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AttachmentCosmeticVariantSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 642 )
	LeftPanel:setTopBottom( 0, 0, 117, 1080 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetAttachmentCosmeticVariantMenuTitle( "MENU_VARIANTS_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCurrentACVEquipped( self, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACACVItemNew( element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	selectionList:linkToElementModel( selectionList, "isChallengeClassified", true, function ( model )
		self:updateElementState( selectionList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isChallengeClassified"
		} )
	end )
	selectionList:setLeftRight( 0, 0, 116.5, 622.5 )
	selectionList:setTopBottom( 0, 0, 205, 883 )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 10 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:setDataSource( "AttachmentCosmeticVariantList" )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsCACACVItemNew( element, controller ) then
			SetCACACVAsOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			CallCustomElementFunction_Self( self, "updateFocus", element, controller )
		else
			CallCustomElementFunction_Self( self, "updateFocus", element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			SetAttachmentVariantClassItem( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "AttachmentSelect",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	PregameTimerOverlay:setLeftRight( 0, 1, 0, 0 )
	PregameTimerOverlay:setTopBottom( 0, 1, 0, 0 )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		}
	} )
	itemDescription:linkToElementModel( itemDescription, "isBMClassified", true, function ( model )
		self:updateElementState( itemDescription, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	itemDescription:setLeftRight( 0, 0, 672, 1248 )
	itemDescription:setTopBottom( 0, 0, 262.5, 295.5 )
	itemDescription.weaponDescTextBox:setText( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_ATTACHMENT_VARIANT" ) )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
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
	itemName:setLeftRight( 0, 0, 670, 1242 )
	itemName:setTopBottom( 0, 0, 205.5, 256.5 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	self:addElement( itemName )
	self.itemName = itemName
	
	local CryptokeyTypeNameLeft0 = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f25_local0 = AlwaysTrue()
				if f25_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f25_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f25_local0 = false
					end
				end
				return f25_local0
			end
		}
	} )
	CryptokeyTypeNameLeft0:linkToElementModel( CryptokeyTypeNameLeft0, "isBMClassified", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft0:linkToElementModel( CryptokeyTypeNameLeft0, "rarity", true, function ( model )
		self:updateElementState( CryptokeyTypeNameLeft0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	CryptokeyTypeNameLeft0:setLeftRight( 0, 0, 671, 837 )
	CryptokeyTypeNameLeft0:setTopBottom( 1, 1, -150.5, -117.5 )
	self:addElement( CryptokeyTypeNameLeft0 )
	self.CryptokeyTypeNameLeft0 = CryptokeyTypeNameLeft0
	
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	itemName:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	CryptokeyTypeNameLeft0:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft0:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		WC_VariantSelectionCancel( self, element, controller )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "PLATFORM_EMBLEM_ROTATE_LAYER_BUTTON", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CACShowRotatePrompt( self, element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
			return true
		else
			return false
		end
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.FEMenuLeftGraphics:close()
		self.GenericMenuFrame0:close()
		self.selectionList:close()
		self.PregameTimerOverlay:close()
		self.itemDescription:close()
		self.itemName:close()
		self.CryptokeyTypeNameLeft0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "AttachmentCosmeticVariantSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

