CoD.T5ClientScore = InheritFrom( LUI.UIElement )
CoD.T5ClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T5ClientScore )
	self.id = "T5ClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( false, true, -155, -4 )
	self.ScoreBG:setTopBottom( false, true, -168, -127.5 )
	self.ScoreBG:setImage( RegisterImage( "blacktransparent" ) )
	self.ScoreBG:setRGB( 0.45, 0, 0 )
	self.ScoreBG:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.ScoreBG:setImage( RegisterImage( "t5_scorebar_zom_" .. (clientNum + 1) ) )

			if clientNum == Engine.GetClientNum( controller ) then
				self.ScoreBG:setLeftRight( false, true, -155, -4 )
				self.ScoreBG:setTopBottom( false, true, -168, -127.5 )
			else
				self.ScoreBG:setLeftRight( false, true, -155, -4 - 30 )
				self.ScoreBG:setTopBottom( false, true, -168 + 2, -127.5 - 2 )
			end
		end
	end )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( false, true, -196, 0 )
	self.ScoreText:setTopBottom( false, true, -168, -123.5 )
	self.ScoreText:setTTF( "fonts/helvetica_neue_67_medium_cond.ttf" )
	self.ScoreText:setScale( 0.5 )
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
				self.ScoreText:setLeftRight( false, true, -196, 0 )
				self.ScoreText:setTopBottom( false, true, -168, -123.5 )
			else
				self.ScoreText:setLeftRight( false, true, -196, 0 )
				self.ScoreText:setTopBottom( false, true, -168 + 5, -123.5 - 5 )
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
