require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 657, 1920 )
	bg:setTopBottom( 0, 0, 0, 480 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local RewardGradient = LUI.UIImage.new()
	RewardGradient:setLeftRight( 0, 0, 0, 657 )
	RewardGradient:setTopBottom( 0, 0, 0, 480 )
	self:addElement( RewardGradient )
	self.RewardGradient = RewardGradient
	
	local DailyChallenge = LUI.UIText.new()
	DailyChallenge:setLeftRight( 0.5, 0.5, -300, 743 )
	DailyChallenge:setTopBottom( 0, 0, 17, 77 )
	DailyChallenge:setText( Engine.Localize( "MENU_DAILY_CHALLENGE" ) )
	DailyChallenge:setTTF( "fonts/escom.ttf" )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DailyChallenge )
	self.DailyChallenge = DailyChallenge
	
	local ChallengeName = CoD.InfoPaneItemNameLabel.new( menu, controller )
	ChallengeName:setLeftRight( 0.5, 0.5, -300, 743 )
	ChallengeName:setTopBottom( 0, 0, 100, 160 )
	ChallengeName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ChallengeName )
	self.ChallengeName = ChallengeName
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( 0, 1, 660, -216 )
	ProgressBarBorder:setTopBottom( 0, 0, 249, 287 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( 0, 1, 663, -217 )
	ProgressBar:setTopBottom( 0, 0, 251, 285 )
	ProgressBar:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 4, 0, 0, 0, 0 )
	ProgressBar:linkToElementModel( self, "progressPercentage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressFraction = LUI.UIText.new()
	ProgressFraction:setLeftRight( 0.5, 0.5, -297, 3 )
	ProgressFraction:setTopBottom( 0, 0, 295, 333 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ProgressFraction:linkToElementModel( self, "fractionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( 0.5, 0.5, -297, 743 )
	ChallengeDescription:setTopBottom( 0, 0, 188, 224 )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( 0.5, 0.5, -743, -551 )
	RewardImage:setTopBottom( 0, 0, 134, 326 )
	RewardImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local RewardDescription = LUI.UIText.new()
	RewardDescription:setLeftRight( 0.5, 0.5, -794, -494 )
	RewardDescription:setTopBottom( 0, 0, 336, 374 )
	RewardDescription:setTTF( "fonts/default.ttf" )
	RewardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RewardDescription:linkToElementModel( self, "rewardText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( RewardDescription )
	self.RewardDescription = RewardDescription
	
	local RewardTitle = LUI.UIText.new()
	RewardTitle:setLeftRight( 0.5, 0.5, -762, -527 )
	RewardTitle:setTopBottom( 0, 0, 80, 125 )
	RewardTitle:setText( Engine.Localize( "MPUI_REWARD" ) )
	RewardTitle:setTTF( "fonts/default.ttf" )
	RewardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardTitle )
	self.RewardTitle = RewardTitle
	
	local CompleteText = LUI.UIText.new()
	CompleteText:setLeftRight( 0.5, 0.5, -297, 743 )
	CompleteText:setTopBottom( 0, 0, 295, 333 )
	CompleteText:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
	CompleteText:setAlpha( 0 )
	CompleteText:setText( Engine.Localize( "MPUI_AAR_CONTRACT_COMPLETE_CAPS" ) )
	CompleteText:setTTF( "fonts/default.ttf" )
	CompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompleteText )
	self.CompleteText = CompleteText
	
	self.resetProperties = function ()
		ProgressFraction:completeAnimation()
		CompleteText:completeAnimation()
		RewardDescription:completeAnimation()
		RewardTitle:completeAnimation()
		ProgressFraction:setLeftRight( 0.5, 0.5, -297, 3 )
		ProgressFraction:setTopBottom( 0, 0, 295, 333 )
		ProgressFraction:setAlpha( 1 )
		CompleteText:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
		CompleteText:setAlpha( 0 )
		RewardDescription:setRGB( 1, 1, 1 )
		RewardTitle:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( 0.5, 0.5, -297, 743 )
				self.ProgressFraction:setTopBottom( 0, 0, 295, 333 )
				self.clipFinished( ProgressFraction, {} )
				CompleteText:completeAnimation()
				self.CompleteText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
				self.clipFinished( CompleteText, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )
				RewardDescription:completeAnimation()
				self.RewardDescription:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
				self.clipFinished( RewardDescription, {} )
				RewardTitle:completeAnimation()
				self.RewardTitle:setRGB( ColorSet.RewardChallenge.r, ColorSet.RewardChallenge.g, ColorSet.RewardChallenge.b )
				self.clipFinished( RewardTitle, {} )
				CompleteText:completeAnimation()
				self.CompleteText:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChallengeName:close()
		self.ProgressBarBorder:close()
		self.ProgressBar:close()
		self.ProgressFraction:close()
		self.ChallengeDescription:close()
		self.RewardImage:close()
		self.RewardDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

