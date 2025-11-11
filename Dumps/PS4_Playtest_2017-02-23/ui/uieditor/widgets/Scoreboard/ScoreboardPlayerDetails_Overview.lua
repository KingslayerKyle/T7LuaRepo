require( "ui.uieditor.widgets.Health.HealthBar" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	f1_local0:create( "Player.clientNum" )
end

CoD.ScoreboardPlayerDetails_Overview = InheritFrom( LUI.UIElement )
CoD.ScoreboardPlayerDetails_Overview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPlayerDetails_Overview )
	self.id = "ScoreboardPlayerDetails_Overview"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1019 )
	self:setTopBottom( 0, 0, 0, 86 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.69, 0.74, 0.76 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local HealthBackground = LUI.UIImage.new()
	HealthBackground:setLeftRight( 0, 1, 0, 0 )
	HealthBackground:setTopBottom( 0, 1, 0, 0 )
	HealthBackground:setRGB( 0, 0, 0 )
	HealthBackground:setAlpha( 0 )
	self:addElement( HealthBackground )
	self.HealthBackground = HealthBackground
	
	local HealthBackgroundTop = LUI.UIImage.new()
	HealthBackgroundTop:setLeftRight( 0, -2.91, 0, 0 )
	HealthBackgroundTop:setTopBottom( 0, 0.02, 0, 0 )
	HealthBackgroundTop:setAlpha( 0 )
	self:addElement( HealthBackgroundTop )
	self.HealthBackgroundTop = HealthBackgroundTop
	
	local HealthBackgroundTop2 = LUI.UIImage.new()
	HealthBackgroundTop2:setLeftRight( 0, -3.48, 0, 0 )
	HealthBackgroundTop2:setTopBottom( 0, 0.02, 84, 84 )
	HealthBackgroundTop2:setAlpha( 0 )
	self:addElement( HealthBackgroundTop2 )
	self.HealthBackgroundTop2 = HealthBackgroundTop2
	
	local HealthBar = CoD.HealthBar.new( menu, controller )
	HealthBar:setLeftRight( 0, 0, 8, 318 )
	HealthBar:setTopBottom( 0, 0, 12, 28 )
	HealthBar:setAlpha( 0 )
	HealthBar:subscribeToGlobalModel( controller, "Player", nil, function ( model )
		HealthBar:setModel( model, controller )
	end )
	HealthBar:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HealthBar.HealthFill:setShaderVector( 0, GetHealthForClientNumVec1( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( 0, 0, 8, 75 )
	RankBackground:setTopBottom( 0, 0, 32, 77 )
	RankBackground:setRGB( 0.97, 0.93, 0.07 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 8, 75 )
	Rank:setTopBottom( 0, 0, 34, 82 )
	Rank:setRGB( 0, 0, 0 )
	Rank:setAlpha( 0.8 )
	Rank:setText( Engine.Localize( "1" ) )
	Rank:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( 0, 0, 82, 1021 )
	Gamertag:setTopBottom( 0, 0, 28, 60 )
	Gamertag:setRGB( 0.97, 0.93, 0.07 )
	Gamertag:setTTF( "fonts/default.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Gamertag:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( Engine.Localize( GetClientName( controller, modelValue ) ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = LUI.UIText.new()
	ClanTag:setLeftRight( 0, 0, 82, 1019 )
	ClanTag:setTopBottom( 0, 0, 52, 78 )
	ClanTag:setRGB( 0.97, 0.93, 0.07 )
	ClanTag:setTTF( "fonts/default.ttf" )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClanTag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ClanTag:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClanTag:setText( Engine.Localize( GetClientClantag( controller, modelValue ) ) )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	self:subscribeToGlobalModel( controller, "GlobalModel", "player.healthChanged", function ( model )
		local element = self
		ForceNotifyControllerModel( controller, "Player.clientNum" )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "UIVisibilityBit.45", function ( model )
		local element = self
		UpdateElementState( self, "HealthBar", controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.HealthBar:close()
		self.Gamertag:close()
		self.ClanTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

