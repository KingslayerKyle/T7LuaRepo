require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemMaterialElement" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.EmblemEditorMaterialSwatch = InheritFrom( LUI.UIElement )
CoD.EmblemEditorMaterialSwatch.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorMaterialSwatch )
	self.id = "EmblemEditorMaterialSwatch"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( true, false, 0, 671 )
	self:setTopBottom( true, false, 0, 161 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ColorPickerBkgd0 = LUI.UIImage.new()
	ColorPickerBkgd0:setLeftRight( true, true, 0, 0 )
	ColorPickerBkgd0:setTopBottom( true, true, -24, 0 )
	ColorPickerBkgd0:setRGB( 0.09, 0.1, 0.12 )
	ColorPickerBkgd0:setAlpha( 0.9 )
	ColorPickerBkgd0:setZRot( 180 )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local lastSavedColor = CoD.EmblemColorElement.new( menu, controller )
	lastSavedColor:setLeftRight( true, false, 7, 45 )
	lastSavedColor:setTopBottom( true, false, 21.5, 155.5 )
	lastSavedColor:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		lastSavedColor:setModel( model, controller )
	end )
	lastSavedColor:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
		EmblemChooseColor_SelectionChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	lastSavedColor:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( lastSavedColor, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		GoBackToMenu( menu, controller, "EmblemEditor" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( lastSavedColor )
	self.lastSavedColor = lastSavedColor
	
	local materialSwatch = LUI.UIList.new( menu, controller, -3, 0, nil, false, false, 0, 0, false, true )
	materialSwatch:makeFocusable()
	materialSwatch:setLeftRight( true, false, 45, 650 )
	materialSwatch:setTopBottom( true, false, 19.5, 157.5 )
	materialSwatch:setDataSource( "EmblemMaterialList" )
	materialSwatch:setWidgetType( CoD.EmblemMaterialElement )
	materialSwatch:setHorizontalCount( 7 )
	materialSwatch:setVerticalCount( 3 )
	materialSwatch:setSpacing( -3 )
	materialSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		EmblemChooseMaterial_SelectionChanged( self, element, controller )
		return f7_local0
	end )
	materialSwatch:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	materialSwatch:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( materialSwatch, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		EmblemChooseMaterial_SelectionChanged( self, element, controller )
		GoBackToMenu( menu, controller, "EmblemEditor" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local tabList = CoD.basicTabList.new( menu, controller )
	tabList:setLeftRight( true, false, 0, 1090 )
	tabList:setTopBottom( true, false, -22.5, 8.5 )
	tabList.grid:setDataSource( "EmblemMaterialTabType" )
	tabList.grid:setWidgetType( CoD.paintshopTabWidget )
	tabList.grid:setHorizontalCount( 5 )
	tabList:registerEventHandler( "list_active_changed", function ( element, event )
		local f12_local0 = nil
		EmblemChooseMaterial_TabChanged( self, element, controller )
		return f12_local0
	end )
	self:addElement( tabList )
	self.tabList = tabList
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -24, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	lastSavedColor.navigation = {
		right = materialSwatch
	}
	materialSwatch.navigation = {
		left = lastSavedColor
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0.9 )
				self.clipFinished( ColorPickerBkgd0, {} )
			end
		}
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.lastSavedColor:close()
		element.materialSwatch:close()
		element.tabList:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

