require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoadingWidget" )

CoD.StatsLoadingWidget = InheritFrom( LUI.UIElement )
CoD.StatsLoadingWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StatsLoadingWidget )
	self.id = "StatsLoadingWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 169 )
	self.anyChildUsesUpdateState = true
	
	local AnimationLoadingWidget = CoD.AnimationLoadingWidget.new( menu, controller )
	AnimationLoadingWidget:setLeftRight( false, false, -72, 72 )
	AnimationLoadingWidget:setTopBottom( false, false, -84.5, 59.5 )
	self:addElement( AnimationLoadingWidget )
	self.AnimationLoadingWidget = AnimationLoadingWidget
	
	local LoadingLabel = LUI.UIText.new()
	LoadingLabel:setLeftRight( false, false, -100, 100 )
	LoadingLabel:setTopBottom( false, false, 59.5, 84.5 )
	LoadingLabel:setText( Engine.Localize( "MENU_LOADING_DOTS" ) )
	LoadingLabel:setTTF( "fonts/default.ttf" )
	LoadingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingLabel )
	self.LoadingLabel = LoadingLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AnimationLoadingWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

