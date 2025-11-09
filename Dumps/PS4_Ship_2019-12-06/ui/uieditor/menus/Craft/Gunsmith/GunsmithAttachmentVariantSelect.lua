require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.CAC.BlackMarketItemDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )

local PreLoadFunc = function ( self, controller )
	if IsCampaign() then
		self.disableBlur = true
	end
	self:setModel( CoD.perController[controller].gunsmithAttachmentModel )
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = CoD.perController[controller].gunsmithAttachmentVariantModel
		if f2_local0 then
			f2_arg0.selectionList:findItem( {
				variantIndex = Engine.GetModelValue( f2_local0 )
			}, nil, true, nil )
		end
	end
	
end

LUI.createMenu.GunsmithAttachmentVariantSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithAttachmentVariantSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryAttachment"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithAttachmentVariantSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 428 )
	LeftPanel:setTopBottom( true, false, 78, 720 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame0:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "MENU_VARIANTS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( GetGunsmithAttachmentVariantMenuTitle( controller, "MENU_VARIANTS_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_cac" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 77, 415 )
	selectionList:setTopBottom( true, false, 136, 589 )
	selectionList:setDataSource( "GunsmithAttachmentVariantList" )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList:setVerticalCounter( CoD.verticalCounter )
	selectionList:linkToElementModel( selectionList, "isBMClassified", true, function ( model )
		local f4_local0 = selectionList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		if Gunsmith_IsACVItemNew( element, controller ) then
			Gunsmith_SetACVASOld( element, controller )
			UpdateSelfElementState( self, element, controller )
			Gunsmith_FocusAttachment( self, element, controller, true )
		elseif not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_FocusAttachment( self, element, controller, true )
		end
		return f5_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			Gunsmith_SetAttachmentVariant( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, true )
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsGunsmithCurrentACVEquipped( self, element, controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Gunsmith_IsACVItemNew( element, controller )
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
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
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
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local itemDescription = CoD.BlackMarketItemDescription.new( self, controller )
	itemDescription:setLeftRight( true, false, 448, 832 )
	itemDescription:setTopBottom( true, false, 175, 197 )
	itemDescription.weaponDescTextBox:setText( Engine.Localize( LocalizeIntoString( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MPUI_ATTACHMENT_VARIANT" ) ) )
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
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local itemName = CoD.InfoPaneItemName.new( self, controller )
	itemName:setLeftRight( true, false, 447, 828 )
	itemName:setTopBottom( true, false, 137, 171 )
	itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
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
			stateName = "NeedsWildcard",
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
	
	local CryptokeyTypeNameLeft0 = CoD.CryptokeyTypeNameLeft.new( self, controller )
	CryptokeyTypeNameLeft0:setLeftRight( true, false, 447, 558 )
	CryptokeyTypeNameLeft0:setTopBottom( false, true, -100, -78 )
	CryptokeyTypeNameLeft0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f24_local0 = AlwaysTrue()
				if f24_local0 then
					if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
						f24_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
					else
						f24_local0 = false
					end
				end
				return f24_local0
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
	self:addElement( CryptokeyTypeNameLeft0 )
	self.CryptokeyTypeNameLeft0 = CryptokeyTypeNameLeft0
	
	itemDescription:linkToElementModel( selectionList, nil, false, function ( model )
		itemDescription:setModel( model, controller )
	end )
	itemName:linkToElementModel( selectionList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	CryptokeyTypeNameLeft0:linkToElementModel( selectionList, "rarityType", false, function ( model )
		CryptokeyTypeNameLeft0:setModel( model, controller )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f30_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f30_local0 then
			f30_local0 = self:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, nil, function ( element, menu, controller, model )
		if CACShowRotatePrompt( self, element, controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "PLATFORM_EMBLEM_ROTATE_LAYER_BUTTON" )
		if CACShowRotatePrompt( self, element, controller ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		if CACShowRotatePrompt( self, element, controller ) then
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.FEMenuLeftGraphics:close()
		element.GenericMenuFrame0:close()
		element.selectionList:close()
		element.PregameTimerOverlay:close()
		element.itemDescription:close()
		element.itemName:close()
		element.CryptokeyTypeNameLeft0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithAttachmentVariantSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

