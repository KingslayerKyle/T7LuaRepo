local PostLoadFunc = function ( self, controller )
	self.displayedScore = 0

	local GenerateScoreSteps = function ( oldScore, newScore )
		if type( oldScore ) ~= "number" or type( newScore ) ~= "number" then
			return { newScore or 0 }
		end

		local steps = {}
		local diff = newScore - oldScore
		local stepCount = math.min( math.abs( diff ), 50 )

		if stepCount <= 0 then
			steps[1] = newScore
			return steps
		end

		local stepSize = diff / stepCount

		for i = 1, stepCount - 1 do
			local stepValue = oldScore + stepSize * i
			
			if diff > 0 then
				steps[i] = math.floor( stepValue )
			else
				steps[i] = math.ceil( stepValue )
			end
		end

		steps[stepCount] = newScore

		return steps
	end

	local function AnimateNextStep( self )
		if self.currentStepIndex > #self.scoreSteps then
			local finalScore = self.scoreSteps[#self.scoreSteps] or 0
			self.Score:setText( Engine.Localize( tostring( finalScore ) ) )
			self.displayedScore = finalScore
			return
		end

		local nextScore = self.scoreSteps[self.currentStepIndex]
		self.Score:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
		self.Score:setText( Engine.Localize( tostring( nextScore ) ) )

		self.Score:registerEventHandler( "transition_complete_keyframe", function ( element, event )
			self.currentStepIndex = self.currentStepIndex + 1
			AnimateNextStep( self )
		end )
	end

	local StartScoreAnimation = function ( self, oldScore, newScore )
		self.scoreSteps = GenerateScoreSteps( oldScore, newScore )
		self.currentStepIndex = 1
		AnimateNextStep( self )
	end

	self.Score:linkToElementModel( self, "playerScore", true, function ( model )
		local newScore = Engine.GetModelValue( model )
		local oldScore = self.displayedScore or 0

		if newScore ~= oldScore then
			StartScoreAnimation( self, oldScore, newScore )
		end
	end )
end

CoD.T4SelfScore = InheritFrom( LUI.UIElement )
CoD.T4SelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4SelfScore )
	self.id = "T4SelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( false, true, -155, -6.5 )
	self.ScoreBG:setTopBottom( false, true, -124, -92.5 )
	self.ScoreBG:setImage( RegisterImage( "t4_scorebar_zom_1" ) )
	self.ScoreBG:setRGB( 0.41, 0, 0 )
	self.ScoreBG:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		
		if clientNum then
			self.ScoreBG:setImage( RegisterImage( "t4_scorebar_zom_" .. (clientNum + 1) ) )
		end
	end )
	self:addElement( self.ScoreBG )

	self.Score = LUI.UIText.new()
	self.Score:setLeftRight( true, true, 1084, 0 )
	self.Score:setTopBottom( false, true, -125, -87 )
	self.Score:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.Score:setScale( 0.5 )
	self.Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.Score:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )
		
		if clientNum then
			self.Score:setRGB( ZombieClientScoreboardColor( clientNum ) )
		end
	end )
	self:addElement( self.Score )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreBG:close()
		element.Score:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
