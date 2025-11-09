require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer3x4" )
require( "ui.uieditor.widgets.CAC.WeaponAttributes" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentItemButtonND" )
require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropSymbols" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListBoxes" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithAttachmentModel )
	self.restoreState = function ( self )
		local attachmentModel = self:getModel()
		local variantAttachmentIndex = Engine.GetModelValue( attachmentModel )
		self.selectionList:findItem( {
			attachmentIndex = variantAttachmentIndex
		}, nil, true, nil )
	end
	
end

LUI.createMenu.GunsmithAttachmentSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithAttachmentSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 418 )
	LeftPanel:setTopBottom( true, false, 84, 667 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local GridItemButtonBackdropContainer3x4 = CoD.GridItemButtonBackdropContainer3x4.new( self, controller )
	GridItemButtonBackdropContainer3x4:setLeftRight( true, false, 99, 443 )
	GridItemButtonBackdropContainer3x4:setTopBottom( true, false, 145.5, 601.5 )
	GridItemButtonBackdropContainer3x4:setRGB( 1, 1, 1 )
	GridItemButtonBackdropContainer3x4:setAlpha( 0 )
	self:addElement( GridItemButtonBackdropContainer3x4 )
	self.GridItemButtonBackdropContainer3x4 = GridItemButtonBackdropContainer3x4
	
	local weaponAttributes = CoD.WeaponAttributes.new( self, controller )
	weaponAttributes:setLeftRight( true, false, 443, 862 )
	weaponAttributes:setTopBottom( false, true, -166, -62 )
	weaponAttributes:setRGB( 1, 1, 1 )
	weaponAttributes:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	self:addElement( weaponAttributes )
	self.weaponAttributes = weaponAttributes
	
	local selectionList = LUI.UIList.new( self, controller, 7, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 75, 413 )
	selectionList:setTopBottom( true, false, 137, 590 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "GunsmithWeaponAttachments" )
	selectionList:setWidgetType( CoD.GunsmithAttachmentItemButtonND )
	selectionList:setHorizontalCount( 3 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 7 )
	selectionList.buttonPromptAddFunctions = {}
	selectionList.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_TOGGLE_ACV" ), "T", element )
			return true
		else
			
		end
	end
	
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		Gunsmith_SelectAttachment( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( self )
		return retVal
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		Gunsmith_FocusAttachment( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "T") and element:isInFocus() then
			Gunsmith_Attachment_ToggleVariant( self, element, controller )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
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
		element.buttonPromptAddFunctions.alt2( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "alt2", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList:updateButtonPromptEventHandlers()
	selectionList:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return Gunsmith_IsAttachmentEquipped( menu, element, controller )
			end
		}
	} )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local GridItemButtonBackdropSymbols = CoD.GridItemButtonBackdropSymbols.new( self, controller )
	GridItemButtonBackdropSymbols:setLeftRight( true, false, 98, 1192.67 )
	GridItemButtonBackdropSymbols:setTopBottom( true, false, 144.5, 601.5 )
	GridItemButtonBackdropSymbols:setRGB( 1, 1, 1 )
	GridItemButtonBackdropSymbols:setAlpha( 0 )
	GridItemButtonBackdropSymbols:setZoom( -7.02 )
	self:addElement( GridItemButtonBackdropSymbols )
	self.GridItemButtonBackdropSymbols = GridItemButtonBackdropSymbols
	
	local cacElemsSideListBoxes0 = CoD.cac_ElemsSideListBoxes.new( self, controller )
	cacElemsSideListBoxes0:setLeftRight( true, false, 18.87, 71.87 )
	cacElemsSideListBoxes0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListBoxes0:setRGB( 1, 1, 1 )
	self:addElement( cacElemsSideListBoxes0 )
	self.cacElemsSideListBoxes0 = cacElemsSideListBoxes0
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeWeaponNameIntoString( modelValue, "MENU_GUNSMITH_ATTACHMENT_SELECT_TITLE", controller ) ) )
		end
	end )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 433, 689 )
	weaponDescTextBox:setTopBottom( true, false, 182, 201 )
	weaponDescTextBox:setRGB( 1, 1, 1 )
	weaponDescTextBox:setAlpha( 0.7 )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( self, controller )
	WeaponNameWidget0:setLeftRight( true, false, 431, 812 )
	WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
	WeaponNameWidget0:setRGB( 1, 1, 1 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	weaponDescTextBox:linkToElementModel( selectionList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	WeaponNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 424 )
				self.LeftPanel:setTopBottom( true, false, 84, 667 )
				self.clipFinished( LeftPanel, {} )
				weaponAttributes:completeAnimation()
				self.weaponAttributes:setLeftRight( true, false, 459, 878 )
				self.weaponAttributes:setTopBottom( false, true, -166, -62 )
				self.clipFinished( weaponAttributes, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setLeftRight( true, false, 449, 705 )
				self.weaponDescTextBox:setTopBottom( true, false, 182, 201 )
				self.clipFinished( weaponDescTextBox, {} )
				WeaponNameWidget0:completeAnimation()
				self.WeaponNameWidget0:setLeftRight( true, false, 447, 828 )
				self.WeaponNameWidget0:setTopBottom( true, false, 137, 171 )
				self.clipFinished( WeaponNameWidget0, {} )
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearMenuSavedState( self )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.LeftPanel:close()
		self.GridItemButtonBackdropContainer3x4:close()
		self.weaponAttributes:close()
		self.selectionList:close()
		self.GridItemButtonBackdropSymbols:close()
		self.cacElemsSideListBoxes0:close()
		self.cac3dTitleIntermediary0:close()
		self.WeaponNameWidget0:close()
		self.weaponDescTextBox:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

