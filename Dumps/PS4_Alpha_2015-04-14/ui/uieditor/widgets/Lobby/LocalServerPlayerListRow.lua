require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )

CoD.LocalServerPlayerListRow = InheritFrom( LUI.UIElement )
CoD.LocalServerPlayerListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LocalServerPlayerListRow )
	self.id = "LocalServerPlayerListRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, -3 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 32, 214 )
	Gamertag:setTopBottom( true, false, 5, 25 )
	Gamertag:setRGB( 1, 1, 1 )
	Gamertag:setText( Engine.Localize( "MENU_NEW" ) )
	Gamertag:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( true, false, 0, 28 )
	LobbyLeaderIcon:setTopBottom( true, false, 0, 26 )
	LobbyLeaderIcon:setRGB( 1, 1, 1 )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	self.close = function ( self )
		self.LobbyLeaderIcon:close()
		CoD.LocalServerPlayerListRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

