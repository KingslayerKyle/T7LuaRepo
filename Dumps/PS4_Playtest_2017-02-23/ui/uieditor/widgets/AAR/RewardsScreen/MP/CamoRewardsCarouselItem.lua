require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.CamoRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.CamoRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.CamoRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CamoRewardsCarouselItem )
	self.id = "CamoRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 414 )
	self:setTopBottom( 0, 0, 0, 666 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local CamoRewardsCarouselItemInternal = CoD.CamoRewardsCarouselItemInternal.new( menu, controller )
	CamoRewardsCarouselItemInternal:setLeftRight( 0, 1, 0, 0 )
	CamoRewardsCarouselItemInternal:setTopBottom( 0, 1, 0, 0 )
	CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.75, 0.75, 0.75 )
	CamoRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		CamoRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( CamoRewardsCarouselItemInternal )
	self.CamoRewardsCarouselItemInternal = CamoRewardsCarouselItemInternal
	
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
		CamoRewardsCarouselItemInternal:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB00:completeAnimation()
		FocusBarB0:completeAnimation()
		FETitleNumBrdr0:setAlpha( 1 )
		CamoRewardsCarouselItemInternal:setScale( 1 )
		CamoRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
		CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.75, 0.75, 0.75 )
		CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.75, 0.75, 0.75 )
		CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.75, 0.75, 0.75 )
		CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.75, 0.75, 0.75 )
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
				self:setupElementClipCounter( 2 )
				CamoRewardsCarouselItemInternal:completeAnimation()
				CamoRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				self.clipFinished( CamoRewardsCarouselItemInternal, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CamoRewardsCarouselItemInternal:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoRewardsCarouselItemInternal:setScale( 1.1 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
				self.clipFinished( CamoRewardsCarouselItemInternal, {} )
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
				self:setupElementClipCounter( 2 )
				local CamoRewardsCarouselItemInternalFrame2 = function ( CamoRewardsCarouselItemInternal, event )
					local CamoRewardsCarouselItemInternalFrame3 = function ( CamoRewardsCarouselItemInternal, event )
						if not event.interrupted then
							CamoRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							CamoRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
						end
						CamoRewardsCarouselItemInternal:setScale( 1.1 )
						CamoRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.67, 0.67, 0.67 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.67, 0.67, 0.67 )
						if event.interrupted then
							self.clipFinished( CamoRewardsCarouselItemInternal, event )
						else
							CamoRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CamoRewardsCarouselItemInternalFrame3( CamoRewardsCarouselItemInternal, event )
						return 
					else
						CamoRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						CamoRewardsCarouselItemInternal:setScale( 1.15 )
						CamoRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.66 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.57, 0.57, 0.57 )
						CamoRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", CamoRewardsCarouselItemInternalFrame3 )
					end
				end
				
				CamoRewardsCarouselItemInternal:completeAnimation()
				CamoRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:completeAnimation()
				CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:completeAnimation()
				self.CamoRewardsCarouselItemInternal:setScale( 1 )
				self.CamoRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem1.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem2.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem3.Border:setRGB( 0.37, 0.37, 0.37 )
				self.CamoRewardsCarouselItemInternal.IndividualRewardItem4.Border:setRGB( 0.37, 0.37, 0.37 )
				CamoRewardsCarouselItemInternalFrame2( CamoRewardsCarouselItemInternal, {} )
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
		self.CamoRewardsCarouselItemInternal:close()
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

