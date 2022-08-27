-- eed55875af9a0ceb328a135e9db347f0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.ArabicAlignTextBox" )
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
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.01, 0.01, 0.01 )
	self:addElement( background )
	self.background = background
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, -1, 1 )
	BorderBakedSolid0:setTopBottom( true, true, -1, 1 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local text = CoD.ArabicAlignTextBox.new( menu, controller )
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 0, 22 )
	text.textBox:setText( Engine.Localize( "MENU_MATCH_BEGINNING_IN" ) )
	text.textBox:setTTF( "fonts/default.ttf" )
	text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( text )
	self.text = text
	
	local timerBackground = LUI.UIImage.new()
	timerBackground:setLeftRight( true, false, 75, 125 )
	timerBackground:setTopBottom( true, false, 24, 46 )
	timerBackground:setRGB( 0.37, 0.1, 0 )
	self:addElement( timerBackground )
	self.timerBackground = timerBackground
	
	local MatchStartWarningTimerBkgd = CoD.MatchStartWarning_TimerBkgd.new( menu, controller )
	MatchStartWarningTimerBkgd:setLeftRight( false, false, -25, 25 )
	MatchStartWarningTimerBkgd:setTopBottom( true, false, 24, 46 )
	MatchStartWarningTimerBkgd:setRGB( 1, 0, 0 )
	MatchStartWarningTimerBkgd:setAlpha( 0.5 )
	self:addElement( MatchStartWarningTimerBkgd )
	self.MatchStartWarningTimerBkgd = MatchStartWarningTimerBkgd
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( false, false, -27, 27 )
	BorderBakedSolid00:setTopBottom( true, false, 22, 48 )
	BorderBakedSolid00:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local BorderBakedSolid000 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid000:setLeftRight( false, false, -27, 27 )
	BorderBakedSolid000:setTopBottom( true, false, 22, 48 )
	BorderBakedSolid000:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid000 )
	self.BorderBakedSolid000 = BorderBakedSolid000
	
	local timerText = CoD.ArabicAlignTextBox.new( menu, controller )
	timerText:setLeftRight( false, false, -50, 50 )
	timerText:setTopBottom( true, false, 25, 47 )
	timerText.textBox:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	timerText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timerText:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTimeRemaining", function ( model )
		local lobbyTimeRemaining = Engine.GetModelValue( model )
		if lobbyTimeRemaining then
			timerText.textBox:setText( Engine.Localize( lobbyTimeRemaining ) )
		end
	end )
	self:addElement( timerText )
	self.timerText = timerText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid0:close()
		element.text:close()
		element.MatchStartWarningTimerBkgd:close()
		element.BorderBakedSolid00:close()
		element.BorderBakedSolid000:close()
		element.timerText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

