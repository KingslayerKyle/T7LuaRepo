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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local GameTypeAndMapNameWidget = CoD.GameTypeAndMapNameWidget.new( menu, controller )
	GameTypeAndMapNameWidget:setLeftRight( 0, 0, 0, 1668 )
	GameTypeAndMapNameWidget:setTopBottom( 0, 0, 17, 89 )
	self:addElement( GameTypeAndMapNameWidget )
	self.GameTypeAndMapNameWidget = GameTypeAndMapNameWidget
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 0, 1138 )
	Label0:setTopBottom( 0, 0, 0, 34 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameTypeAndMapNameWidget:close()
		self.Label0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

