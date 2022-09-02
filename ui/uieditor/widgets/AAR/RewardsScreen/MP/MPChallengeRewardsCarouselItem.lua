-- 06e6c46a5d40d86c7a01f4076fb134d1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.MPChallengeRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.MPChallengeRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.MPChallengeRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MPChallengeRewardsCarouselItem )
	self.id = "MPChallengeRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 444 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local MPChallengeRewardsCarouselItemInternal = CoD.MPChallengeRewardsCarouselItemInternal.new( menu, controller )
	MPChallengeRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
	MPChallengeRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
	MPChallengeRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		MPChallengeRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( MPChallengeRewardsCarouselItemInternal )
	self.MPChallengeRewardsCarouselItemInternal = MPChallengeRewardsCarouselItemInternal
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -6, 6 )
	FocusBarB:setTopBottom( false, true, 0, -3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -6, 6 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( false, false, -138, 138 )
	FETitleNumBrdr0:setTopBottom( false, false, -220, 220 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local FocusBarB00 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB00:setLeftRight( false, false, -142, 142 )
	FocusBarB00:setTopBottom( false, false, -216, -222 )
	FocusBarB00:setAlpha( 0 )
	FocusBarB00:setZRot( -180 )
	FocusBarB00:setZoom( 1 )
	self:addElement( FocusBarB00 )
	self.FocusBarB00 = FocusBarB00
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -142, 142 )
	FocusBarB0:setTopBottom( false, false, 221, 217 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				MPChallengeRewardsCarouselItemInternal:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.MPChallengeRewardsCarouselItemInternal:setScale( 1 )
				self.MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( MPChallengeRewardsCarouselItemInternal, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				MPChallengeRewardsCarouselItemInternal:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.MPChallengeRewardsCarouselItemInternal:setScale( 1.1 )
				self.MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
				self.clipFinished( MPChallengeRewardsCarouselItemInternal, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -15, 15 )
				self.FocusBarB:setTopBottom( false, true, 19, 23 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -15, 15 )
				self.FocusBarT:setTopBottom( true, false, -23, -19 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )

				local MPChallengeRewardsCarouselItemInternalFrame2 = function ( MPChallengeRewardsCarouselItemInternal, event )
					local MPChallengeRewardsCarouselItemInternalFrame3 = function ( MPChallengeRewardsCarouselItemInternal, event )
						if not event.interrupted then
							MPChallengeRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
						end
						MPChallengeRewardsCarouselItemInternal:setScale( 1.1 )
						MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
						if event.interrupted then
							self.clipFinished( MPChallengeRewardsCarouselItemInternal, event )
						else
							MPChallengeRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MPChallengeRewardsCarouselItemInternalFrame3( MPChallengeRewardsCarouselItemInternal, event )
						return 
					else
						MPChallengeRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						MPChallengeRewardsCarouselItemInternal:setScale( 1.15 )
						MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.66 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.57, 0.57, 0.57 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.57, 0.57, 0.57 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.57, 0.57, 0.57 )
						MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.57, 0.57, 0.57 )
						MPChallengeRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", MPChallengeRewardsCarouselItemInternalFrame3 )
					end
				end
				
				MPChallengeRewardsCarouselItemInternal:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()

				MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.MPChallengeRewardsCarouselItemInternal:setScale( 1 )
				self.MPChallengeRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.MPChallengeRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				MPChallengeRewardsCarouselItemInternalFrame2( MPChallengeRewardsCarouselItemInternal, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setAlpha( 0 )
				self.clipFinished( FocusBarB00, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 5 )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( false, false, -138, 138 )
				self.FETitleNumBrdr0:setTopBottom( false, false, -220, 220 )
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )

				FocusBarB00:completeAnimation()
				self.FocusBarB00:setLeftRight( false, false, -142, 142 )
				self.FocusBarB00:setTopBottom( false, false, -216, -222 )
				self.FocusBarB00:setAlpha( 1 )
				self.clipFinished( FocusBarB00, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( false, false, -142, 142 )
				self.FocusBarB0:setTopBottom( false, false, 221, 217 )
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPChallengeRewardsCarouselItemInternal:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.FETitleNumBrdr0:close()
		element.FocusBarB00:close()
		element.FocusBarB0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

