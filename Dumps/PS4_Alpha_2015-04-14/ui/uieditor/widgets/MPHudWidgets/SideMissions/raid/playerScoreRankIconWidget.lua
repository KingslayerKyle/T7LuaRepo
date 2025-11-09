local PostLoadFunc = function ( self, controller )
	local lastStandTimerUpdate = function ( self, event )
		self.countdownTimer:setText( tostring( event.timeLeft ) )
		event.timeLeft = event.timeLeft - 1
		if event.timeLeft == 0 then
			self.lastStandTimer:close()
			self.lastStandTimer = nil
		end
	end
	
	self.setState = function ( self, newState )
		CoD.playerScoreRankIconWidget.super.setState( self, newState )
		if newState == "PlayerDown" then
			local lastStandTime = Dvar.player_lastStandBleedoutTime:get()
			self.countdownTimer:setText( tostring( lastStandTime ) )
			self.lastStandTimer = LUI.UITimer.new( 1000, {
				name = "last_stand_time_update",
				timeLeft = lastStandTime - 1
			}, false, self )
			self:addElement( self.lastStandTimer )
		elseif self.lastStandTimer then
			self.lastStandTimer:close()
			self.lastStandTimer = nil
		end
	end
	
	self:registerEventHandler( "last_stand_time_update", lastStandTimerUpdate )
end

CoD.playerScoreRankIconWidget = InheritFrom( LUI.UIElement )
CoD.playerScoreRankIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playerScoreRankIconWidget )
	self.id = "playerScoreRankIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local countdownBacking = LUI.UIImage.new()
	countdownBacking:setLeftRight( true, true, 0, 0 )
	countdownBacking:setTopBottom( true, true, 0, 0 )
	countdownBacking:setRGB( 0, 0, 0 )
	countdownBacking:setAlpha( 0.6 )
	countdownBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( countdownBacking )
	self.countdownBacking = countdownBacking
	
	local deadImage = LUI.UIImage.new()
	deadImage:setLeftRight( true, true, 0, 0 )
	deadImage:setTopBottom( true, true, 0, 0 )
	deadImage:setRGB( 1, 1, 1 )
	deadImage:setAlpha( 0 )
	deadImage:setImage( RegisterImage( "uie_t7_hud_playerlist_dead" ) )
	deadImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( deadImage )
	self.deadImage = deadImage
	
	local countdownTimer = LUI.UIText.new()
	countdownTimer:setLeftRight( true, true, 0, 0 )
	countdownTimer:setTopBottom( true, true, 0, 0 )
	countdownTimer:setRGB( 1, 1, 1 )
	countdownTimer:setText( Engine.Localize( "20" ) )
	countdownTimer:setTTF( "fonts/default.ttf" )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( countdownTimer )
	self.countdownTimer = countdownTimer
	
	local rankImage = LUI.UIImage.new()
	rankImage:setLeftRight( true, true, 4, -4 )
	rankImage:setTopBottom( true, true, 4, -4 )
	rankImage:setRGB( 1, 1, 1 )
	rankImage:setImage( RegisterImage( "uie_t7_rank_1_3" ) )
	rankImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankImage )
	self.rankImage = rankImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setRGB( 0, 0, 0 )
				self.countdownBacking:setAlpha( 0.6 )
				self.clipFinished( countdownBacking, {} )
				deadImage:completeAnimation()
				self.deadImage:setAlpha( 0 )
				self.clipFinished( deadImage, {} )
				countdownTimer:completeAnimation()
				self.countdownTimer:setAlpha( 0 )
				self.clipFinished( countdownTimer, {} )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 1 )
				self.clipFinished( rankImage, {} )
			end
		},
		PlayerDown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setRGB( 1, 0.12, 0.14 )
				self.countdownBacking:setAlpha( 0.79 )
				self.clipFinished( countdownBacking, {} )
				deadImage:completeAnimation()
				self.deadImage:setAlpha( 0 )
				self.clipFinished( deadImage, {} )
				countdownTimer:completeAnimation()
				self.countdownTimer:setAlpha( 1 )
				self.clipFinished( countdownTimer, {} )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				self.clipFinished( rankImage, {} )
			end
		},
		PlayerDead = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setAlpha( 0 )
				self.clipFinished( countdownBacking, {} )
				deadImage:completeAnimation()
				self.deadImage:setAlpha( 1 )
				self.clipFinished( deadImage, {} )
				countdownTimer:completeAnimation()
				self.countdownTimer:setAlpha( 0 )
				self.clipFinished( countdownTimer, {} )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				self.clipFinished( rankImage, {} )
			end
		},
		PlayerHasObjective = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setRGB( 0.99, 0.81, 0.19 )
				self.countdownBacking:setAlpha( 0.79 )
				self.clipFinished( countdownBacking, {} )
				deadImage:completeAnimation()
				self.deadImage:setAlpha( 0 )
				self.clipFinished( deadImage, {} )
				countdownTimer:completeAnimation()
				self.countdownTimer:setAlpha( 0 )
				self.clipFinished( countdownTimer, {} )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 1 )
				self.clipFinished( rankImage, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

