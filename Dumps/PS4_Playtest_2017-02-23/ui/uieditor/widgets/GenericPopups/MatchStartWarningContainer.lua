require( "ui.uieditor.widgets.ArabicAlignTextBox" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.GenericPopups.MatchStartWarning_TimerBkgd" )

CoD.MatchStartWarningContainer = InheritFrom( LUI.UIElement )
CoD.MatchStartWarningContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MatchStartWarningContainer )
	self.id = "MatchStartWarningContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0.01, 0.01, 0.01 )
	self:addElement( background )
	self.background = background
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 1, -2, 2 )
	BorderBakedSolid0:setTopBottom( 0, 1, -2, 2 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local text = CoD.ArabicAlignTextBox.new( menu, controller )
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, -0.5, 32.5 )
	text.textBox:setText( Engine.Localize( "MENU_MATCH_BEGINNING_IN" ) )
	text.textBox:setTTF( "fonts/default.ttf" )
	text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( text )
	self.text = text
	
	local timerBackground = LUI.UIImage.new()
	timerBackground:setLeftRight( 0, 0, 112, 187 )
	timerBackground:setTopBottom( 0, 0, 36, 69 )
	timerBackground:setRGB( 0.37, 0.1, 0 )
	self:addElement( timerBackground )
	self.timerBackground = timerBackground
	
	local MatchStartWarningTimerBkgd = CoD.MatchStartWarning_TimerBkgd.new( menu, controller )
	MatchStartWarningTimerBkgd:setLeftRight( 0.5, 0.5, -37.5, 37.5 )
	MatchStartWarningTimerBkgd:setTopBottom( 0, 0, 36, 69 )
	MatchStartWarningTimerBkgd:setRGB( 1, 0, 0 )
	MatchStartWarningTimerBkgd:setAlpha( 0.5 )
	self:addElement( MatchStartWarningTimerBkgd )
	self.MatchStartWarningTimerBkgd = MatchStartWarningTimerBkgd
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( 0.5, 0.5, -40.5, 40.5 )
	BorderBakedSolid00:setTopBottom( 0, 0, 33, 72 )
	BorderBakedSolid00:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local BorderBakedSolid000 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid000:setLeftRight( 0.5, 0.5, -40.5, 40.5 )
	BorderBakedSolid000:setTopBottom( 0, 0, 33, 72 )
	BorderBakedSolid000:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid000 )
	self.BorderBakedSolid000 = BorderBakedSolid000
	
	local timerText = CoD.ArabicAlignTextBox.new( menu, controller )
	timerText:setLeftRight( 0.5, 0.5, -75, 75 )
	timerText:setTopBottom( 0, 0, 37.5, 70.5 )
	timerText.textBox:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	timerText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timerText:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTimeRemaining", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			timerText.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( timerText )
	self.timerText = timerText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedSolid0:close()
		self.text:close()
		self.MatchStartWarningTimerBkgd:close()
		self.BorderBakedSolid00:close()
		self.BorderBakedSolid000:close()
		self.timerText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

