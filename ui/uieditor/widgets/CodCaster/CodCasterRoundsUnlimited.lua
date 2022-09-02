-- 008ef44ff0a06a5416ca2e094032dea5
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterRoundsUnlimited = InheritFrom( LUI.UIElement )
CoD.CodCasterRoundsUnlimited.new = function ( menu, controller )
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
	self:setClass( CoD.CodCasterRoundsUnlimited )
	self.id = "CodCasterRoundsUnlimited"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 32 )
	
	local TextBox2 = LUI.UITightText.new()
	TextBox2:setLeftRight( false, false, -29.56, 12.84 )
	TextBox2:setTopBottom( false, true, -23.02, -7.02 )
	TextBox2:setText( Engine.Localize( "MP_HUD_SCORE_ROUND" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox2:setLetterSpacing( 0.6 )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( false, false, 10.84, 21.2 )
	TextBox0:setTopBottom( false, false, -7.02, 8.98 )
	TextBox0:setText( Engine.Localize( "" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TotalRoundCount0 = LUI.UITightText.new()
	TotalRoundCount0:setLeftRight( false, false, 19.2, 29.56 )
	TotalRoundCount0:setTopBottom( false, true, -23.02, -7.02 )
	TotalRoundCount0:setTTF( "fonts/escom.ttf" )
	TotalRoundCount0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TotalRoundCount0:setShaderVector( 0, 0.01, 0, 0, 0 )
	TotalRoundCount0:setShaderVector( 1, 0, 0, 0, 0 )
	TotalRoundCount0:setShaderVector( 2, 1, 0, 0, 0 )
	TotalRoundCount0:subscribeToGlobalModel( controller, "GameScore", "roundLimit", function ( model )
		local roundLimit = Engine.GetModelValue( model )
		if roundLimit then
			TotalRoundCount0:setText( Engine.Localize( roundLimit ) )
		end
	end )
	self:addElement( TotalRoundCount0 )
	self.TotalRoundCount0 = TotalRoundCount0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TotalRoundCount0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

