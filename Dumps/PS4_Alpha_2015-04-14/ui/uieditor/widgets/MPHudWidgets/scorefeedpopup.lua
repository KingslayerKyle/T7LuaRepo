require( "ui.uieditor.widgets.ScoreFeedList" )

local ScoreFeedPopup_ScoreEvent = function ( self, event )
	local scoreName = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
	local score = event.data[2]
	local controller = event.controller
	local perControllerModel = Engine.GetModelForController( controller )
	if scoreName then
		local translatedReason = Engine.Localize( scoreName )
		local scoreAmountModel = Engine.GetModel( perControllerModel, "inGameNotifications.scorePopupAmount" )
		local scoreCount = Engine.GetModelValue( scoreAmountModel )
		scoreCount = scoreCount + score
		local displayedScore = false
		if scoreCount > 0 then
			displayedScore = true
			Engine.SetModelValue( scoreAmountModel, scoreCount )
			self:playClip( "FadeOutScore" )
			if self.resetTimer then
				self.resetTimer:close()
				self.resetTimer:reset()
			end
			self.resetTimer = LUI.UITimer.new( 1250, {
				name = "reset_score",
				controller = controller
			}, true, self )
			self:addElement( self.resetTimer )
		end
		if scoreName ~= "SCORE_KILL" and displayedScore == true then
			self.scoreFeedList:addRow( translatedReason, score )
		end
	end
end

local ScoreFeedPopup_ResetScore = function ( self, event )
	local scoreAmountModel = Engine.GetModel( Engine.GetModelForController( event.controller ), "inGameNotifications.scorePopupAmount" )
	Engine.SetModelValue( scoreAmountModel, 0 )
end

local PostLoadFunc = function ( self )
	self:registerEventHandler( "score_event", ScoreFeedPopup_ScoreEvent )
	self:registerEventHandler( "reset_score", ScoreFeedPopup_ResetScore )
end

CoD.ScoreFeedPopup = InheritFrom( LUI.UIElement )
CoD.ScoreFeedPopup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreFeedPopup )
	self.id = "ScoreFeedPopup"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 106 )
	
	local scoreAmountText = LUI.UITightText.new()
	scoreAmountText:setLeftRight( true, false, 0, 334 )
	scoreAmountText:setTopBottom( true, false, -25, 0 )
	scoreAmountText:setRGB( 1, 1, 1 )
	scoreAmountText:setText( Engine.Localize( "+$(inGameNotifications.scorePopupAmount)" ) )
	scoreAmountText:setTTF( "fonts/default.ttf" )
	self:addElement( scoreAmountText )
	self.scoreAmountText = scoreAmountText
	
	local scoreFeedList = CoD.ScoreFeedList.new( menu, controller )
	scoreFeedList:setLeftRight( true, false, 0, 200 )
	scoreFeedList:setTopBottom( true, false, 0, 106 )
	scoreFeedList:setRGB( 1, 1, 1 )
	self:addElement( scoreFeedList )
	self.scoreFeedList = scoreFeedList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				scoreAmountText:completeAnimation()
				self.scoreAmountText:setRGB( 1, 1, 1 )
				self.scoreAmountText:setAlpha( 0 )
				self.clipFinished( scoreAmountText, {} )
			end,
			FadeOutScore = function ()
				self:setupElementClipCounter( 1 )
				local scoreAmountTextFrame2 = function ( scoreAmountText, event )
					local scoreAmountTextFrame3 = function ( scoreAmountText, event )
						if not event.interrupted then
							scoreAmountText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						scoreAmountText:setRGB( 1, 1, 1 )
						scoreAmountText:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( scoreAmountText, event )
						else
							scoreAmountText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						scoreAmountTextFrame3( scoreAmountText, event )
						return 
					else
						scoreAmountText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						scoreAmountText:registerEventHandler( "transition_complete_keyframe", scoreAmountTextFrame3 )
					end
				end
				
				scoreAmountText:completeAnimation()
				self.scoreAmountText:setRGB( 1, 1, 1 )
				self.scoreAmountText:setAlpha( 1 )
				scoreAmountTextFrame2( scoreAmountText, {} )
			end
		}
	}
	self.close = function ( self )
		self.scoreFeedList:close()
		CoD.ScoreFeedPopup.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

