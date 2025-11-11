require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.PrematchCountdown_BeginsIn = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_BeginsIn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_BeginsIn )
	self.id = "PrematchCountdown_BeginsIn"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 348 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel0:setTopBottom( 0.5, 0.5, -24, 24 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -26, 34 )
	Glow:setTopBottom( 0.5, 0.5, -59, 63 )
	Glow:setRGB( 0.3, 0.23, 0.2 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local MatchText = LUI.UITightText.new()
	MatchText:setLeftRight( 0.5, 0.5, -174, 174 )
	MatchText:setTopBottom( 0.5, 0.5, -17, 21 )
	MatchText:setRGB( 0.96, 0.96, 1 )
	MatchText:setAlpha( 0.95 )
	MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	MatchText:setTTF( "fonts/escom.ttf" )
	MatchText:setLetterSpacing( 2.7 )
	LUI.OverrideFunction_CallOriginalFirst( MatchText, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 15 )
	end )
	self:addElement( MatchText )
	self.MatchText = MatchText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

