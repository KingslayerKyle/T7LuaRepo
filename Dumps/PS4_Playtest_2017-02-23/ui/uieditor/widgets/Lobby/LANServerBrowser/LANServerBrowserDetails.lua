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
	self:setLeftRight( 0, 0, 0, 678 )
	self:setTopBottom( 0, 0, 0, 840 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PlayerList = LUI.UIList.new( menu, controller, 6, 0, nil, false, false, 0, 0, false, false )
	PlayerList:makeFocusable()
	PlayerList:setLeftRight( 0, 0, 3, 677 )
	PlayerList:setTopBottom( 0, 0, 350, 731 )
	PlayerList:setWidgetType( CoD.LocalServerPlayerListRow )
	PlayerList:setHorizontalCount( 2 )
	PlayerList:setVerticalCount( 9 )
	PlayerList:setSpacing( 6 )
	PlayerList:setDataSource( "LocalServerPlayer" )
	self:addElement( PlayerList )
	self.PlayerList = PlayerList
	
	local PlayerListTitle = LUI.UITightText.new()
	PlayerListTitle:setLeftRight( 0, 0, 12, 232 )
	PlayerListTitle:setTopBottom( 0, 0, 303, 336 )
	PlayerListTitle:setText( Engine.Localize( "MENU_PLAYERS_IN_GAME" ) )
	PlayerListTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( PlayerListTitle )
	self.PlayerListTitle = PlayerListTitle
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 0, 0, 669 )
	MapImage:setTopBottom( 0, 0, -87, 292 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local MapBackImage = LUI.UIImage.new()
	MapBackImage:setLeftRight( 0, 0, 0, 669 )
	MapBackImage:setTopBottom( 0, 0, 218, 293 )
	MapBackImage:setRGB( 0, 0, 0 )
	MapBackImage:setAlpha( 0.5 )
	self:addElement( MapBackImage )
	self.MapBackImage = MapBackImage
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( 0, 0, 12, 183 )
	GameType:setTopBottom( 0, 0, 258, 288 )
	GameType:setRGB( 1, 0.84, 0 )
	GameType:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( 0, 0, 9, 264 )
	MapName:setTopBottom( 0, 0, 222, 267 )
	MapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( MapName )
	self.MapName = MapName
	
	self.MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "gameType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( GameTypeToLocalizedGameType( modelValue ) )
		end
	end )
	self.MapName:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( MapNameToLocalizedMapName( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		MapImage:completeAnimation()
		MapName:completeAnimation()
		GameType:completeAnimation()
		PlayerListTitle:completeAnimation()
		PlayerList:completeAnimation()
		MapBackImage:completeAnimation()
		MapImage:setAlpha( 1 )
		MapName:setAlpha( 1 )
		GameType:setAlpha( 1 )
		PlayerListTitle:setAlpha( 1 )
		PlayerList:setAlpha( 1 )
		MapBackImage:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PlayerList:close()
		self.MapImage:close()
		self.GameType:close()
		self.MapName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

