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
	
	local PlayerList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	PlayerList:makeFocusable()
	PlayerList:setLeftRight( true, false, 0, 362 )
	PlayerList:setTopBottom( true, false, 263.5, 531.5 )
	PlayerList:setDataSource( "LocalServerPlayer" )
	PlayerList:setWidgetType( CoD.LocalServerPlayerListRow )
	PlayerList:setHorizontalCount( 2 )
	PlayerList:setVerticalCount( 9 )
	self:addElement( PlayerList )
	self.PlayerList = PlayerList
	
	local PlayerListTitle = LUI.UITightText.new()
	PlayerListTitle:setLeftRight( true, false, 0, 147 )
	PlayerListTitle:setTopBottom( true, false, 234.5, 259.5 )
	PlayerListTitle:setText( Engine.Localize( "MENU_PLAYERS_IN_GAME" ) )
	PlayerListTitle:setTTF( "fonts/default.ttf" )
	self:addElement( PlayerListTitle )
	self.PlayerListTitle = PlayerListTitle
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, -12 )
	MapImage:setTopBottom( true, true, 1, -331 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local MapBackImage = LUI.UIImage.new()
	MapBackImage:setLeftRight( true, true, 0, -12 )
	MapBackImage:setTopBottom( true, true, 157.5, -331 )
	MapBackImage:setRGB( 0, 0, 0 )
	MapBackImage:setAlpha( 0.5 )
	self:addElement( MapBackImage )
	self.MapBackImage = MapBackImage
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 10, 124 )
	GameType:setTopBottom( true, false, 195.5, 220.5 )
	GameType:setRGB( 1, 0.84, 0 )
	GameType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( true, false, 10, 180 )
	MapName:setTopBottom( true, false, 167.25, 197.25 )
	MapName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( MapName )
	self.MapName = MapName
	
	local Details = LUI.UITightText.new()
	Details:setLeftRight( true, false, 0, 61 )
	Details:setTopBottom( true, false, -46, -26 )
	Details:setText( Engine.Localize( "MENU_DETAILS_CAPS" ) )
	Details:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Details )
	self.Details = Details
	
	self.MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "gameType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( Engine.Localize( GameTypeToLocalizedGameType( modelValue ) ) )
		end
	end )
	self.MapName:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( MapNameToLocalizedMapName( modelValue ) ) )
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
				GameType:completeAnimation()
				self.GameType:setAlpha( 1 )
				self.clipFinished( GameType, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 1 )
				self.clipFinished( MapName, {} )
				Details:completeAnimation()
				self.Details:setAlpha( 1 )
				self.clipFinished( Details, {} )
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
				GameType:completeAnimation()
				self.GameType:setAlpha( 0 )
				self.clipFinished( GameType, {} )
				MapName:completeAnimation()
				self.MapName:setAlpha( 0 )
				self.clipFinished( MapName, {} )
				Details:completeAnimation()
				self.Details:setAlpha( 0 )
				self.clipFinished( Details, {} )
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

