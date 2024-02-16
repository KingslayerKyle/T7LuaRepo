-- ae62f82c9dacf1fc6b2f1d1f61788b93
-- This hash is used for caching, delete to decompile the file again

CoD.Games = InheritFrom( LUI.UIElement )
CoD.Games.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = -3
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Games )
	self.id = "Games"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 32 )
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( false, false, -33.06, 9.34 )
	TextBox2:setTopBottom( false, true, -23.02, -7.02 )
	TextBox2:setText( Engine.Localize( "MENU_GAME_CAPS" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setLetterSpacing( 0.6 )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, false, 6.34, 18.34 )
	Label0:setTopBottom( false, false, -7.02, 8.98 )
	Label0:setText( Engine.Localize( "" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local TotalRoundCount0 = LUI.UITightText.new()
	TotalRoundCount0:setLeftRight( false, false, 15.34, 25.7 )
	TotalRoundCount0:setTopBottom( false, true, -23.02, -7.02 )
	TotalRoundCount0:setTTF( "fonts/escom.ttf" )
	TotalRoundCount0:subscribeToGlobalModel( controller, "GameScore", "roundsPlayed", function ( model )
		local roundsPlayed = Engine.GetModelValue( model )
		if roundsPlayed then
			TotalRoundCount0:setText( Engine.Localize( roundsPlayed ) )
		end
	end )
	self:addElement( TotalRoundCount0 )
	self.TotalRoundCount0 = TotalRoundCount0
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( false, false, 22.7, 33.06 )
	TextBox0:setTopBottom( false, true, -23.02, -7.02 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:subscribeToGlobalModel( controller, "GameScore", "roundLimit", function ( model )
		local roundLimit = Engine.GetModelValue( model )
		if roundLimit then
			TextBox0:setText( Engine.Localize( RoundOutOfString( roundLimit ) ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TotalRoundCount0:close()
		element.TextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
