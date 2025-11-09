local PostLoadFunc = function ( self, controller )
	local lastStandTimerUpdate = function ( self, event )
		self:setState( "IsDown_Last10Seconds" )
	end
	
	self.setState = function ( self, newState )
		if self.currentState == "IsDown_Last10Seconds" and newState == "IsDown" then
			return 
		end
		CoD.playerScoreRankIconWidget.super.setState( self, newState )
		if newState == "IsDown" then
			local lastStandWaitTime = Dvar.player_lastStandBleedoutTime:get() * 1000 - 10000
			self.lastStandWaitTimer = LUI.UITimer.new( lastStandWaitTime, "last_stand_time_update", true, self )
			self:addElement( self.lastStandWaitTimer )
		elseif self.lastStandWaitTimer then
			self.lastStandWaitTimer:close()
			self.lastStandWaitTimer = nil
		end
	end
	
	self:registerEventHandler( "last_stand_time_update", lastStandTimerUpdate )
end

CoD.playerScoreStatusIconWidget = InheritFrom( LUI.UIElement )
CoD.playerScoreStatusIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playerScoreStatusIconWidget )
	self.id = "playerScoreStatusIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local downIcon = LUI.UIImage.new()
	downIcon:setLeftRight( true, true, 4, -4 )
	downIcon:setTopBottom( true, true, 4, -4 )
	downIcon:setRGB( 1, 1, 1 )
	downIcon:setAlpha( 0 )
	downIcon:setImage( RegisterImage( "uie_t7_hud_playerlist_revive" ) )
	downIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( downIcon )
	self.downIcon = downIcon
	
	local objectiveIconWidget = LUI.UIImage.new()
	objectiveIconWidget:setLeftRight( true, true, 4, -4 )
	objectiveIconWidget:setTopBottom( true, true, 4, -4 )
	objectiveIconWidget:setRGB( 1, 1, 1 )
	objectiveIconWidget:setImage( RegisterImage( "uie_t7_hud_playerlist_unobtanium" ) )
	objectiveIconWidget:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( objectiveIconWidget )
	self.objectiveIconWidget = objectiveIconWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				downIcon:completeAnimation()
				self.downIcon:setAlpha( 0 )
				self.clipFinished( downIcon, {} )
				objectiveIconWidget:completeAnimation()
				self.objectiveIconWidget:setAlpha( 0 )
				self.clipFinished( objectiveIconWidget, {} )
			end
		},
		IsDown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				downIcon:completeAnimation()
				self.downIcon:setAlpha( 1 )
				self.clipFinished( downIcon, {} )
				objectiveIconWidget:completeAnimation()
				self.objectiveIconWidget:setAlpha( 0 )
				self.clipFinished( objectiveIconWidget, {} )
			end
		},
		HasObjective = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				downIcon:completeAnimation()
				self.downIcon:setAlpha( 0 )
				self.clipFinished( downIcon, {} )
				local objectiveIconWidgetFrame2 = function ( objectiveIconWidget, event )
					local objectiveIconWidgetFrame3 = function ( objectiveIconWidget, event )
						if not event.interrupted then
							objectiveIconWidget:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						objectiveIconWidget:setLeftRight( true, true, 4, -4 )
						objectiveIconWidget:setTopBottom( true, true, 4, -4 )
						objectiveIconWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( objectiveIconWidget, event )
						else
							objectiveIconWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						objectiveIconWidgetFrame3( objectiveIconWidget, event )
						return 
					else
						objectiveIconWidget:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						objectiveIconWidget:setLeftRight( true, true, 0, 0 )
						objectiveIconWidget:setTopBottom( true, true, 0, 0 )
						objectiveIconWidget:setAlpha( 1 )
						objectiveIconWidget:registerEventHandler( "transition_complete_keyframe", objectiveIconWidgetFrame3 )
					end
				end
				
				objectiveIconWidget:completeAnimation()
				self.objectiveIconWidget:setLeftRight( true, true, 4, -4 )
				self.objectiveIconWidget:setTopBottom( true, true, 4, -4 )
				self.objectiveIconWidget:setAlpha( 0 )
				objectiveIconWidgetFrame2( objectiveIconWidget, {} )
			end
		},
		IsDown_Last10Seconds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local downIconFrame2 = function ( downIcon, event )
					local downIconFrame3 = function ( downIcon, event )
						if not event.interrupted then
							downIcon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						downIcon:setLeftRight( true, true, 4, -4 )
						downIcon:setTopBottom( true, true, 4, -4 )
						if event.interrupted then
							self.clipFinished( downIcon, event )
						else
							downIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						downIconFrame3( downIcon, event )
						return 
					else
						downIcon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						downIcon:setLeftRight( true, true, 0, 0 )
						downIcon:setTopBottom( true, true, 0, 0 )
						downIcon:registerEventHandler( "transition_complete_keyframe", downIconFrame3 )
					end
				end
				
				downIcon:completeAnimation()
				self.downIcon:setLeftRight( true, true, 4, -4 )
				self.downIcon:setTopBottom( true, true, 4, -4 )
				downIconFrame2( downIcon, {} )
				objectiveIconWidget:completeAnimation()
				self.objectiveIconWidget:setAlpha( 0 )
				self.clipFinished( objectiveIconWidget, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

