require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.SpecialistRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.SpecialistCompletionEpicRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.SpecialistCompletionEpicRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialistCompletionEpicRewardsCarouselItem )
	self.id = "SpecialistCompletionEpicRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 414 )
	self:setTopBottom( 0, 0, 0, 666 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local SpecialistRewardsCarouselItemInternal = CoD.SpecialistRewardsCarouselItemInternal.new( menu, controller )
	SpecialistRewardsCarouselItemInternal:setLeftRight( 0, 1, 0, 0 )
	SpecialistRewardsCarouselItemInternal:setTopBottom( 0, 1, 0, 0 )
	SpecialistRewardsCarouselItemInternal:setScale( 1.1 )
	SpecialistRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		SpecialistRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( SpecialistRewardsCarouselItemInternal )
	self.SpecialistRewardsCarouselItemInternal = SpecialistRewardsCarouselItemInternal
	
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
	
	self.resetProperties = function ()
		FETitleNumBrdr0:completeAnimation()
		SpecialistRewardsCarouselItemInternal:completeAnimation()
		FocusBarB00:completeAnimation()
		FocusBarB0:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		FETitleNumBrdr0:setAlpha( 1 )
		SpecialistRewardsCarouselItemInternal:setScale( 1.1 )
		SpecialistRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
		SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 1, 1, 1 )
		SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 1, 1, 1 )
		SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 1, 1, 1 )
		SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 1, 1, 1 )
		FocusBarB00:setAlpha( 0 )
		FocusBarB0:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -9, 9 )
		FocusBarT:setTopBottom( 0, 0, 0, 6 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setLeftRight( 0, 1, -9, 9 )
		FocusBarB:setTopBottom( 1, 1, 0, -4 )
		FocusBarB:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				SpecialistRewardsCarouselItemInternal:completeAnimation()
				SpecialistRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.SpecialistRewardsCarouselItemInternal:setScale( 1 )
				self.SpecialistRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( SpecialistRewardsCarouselItemInternal, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local SpecialistRewardsCarouselItemInternalFrame2 = function ( SpecialistRewardsCarouselItemInternal, event )
					local SpecialistRewardsCarouselItemInternalFrame3 = function ( SpecialistRewardsCarouselItemInternal, event )
						if not event.interrupted then
							SpecialistRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							SpecialistRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
						end
						SpecialistRewardsCarouselItemInternal:setScale( 1.1 )
						SpecialistRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
						if event.interrupted then
							self.clipFinished( SpecialistRewardsCarouselItemInternal, event )
						else
							SpecialistRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SpecialistRewardsCarouselItemInternalFrame3( SpecialistRewardsCarouselItemInternal, event )
						return 
					else
						SpecialistRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						SpecialistRewardsCarouselItemInternal:setScale( 1.15 )
						SpecialistRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.66 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.57, 0.57, 0.57 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.57, 0.57, 0.57 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.57, 0.57, 0.57 )
						SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.57, 0.57, 0.57 )
						SpecialistRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", SpecialistRewardsCarouselItemInternalFrame3 )
					end
				end
				
				SpecialistRewardsCarouselItemInternal:completeAnimation()
				SpecialistRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.SpecialistRewardsCarouselItemInternal:setScale( 1 )
				self.SpecialistRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.SpecialistRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				SpecialistRewardsCarouselItemInternalFrame2( SpecialistRewardsCarouselItemInternal, {} )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SpecialistRewardsCarouselItemInternal:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.FETitleNumBrdr0:close()
		self.FocusBarB00:close()
		self.FocusBarB0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

