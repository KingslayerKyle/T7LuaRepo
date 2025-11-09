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
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 32 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( false, false, -16.11, 16.11 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -17, 23 )
	Glow:setTopBottom( false, false, -39.3, 42.3 )
	Glow:setRGB( 0.3, 0.23, 0.2 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local MatchText = LUI.UITightText.new()
	MatchText:setLeftRight( false, false, -116, 116 )
	MatchText:setTopBottom( false, false, -11, 14 )
	MatchText:setRGB( 0.96, 0.96, 1 )
	MatchText:setAlpha( 0.95 )
	MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	MatchText:setTTF( "fonts/escom.ttf" )
	MatchText:setLetterSpacing( 2.7 )
	LUI.OverrideFunction_CallOriginalFirst( MatchText, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 15 )
	end )
	self:addElement( MatchText )
	self.MatchText = MatchText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

