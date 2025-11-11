require( "ui.uieditor.widgets.AAR.RewardsScreen.ZM.ZMDailyChallengeRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.ZMDailyChallengeRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.ZMDailyChallengeRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMDailyChallengeRewardsCarouselItem )
	self.id = "ZMDailyChallengeRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 414 )
	self:setTopBottom( 0, 0, 0, 666 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -9, 9 )
	FocusBarB:setTopBottom( 1, 1, 0, -4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -9, 9 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0.5, 0.5, -207, 207 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -330, 330 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local FocusBarB00 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB00:setLeftRight( 0.5, 0.5, -213, 213 )
	FocusBarB00:setTopBottom( 0.5, 0.5, -323.5, -332.5 )
	FocusBarB00:setAlpha( 0 )
	FocusBarB00:setZRot( -180 )
	FocusBarB00:setZoom( 1 )
	self:addElement( FocusBarB00 )
	self.FocusBarB00 = FocusBarB00
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0.5, 0.5, -213, 213 )
	FocusBarB0:setTopBottom( 0.5, 0.5, 331, 325 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local ZMDailyChallengeRewardsCarouselItemInternal = CoD.ZMDailyChallengeRewardsCarouselItemInternal.new( menu, controller )
	ZMDailyChallengeRewardsCarouselItemInternal:setLeftRight( 0, 0, 0, 414 )
	ZMDailyChallengeRewardsCarouselItemInternal:setTopBottom( 0, 0, 5, 671 )
	ZMDailyChallengeRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		ZMDailyChallengeRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( ZMDailyChallengeRewardsCarouselItemInternal )
	self.ZMDailyChallengeRewardsCarouselItemInternal = ZMDailyChallengeRewardsCarouselItemInternal
	
	self.resetProperties = function ()
		FETitleNumBrdr0:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB00:completeAnimation()
		FocusBarB0:completeAnimation()
		FETitleNumBrdr0:setAlpha( 1 )
		FocusBarB:setLeftRight( 0, 1, -9, 9 )
		FocusBarB:setTopBottom( 1, 1, 0, -4 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -9, 9 )
		FocusBarT:setTopBottom( 0, 0, 0, 6 )
		FocusBarT:setAlpha( 0 )
		FocusBarB00:setAlpha( 0 )
		FocusBarB0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, -22, 22 )
				self.FocusBarB:setTopBottom( 1, 1, 29, 35 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -22, 22 )
				self.FocusBarT:setTopBottom( 0, 0, -35, -29 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 1 )
				self.clipFinished( FocusBarB00, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.FETitleNumBrdr0:close()
		self.FocusBarB00:close()
		self.FocusBarB0:close()
		self.ZMDailyChallengeRewardsCarouselItemInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

