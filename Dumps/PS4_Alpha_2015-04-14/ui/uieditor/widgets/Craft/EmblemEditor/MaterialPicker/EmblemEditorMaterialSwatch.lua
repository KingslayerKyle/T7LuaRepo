require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemMaterialElement" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.emblemMaterialTabWidget" )

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
	ColorPickerBkgd0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ColorPickerBkgd0 )
	self.ColorPickerBkgd0 = ColorPickerBkgd0
	
	local lastSavedColor = CoD.EmblemColorElement.new( menu, controller )
	lastSavedColor:setLeftRight( true, false, 4, 42 )
	lastSavedColor:setTopBottom( true, false, 8.5, 152.5 )
	lastSavedColor:setRGB( 1, 1, 1 )
	lastSavedColor:subscribeToGlobalModel( controller, "EmblemSelectedLayerColor", nil, function ( model )
		lastSavedColor:setModel( model, controller )
	end )
	lastSavedColor:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		EmblemChooseColor_SelectionChanged( self, element, controller )
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	lastSavedColor:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		EmblemChooseColor_SelectionChanged( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	self:addElement( lastSavedColor )
	self.lastSavedColor = lastSavedColor
	
	local materialSwatch = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	materialSwatch:makeFocusable()
	materialSwatch:setLeftRight( true, false, 43, 666 )
	materialSwatch:setTopBottom( true, false, 8.5, 152.5 )
	materialSwatch:setRGB( 1, 1, 1 )
	materialSwatch:setDataSource( "EmblemMaterialList" )
	materialSwatch:setWidgetType( CoD.EmblemMaterialElement )
	materialSwatch:setHorizontalCount( 7 )
	materialSwatch:setVerticalCount( 3 )
	materialSwatch:setSpacing( 0 )
	materialSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemChooseMaterial_SelectionChanged( self, element, controller )
		return retVal
	end )
	materialSwatch:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		EmblemChooseMaterial_SelectionChanged( self, element, controller )
		return retVal
	end )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local tabList = CoD.basicTabList.new( menu, controller )
	tabList:setLeftRight( true, false, -33, 1057 )
	tabList:setTopBottom( true, false, -22.5, 8.5 )
	tabList:setRGB( 1, 1, 1 )
	tabList.grid:setDataSource( "EmblemMaterialTabType" )
	tabList.grid:setWidgetType( CoD.emblemMaterialTabWidget )
	tabList.grid:setHorizontalCount( 5 )
	self:addElement( tabList )
	self.tabList = tabList
	
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
	lastSavedColor.id = "lastSavedColor"
	materialSwatch.id = "materialSwatch"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lastSavedColor:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.lastSavedColor:close()
		self.materialSwatch:close()
		self.tabList:close()
		CoD.EmblemEditorMaterialSwatch.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

