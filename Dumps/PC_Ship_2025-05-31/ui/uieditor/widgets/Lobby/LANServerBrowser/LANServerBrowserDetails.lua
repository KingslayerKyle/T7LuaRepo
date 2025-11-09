require( "ui.uieditor.widgets.Lobby.LocalServerPlayerListRow" )

CoD.LANServerBrowserDetails = InheritFrom( LUI.UIElement )
CoD.LANServerBrowserDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LANServerBrowserDetails )
	self.id = "LANServerBrowserDetails"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 452 )
	self:setTopBottom( true, false, 0, 560 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PlayerList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, true )
	PlayerList:makeFocusable()
	PlayerList:setLeftRight( true, false, 3, 453 )
	PlayerList:setTopBottom( true, false, 230, 487 )
	PlayerList:setWidgetType( CoD.LocalServerPlayerListRow )
	PlayerList:setHorizontalCount( 2 )
	PlayerList:setVerticalCount( 9 )
	PlayerList:setSpacing( 4 )
	PlayerList:setDataSource( "LocalServerPlayer" )
	self:addElement( PlayerList )
	self.PlayerList = PlayerList
	
	local PlayerListTitle = LUI.UITightText.new()
	PlayerListTitle:setLeftRight( true, false, 9, 156 )
	PlayerListTitle:setTopBottom( true, false, 203, 225 )
	PlayerListTitle:setText( Engine.Localize( "MENU_PLAYERS_IN_GAME" ) )
	PlayerListTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( PlayerListTitle )
	self.PlayerListTitle = PlayerListTitle
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, false, 1, 447 )
	MapImage:setTopBottom( true, false, 10.27, 199.66 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local MapBackImage = LUI.UIImage.new()
	MapBackImage:setLeftRight( true, false, 1, 447 )
	MapBackImage:setTopBottom( true, false, 150.25, 200 )
	MapBackImage:setRGB( 0, 0, 0 )
	MapBackImage:setAlpha( 0.5 )
	self:addElement( MapBackImage )
	self.MapBackImage = MapBackImage
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 9, 123 )
	GameType:setTopBottom( true, false, 177.25, 197.25 )
	GameType:setRGB( 1, 0.84, 0 )
	GameType:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( true, false, 7, 177 )
	MapName:setTopBottom( true, false, 153.25, 183.25 )
	MapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( MapName )
	self.MapName = MapName
	
	self.MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			GameType:setText( GameTypeToLocalizedGameType( gameType ) )
		end
	end )
	self.MapName:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapName:setText( MapNameToLocalizedMapName( mapName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PlayerList:completeAnimation()
				self.PlayerList:setAlpha( 1 )
				self.clipFinished( PlayerList, {} )
				PlayerListTitle:completeAnimation()
				self.PlayerListTitle:setAlpha( 1 )
				self.clipFinished( PlayerListTitle, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				MapBackImage:completeAnimation()
				self.MapBackImage:setAlpha( 0.5 )
				self.clipFinished( MapBackImage, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 1 )
				self.clipFinished( GameType, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 1 )
				self.clipFinished( MapName, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PlayerList:completeAnimation()
				self.PlayerList:setAlpha( 0 )
				self.clipFinished( PlayerList, {} )
				PlayerListTitle:completeAnimation()
				self.PlayerListTitle:setAlpha( 0 )
				self.clipFinished( PlayerListTitle, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				MapBackImage:completeAnimation()
				self.MapBackImage:setAlpha( 0 )
				self.clipFinished( MapBackImage, {} )
				GameType:completeAnimation()
				self.GameType:setAlpha( 0 )
				self.clipFinished( GameType, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				self.clipFinished( MapName, {} )
			end
		},
		SixAndUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MapBackImage:completeAnimation()
				self.MapBackImage:setAlpha( 0.5 )
				self.clipFinished( MapBackImage, {} )
			end
		}
	}
	PlayerList.id = "PlayerList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PlayerList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayerList:close()
		element.MapImage:close()
		element.GameType:close()
		element.MapName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

