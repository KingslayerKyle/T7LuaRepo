-- aa3f6a848357315ec6f82d83d5d221dc
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_HelpButton = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HelpButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HelpButton )
	self.id = "VehicleGround_HelpButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( true, true, 0, 0 )
	buttonText:setTopBottom( false, false, -15, 15 )
	buttonText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERL^" ) )
	buttonText:setTTF( "fonts/default.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
