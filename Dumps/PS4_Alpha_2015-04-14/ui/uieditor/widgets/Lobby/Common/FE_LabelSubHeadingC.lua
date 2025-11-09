CoD.FE_LabelSubHeadingC = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingC )
	self.id = "FE_LabelSubHeadingC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 195 )
	self:setTopBottom( true, false, 0, 32 )
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 0, 195 )
	TextBox2:setTopBottom( true, false, 0, 32 )
	TextBox2:setRGB( 0.84, 0.86, 0.87 )
	TextBox2:setText( Engine.Localize( "ZombieSlashers" ) )
	TextBox2:setTTF( "fonts/Entovo.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

