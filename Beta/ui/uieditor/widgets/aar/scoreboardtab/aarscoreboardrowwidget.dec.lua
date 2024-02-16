require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )

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
	self:setLeftRight( true, false, 0, 773 )
	self:setTopBottom( true, false, 0, 25 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 0, 771.91 )
	black:setTopBottom( true, false, 0.5, 25.5 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.85 )
	self:addElement( black )
	self.black = black
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 771.91 )
	bg:setTopBottom( true, false, 0.5, 25.5 )
	bg:setAlpha( 0.1 )
	self:addElement( bg )
	self.bg = bg
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( true, false, 0, 29 )
	Rank:setTopBottom( false, false, -12, 13 )
	Rank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Rank:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Rank:setText( Engine.Localize( GetScoreboardPlayerRank( controller, modelValue ) ) )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = LUI.UIImage.new()
	RankIcon:setLeftRight( true, false, 30, 54 )
	RankIcon:setTopBottom( false, false, -12, 12 )
	RankIcon:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RankIcon:setImage( RegisterImage( GetScoreboardPlayerRankIcon( controller, modelValue ) ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 63.41, 384.41 )
	Gamertag:setTopBottom( false, false, -13.5, 11.5 )
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
	ScoreColumn1:setLeftRight( false, true, -432.09, -345.09 )
	ScoreColumn1:setTopBottom( true, true, 0, 0 )
	ScoreColumn1.Bg:setAlpha( 0.3 )
	ScoreColumn1.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	ScoreColumn2:setLeftRight( false, true, -345.09, -258.09 )
	ScoreColumn2:setTopBottom( true, true, 0, 0 )
	ScoreColumn2.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn2.Bg:setAlpha( 0 )
	ScoreColumn2.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn2:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -258.09, -171.09 )
	ScoreColumn3:setTopBottom( true, true, 0, 0 )
	ScoreColumn3.Bg:setAlpha( 0.3 )
	ScoreColumn3.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	ScoreColumn4:setLeftRight( false, true, -171.09, -84.09 )
	ScoreColumn4:setTopBottom( true, true, 0, 0 )
	ScoreColumn4.Bg:setRGB( 0.3, 0.27, 0.27 )
	ScoreColumn4.Bg:setAlpha( 0 )
	ScoreColumn4.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ScoreColumn4:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.Text:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, modelValue ) ) )
		end
	end )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local ScoreColumn5 = CoD.TextWithBg.new( menu, controller )
	ScoreColumn5:setLeftRight( false, true, -84.09, -1.09 )
	ScoreColumn5:setTopBottom( true, true, 0, 0 )
	ScoreColumn5.Bg:setAlpha( 0.3 )
	ScoreColumn5.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Rank:completeAnimation()
				self.Rank:setRGB( 1, 1, 1 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 1, 1 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
				self.ScoreColumn5.Text:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreColumn5, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Rank:completeAnimation()
				self.Rank:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Rank, {} )
				Gamertag:completeAnimation()
				self.Gamertag:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( Gamertag, {} )
				ScoreColumn1:completeAnimation()
				ScoreColumn1.Text:completeAnimation()
				self.ScoreColumn1:setRGB( 1, 1, 1 )
				self.ScoreColumn1.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				ScoreColumn2.Text:completeAnimation()
				self.ScoreColumn2:setRGB( 1, 1, 1 )
				self.ScoreColumn2.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				ScoreColumn3.Text:completeAnimation()
				self.ScoreColumn3:setRGB( 1, 1, 1 )
				self.ScoreColumn3.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				ScoreColumn4.Text:completeAnimation()
				self.ScoreColumn4:setRGB( 1, 1, 1 )
				self.ScoreColumn4.Text:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( ScoreColumn4, {} )
				ScoreColumn5:completeAnimation()
				ScoreColumn5.Text:completeAnimation()
				self.ScoreColumn5:setRGB( 1, 1, 1 )
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
	self:linkToElementModel( "clientNum", true, function ( model )
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

