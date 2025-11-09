require( "ui.uieditor.widgets.Craft.EmblemEditor.ColorPicker.EmblemColorElement" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

CoD.EmblemEditorColorSwatchContainer = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorSwatchContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorSwatchContainer )
	self.id = "EmblemEditorColorSwatchContainer"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( true, false, 0, 671 )
	self:setTopBottom( true, false, 0, 161 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ColorPickerBkgd0 = LUI.UIImage.new()
	ColorPickerBkgd0:setLeftRight( true, true, 0, 0 )
	ColorPickerBkgd0:setTopBottom( true, true, 0, 0 )
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
	
	local emblemColorSwatch = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	emblemColorSwatch:makeFocusable()
	emblemColorSwatch:setLeftRight( true, false, 43, 667 )
	emblemColorSwatch:setTopBottom( true, false, 8.5, 152.5 )
	emblemColorSwatch:setRGB( 1, 1, 1 )
	emblemColorSwatch:setDataSource( "EmblemColorList" )
	emblemColorSwatch:setWidgetType( CoD.EmblemColorElement )
	emblemColorSwatch:setHorizontalCount( 13 )
	emblemColorSwatch:setVerticalCount( 9 )
	emblemColorSwatch:setSpacing( 0 )
	emblemColorSwatch:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemChooseColor_SelectionChanged( self, element, controller )
		return retVal
	end )
	emblemColorSwatch:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		EmblemChooseColor_SelectionChanged( self, element, controller )
		return retVal
	end )
	self:addElement( emblemColorSwatch )
	self.emblemColorSwatch = emblemColorSwatch
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 671 )
	EmblemEditorFrame0:setTopBottom( true, false, 0, 161 )
	EmblemEditorFrame0:setRGB( 1, 1, 1 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	lastSavedColor.navigation = {
		right = emblemColorSwatch
	}
	emblemColorSwatch.navigation = {
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
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0.9 )
				self.clipFinished( ColorPickerBkgd0, {} )
				lastSavedColor:completeAnimation()
				self.lastSavedColor:setAlpha( 1 )
				self.clipFinished( lastSavedColor, {} )
				emblemColorSwatch:completeAnimation()
				self.emblemColorSwatch:setAlpha( 1 )
				self.clipFinished( emblemColorSwatch, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ColorPickerBkgd0:completeAnimation()
				self.ColorPickerBkgd0:setAlpha( 0 )
				self.clipFinished( ColorPickerBkgd0, {} )
				lastSavedColor:completeAnimation()
				self.lastSavedColor:setAlpha( 0 )
				self.clipFinished( lastSavedColor, {} )
				emblemColorSwatch:completeAnimation()
				self.emblemColorSwatch:setAlpha( 0 )
				self.clipFinished( emblemColorSwatch, {} )
			end
		}
	}
	lastSavedColor.id = "lastSavedColor"
	emblemColorSwatch.id = "emblemColorSwatch"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lastSavedColor:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.lastSavedColor:close()
		self.emblemColorSwatch:close()
		self.EmblemEditorFrame0:close()
		CoD.EmblemEditorColorSwatchContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

