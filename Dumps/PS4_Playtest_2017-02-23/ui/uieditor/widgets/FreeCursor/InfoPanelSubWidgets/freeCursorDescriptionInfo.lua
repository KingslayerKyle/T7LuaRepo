CoD.freeCursorDescriptionInfo = InheritFrom( LUI.UIElement )
CoD.freeCursorDescriptionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorDescriptionInfo )
	self.id = "freeCursorDescriptionInfo"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 100 )
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0.05, 0.15, 0.11 )
	BlackBG2:setAlpha( 0.98 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 0.95, 10, 10 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setRGB( 0.05, 0.15, 0.11 )
	backing:setAlpha( 0 )
	self:addElement( backing )
	self.backing = backing
	
	local description = LUI.UIText.new()
	description:setLeftRight( 0, 0, 20, 400 )
	description:setTopBottom( 0, 0, 5, 32 )
	description:setAlpha( 0.3 )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( description, "setText", function ( element, text )
		if IsTextEmpty( element ) then
			CollapseFreeCursorElement( self )
		else
			UpdateWidgetHeightToMultilineText( self, element, 5 )
		end
	end )
	self:addElement( description )
	self.description = description
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.description:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

