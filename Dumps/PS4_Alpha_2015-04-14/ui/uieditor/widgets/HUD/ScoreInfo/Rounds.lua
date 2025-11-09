CoD.Rounds = InheritFrom( LUI.UIElement )
CoD.Rounds.new = function ( menu, controller )
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
	self:setClass( CoD.Rounds )
	self.id = "Rounds"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 32 )
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( false, false, -35.55, 11.82 )
	TextBox2:setTopBottom( false, true, -23.02, -7.02 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "ROUND" ) )
	TextBox2:setTTF( "fonts/Entovo.ttf" )
	TextBox2:setLetterSpacing( 0.6 )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, false, 8.82, 20.82 )
	Label0:setTopBottom( false, false, -7.02, 8.98 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "" ) )
	Label0:setTTF( "fonts/Entovo.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local TotalRoundCount0 = LUI.UITightText.new()
	TotalRoundCount0:setLeftRight( false, false, 17.82, 28.18 )
	TotalRoundCount0:setTopBottom( false, true, -23.02, -7.02 )
	TotalRoundCount0:setRGB( 1, 1, 1 )
	TotalRoundCount0:setTTF( "fonts/Entovo.ttf" )
	TotalRoundCount0:subscribeToGlobalModel( controller, "GameScore", "roundsPlayed", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalRoundCount0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TotalRoundCount0 )
	self.TotalRoundCount0 = TotalRoundCount0
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( false, false, 25.18, 35.55 )
	TextBox0:setTopBottom( false, true, -23.02, -7.02 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setTTF( "fonts/Entovo.ttf" )
	TextBox0:subscribeToGlobalModel( controller, "GameScore", "roundLimit", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( RoundOutOfString( modelValue ) ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.close = function ( self )
		self.TotalRoundCount0:close()
		self.TextBox0:close()
		CoD.Rounds.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

