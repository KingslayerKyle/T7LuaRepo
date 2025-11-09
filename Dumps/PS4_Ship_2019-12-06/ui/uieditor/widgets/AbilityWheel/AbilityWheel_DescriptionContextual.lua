CoD.AbilityWheel_DescriptionContextual = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_DescriptionContextual.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_DescriptionContextual )
	self.id = "AbilityWheel_DescriptionContextual"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 68 )
	
	local TextDesc = LUI.UIText.new()
	TextDesc:setLeftRight( false, false, -116.5, 116.5 )
	TextDesc:setTopBottom( true, false, 0, 16 )
	TextDesc:setRGB( 0.78, 0.89, 0.93 )
	TextDesc:setAlpha( RandomAddPercent( -15, 1 ) )
	TextDesc:setText( Engine.Localize( "Hack enemy robots servos to blow off legs and heads." ) )
	TextDesc:setTTF( "fonts/escom.ttf" )
	TextDesc:setLetterSpacing( 1 )
	TextDesc:setLineSpacing( 1 )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextDesc )
	self.TextDesc = TextDesc
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

