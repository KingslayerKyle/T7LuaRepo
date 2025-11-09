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
	self:setTopBottom( true, false, 0, 48 )
	
	local GameTypeAndMapNameWidget = CoD.GameTypeAndMapNameWidget.new( menu, controller )
	GameTypeAndMapNameWidget:setLeftRight( true, false, 0, 1112 )
	GameTypeAndMapNameWidget:setTopBottom( true, false, 0, 48 )
	GameTypeAndMapNameWidget:setRGB( 1, 1, 1 )
	GameTypeAndMapNameWidget:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeAndMapNameWidget.GameTypeAndMapNameWidgetTitle0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	GameTypeAndMapNameWidget:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeAndMapNameWidget.GameTypeAndMapNameWidgetTitle0.GameType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameTypeAndMapNameWidget )
	self.GameTypeAndMapNameWidget = GameTypeAndMapNameWidget
	
	self.close = function ( self )
		self.GameTypeAndMapNameWidget:close()
		CoD.GameTypeAndMapNameWidgetContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

