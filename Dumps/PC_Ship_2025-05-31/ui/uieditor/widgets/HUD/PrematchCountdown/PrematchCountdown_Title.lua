require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.PrematchCountdown_Title = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_Title )
	self.id = "PrematchCountdown_Title"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 32 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( false, false, -13.11, 12 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local MatchText = LUI.UITightText.new()
	MatchText:setLeftRight( false, false, -116, 116 )
	MatchText:setTopBottom( false, false, -11, 12 )
	MatchText:setRGB( 0.96, 0.96, 1 )
	MatchText:setAlpha( 0.95 )
	MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	MatchText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	MatchText:setLetterSpacing( 1.2 )
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

