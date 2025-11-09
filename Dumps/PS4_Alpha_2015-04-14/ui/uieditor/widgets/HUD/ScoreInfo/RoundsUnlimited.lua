CoD.RoundsUnlimited = InheritFrom( LUI.UIElement )
CoD.RoundsUnlimited.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = -2
	} )
	self:setAlignment( LUI.Alignment.Center )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RoundsUnlimited )
	self.id = "RoundsUnlimited"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 32 )
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( false, false, -32.05, 15.32 )
	TextBox2:setTopBottom( false, true, -23.02, -7.02 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "ROUND" ) )
	TextBox2:setTTF( "fonts/Entovo.ttf" )
	TextBox2:setLetterSpacing( 0.6 )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( false, false, 13.32, 23.68 )
	TextBox0:setTopBottom( false, false, -7.02, 8.98 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "" ) )
	TextBox0:setTTF( "fonts/Entovo.ttf" )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TotalRoundCount0 = LUI.UITightText.new()
	TotalRoundCount0:setLeftRight( false, false, 21.68, 32.05 )
	TotalRoundCount0:setTopBottom( false, true, -23.02, -7.02 )
	TotalRoundCount0:setRGB( 1, 1, 1 )
	TotalRoundCount0:setTTF( "fonts/Entovo.ttf" )
	TotalRoundCount0:subscribeToGlobalModel( controller, "GameScore", "roundLimit", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalRoundCount0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TotalRoundCount0 )
	self.TotalRoundCount0 = TotalRoundCount0
	
	self.close = function ( self )
		self.TotalRoundCount0:close()
		CoD.RoundsUnlimited.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

