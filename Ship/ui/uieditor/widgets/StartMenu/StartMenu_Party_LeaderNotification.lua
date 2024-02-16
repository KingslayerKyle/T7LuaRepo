-- e46ebc4c822f2a320678cd7968749d95
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 349 )
	self:setTopBottom( true, false, 0, 60 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 60.35 )
	Image1:setTopBottom( true, false, 0, 60.35 )
	Image1:setRGB( 0.14, 0.24, 0.56 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 65.35, 349 )
	TextBox0:setTopBottom( true, false, 22, 43 )
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
