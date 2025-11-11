CoD.ChooseCharacter_HelpBubble_ButtonBackground = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_ButtonBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_ButtonBackground )
	self.id = "ChooseCharacter_HelpBubble_ButtonBackground"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local ButtonBackground = LUI.UIImage.new()
	ButtonBackground:setLeftRight( 0, 1, 0, 0 )
	ButtonBackground:setTopBottom( 0, 0, 0, 48 )
	ButtonBackground:setRGB( 0.18, 0.18, 0.18 )
	self:addElement( ButtonBackground )
	self.ButtonBackground = ButtonBackground
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

