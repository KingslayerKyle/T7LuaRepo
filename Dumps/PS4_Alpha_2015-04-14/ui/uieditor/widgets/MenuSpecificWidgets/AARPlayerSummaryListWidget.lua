require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.AARMedalsListWidget" )

local PostLoadFunc = function ( self )
	
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
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 0, 32 )
	rankIcon:setTopBottom( true, false, 0, 32 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankLabel = LUI.UITightText.new()
	rankLabel:setLeftRight( false, false, -114, -93 )
	rankLabel:setTopBottom( true, false, 32, 57 )
	rankLabel:setRGB( 1, 1, 1 )
	rankLabel:setTTF( "fonts/default.ttf" )
	self:addElement( rankLabel )
	self.rankLabel = rankLabel
	
	local playerGamerTagLabel = LUI.UITightText.new()
	playerGamerTagLabel:setLeftRight( true, false, 38, 133 )
	playerGamerTagLabel:setTopBottom( true, false, 3.5, 28.5 )
	playerGamerTagLabel:setRGB( 1, 1, 1 )
	playerGamerTagLabel:setTTF( "fonts/default.ttf" )
	self:addElement( playerGamerTagLabel )
	self.playerGamerTagLabel = playerGamerTagLabel
	
	local killsAssistsBg = LUI.UIImage.new()
	killsAssistsBg:setLeftRight( true, true, 0, 0 )
	killsAssistsBg:setTopBottom( true, false, 57, 140 )
	killsAssistsBg:setRGB( 0, 0, 0 )
	killsAssistsBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( killsAssistsBg )
	self.killsAssistsBg = killsAssistsBg
	
	local killsLabel = LUI.UITightText.new()
	killsLabel:setLeftRight( false, false, -79, -40 )
	killsLabel:setTopBottom( true, false, 64, 89 )
	killsLabel:setRGB( 1, 1, 1 )
	killsLabel:setText( Engine.Localize( "MPUI_KILLS_CAPS" ) )
	killsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( killsLabel )
	self.killsLabel = killsLabel
	
	local numKills = LUI.UITightText.new()
	numKills:setLeftRight( true, true, 42, -161 )
	numKills:setTopBottom( true, false, 88, 136 )
	numKills:setRGB( 1, 1, 1 )
	numKills:setTTF( "fonts/default.ttf" )
	self:addElement( numKills )
	self.numKills = numKills
	
	local assistsLabel = LUI.UITightText.new()
	assistsLabel:setLeftRight( true, true, 145, -32 )
	assistsLabel:setTopBottom( true, false, 64, 89 )
	assistsLabel:setRGB( 1, 1, 1 )
	assistsLabel:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	assistsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( assistsLabel )
	self.assistsLabel = assistsLabel
	
	local numAssists = LUI.UITightText.new()
	numAssists:setLeftRight( true, true, 158.5, -45.5 )
	numAssists:setTopBottom( true, false, 88, 136 )
	numAssists:setRGB( 1, 1, 1 )
	numAssists:setTTF( "fonts/default.ttf" )
	self:addElement( numAssists )
	self.numAssists = numAssists
	
	local keyActionsLabel = LUI.UITightText.new()
	keyActionsLabel:setLeftRight( true, true, 73.5, -73.5 )
	keyActionsLabel:setTopBottom( true, false, 140, 165 )
	keyActionsLabel:setRGB( 1, 1, 1 )
	keyActionsLabel:setText( Engine.Localize( "KEY ACTIONS" ) )
	keyActionsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( keyActionsLabel )
	self.keyActionsLabel = keyActionsLabel
	
	local AARMedalsListWidget1 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget1:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget1:setTopBottom( true, false, 171, 246 )
	AARMedalsListWidget1:setRGB( 1, 1, 1 )
	self:addElement( AARMedalsListWidget1 )
	self.AARMedalsListWidget1 = AARMedalsListWidget1
	
	local AARMedalsListWidget2 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget2:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget2:setTopBottom( true, false, 246, 321 )
	AARMedalsListWidget2:setRGB( 1, 1, 1 )
	self:addElement( AARMedalsListWidget2 )
	self.AARMedalsListWidget2 = AARMedalsListWidget2
	
	local AARMedalsListWidget3 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget3:setLeftRight( true, true, 0, 0 )
	AARMedalsListWidget3:setTopBottom( true, false, 325, 400 )
	AARMedalsListWidget3:setRGB( 1, 1, 1 )
	self:addElement( AARMedalsListWidget3 )
	self.AARMedalsListWidget3 = AARMedalsListWidget3
	
	self.rankIcon:linkToElementModel( self, "playerRankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.rankLabel:linkToElementModel( self, "playerRank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.playerGamerTagLabel:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playerGamerTagLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.numKills:linkToElementModel( self, "playerKills", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			numKills:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.numAssists:linkToElementModel( self, "playerAssists", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			numAssists:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.AARMedalsListWidget1:linkToElementModel( self, "medalImage1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget1.medalIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.AARMedalsListWidget1:linkToElementModel( self, "medalName1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget1.medalNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.AARMedalsListWidget2:linkToElementModel( self, "medalImage2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget2.medalIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.AARMedalsListWidget2:linkToElementModel( self, "medalName2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget2.medalNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.AARMedalsListWidget3:linkToElementModel( self, "medalImage3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget3.medalIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.AARMedalsListWidget3:linkToElementModel( self, "medalName3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AARMedalsListWidget3.medalNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.border:close()
		self.AARMedalsListWidget1:close()
		self.AARMedalsListWidget2:close()
		self.AARMedalsListWidget3:close()
		self.rankIcon:close()
		self.rankLabel:close()
		self.playerGamerTagLabel:close()
		self.numKills:close()
		self.numAssists:close()
		CoD.AARPlayerSummaryListWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

