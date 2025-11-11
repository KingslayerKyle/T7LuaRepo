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
	self:setLeftRight( 0, 0, 0, 334 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, -4 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.1 )
	self:addElement( Background )
	self.Background = Background
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( 0, 0, 28, 330 )
	Gamertag:setTopBottom( 0, 0, 5, 33 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local LobbyLeaderIcon = CoD.LobbyLeaderIcon.new( menu, controller )
	LobbyLeaderIcon:setLeftRight( 0, 0, -3, 35 )
	LobbyLeaderIcon:setTopBottom( 0, 0, 1, 36 )
	self:addElement( LobbyLeaderIcon )
	self.LobbyLeaderIcon = LobbyLeaderIcon
	
	self.Gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.LobbyLeaderIcon:linkToElementModel( self, "isLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LobbyLeaderIcon:setAlpha( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyLeaderIcon:close()
		self.Gamertag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

