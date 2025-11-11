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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 72 )
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( 0.5, 0.5, -960, -366 )
	GameType:setTopBottom( 0.5, 0.5, -27, 36 )
	GameType:setRGB( 0.87, 0.9, 0.9 )
	GameType:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameType:setLetterSpacing( -1 )
	GameType:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( Engine.Localize( AppendStringIfRefExists( "_SHORT", modelValue ) ) )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameType:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

