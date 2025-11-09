CoD.EACJumpHeightTextMessage = InheritFrom( LUI.UIElement )
CoD.EACJumpHeightTextMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EACJumpHeightTextMessage )
	self.id = "EACJumpHeightTextMessage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 185 )
	self:setTopBottom( true, false, 0, 51 )
	
	local MessageLbl = LUI.UIText.new()
	MessageLbl:setLeftRight( true, false, 4.53, 65.53 )
	MessageLbl:setTopBottom( true, false, 4, 19 )
	MessageLbl:setRGB( 1, 1, 1 )
	MessageLbl:setText( Engine.Localize( "MINIMAL IMPACT DISTANCE" ) )
	MessageLbl:setTTF( "fonts/UnitedSansSmExLt.ttf" )
	MessageLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MessageLbl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MessageLbl )
	self.MessageLbl = MessageLbl
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

