require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemMaterialElement" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.EmblemEditorMaterialSwatch = InheritFrom( LUI.UIElement )
CoD.EmblemEditorMaterialSwatch.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.EmblemEditorMaterialSwatch )
	self.id = "EmblemEditorMaterialSwatch"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( 0, 0, 0, 915 )
	self:setTopBottom( 0, 0, 0, 301 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ColorPickerBkgd0 = LUI.UIImage.new()
	ColorPickerBkgd0:setLeftRight( 0, 1, 0, 0 )
	ColorPickerBkgd0:setTopBottom( 0, 1, 0, 0 )
	ColorPickerBkgd0:setRGB( 0.09, 0.1, 0.12 )
	ColorPickerBkgd0:setAlpha( 0.9 )
	ColorPickerBkgd0:setZRot( 180 )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local lastSavedColor = CoD.EmblemColorElement.new( menu, controller )
	lastSavedColor:setLeftRight( 0, 0, 24, 81 )
	lastSavedColor:setTopBottom( 0, 0, 72, 256 )
	lastSavedColor:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		lastSavedColor:setModel( model, controller )
	end )
	lastSavedColor:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
		EmblemChooseColor_SelectionChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	lastSavedColor:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( lastSavedColor, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		GoBackToMenu( menu, controller, "EmblemEditor" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( lastSavedColor )
	self.lastSavedColor = lastSavedColor
	
	local materialSwatch = LUI.UIList.new( menu, controller, -4, 0, nil, false, false, 0, 0, false, false )
	materialSwatch:makeFocusable()
	materialSwatch:setLeftRight( 0, 0, 79, 911 )
	materialSwatch:setTopBottom( 0, 0, 68, 256 )
	materialSwatch:setWidgetType( CoD.EmblemMaterialElement )
	materialSwatch:setHorizontalCount( 9 )
	materialSwatch:setVerticalCount( 2 )
	materialSwatch:setSpacing( -4 )
	materialSwatch:setVerticalCounter( CoD.verticalCounter )
	materialSwatch:setDataSource( "EmblemMaterialList" )
	materialSwatch:linkToElementModel( materialSwatch, "isBMClassified", true, function ( model )
		local element = materialSwatch
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	materialSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		if IsElementInState( element, "New" ) then
			EmblemChooseMaterial_SelectionChanged( self, element, controller )
			Emblems_SetMaterialOld( menu, element, controller )
			UpdateSelfElementState( menu, element, controller )
		else
			EmblemChooseMaterial_SelectionChanged( self, element, controller )
		end
		return retVal
	end )
	materialSwatch:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	materialSwatch:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( materialSwatch, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			EmblemChooseMaterial_SelectionChanged( self, element, controller )
			GoBackToMenu( menu, controller, "EmblemEditor" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 0, 4 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local tabList = CoD.FE_TabBar.new( menu, controller )
	tabList:setLeftRight( 0, 0, -94, 912 )
	tabList:setTopBottom( 0, 0, 6, 67 )
	tabList.Tabs.grid:setDataSource( "EmblemMaterialTabType" )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		EmblemChooseMaterial_TabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	lastSavedColor.navigation = {
		up = materialSwatch,
		right = materialSwatch
	}
	materialSwatch.navigation = {
		left = lastSavedColor,
		down = lastSavedColor
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	lastSavedColor.id = "lastSavedColor"
	materialSwatch.id = "materialSwatch"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lastSavedColor:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lastSavedColor:close()
		self.materialSwatch:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.tabList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

