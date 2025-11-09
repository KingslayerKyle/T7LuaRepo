CoD.Pregame_Title_Small = InheritFrom( LUI.UIElement )
CoD.Pregame_Title_Small.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_Title_Small )
	self.id = "Pregame_Title_Small"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 50 )
	
	local HeaderImage = LUI.UIImage.new()
	HeaderImage:setLeftRight( true, true, -108, 101 )
	HeaderImage:setTopBottom( true, false, -123, 50 )
	HeaderImage:setRGB( 0, 0, 0 )
	HeaderImage:setAlpha( 0 )
	self:addElement( HeaderImage )
	self.HeaderImage = HeaderImage
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( true, false, 62.17, 116.17 )
	GameModeIcon:setTopBottom( true, false, -4.5, 49.5 )
	GameModeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			GameModeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameMode = LUI.UITightText.new()
	GameMode:setLeftRight( true, false, 121.34, 543.34 )
	GameMode:setTopBottom( true, false, 17, 51 )
	GameMode:setAlpha( 0.85 )
	GameMode:setText( LocalizeToUpperString( GetGameMode( "TEAM DEATHMATCH" ) ) )
	GameMode:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameMode:setLetterSpacing( 0 )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( true, false, 121.17, 543.34 )
	MapName:setTopBottom( true, false, -0.5, 21.5 )
	MapName:setRGB( 1, 0.35, 0 )
	MapName:setAlpha( 0.85 )
	MapName:setText( LocalizeToUpperString( GetMapName( "REDWOOD" ) ) )
	MapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( MapName )
	self.MapName = MapName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameModeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

