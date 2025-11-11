CoD.WarScoreboardHeadingItem = InheritFrom( LUI.UIElement )
CoD.WarScoreboardHeadingItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboardHeadingItem )
	self.id = "WarScoreboardHeadingItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 166 )
	self:setTopBottom( 0, 0, 0, 53 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 166 )
	bg:setTopBottom( 0, 0, 0, 53 )
	bg:setRGB( 0.42, 0.42, 0.42 )
	bg:setAlpha( 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Heading = LUI.UIText.new()
	Heading:setLeftRight( 0, 0, 22, 144 )
	Heading:setTopBottom( 0, 0, 7, 40 )
	Heading:setRGB( 0.6, 0.68, 0.64 )
	Heading:setTTF( "fonts/default.ttf" )
	Heading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Heading:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Heading:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Heading:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Heading )
	self.Heading = Heading
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Heading:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

