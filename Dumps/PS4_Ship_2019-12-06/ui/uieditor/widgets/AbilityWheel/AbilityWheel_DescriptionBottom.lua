CoD.AbilityWheel_DescriptionBottom = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_DescriptionBottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_DescriptionBottom )
	self.id = "AbilityWheel_DescriptionBottom"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 68 )
	
	local TextDesc = LUI.UIText.new()
	TextDesc:setLeftRight( false, false, -88, 88 )
	TextDesc:setTopBottom( true, false, 0, 16 )
	TextDesc:setAlpha( RandomAddPercent( -15, 1 ) )
	TextDesc:setTTF( "fonts/escom.ttf" )
	TextDesc:setLetterSpacing( 1 )
	TextDesc:setLineSpacing( 1 )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextDesc:linkToElementModel( self, "selectedAbilityDisplayDesc", true, function ( model )
		local selectedAbilityDisplayDesc = Engine.GetModelValue( model )
		if selectedAbilityDisplayDesc then
			TextDesc:setText( Engine.Localize( selectedAbilityDisplayDesc ) )
		end
	end )
	self:addElement( TextDesc )
	self.TextDesc = TextDesc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TextDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

