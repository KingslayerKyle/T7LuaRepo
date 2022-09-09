-- 98e9cc381244c650f23904c50a9b39be
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_TrainingSimCompleted" )

CoD.cac_TrainingSimRating = InheritFrom( LUI.UIElement )
CoD.cac_TrainingSimRating.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_TrainingSimRating )
	self.id = "cac_TrainingSimRating"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 143 )
	self:setTopBottom( true, false, 0, 240 )
	self.anyChildUsesUpdateState = true
	
	local RatingNameBackground0 = LUI.UIImage.new()
	RatingNameBackground0:setLeftRight( true, false, 4, 139 )
	RatingNameBackground0:setTopBottom( true, false, 171, 189.39 )
	RatingNameBackground0:setRGB( 0.4, 0.4, 0.4 )
	RatingNameBackground0:setAlpha( 0.7 )
	self:addElement( RatingNameBackground0 )
	self.RatingNameBackground0 = RatingNameBackground0
	
	local RatingNameBackground = LUI.UIImage.new()
	RatingNameBackground:setLeftRight( true, false, 4, 139 )
	RatingNameBackground:setTopBottom( true, false, 99, 125 )
	RatingNameBackground:setRGB( 0.4, 0.4, 0.4 )
	RatingNameBackground:setAlpha( 0.7 )
	self:addElement( RatingNameBackground )
	self.RatingNameBackground = RatingNameBackground
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, false, 0, 143 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, false, 0, 240 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local RatingName = LUI.UIText.new()
	RatingName:setLeftRight( true, false, 4, 140 )
	RatingName:setTopBottom( true, false, 99, 124 )
	RatingName:setTTF( "fonts/default.ttf" )
	RatingName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RatingName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RatingName:linkToElementModel( self, "ratingName", true, function ( model )
		local ratingName = Engine.GetModelValue( model )
		if ratingName then
			RatingName:setText( Engine.Localize( ratingName ) )
		end
	end )
	self:addElement( RatingName )
	self.RatingName = RatingName
	
	local RequiredScoreCaps = LUI.UIText.new()
	RequiredScoreCaps:setLeftRight( true, false, 9, 136 )
	RequiredScoreCaps:setTopBottom( true, false, 125, 146 )
	RequiredScoreCaps:setText( Engine.Localize( "CPUI_REQUIRED_SCORE" ) )
	RequiredScoreCaps:setTTF( "fonts/default.ttf" )
	RequiredScoreCaps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RequiredScoreCaps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RequiredScoreCaps )
	self.RequiredScoreCaps = RequiredScoreCaps
	
	local RatingRequiredScore = LUI.UIText.new()
	RatingRequiredScore:setLeftRight( true, false, 9, 136 )
	RatingRequiredScore:setTopBottom( true, false, 146, 171 )
	RatingRequiredScore:setTTF( "fonts/default.ttf" )
	RatingRequiredScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RatingRequiredScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RatingRequiredScore:linkToElementModel( self, "requiredScore", true, function ( model )
		local requiredScore = Engine.GetModelValue( model )
		if requiredScore then
			RatingRequiredScore:setText( Engine.Localize( requiredScore ) )
		end
	end )
	self:addElement( RatingRequiredScore )
	self.RatingRequiredScore = RatingRequiredScore
	
	local unlockTokenIcon = LUI.UIImage.new()
	unlockTokenIcon:setLeftRight( true, false, 9, 24 )
	unlockTokenIcon:setTopBottom( true, false, 196, 212 )
	unlockTokenIcon:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	unlockTokenIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( unlockTokenIcon )
	self.unlockTokenIcon = unlockTokenIcon
	
	local xpIcon = LUI.UIImage.new()
	xpIcon:setLeftRight( true, false, 8, 25 )
	xpIcon:setTopBottom( true, false, 214.36, 231.36 )
	xpIcon:setScale( 1.1 )
	xpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp_blue" ) )
	xpIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( xpIcon )
	self.xpIcon = xpIcon
	
	local RatingXP = LUI.UIText.new()
	RatingXP:setLeftRight( true, false, 28, 140 )
	RatingXP:setTopBottom( true, false, 214.36, 230.36 )
	RatingXP:setTTF( "fonts/default.ttf" )
	RatingXP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RatingXP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RatingXP:linkToElementModel( self, "xpAwarded", true, function ( model )
		local xpAwarded = Engine.GetModelValue( model )
		if xpAwarded then
			RatingXP:setText( Engine.Localize( GetBonusXPString( controller, xpAwarded ) ) )
		end
	end )
	self:addElement( RatingXP )
	self.RatingXP = RatingXP
	
	local RatingUnlockTokens = LUI.UIText.new()
	RatingUnlockTokens:setLeftRight( true, false, 28, 140 )
	RatingUnlockTokens:setTopBottom( true, false, 196, 214 )
	RatingUnlockTokens:setTTF( "fonts/default.ttf" )
	RatingUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RatingUnlockTokens:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RatingUnlockTokens:linkToElementModel( self, "tokensAwarded", true, function ( model )
		local tokensAwarded = Engine.GetModelValue( model )
		if tokensAwarded then
			RatingUnlockTokens:setText( Engine.Localize( GetAllUnlockTokens( controller, tokensAwarded ) ) )
		end
	end )
	self:addElement( RatingUnlockTokens )
	self.RatingUnlockTokens = RatingUnlockTokens
	
	local cacTrainingSimCompleted = CoD.cac_TrainingSimCompleted.new( menu, controller )
	cacTrainingSimCompleted:setLeftRight( true, false, 4, 140 )
	cacTrainingSimCompleted:setTopBottom( true, false, 171, 189.39 )
	cacTrainingSimCompleted:mergeStateConditions( {
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Show" )
			end
		}
	} )
	self:addElement( cacTrainingSimCompleted )
	self.cacTrainingSimCompleted = cacTrainingSimCompleted
	
	local RatingImage = LUI.UIImage.new()
	RatingImage:setLeftRight( true, false, 20.5, 124.5 )
	RatingImage:setTopBottom( true, false, 1.5, 105.5 )
	RatingImage:setScale( 0.9 )
	RatingImage:linkToElementModel( self, "ratingImage", true, function ( model )
		local ratingImage = Engine.GetModelValue( model )
		if ratingImage then
			RatingImage:setImage( RegisterImage( ratingImage ) )
		end
	end )
	self:addElement( RatingImage )
	self.RatingImage = RatingImage
	
	local yellowStar = LUI.UIImage.new()
	yellowStar:setLeftRight( true, false, 94, 138 )
	yellowStar:setTopBottom( true, false, 1.5, 45.5 )
	yellowStar:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	self:addElement( yellowStar )
	self.yellowStar = yellowStar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				RatingImage:completeAnimation()
				self.RatingImage:setRGB( 0.08, 0.08, 0.08 )
				self.RatingImage:setAlpha( 1 )
				self.clipFinished( RatingImage, {} )

				yellowStar:completeAnimation()
				self.yellowStar:setAlpha( 0 )
				self.clipFinished( yellowStar, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end,
			Back = function ()
				self:setupElementClipCounter( 0 )
			end,
			Close = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				RatingXP:completeAnimation()
				self.RatingXP:setRGB( 0.95, 0.89, 0.03 )
				self.clipFinished( RatingXP, {} )

				RatingUnlockTokens:completeAnimation()
				self.RatingUnlockTokens:setRGB( 0.95, 0.89, 0.03 )
				self.clipFinished( RatingUnlockTokens, {} )

				cacTrainingSimCompleted:completeAnimation()
				self.cacTrainingSimCompleted:setRGB( 0.95, 0.89, 0.03 )
				self.clipFinished( cacTrainingSimCompleted, {} )

				RatingImage:completeAnimation()
				self.RatingImage:setRGB( 1, 1, 1 )
				self.RatingImage:setAlpha( 1 )
				self.clipFinished( RatingImage, {} )

				yellowStar:completeAnimation()
				self.yellowStar:setAlpha( 1 )
				self.clipFinished( yellowStar, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.cacTrainingSimCompleted:close()
		element.RatingName:close()
		element.RatingRequiredScore:close()
		element.RatingXP:close()
		element.RatingUnlockTokens:close()
		element.RatingImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
