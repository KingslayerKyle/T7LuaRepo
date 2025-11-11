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
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 253 )
	self.anyChildUsesUpdateState = true
	
	local AnimationLoadingWidget = CoD.AnimationLoadingWidget.new( menu, controller )
	AnimationLoadingWidget:setLeftRight( 0.5, 0.5, -108, 108 )
	AnimationLoadingWidget:setTopBottom( 0.5, 0.5, -127, 89 )
	self:addElement( AnimationLoadingWidget )
	self.AnimationLoadingWidget = AnimationLoadingWidget
	
	local LoadingLabel = LUI.UIText.new()
	LoadingLabel:setLeftRight( 0.5, 0.5, -150, 150 )
	LoadingLabel:setTopBottom( 0.5, 0.5, 89, 127 )
	LoadingLabel:setText( Engine.Localize( "MENU_LOADING_DOTS" ) )
	LoadingLabel:setTTF( "fonts/default.ttf" )
	LoadingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingLabel )
	self.LoadingLabel = LoadingLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.AnimationLoadingWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

