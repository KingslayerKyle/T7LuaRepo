CoD.StartMenu_Party_LeaderNotification = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party_LeaderNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party_LeaderNotification )
	self.id = "StartMenu_Party_LeaderNotification"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 523 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 0, 91 )
	Image1:setTopBottom( 0, 0, 0, 91 )
	Image1:setRGB( 0.14, 0.24, 0.56 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 98, 523 )
	TextBox0:setTopBottom( 0, 0, 33, 65 )
	TextBox0:setText( Engine.Localize( "You are the Party Leader" ) )
	TextBox0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

