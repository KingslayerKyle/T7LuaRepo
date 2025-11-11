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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local HeaderImage = LUI.UIImage.new()
	HeaderImage:setLeftRight( 0, 1, -162, 152 )
	HeaderImage:setTopBottom( 0, 0, -185, 75 )
	HeaderImage:setRGB( 0, 0, 0 )
	HeaderImage:setAlpha( 0 )
	self:addElement( HeaderImage )
	self.HeaderImage = HeaderImage
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( 0, 0, 93, 174 )
	GameModeIcon:setTopBottom( 0, 0, -7, 74 )
	GameModeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameMode = LUI.UITightText.new()
	GameMode:setLeftRight( 0, 0, 182, 815 )
	GameMode:setTopBottom( 0, 0, 26, 77 )
	GameMode:setAlpha( 0.85 )
	GameMode:setText( LocalizeToUpperString( GetGameMode( "TEAM DEATHMATCH" ) ) )
	GameMode:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameMode:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ScaleWidgetToLabel( self, element, 5 )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( 0, 0, 182, 815 )
	MapName:setTopBottom( 0, 0, -1, 32 )
	MapName:setRGB( 1, 0.35, 0 )
	MapName:setAlpha( 0.85 )
	MapName:setText( LocalizeToUpperString( GetMapName( "REDWOOD" ) ) )
	MapName:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( MapName )
	self.MapName = MapName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameModeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

