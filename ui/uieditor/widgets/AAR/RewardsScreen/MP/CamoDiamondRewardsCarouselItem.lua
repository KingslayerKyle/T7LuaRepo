-- 5210fb10601ab2a8ca2a244fdfc7096d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.CamoDiamondRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.CamoDiamondRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.CamoDiamondRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CamoDiamondRewardsCarouselItem )
	self.id = "CamoDiamondRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 444 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local CamoDiamondRewardsCarouselItemInternal = CoD.CamoDiamondRewardsCarouselItemInternal.new( menu, controller )
	CamoDiamondRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
	CamoDiamondRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
	CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoDiamondRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		CamoDiamondRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( CamoDiamondRewardsCarouselItemInternal )
	self.CamoDiamondRewardsCarouselItemInternal = CamoDiamondRewardsCarouselItemInternal
	
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
				CamoDiamondRewardsCarouselItemInternal:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoDiamondRewardsCarouselItemInternal:setScale( 1 )
				self.CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( CamoDiamondRewardsCarouselItemInternal, {} )
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
				CamoDiamondRewardsCarouselItemInternal:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoDiamondRewardsCarouselItemInternal:setScale( 1.1 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
				self.clipFinished( CamoDiamondRewardsCarouselItemInternal, {} )
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
				local CamoDiamondRewardsCarouselItemInternalFrame2 = function ( CamoDiamondRewardsCarouselItemInternal, event )
					local CamoDiamondRewardsCarouselItemInternalFrame3 = function ( CamoDiamondRewardsCarouselItemInternal, event )
						if not event.interrupted then
							CamoDiamondRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
						end
						CamoDiamondRewardsCarouselItemInternal:setScale( 1.1 )
						CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
						if event.interrupted then
							self.clipFinished( CamoDiamondRewardsCarouselItemInternal, event )
						else
							CamoDiamondRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CamoDiamondRewardsCarouselItemInternalFrame3( CamoDiamondRewardsCarouselItemInternal, event )
						return 
					else
						CamoDiamondRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoDiamondRewardsCarouselItemInternal:setScale( 1.15 )
						CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.66 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoDiamondRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", CamoDiamondRewardsCarouselItemInternalFrame3 )
					end
				end
				
				CamoDiamondRewardsCarouselItemInternal:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoDiamondRewardsCarouselItemInternal:setScale( 1 )
				self.CamoDiamondRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoDiamondRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				CamoDiamondRewardsCarouselItemInternalFrame2( CamoDiamondRewardsCarouselItemInternal, {} )
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
		element.CamoDiamondRewardsCarouselItemInternal:close()
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

