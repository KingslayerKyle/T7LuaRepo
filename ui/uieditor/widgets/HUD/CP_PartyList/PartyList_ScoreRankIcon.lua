-- 6cd5a412199fd88c2feaa5347d6d0a64
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local countdownBacking = LUI.UIImage.new()
	countdownBacking:setLeftRight( true, true, 0, 0 )
	countdownBacking:setTopBottom( true, true, 0, 0 )
	countdownBacking:setRGB( 0, 0, 0 )
	countdownBacking:setAlpha( 0 )
	self:addElement( countdownBacking )
	self.countdownBacking = countdownBacking
	
	local deadImage = LUI.UIImage.new()
	deadImage:setLeftRight( true, true, 0, 0 )
	deadImage:setTopBottom( true, true, 0, 0 )
	deadImage:setAlpha( 0 )
	deadImage:setImage( RegisterImage( "uie_t7_hud_playerlist_dead" ) )
	self:addElement( deadImage )
	self.deadImage = deadImage
	
	local countdownTimer = LUI.UIText.new()
	countdownTimer:setLeftRight( true, true, 0, 0 )
	countdownTimer:setTopBottom( true, true, 0, 0 )
	countdownTimer:setAlpha( 0 )
	countdownTimer:setText( Engine.Localize( "20" ) )
	countdownTimer:setTTF( "fonts/default.ttf" )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countdownTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( countdownTimer )
	self.countdownTimer = countdownTimer
	
	local rankImage = LUI.UIImage.new()
	rankImage:setLeftRight( true, true, 0, 0 )
	rankImage:setTopBottom( true, true, 0, 0 )
	rankImage:setImage( RegisterImage( "uie_t7_rank_1_3" ) )
	self:addElement( rankImage )
	self.rankImage = rankImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setRGB( 0, 0, 0 )
				self.countdownBacking:setAlpha( 0 )
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

