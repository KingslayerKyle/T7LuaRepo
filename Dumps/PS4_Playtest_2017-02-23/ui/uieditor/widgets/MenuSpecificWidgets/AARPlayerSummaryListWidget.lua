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
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, -3, 3 )
	border:setTopBottom( 0, 1, -3, 3 )
	border:setRGB( 0, 0, 0 )
	self:addElement( border )
	self.border = border
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 0, 360 )
	background:setTopBottom( 0, 0, 0, 600 )
	background:setRGB( 0.51, 0.51, 0.51 )
	self:addElement( background )
	self.background = background
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( 0, 0, 0, 48 )
	rankIcon:setTopBottom( 0, 0, 0, 48 )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankLabel = LUI.UITightText.new()
	rankLabel:setLeftRight( 0.5, 0.5, -171, -139 )
	rankLabel:setTopBottom( 0, 0, 48, 86 )
	rankLabel:setTTF( "fonts/default.ttf" )
	self:addElement( rankLabel )
	self.rankLabel = rankLabel
	
	local playerGamerTagLabel = LUI.UITightText.new()
	playerGamerTagLabel:setLeftRight( 0, 0, 57, 199 )
	playerGamerTagLabel:setTopBottom( 0, 0, 5, 43 )
	playerGamerTagLabel:setTTF( "fonts/default.ttf" )
	self:addElement( playerGamerTagLabel )
	self.playerGamerTagLabel = playerGamerTagLabel
	
	local killsAssistsBg = LUI.UIImage.new()
	killsAssistsBg:setLeftRight( 0, 1, 0, 0 )
	killsAssistsBg:setTopBottom( 0, 0, 86, 210 )
	killsAssistsBg:setRGB( 0, 0, 0 )
	self:addElement( killsAssistsBg )
	self.killsAssistsBg = killsAssistsBg
	
	local killsLabel = LUI.UITightText.new()
	killsLabel:setLeftRight( 0.5, 0.5, -118, -60 )
	killsLabel:setTopBottom( 0, 0, 96, 134 )
	killsLabel:setText( Engine.Localize( "MPUI_KILLS_CAPS" ) )
	killsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( killsLabel )
	self.killsLabel = killsLabel
	
	local numKills = LUI.UITightText.new()
	numKills:setLeftRight( 0, 1, 63, -241 )
	numKills:setTopBottom( 0, 0, 132, 204 )
	numKills:setTTF( "fonts/default.ttf" )
	self:addElement( numKills )
	self.numKills = numKills
	
	local assistsLabel = LUI.UITightText.new()
	assistsLabel:setLeftRight( 0, 1, 218, -48 )
	assistsLabel:setTopBottom( 0, 0, 96, 134 )
	assistsLabel:setText( Engine.Localize( "MPUI_ASSISTS_CAPS" ) )
	assistsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( assistsLabel )
	self.assistsLabel = assistsLabel
	
	local numAssists = LUI.UITightText.new()
	numAssists:setLeftRight( 0, 1, 238, -68 )
	numAssists:setTopBottom( 0, 0, 132, 204 )
	numAssists:setTTF( "fonts/default.ttf" )
	self:addElement( numAssists )
	self.numAssists = numAssists
	
	local keyActionsLabel = LUI.UITightText.new()
	keyActionsLabel:setLeftRight( 0, 1, 110, -110 )
	keyActionsLabel:setTopBottom( 0, 0, 210, 248 )
	keyActionsLabel:setText( Engine.Localize( "KEY ACTIONS" ) )
	keyActionsLabel:setTTF( "fonts/default.ttf" )
	self:addElement( keyActionsLabel )
	self.keyActionsLabel = keyActionsLabel
	
	local AARMedalsListWidget1 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget1:setLeftRight( 0, 1, 0, 0 )
	AARMedalsListWidget1:setTopBottom( 0, 0, 257, 369 )
	self:addElement( AARMedalsListWidget1 )
	self.AARMedalsListWidget1 = AARMedalsListWidget1
	
	local AARMedalsListWidget2 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget2:setLeftRight( 0, 1, 0, 0 )
	AARMedalsListWidget2:setTopBottom( 0, 0, 369, 481 )
	self:addElement( AARMedalsListWidget2 )
	self.AARMedalsListWidget2 = AARMedalsListWidget2
	
	local AARMedalsListWidget3 = CoD.AARMedalsListWidget.new( menu, controller )
	AARMedalsListWidget3:setLeftRight( 0, 1, 0, 0 )
	AARMedalsListWidget3:setTopBottom( 0, 0, 488, 600 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
		self.AARMedalsListWidget1:close()
		self.AARMedalsListWidget2:close()
		self.AARMedalsListWidget3:close()
		self.rankIcon:close()
		self.rankLabel:close()
		self.playerGamerTagLabel:close()
		self.numKills:close()
		self.numAssists:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

