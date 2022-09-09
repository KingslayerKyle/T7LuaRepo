-- 035e9c2e5d6a2e4ffb02503adf1bf2a7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.GameTypeAndMapNameWidget" )

CoD.GameTypeAndMapNameWidgetContainer = InheritFrom( LUI.UIElement )
CoD.GameTypeAndMapNameWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GameTypeAndMapNameWidgetContainer )
	self.id = "GameTypeAndMapNameWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 60 )
	
	local GameTypeAndMapNameWidget = CoD.GameTypeAndMapNameWidget.new( menu, controller )
	GameTypeAndMapNameWidget:setLeftRight( true, false, 0, 1112 )
	GameTypeAndMapNameWidget:setTopBottom( true, false, 11.29, 59.29 )
	self:addElement( GameTypeAndMapNameWidget )
	self.GameTypeAndMapNameWidget = GameTypeAndMapNameWidget
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 759 )
	Label0:setTopBottom( true, false, 0, 22.58 )
	Label0:setRGB( 1, 0.35, 0 )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -1 )
	Label0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			Label0:setText( Engine.Localize( mapName ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameTypeAndMapNameWidget:close()
		element.Label0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
