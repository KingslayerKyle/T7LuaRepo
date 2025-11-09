require( "ui.uieditor.widgets.CAC.Customization.CustomizationItem_ND" )
require( "ui.uieditor.widgets.CAC.Customization.UnlockRewardWidget" )
require( "ui.uieditor.widgets.CAC.Customization.CategoryNameWidget" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToElementModel( self, nil, function ( model )
		local modelValue = Engine.GetModel( model, "itemIndex" )
		if modelValue then
			local itemIndex = Engine.GetModelValue( modelValue )
			self.unlockWeaponDescTextBox:setText( CoD.GetUnlockStringForItemIndex( controller, itemIndex ) )
		end
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end )
	if self.CategoryNameWidget0 then
		self.CategoryNameWidget0:linkToElementModel( self.selectionList, "name", true, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.CategoryNameWidget0.categoryNameLabel:setText( LocalizeToUpperString( modelValue ) )
				local textWidth = self.CategoryNameWidget0.categoryNameLabel:getTextWidth()
				local left, top, right, bottom = self.CategoryNameWidget0:getLocalRect()
				local extraTextWidth = 30
				self.CategoryNameWidget0:setLeftRight( true, false, left, left + textWidth + extraTextWidth )
			end
		end )
	end
end

CoD.WeaponCustomizationSelect = InheritFrom( LUI.UIElement )
CoD.WeaponCustomizationSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponCustomizationSelect )
	self.id = "WeaponCustomizationSelect"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 9, 233 )
	selectionList:setTopBottom( true, false, 11, 467 )
	selectionList:setDataSource( "WeaponOptions" )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setHorizontalCount( 2 )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		WC_WeaponOptionGainFocus( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetWeaponOptionClassItem( self, element, controller )
		WC_SelectingCustomization( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local unlockDescTextBox = LUI.UIText.new()
	unlockDescTextBox:setLeftRight( true, false, 255, 747 )
	unlockDescTextBox:setTopBottom( true, false, 43, 60 )
	unlockDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockDescTextBox )
	self.unlockDescTextBox = unlockDescTextBox
	
	local unlockRewardWidget = CoD.UnlockRewardWidget.new( menu, controller )
	unlockRewardWidget:setLeftRight( false, true, -150, 0 )
	unlockRewardWidget:setTopBottom( true, false, 0, 150 )
	unlockRewardWidget:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( unlockRewardWidget )
	self.unlockRewardWidget = unlockRewardWidget
	
	local CategoryNameWidget0 = CoD.CategoryNameWidget.new( menu, controller )
	CategoryNameWidget0:setLeftRight( true, false, 253, 696 )
	CategoryNameWidget0:setTopBottom( true, false, 7, 42 )
	self:addElement( CategoryNameWidget0 )
	self.CategoryNameWidget0 = CategoryNameWidget0
	
	unlockDescTextBox:linkToElementModel( selectionList, "unlockDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	unlockRewardWidget:linkToElementModel( selectionList, "unlockReward", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockRewardWidget.unlockRewardAmount:setText( Engine.Localize( modelValue ) )
		end
	end )
	CategoryNameWidget0:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryNameWidget0.categoryNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectionList:close()
		self.unlockRewardWidget:close()
		self.CategoryNameWidget0:close()
		self.unlockDescTextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

