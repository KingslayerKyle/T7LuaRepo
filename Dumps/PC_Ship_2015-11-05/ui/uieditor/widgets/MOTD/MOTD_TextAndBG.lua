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
	self:setLeftRight( true, false, 0, 452 )
	self:setTopBottom( true, false, 0, 22 )
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 3, 445 )
	weaponDescTextBox:setTopBottom( true, false, 0, 22 )
	weaponDescTextBox:setAlpha( 0.92 )
	weaponDescTextBox:setText( Engine.Localize( "test" ) )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

