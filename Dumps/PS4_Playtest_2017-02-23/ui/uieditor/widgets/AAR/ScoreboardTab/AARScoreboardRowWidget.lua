require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED )
end

CoD.AARScoreboardRowWidget = InheritFrom( LUI.UIElement )
CoD.AARScoreboardRowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AARScoreboardRowWidget )
	self.id = "AARScoreboardRowWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1159 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local white = LUI.UIImage.new()
	white:setLeftRight( 0, 0, 0, 1158 )
	white:setTopBottom( 0, 0, 1, 39 )
	white:setAlpha( 0.02 )
	self:addElement( white )
	self.white = white
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( 0, 0, 0, 44 )
	Rank:setTopBottom( 0.5, 0.5, -16, 17 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setRGB( SetToParagonColorIfPrestigeMasterForScoreboard( controller, 255, 255, 255, modelValue ) )
		end
	end )
	Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( GetScoreboardPlayerRank( controller, modelValue ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( 0, 0, 45, 81 )
	RankIcon:setTopBottom( 0.5, 0.5, -18, 18 )
	RankIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( GetScoreboardPlayerRankIcon( controller, modelValue ) ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( 0, 0, 95, 469 )
	Gamertag:setTopBottom( 0.5, 0.5, -18, 15 )
	Gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Gamertag:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( GetScoreboardPlayerName( controller, modelValue ) )
		end
	end )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ScoreColumn1 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn1:setLeftRight( 1, 1, -648, -518 )
	ScoreColumn1:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn1.Bg:setAlpha( 0.3 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn1.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn1:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn1:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn2:setLeftRight( 1, 1, -517, -387 )
	ScoreColumn2:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn2.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn2:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( 1, 1, -387, -257 )
	ScoreColumn3:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn3.Bg:setAlpha( 0.3 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn3.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn3:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn3:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn4:setLeftRight( 1, 1, -256, -126 )
	ScoreColumn4:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn4.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn4.Bg:setAlpha( 0 )
	ScoreColumn4.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn4:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local ScoreColumn5 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5:setLeftRight( 1, 1, -126, -2 )
	ScoreColumn5:setTopBottom( 0, 1, 0, 0 )
	ScoreColumn5.Bg:setAlpha( 0.3 )
	ScoreColumn5.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn5.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreColumn5:linkToElementModel( self, "team", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Bg:setRGB( GetScoreboardTeamBackgroundColor( controller, modelValue ) )
		end
	end )
	ScoreColumn5:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn5.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn5 )
	self.ScoreColumn5 = ScoreColumn5
	
	self.resetProperties = function ()
		white:completeAnimation()
		Gamertag:completeAnimation()
		ScoreColumn1:completeAnimation()
		ScoreColumn2:completeAnimation()
		ScoreColumn3:completeAnimation()
		ScoreColumn4:completeAnimation()
		ScoreColumn5:completeAnimation()
		white:setAlpha( 0.02 )
		Gamertag:setRGB( 1, 1, 1 )
		ScoreColumn1.Text:setRGB( 1, 1, 1 )
		ScoreColumn2.Text:setRGB( 1, 1, 1 )
		ScoreColumn3.Text:setRGB( 1, 1, 1 )
		ScoreColumn4.Text:setRGB( 1, 1, 1 )
		ScoreColumn5.Text:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				white:completeAnimation()
				self.white:setAlpha( 0.04 )
				self.clipFinished( white, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				white:completeAnimation()
				self.white:setAlpha( 0.04 )
				self.clipFinished( white, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn5, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ScoreColumn1:close()
		self.ScoreColumn2:close()
		self.ScoreColumn3:close()
		self.ScoreColumn4:close()
		self.ScoreColumn5:close()
		self.Rank:close()
		self.RankIcon:close()
		self.Gamertag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

