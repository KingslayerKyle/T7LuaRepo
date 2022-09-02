-- 99d78be68af199985da1cb905a7347dd
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 868 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 30, 0.11 )
	Text:setTopBottom( true, false, 0, 32 )
	Text:setText( Engine.Localize( "Item Banned By: FEXTWOLF" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local BannedIcon = LUI.UIImage.new()
	BannedIcon:setLeftRight( true, false, -10, 25 )
	BannedIcon:setTopBottom( true, false, -7, 35 )
	BannedIcon:setImage( RegisterImage( "uie_t7_icon_pregame_forced" ) )
	self:addElement( BannedIcon )
	self.BannedIcon = BannedIcon
	
	local ProtectedIcon = LUI.UIImage.new()
	ProtectedIcon:setLeftRight( true, false, -5.17, 25 )
	ProtectedIcon:setTopBottom( true, false, -2.1, 34.1 )
	ProtectedIcon:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( ProtectedIcon )
	self.ProtectedIcon = ProtectedIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

