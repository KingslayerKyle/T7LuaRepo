CoD.GenericListHeaderEntry = InheritFrom( LUI.UIElement )
CoD.GenericListHeaderEntry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericListHeaderEntry )
	self.id = "GenericListHeaderEntry"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 351 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( 0, 1, 0, 0 )
	btnDisplayText:setTopBottom( 0, 0, 0, 30 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayText:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.btnDisplayText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

