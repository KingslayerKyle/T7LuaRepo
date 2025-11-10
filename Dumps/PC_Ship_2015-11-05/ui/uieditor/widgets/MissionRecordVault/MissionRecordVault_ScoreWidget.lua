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
	self:setLeftRight( true, false, 0, 219 )
	self:setTopBottom( true, false, 0, 39 )
	
	local currentScore = LUI.UIText.new()
	currentScore:setLeftRight( true, false, 0, 219 )
	currentScore:setTopBottom( true, false, 19, 39 )
	currentScore:setRGB( 0.95, 0.89, 0.03 )
	currentScore:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	currentScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	currentScore:linkToElementModel( self, "challengeProgressQuantity", true, function ( model )
		local challengeProgressQuantity = Engine.GetModelValue( model )
		if challengeProgressQuantity then
			currentScore:setText( Engine.Localize( challengeProgressQuantity ) )
		end
	end )
	self:addElement( currentScore )
	self.currentScore = currentScore
	
	local TextBox40 = LUI.UIText.new()
	TextBox40:setLeftRight( true, false, 0, 193 )
	TextBox40:setTopBottom( true, false, 0, 20 )
	TextBox40:setRGB( 0.95, 0.89, 0.03 )
	TextBox40:setText( Engine.Localize( "CPUI_IN_PROGRESS" ) )
	TextBox40:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox40:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox40:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox40 )
	self.TextBox40 = TextBox40
	
	local highestScore = LUI.UIText.new()
	highestScore:setLeftRight( true, false, 0, 219 )
	highestScore:setTopBottom( true, false, 19, 39 )
	highestScore:setRGB( 0.95, 0.89, 0.03 )
	highestScore:setAlpha( 0 )
	highestScore:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highestScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	highestScore:linkToElementModel( self, "highestValue", true, function ( model )
		local highestValue = Engine.GetModelValue( model )
		if highestValue then
			highestScore:setText( Engine.Localize( highestValue ) )
		end
	end )
	self:addElement( highestScore )
	self.highestScore = highestScore
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				highestScore:completeAnimation()
				self.highestScore:setAlpha( 0 )
				self.clipFinished( highestScore, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )
				currentScore:completeAnimation()
				self.currentScore:setAlpha( 1 )
				self.clipFinished( currentScore, {} )
				TextBox40:completeAnimation()
				self.TextBox40:setText( Engine.Localize( "CPUI_IN_PROGRESS" ) )
				self.clipFinished( TextBox40, {} )
				highestScore:completeAnimation()
				self.highestScore:setAlpha( 0 )
				self.clipFinished( highestScore, {} )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				currentScore:completeAnimation()
				self.currentScore:setAlpha( 1 )
				self.clipFinished( currentScore, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.currentScore:close()
		element.highestScore:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

