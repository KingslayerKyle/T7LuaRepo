require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.ScoreboardPingHeader = InheritFrom( LUI.UIElement )
CoD.ScoreboardPingHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPingHeader )
	self.id = "ScoreboardPingHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 34 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local phPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	phPanel:setLeftRight( true, true, 0, 0 )
	phPanel:setTopBottom( true, true, 0, 0 )
	phPanel:setRGB( 0.6, 0.6, 0.6 )
	self:addElement( phPanel )
	self.phPanel = phPanel
	
	local phText = LUI.UIText.new()
	phText:setLeftRight( false, false, -17, 17 )
	phText:setTopBottom( false, false, -12.5, 12.5 )
	phText:setAlpha( 0.8 )
	phText:setText( Engine.Localize( "CGAME_SB_PING" ) )
	phText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	phText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	phText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( phText )
	self.phText = phText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.phPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

