CoD.Pregame_ItemVote_BanProtectPopup_Alert = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_BanProtectPopup_Alert.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_ItemVote_BanProtectPopup_Alert )
	self.id = "Pregame_ItemVote_BanProtectPopup_Alert"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1302 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 1, 45, 1 )
	Text:setTopBottom( 0, 0, 0, 48 )
	Text:setText( Engine.Localize( "Item Banned By: FEXTWOLF" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local BannedIcon = LUI.UIImage.new()
	BannedIcon:setLeftRight( 0, 0, -15, 38 )
	BannedIcon:setTopBottom( 0, 0, -10, 53 )
	BannedIcon:setImage( RegisterImage( "uie_t7_icon_pregame_forced" ) )
	self:addElement( BannedIcon )
	self.BannedIcon = BannedIcon
	
	local ProtectedIcon = LUI.UIImage.new()
	ProtectedIcon:setLeftRight( 0, 0, -8, 37 )
	ProtectedIcon:setTopBottom( 0, 0, -3, 51 )
	ProtectedIcon:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( ProtectedIcon )
	self.ProtectedIcon = ProtectedIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

