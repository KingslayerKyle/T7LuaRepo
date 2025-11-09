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
	TextDesc:setRGB( 1, 1, 1 )
	TextDesc:setAlpha( RandomAddPercent( 1, -15 ) )
	TextDesc:setTTF( "fonts/Entovo.ttf" )
	TextDesc:setLetterSpacing( 1 )
	TextDesc:setLineSpacing( 1 )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextDesc:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayDesc", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextDesc )
	self.TextDesc = TextDesc
	
	self.close = function ( self )
		self.TextDesc:close()
		CoD.AbilityWheel_DescriptionBottom.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

