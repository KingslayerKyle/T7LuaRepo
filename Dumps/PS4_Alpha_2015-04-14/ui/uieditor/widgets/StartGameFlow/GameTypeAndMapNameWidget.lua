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
	GameTypeAndMapNameWidgetTitle0:setRGB( 1, 1, 1 )
	GameTypeAndMapNameWidgetTitle0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeAndMapNameWidgetTitle0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	GameTypeAndMapNameWidgetTitle0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeAndMapNameWidgetTitle0.GameType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameTypeAndMapNameWidgetTitle0 )
	self.GameTypeAndMapNameWidgetTitle0 = GameTypeAndMapNameWidgetTitle0
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, true, 0, 0 )
	Line:setTopBottom( false, false, 0, 1 )
	Line:setRGB( 0, 0, 0 )
	Line:setAlpha( 0.5 )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Line )
	self.Line = Line
	
	self.close = function ( self )
		self.GameTypeAndMapNameWidgetTitle0:close()
		CoD.GameTypeAndMapNameWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

