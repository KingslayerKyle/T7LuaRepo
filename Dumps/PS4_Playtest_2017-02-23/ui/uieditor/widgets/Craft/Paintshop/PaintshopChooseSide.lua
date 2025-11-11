require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

CoD.PaintshopChooseSide = InheritFrom( LUI.UIElement )
CoD.PaintshopChooseSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopChooseSide )
	self.id = "PaintshopChooseSide"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( 0, 0, 0, 38 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 3.5, -0.5 )
	text:setTopBottom( 0, 0, 4, 34 )
	text:setRGB( 0, 0, 0 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

