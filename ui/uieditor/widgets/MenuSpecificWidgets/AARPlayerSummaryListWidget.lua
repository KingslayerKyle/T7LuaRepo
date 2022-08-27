-- acc1716b2dd5d9aa14abad807a7ce539
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.AARMedalsListWidget" )

local PostLoadFunc = function ( f1_arg0 )
	
end

CoD.AARPlayerSummaryListWidget = InheritFrom( LUI.UIElement )
CoD.AARPlayerSummaryListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AARPlayerSummaryListWidget )
	self.id = "AARPlayerSummaryListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 400 )
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, -2, 2 )
	border:setTopBottom( true, true, -2, 2 )
	border:setRGB( 0, 0, 0 )
	self:addElement( border )
	self.border = border
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 240 )
	background:setTopBottom( true, false, 0, 400 )
	background:setRGB( 0.51, 0.51, 0.51 )
	self:addElement( background )
	self.background = background
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 0, 32 )
	rankIcon:setTopBottom( true, false, 0, 32 )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankLabel = LUI.UITightText.new()
	rankLabel:setLeftRight( false, false, -114, -93 )
	rankLabel:setTopBottom( true, false, 32, 57 )
	rankLabel:setTTF( "fonts/default.ttf" )
	self:addElement( rankLabel )
	self.rankLabel = rankLabel
	
	local playerGamerTagLabel = LUI.UITightText.new()
	playerGamerTagLabel:setLeftRight( true, false, 38, 133 )
	playerGamerTagLabel:setTopBottom( true, false, 3.5, 28.5 )
	playerGamerTagLabel:setTTF( "fonts/default.ttf" )
	self:addElement( playerGamerTagLabel )
	self.playerGamerTagLabel = playerGamerTagLabel
	
	local killsAssistsBg = LUI.UIImage.new()
	killsAssistsBg:setLeftRight( true, true, 0, 0 )
	killsAssistsBg:setTopBottom( true, false, 57, 140 )
	killsAssistsBg:setRGB( 0, 0, 0 )
	self:addElement( killsAssistsBg )
	self.killsAssistsBg = killsAssistsBg
	
	local killsLabel = LUI.UITightText.new()
	killsLabel:setLeftRight( false, false, -79, -40 )
	killsLabel:setTopBottom( true, false, 64, 89 )
	killsLabel:setText( Engine.Localize( "MPUI_KILLS_CAPS" ) )
	killsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( killsLabel )
	self.killsLabel = killsLabel
	
	local numKills = LUI.UITightText.new()
	numKills:setLeftRight( true, true, 42, -161 )
	numKills:setTopBottom( true, false, 88, 136 )
	numKills:setTTF( "fonts/default.ttf" )
	self:addElement( numKills )
	self.numKills = numKills
	
	local assistsLabel = LUI.UITightText.new()
	assistsLabel:setLeftRight( true, true, 145, -32 )
	assistsLabel:setTopBottom( true, false, 64, 89 )
	assistsLabel:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	assistsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( assistsLabel )
	self.assistsLabel = assistsLabel
	
	local numAssists = LUI.UITightText.new()
	numAssists:setLeftRight( true, true, 158.5, -45.5 )
	numAssists:setTopBottom( true, false, 88, 136 )
	numAssists:setTTF( "fonts/default.ttf" )
	self:addElement( numAssists )
	self.numAssists = numAssists
	
	local keyActionsLabel = LUI.UITightText.new()
	keyActionsLabel:setLeftRight( true, true, 73.5, -73.5 )
	keyActionsLabel:setTopBottom( true, false, 140, 165 )
	keyActionsLabel:setText( Engine.Localize( "KEY ACTIONS" ) )
	keyActionsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( keyActionsLabel )
	self.keyActionsLabel = keyActionsLabel
	
	local AARMedalsListWidget1 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget1:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget1:setTopBottom( true, false, 171, 246 )
	self:addElement( AARMedalsListWidget1 )
	self.AARMedalsListWidget1 = AARMedalsListWidget1
	
	local AARMedalsListWidget2 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget2:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget2:setTopBottom( true, false, 246, 321 )
	self:addElement( AARMedalsListWidget2 )
	self.AARMedalsListWidget2 = AARMedalsListWidget2
	
	local AARMedalsListWidget3 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget3:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget3:setTopBottom( true, false, 325, 400 )
	self:addElement( AARMedalsListWidget3 )
	self.AARMedalsListWidget3 = AARMedalsListWidget3
	
	self.rankIcon:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local playerRankIcon = Engine.GetModelValue( model )
		if playerRankIcon then
			rankIcon:setImage( RegisterImage( playerRankIcon ) )
		end
	end )
	self.rankLabel:linkToElementModel( self, "playerRank", true, function ( model )
		local playerRank = Engine.GetModelValue( model )
		if playerRank then
			rankLabel:setText( Engine.Localize( playerRank ) )
		end
	end )
	self.playerGamerTagLabel:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )
		if playerName then
			playerGamerTagLabel:setText( Engine.Localize( playerName ) )
		end
	end )
	self.numKills:linkToElementModel( self, "playerKills", true, function ( model )
		local playerKills = Engine.GetModelValue( model )
		if playerKills then
			numKills:setText( Engine.Localize( playerKills ) )
		end
	end )
	self.numAssists:linkToElementModel( self, "playerAssists", true, function ( model )
		local playerAssists = Engine.GetModelValue( model )
		if playerAssists then
			numAssists:setText( Engine.Localize( playerAssists ) )
		end
	end )
	self.AARMedalsListWidget1:linkToElementModel( self, "medalImage1", true, function ( model )
		local medalImage1 = Engine.GetModelValue( model )
		if medalImage1 then
			AARMedalsListWidget1.medalIcon:setImage( RegisterImage( medalImage1 ) )
		end
	end )
	self.AARMedalsListWidget1:linkToElementModel( self, "medalName1", true, function ( model )
		local medalName1 = Engine.GetModelValue( model )
		if medalName1 then
			AARMedalsListWidget1.medalNameLabel:setText( Engine.Localize( medalName1 ) )
		end
	end )
	self.AARMedalsListWidget2:linkToElementModel( self, "medalImage2", true, function ( model )
		local medalImage2 = Engine.GetModelValue( model )
		if medalImage2 then
			AARMedalsListWidget2.medalIcon:setImage( RegisterImage( medalImage2 ) )
		end
	end )
	self.AARMedalsListWidget2:linkToElementModel( self, "medalName2", true, function ( model )
		local medalName2 = Engine.GetModelValue( model )
		if medalName2 then
			AARMedalsListWidget2.medalNameLabel:setText( Engine.Localize( medalName2 ) )
		end
	end )
	self.AARMedalsListWidget3:linkToElementModel( self, "medalImage3", true, function ( model )
		local medalImage3 = Engine.GetModelValue( model )
		if medalImage3 then
			AARMedalsListWidget3.medalIcon:setImage( RegisterImage( medalImage3 ) )
		end
	end )
	self.AARMedalsListWidget3:linkToElementModel( self, "medalName3", true, function ( model )
		local medalName3 = Engine.GetModelValue( model )
		if medalName3 then
			AARMedalsListWidget3.medalNameLabel:setText( Engine.Localize( medalName3 ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.border:close()
		element.AARMedalsListWidget1:close()
		element.AARMedalsListWidget2:close()
		element.AARMedalsListWidget3:close()
		element.rankIcon:close()
		element.rankLabel:close()
		element.playerGamerTagLabel:close()
		element.numKills:close()
		element.numAssists:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

