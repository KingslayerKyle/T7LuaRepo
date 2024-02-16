CoD.T6ClientScore = InheritFrom( LUI.UIElement )
CoD.T6ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6ClientScore )
	self.id = "T6ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( false, true, -158, 0 )
	self.ScoreBG:setTopBottom( false, true, -155, -115 )
	self.ScoreBG:setImage( RegisterImage( "blacktransparent" ) )
	self.ScoreBG:setRGB( 0.21, 0, 0 )
	self.ScoreBG:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			if clientNum == Engine.GetClientNum( controller ) then
				self.ScoreBG:setImage( RegisterImage( "scorebar_zom_5" ) )
			else
				self.ScoreBG:setImage( RegisterImage( "blacktransparent" ) )
			end
		end
	end )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, true, 1135, 0 )
	self.ScoreText:setTopBottom( false, true, -152.5, -115 )
	self.ScoreText:setTTF( "fonts/bigFont.ttf" )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreText:setText( Engine.Localize( playerScore ) )
		end
	end )
	self.ScoreText:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.ScoreText:setRGB( ZombieClientScoreboardColor( clientNum ) )

			if clientNum == Engine.GetClientNum( controller ) then
				self.ScoreText:setLeftRight( true, true, 1135, 0 )
				self.ScoreText:setTopBottom( false, true, -152.5, -115 )
			else
				self.ScoreText:setLeftRight( true, true, 1135 + 7.5, 0 + 7.5 )
				self.ScoreText:setTopBottom( false, true, -152.5 + 7.5, -115 - 7.5 )
			end
		end
	end )
	self:addElement( self.ScoreText )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 0 )
				self.clipFinished( self.ScoreBG, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 0 )
				self.clipFinished( self.ScoreText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.ScoreBG:completeAnimation()
				self.ScoreBG:setAlpha( 1 )
				self.clipFinished( self.ScoreBG, {} )

				self.ScoreText:completeAnimation()
				self.ScoreText:setAlpha( 1 )
				self.clipFinished( self.ScoreText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "playerScoreShown", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerScoreShown"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBG:close()
		element.ScoreText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
