CoD.MOTD_TextAndBG = InheritFrom( LUI.UIElement )
CoD.MOTD_TextAndBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MOTD_TextAndBG )
	self.id = "MOTD_TextAndBG"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 678 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( 0, 0, 4, 667 )
	weaponDescTextBox:setTopBottom( 0, 0, 0, 33 )
	weaponDescTextBox:setAlpha( 0.92 )
	weaponDescTextBox:setText( Engine.Localize( "test" ) )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

