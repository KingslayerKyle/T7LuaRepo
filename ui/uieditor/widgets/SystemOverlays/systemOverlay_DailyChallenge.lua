-- 9586807184b850d62ffded2911a8032a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.Border" )

CoD.systemOverlay_DailyChallenge = InheritFrom( LUI.UIElement )
CoD.systemOverlay_DailyChallenge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_DailyChallenge )
	self.id = "systemOverlay_DailyChallenge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 438, 1280 )
	bg:setTopBottom( true, false, 0, 320 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local RewardGradient = LUI.UIImage.new()
	RewardGradient:setLeftRight( true, false, 0, 438 )
	RewardGradient:setTopBottom( true, false, 0, 320 )
	RewardGradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_gradient" ) )
	RewardGradient:setShaderVector( 0, 0.15, 0.16, 0.18, 1 )
	RewardGradient:setShaderVector( 1, 0, 0, 0, 1 )
	RewardGradient:setShaderVector( 2, 0.8, 0, 0, 0 )
	self:addElement( RewardGradient )
	self.RewardGradient = RewardGradient
	
	local DailyChallenge = LUI.UIText.new()
	DailyChallenge:setLeftRight( false, false, -200, 495.37 )
	DailyChallenge:setTopBottom( true, false, 11.66, 51.66 )
	DailyChallenge:setText( Engine.Localize( "MENU_DAILY_CHALLENGE" ) )
	DailyChallenge:setTTF( "fonts/escom.ttf" )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DailyChallenge )
	self.DailyChallenge = DailyChallenge
	
	local ChallengeName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	ChallengeName:setLeftRight( false, false, -200, 495.37 )
	ChallengeName:setTopBottom( true, false, 66.66, 106.66 )
	ChallengeName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			ChallengeName.itemName:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( ChallengeName )
	self.ChallengeName = ChallengeName
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( true, true, 440, -144.63 )
	ProgressBarBorder:setTopBottom( true, false, 166.5, 191.5 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, true, 442, -144.63 )
	ProgressBar:setTopBottom( true, false, 167.5, 190.5 )
	ProgressBar:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:linkToElementModel( self, "progressPercentage", true, function ( model )
		local progressPercentage = Engine.GetModelValue( model )
		if progressPercentage then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( progressPercentage, 1 ), CoD.GetVectorComponentFromString( progressPercentage, 2 ), CoD.GetVectorComponentFromString( progressPercentage, 3 ), CoD.GetVectorComponentFromString( progressPercentage, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressFraction = LUI.UIText.new()
	ProgressFraction:setLeftRight( false, false, -198, 2 )
	ProgressFraction:setTopBottom( true, false, 196.5, 221.5 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ProgressFraction:linkToElementModel( self, "fractionText", true, function ( model )
		local fractionText = Engine.GetModelValue( model )
		if fractionText then
			ProgressFraction:setText( Engine.Localize( fractionText ) )
		end
	end )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( false, false, -198, 495.37 )
	ChallengeDescription:setTopBottom( true, false, 125.24, 149.24 )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			ChallengeDescription:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( false, false, -495.37, -367.37 )
	RewardImage:setTopBottom( true, false, 89, 217 )
	RewardImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local RewardDescription = LUI.UIText.new()
	RewardDescription:setLeftRight( false, false, -529.37, -329.37 )
	RewardDescription:setTopBottom( true, false, 224.11, 249.11 )
	RewardDescription:setTTF( "fonts/default.ttf" )
	RewardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RewardDescription:linkToElementModel( self, "rewardText", true, function ( model )
		local rewardText = Engine.GetModelValue( model )
		if rewardText then
			RewardDescription:setText( Engine.Localize( rewardText ) )
		end
	end )
	self:addElement( RewardDescription )
	self.RewardDescription = RewardDescription
	
	local RewardTitle = LUI.UIText.new()
	RewardTitle:setLeftRight( false, false, -507.65, -351.1 )
	RewardTitle:setTopBottom( true, false, 53.25, 83.25 )
	RewardTitle:setText( Engine.Localize( "MPUI_REWARD" ) )
	RewardTitle:setTTF( "fonts/default.ttf" )
	RewardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardTitle )
	self.RewardTitle = RewardTitle
	
	local CompleteText = LUI.UIText.new()
	CompleteText:setLeftRight( false, false, -198, 495.37 )
	CompleteText:setTopBottom( true, false, 196.5, 221.5 )
	CompleteText:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
	CompleteText:setAlpha( 0 )
	CompleteText:setText( Engine.Localize( "MPUI_AAR_CONTRACT_COMPLETE_CAPS" ) )
	CompleteText:setTTF( "fonts/default.ttf" )
	CompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompleteText )
	self.CompleteText = CompleteText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				DailyChallenge:completeAnimation()
				self.DailyChallenge:setAlpha( 1 )
				self.clipFinished( DailyChallenge, {} )
				ChallengeName:completeAnimation()
				self.ChallengeName:setAlpha( 1 )
				self.clipFinished( ChallengeName, {} )
				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )
				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( false, false, -198, 495.37 )
				self.ProgressFraction:setTopBottom( true, false, 196.5, 221.5 )
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )
				ChallengeDescription:completeAnimation()
				self.ChallengeDescription:setAlpha( 1 )
				self.clipFinished( ChallengeDescription, {} )
				RewardDescription:completeAnimation()
				self.RewardDescription:setRGB( 1, 1, 1 )
				self.clipFinished( RewardDescription, {} )
				RewardTitle:completeAnimation()
				self.RewardTitle:setRGB( 1, 1, 1 )
				self.clipFinished( RewardTitle, {} )
				CompleteText:completeAnimation()
				self.CompleteText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
				self.CompleteText:setAlpha( 0 )
				self.CompleteText:setText( Engine.Localize( "MPUI_AAR_CONTRACT_COMPLETE_CAPS" ) )
				self.clipFinished( CompleteText, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				DailyChallenge:completeAnimation()
				self.DailyChallenge:setAlpha( 1 )
				self.clipFinished( DailyChallenge, {} )
				ChallengeName:completeAnimation()
				self.ChallengeName:setAlpha( 1 )
				self.clipFinished( ChallengeName, {} )
				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )
				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )
				ChallengeDescription:completeAnimation()
				self.ChallengeDescription:setAlpha( 1 )
				self.clipFinished( ChallengeDescription, {} )
				RewardDescription:completeAnimation()
				self.RewardDescription:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
				self.clipFinished( RewardDescription, {} )
				RewardTitle:completeAnimation()
				self.RewardTitle:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
				self.clipFinished( RewardTitle, {} )
				CompleteText:completeAnimation()
				self.CompleteText:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
				self.CompleteText:setAlpha( 1 )
				self.CompleteText:setText( Engine.Localize( "MPUI_AAR_CONTRACT_COMPLETE_CAPS" ) )
				self.clipFinished( CompleteText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "progressPercentage", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "progressPercentage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progressPercentage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChallengeName:close()
		element.ProgressBarBorder:close()
		element.ProgressBar:close()
		element.ProgressFraction:close()
		element.ChallengeDescription:close()
		element.RewardImage:close()
		element.RewardDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

