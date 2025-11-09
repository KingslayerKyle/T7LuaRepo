require( "ui.uieditor.widgets.CAC.Customization.CategoryNameWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToElementModel( f1_arg0, nil, function ( f2_arg0 )
		local f2_local0 = Engine.GetModel( f2_arg0, "itemIndex" )
		if f2_local0 then
			f1_arg0.unlockWeaponDescTextBox:setText( CoD.GetUnlockStringForItemIndex( f1_arg1, Engine.GetModelValue( f2_local0 ) ) )
		end
		f1_arg0:processEvent( {
			name = "update_state",
			controller = f1_arg1
		} )
	end )
	if f1_arg0.CategoryNameWidget0 then
		f1_arg0.CategoryNameWidget0:linkToElementModel( f1_arg0, "displayText", true, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f1_arg0.CategoryNameWidget0.categoryNameLabel:setText( LocalizeToUpperString( modelValue ) )
				local f3_local1 = f1_arg0.CategoryNameWidget0.categoryNameLabel:getTextWidth()
				local f3_local2, f3_local3, f3_local4, f3_local5 = f1_arg0.CategoryNameWidget0:getLocalRect()
				f1_arg0.CategoryNameWidget0:setLeftRight( true, false, f3_local2, f3_local2 + f3_local1 + 30 )
			end
		end )
	end
end

CoD.WeaponPreviewPane = InheritFrom( LUI.UIElement )
CoD.WeaponPreviewPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WeaponPreviewPane )
	self.id = "WeaponPreviewPane"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 901 )
	self:setTopBottom( true, false, 0, 505 )
	
	local bottomLine = LUI.UIImage.new()
	bottomLine:setLeftRight( true, true, 0, 0 )
	bottomLine:setTopBottom( false, true, -2, 0 )
	bottomLine:setRGB( 0.43, 0.43, 0.44 )
	bottomLine:setAlpha( 0 )
	self:addElement( bottomLine )
	self.bottomLine = bottomLine
	
	local topLine = LUI.UIImage.new()
	topLine:setLeftRight( true, true, 0, 0 )
	topLine:setTopBottom( true, false, 0, 2 )
	topLine:setRGB( 0.43, 0.43, 0.44 )
	topLine:setAlpha( 0 )
	self:addElement( topLine )
	self.topLine = topLine
	
	local currentlyEquipped = LUI.UITightText.new()
	currentlyEquipped:setLeftRight( true, false, 44, 74 )
	currentlyEquipped:setTopBottom( true, false, 55, 72 )
	currentlyEquipped:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentlyEquipped:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			currentlyEquipped:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( currentlyEquipped )
	self.currentlyEquipped = currentlyEquipped
	
	local CategoryNameWidget0 = CoD.CategoryNameWidget.new( menu, controller )
	CategoryNameWidget0:setLeftRight( true, false, 40, 206 )
	CategoryNameWidget0:setTopBottom( true, false, 16, 51 )
	CategoryNameWidget0:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			CategoryNameWidget0.categoryNameLabel:setText( Engine.Localize( displayText ) )
		end
	end )
	self:addElement( CategoryNameWidget0 )
	self.CategoryNameWidget0 = CategoryNameWidget0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CategoryNameWidget0:close()
		element.currentlyEquipped:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

