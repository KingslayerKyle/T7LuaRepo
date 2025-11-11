CoD.MissionRecordVault_ScoreWidget = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ScoreWidget )
	self.id = "MissionRecordVault_ScoreWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 328 )
	self:setTopBottom( 0, 0, 0, 58 )
	
	local currentScore = LUI.UIText.new()
	currentScore:setLeftRight( 0, 0, 0, 328 )
	currentScore:setTopBottom( 0, 0, 29, 59 )
	currentScore:setRGB( 0.95, 0.89, 0.03 )
	currentScore:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	currentScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	currentScore:linkToElementModel( self, "challengeProgressQuantity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentScore )
	self.currentScore = currentScore
	
	local TextBox40 = LUI.UIText.new()
	TextBox40:setLeftRight( 0, 0, 0, 290 )
	TextBox40:setTopBottom( 0, 0, 0, 30 )
	TextBox40:setRGB( 0.95, 0.89, 0.03 )
	TextBox40:setText( Engine.Localize( "CPUI_IN_PROGRESS" ) )
	TextBox40:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox40:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox40:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox40 )
	self.TextBox40 = TextBox40
	
	local highestScore = LUI.UIText.new()
	highestScore:setLeftRight( 0, 0, 0, 328 )
	highestScore:setTopBottom( 0, 0, 29, 59 )
	highestScore:setRGB( 0.95, 0.89, 0.03 )
	highestScore:setAlpha( 0 )
	highestScore:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	highestScore:linkToElementModel( self, "highestValue", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highestScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( highestScore )
	self.highestScore = highestScore
	
	self.resetProperties = function ()
		TextBox40:completeAnimation()
		highestScore:completeAnimation()
		currentScore:completeAnimation()
		TextBox40:setText( Engine.Localize( "CPUI_IN_PROGRESS" ) )
		highestScore:setAlpha( 0 )
		currentScore:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Completed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentScore:completeAnimation()
				self.currentScore:setAlpha( 0 )
				self.clipFinished( currentScore, {} )
				TextBox40:completeAnimation()
				self.TextBox40:setText( Engine.Localize( "CPUI_COMPLETE" ) )
				self.clipFinished( TextBox40, {} )
				highestScore:completeAnimation()
				self.highestScore:setAlpha( 1 )
				self.clipFinished( highestScore, {} )
			end
		},
		Safehouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentScore:completeAnimation()
				self.currentScore:setAlpha( 0 )
				self.clipFinished( currentScore, {} )
				TextBox40:completeAnimation()
				self.TextBox40:setText( Engine.Localize( "CPUI_YOUR_BEST" ) )
				self.clipFinished( TextBox40, {} )
				highestScore:completeAnimation()
				self.highestScore:setAlpha( 1 )
				self.clipFinished( highestScore, {} )
			end
		},
		InProgress = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completed" )
			end
		},
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				return IsCPAndInSafehouse()
			end
		},
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "challengeImage" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self:linkToElementModel( self, "challengeImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "challengeImage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.currentScore:close()
		self.highestScore:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

