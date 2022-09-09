-- 3474064670dfb9f67c9a4dd8e779dacb
-- This hash is used for caching, delete to decompile the file again

CoD.GameTypeAndMapNameWidgetTitle = InheritFrom( LUI.UIElement )
CoD.GameTypeAndMapNameWidgetTitle.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameTypeAndMapNameWidgetTitle )
	self.id = "GameTypeAndMapNameWidgetTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 48 )
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( false, false, -640, -244 )
	GameType:setTopBottom( false, false, -17.81, 24.19 )
	GameType:setRGB( 0.87, 0.9, 0.9 )
	GameType:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameType:setLetterSpacing( -1 )
	GameType:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			GameType:setText( Engine.Localize( AppendStringIfRefExists( "_SHORT", gameType ) ) )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameType:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
