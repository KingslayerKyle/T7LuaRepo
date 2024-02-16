-- 2dfd6db4f03239b18404be91bca09b88
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyLeaderIcon" )

CoD.LocalServerPlayerListRow = InheritFrom( LUI.UIElement )
CoD.LocalServerPlayerListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.LocalServerPlayerListRow )
	self.id = "LocalServerPlayerListRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 223 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, -3 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.1 )
	self:addElement( Background )
	self.Background = Background
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 19, 220 )
	Gamertag:setTopBottom( true, false, 3, 22 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( true, false, -2, 23 )
	LobbyLeaderIcon:setTopBottom( true, false, 0.79, 24 )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	self.Gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			Gamertag:setText( Engine.Localize( gamertag ) )
		end
	end )
	self.LobbyLeaderIcon:linkToElementModel( self, "isLeader", true, function ( model )
		local isLeader = Engine.GetModelValue( model )
		if isLeader then
			LobbyLeaderIcon:setAlpha( isLeader )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyLeaderIcon:close()
		element.Gamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
