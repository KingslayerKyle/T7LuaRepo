require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )

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
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 173 )
	Label0:setTopBottom( true, false, 5, 47 )
	Label0:setRGB( 1, 0.35, 0 )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -1 )
	Label0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 173, 186 )
	Image0:setTopBottom( true, false, -33.81, 94.19 )
	Image0:setAlpha( 0 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 186, 582 )
	GameType:setTopBottom( true, false, 5, 47 )
	GameType:setRGB( 0.87, 0.9, 0.9 )
	GameType:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	GameType:setLetterSpacing( -1 )
	GameType:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local TeamIconAndNameWidgetElemSide0 = CoD.TeamIconAndNameWidgetElemSide.new( menu, controller )
	TeamIconAndNameWidgetElemSide0:setLeftRight( true, false, 582, 618 )
	TeamIconAndNameWidgetElemSide0:setTopBottom( true, false, 10.5, 37.5 )
	TeamIconAndNameWidgetElemSide0:setRGB( 1, 1, 1 )
	TeamIconAndNameWidgetElemSide0:setYRot( -180 )
	self:addElement( TeamIconAndNameWidgetElemSide0 )
	self.TeamIconAndNameWidgetElemSide0 = TeamIconAndNameWidgetElemSide0
	
	self.close = function ( self )
		self.TeamIconAndNameWidgetElemSide0:close()
		self.Label0:close()
		self.GameType:close()
		CoD.GameTypeAndMapNameWidgetTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

