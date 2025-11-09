CoD.FileshareStat = InheritFrom( LUI.UIElement )
CoD.FileshareStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareStat )
	self.id = "FileshareStat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 18 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 100 )
	BG:setTopBottom( true, false, 0, 18 )
	BG:setRGB( 0.32, 0.32, 0.32 )
	BG:setAlpha( 0.8 )
	self:addElement( BG )
	self.BG = BG
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 2, 17.63 )
	Icon:setTopBottom( true, false, 2.3, 16 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 16.63, 98.63 )
	TextBox0:setTopBottom( true, false, -1.85, 18.15 )
	TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

