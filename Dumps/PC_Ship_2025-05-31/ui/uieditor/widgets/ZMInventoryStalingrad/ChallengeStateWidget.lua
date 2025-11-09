require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.ChallengeStateWidget = InheritFrom( LUI.UIElement )
CoD.ChallengeStateWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChallengeStateWidget )
	self.id = "ChallengeStateWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 85 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 0, 85 )
	Backing:setTopBottom( true, false, 0, 85 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local IconOutline = LUI.UIImage.new()
	IconOutline:setLeftRight( true, false, 0, 85 )
	IconOutline:setTopBottom( true, false, 0, 85 )
	self:addElement( IconOutline )
	self.IconOutline = IconOutline
	
	local BackPanel = CoD.FE_ButtonPanel.new( menu, controller )
	BackPanel:setLeftRight( true, false, 1, 85 )
	BackPanel:setTopBottom( true, false, 0, 45 )
	BackPanel:setRGB( 0.24, 0.24, 0.26 )
	BackPanel:setAlpha( 0 )
	self:addElement( BackPanel )
	self.BackPanel = BackPanel
	
	local RewardUnclaimedImage = LUI.UIImage.new()
	RewardUnclaimedImage:setLeftRight( true, false, 0, 85 )
	RewardUnclaimedImage:setTopBottom( true, false, 0, 85 )
	RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_zm_dlc_trials_active" ) )
	self:addElement( RewardUnclaimedImage )
	self.RewardUnclaimedImage = RewardUnclaimedImage
	
	local RewardClaimedImage = LUI.UIImage.new()
	RewardClaimedImage:setLeftRight( true, false, 0, 85 )
	RewardClaimedImage:setTopBottom( true, false, 0, 85 )
	RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_zm_dlc_trials_active" ) )
	self:addElement( RewardClaimedImage )
	self.RewardClaimedImage = RewardClaimedImage
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, false, 0, 85 )
	HighlightFrame:setTopBottom( true, false, 0, 85 )
	HighlightFrame:setAlpha( 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Backing:completeAnimation()
				self.Backing:setLeftRight( true, false, 0, 85 )
				self.Backing:setTopBottom( true, false, 0, 85 )
				self.clipFinished( Backing, {} )
				IconOutline:completeAnimation()
				self.IconOutline:setAlpha( 1 )
				self.clipFinished( IconOutline, {} )
				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )
				RewardUnclaimedImage:completeAnimation()
				self.RewardUnclaimedImage:setAlpha( 0 )
				self.clipFinished( RewardUnclaimedImage, {} )
				RewardClaimedImage:completeAnimation()
				self.RewardClaimedImage:setAlpha( 0 )
				self.clipFinished( RewardClaimedImage, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
			end
		},
		TrialIncomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				IconOutline:completeAnimation()
				self.IconOutline:setAlpha( 1 )
				self.clipFinished( IconOutline, {} )
				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )
				RewardUnclaimedImage:completeAnimation()
				self.RewardUnclaimedImage:setRGB( 0, 0, 0 )
				self.RewardUnclaimedImage:setAlpha( 0 )
				self.clipFinished( RewardUnclaimedImage, {} )
				RewardClaimedImage:completeAnimation()
				self.RewardClaimedImage:setAlpha( 0 )
				self.clipFinished( RewardClaimedImage, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
			end
		},
		TrialCompleteRewardUnclaimed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				IconOutline:completeAnimation()
				self.IconOutline:setAlpha( 0 )
				self.clipFinished( IconOutline, {} )
				BackPanel:completeAnimation()
				self.BackPanel:setAlpha( 0 )
				self.clipFinished( BackPanel, {} )
				RewardUnclaimedImage:completeAnimation()
				self.RewardUnclaimedImage:setRGB( 1, 1, 1 )
				self.RewardUnclaimedImage:setAlpha( 1 )
				self.clipFinished( RewardUnclaimedImage, {} )
				RewardClaimedImage:completeAnimation()
				self.RewardClaimedImage:setAlpha( 0 )
				self.clipFinished( RewardClaimedImage, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
			end
		},
		TrialCompleteRewardClaimed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				IconOutline:completeAnimation()
				self.IconOutline:setAlpha( 0 )
				self.clipFinished( IconOutline, {} )
				RewardUnclaimedImage:completeAnimation()
				self.RewardUnclaimedImage:setRGB( 1, 1, 1 )
				self.RewardUnclaimedImage:setAlpha( 0 )
				self.clipFinished( RewardUnclaimedImage, {} )
				RewardClaimedImage:completeAnimation()
				self.RewardClaimedImage:setAlpha( 1 )
				self.clipFinished( RewardClaimedImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackPanel:close()
		element.HighlightFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

