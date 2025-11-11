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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 72 )
	
	local GameTypeAndMapNameWidgetTitle0 = CoD.GameTypeAndMapNameWidgetTitle.new( menu, controller )
	GameTypeAndMapNameWidgetTitle0:setLeftRight( 0, 0, 0, 1920 )
	GameTypeAndMapNameWidgetTitle0:setTopBottom( 0, 0, 0, 72 )
	GameTypeAndMapNameWidgetTitle0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeAndMapNameWidgetTitle0.GameType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameTypeAndMapNameWidgetTitle0 )
	self.GameTypeAndMapNameWidgetTitle0 = GameTypeAndMapNameWidgetTitle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameTypeAndMapNameWidgetTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

