CoD.Social_Party = InheritFrom( LUI.UIElement )
CoD.Social_Party.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Party )
	self.id = "Social_Party"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 75, 575 )
	TextBox0:setTopBottom( true, false, 83, 108 )
	TextBox0:setText( Engine.Localize( "MENU_PARTY_CAPS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

