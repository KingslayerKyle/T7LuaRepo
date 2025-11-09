require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCustomizeVariant" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithCreateVariantName" )
require( "ui.uieditor.menus.Craft.Gunsmith.GunsmithVariantOptions" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantItemND" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.GunsmithVariantSelector = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantSelector )
	self.id = "GunsmithVariantSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 572 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	variantList:makeFocusable()
	variantList:setLeftRight( true, false, 0, 338 )
	variantList:setTopBottom( true, false, 8, 461 )
	variantList:setDataSource( "GunsmithVariantList" )
	variantList:setWidgetType( CoD.GunsmithVariantItemND )
	variantList:setHorizontalCount( 3 )
	variantList:setVerticalCount( 4 )
	variantList:setSpacing( 7 )
	variantList:setVerticalCounter( CoD.verticalCounter )
	variantList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsModelValueEqualToEnum( controller, "Gunsmith.Mode", Enum.GunsmithMode.GUNSMITHMODE_VARIANTS ) then
			Gunsmith_FocusOccupiedVariant( self, element, controller )
		end
		return retVal
	end )
	variantList:registerEventHandler( "personalize_class_item", function ( element, event )
		local retVal = nil
		OpenPopup( self, "GunsmithVariantOptions", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	variantList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	variantList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Gunsmith_IsVariantOccupied( element, controller ) then
			OpenOverlay( self, "GunsmithCustomizeVariant", controller )
			return true
		elseif not Gunsmith_IsVariantOccupied( element, controller ) then
			Gunsmith_ChooseEmptyVariant( self, element, controller )
			OpenPopup( self, "GunsmithCreateVariantName", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if Gunsmith_IsVariantOccupied( element, controller ) then
			return true
		elseif not Gunsmith_IsVariantOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( variantList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if Gunsmith_IsVariantOccupied( element, controller ) then
			OpenPopup( self, "GunsmithVariantOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_GUNSMITH_VARIANT_OPTIONS" )
		if Gunsmith_IsVariantOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( variantList )
	self.variantList = variantList
	
	variantList.id = "variantList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.variantList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.variantList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

