-- 557cd1c54a291fa9f51ef2bd54a24528
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.GameTypeAndMapNameWidgetTitle" )

CoD.GameTypeAndMapNameWidget = InheritFrom( LUI.UIElement )
CoD.GameTypeAndMapNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameTypeAndMapNameWidget )
	self.id = "GameTypeAndMapNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 48 )
	
	local GameTypeAndMapNameWidgetTitle0 = CoD.GameTypeAndMapNameWidgetTitle.new( menu, controller )
	GameTypeAndMapNameWidgetTitle0:setLeftRight( true, false, 0, 1280 )
	GameTypeAndMapNameWidgetTitle0:setTopBottom( true, false, 0, 48 )
	GameTypeAndMapNameWidgetTitle0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			GameTypeAndMapNameWidgetTitle0.GameType:setText( Engine.Localize( gameType ) )
		end
	end )
	self:addElement( GameTypeAndMapNameWidgetTitle0 )
	self.GameTypeAndMapNameWidgetTitle0 = GameTypeAndMapNameWidgetTitle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameTypeAndMapNameWidgetTitle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

