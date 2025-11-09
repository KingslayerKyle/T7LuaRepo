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

CoD.AttachmentVariantSelect = InheritFrom( LUI.UIElement )
CoD.AttachmentVariantSelect.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AttachmentVariantSelect )
	self.id = "AttachmentVariantSelect"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, 8, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 9, 117 )
	selectionList:setTopBottom( true, false, 13, 469 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "AttachmentCosmeticVariantList" )
	selectionList:setWidgetType( CoD.CustomizationItem_ND )
	selectionList:setVerticalCount( 4 )
	selectionList:setSpacing( 8 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		SetAttachmentVariantClassItem( self, element, controller )
		WC_SelectingCustomization( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		WC_VariantGainFocus( self, element, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local unlockDescTextBox = LUI.UIText.new()
	unlockDescTextBox:setLeftRight( true, false, 255, 720 )
	unlockDescTextBox:setTopBottom( true, false, 43, 60 )
	unlockDescTextBox:setRGB( 1, 1, 1 )
	unlockDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockDescTextBox )
	self.unlockDescTextBox = unlockDescTextBox
	
	local unlockRewardWidget = CoD.UnlockRewardWidget.new( menu, controller )
	unlockRewardWidget:setLeftRight( false, true, -150, 0 )
	unlockRewardWidget:setTopBottom( true, false, 0, 150 )
	unlockRewardWidget:setRGB( 1, 1, 1 )
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
	CategoryNameWidget0:setRGB( 1, 1, 1 )
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
	self.close = function ( self )
		self.selectionList:close()
		self.unlockRewardWidget:close()
		self.CategoryNameWidget0:close()
		self.unlockDescTextBox:close()
		CoD.AttachmentVariantSelect.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

