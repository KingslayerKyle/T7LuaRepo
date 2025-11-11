CoD.PartyList_ScoreRankIcon = InheritFrom( LUI.UIElement )
CoD.PartyList_ScoreRankIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_ScoreRankIcon )
	self.id = "PartyList_ScoreRankIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local countdownBacking = LUI.UIImage.new()
	countdownBacking:setLeftRight( 0, 1, 0, 0 )
	countdownBacking:setTopBottom( 0, 1, 0, 0 )
	countdownBacking:setRGB( 0, 0, 0 )
	countdownBacking:setAlpha( 0 )
	self:addElement( countdownBacking )
	self.countdownBacking = countdownBacking
	
	local deadImage = LUI.UIImage.new()
	deadImage:setLeftRight( 0, 1, 0, 0 )
	deadImage:setTopBottom( 0, 1, 0, 0 )
	deadImage:setAlpha( 0 )
	deadImage:setImage( RegisterImage( "uie_t7_hud_playerlist_dead" ) )
	self:addElement( deadImage )
	self.deadImage = deadImage
	
	local countdownTimer = LUI.UIText.new()
	countdownTimer:setLeftRight( 0, 1, 0, 0 )
	countdownTimer:setTopBottom( 0, 1, 0, 0 )
	countdownTimer:setAlpha( 0 )
	countdownTimer:setText( Engine.Localize( "20" ) )
	countdownTimer:setTTF( "fonts/default.ttf" )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( countdownTimer )
	self.countdownTimer = countdownTimer
	
	local rankImage = LUI.UIImage.new()
	rankImage:setLeftRight( 0, 1, 0, 0 )
	rankImage:setTopBottom( 0, 1, 0, 0 )
	rankImage:setImage( RegisterImage( "img_t7_rank_1_3" ) )
	self:addElement( rankImage )
	self.rankImage = rankImage
	
	self.resetProperties = function ()
		rankImage:completeAnimation()
		deadImage:completeAnimation()
		countdownBacking:completeAnimation()
		rankImage:setAlpha( 1 )
		deadImage:setAlpha( 0 )
		countdownBacking:setRGB( 0, 0, 0 )
		countdownBacking:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PlayerDead = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				deadImage:completeAnimation()
				self.deadImage:setAlpha( 1 )
				self.clipFinished( deadImage, {} )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				self.clipFinished( rankImage, {} )
			end
		},
		PlayerHasObjective = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setRGB( 0.99, 0.81, 0.19 )
				self.countdownBacking:setAlpha( 0.79 )
				self.clipFinished( countdownBacking, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

