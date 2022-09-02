-- e70981a87f4ce3e8dc4f1d8f81710746
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.IncentiveRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.IncentiveRewardsCarouselItem = InheritFrom( LUI.UIElement )
CoD.IncentiveRewardsCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IncentiveRewardsCarouselItem )
	self.id = "IncentiveRewardsCarouselItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 444 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local IncentiveRewardsCarouselItemInternal = CoD.IncentiveRewardsCarouselItemInternal.new( menu, controller )
	IncentiveRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
	IncentiveRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
	IncentiveRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		IncentiveRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( IncentiveRewardsCarouselItemInternal )
	self.IncentiveRewardsCarouselItemInternal = IncentiveRewardsCarouselItemInternal
	
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

				IncentiveRewardsCarouselItemInternal:completeAnimation()
				self.IncentiveRewardsCarouselItemInternal:setScale( 1 )
				self.clipFinished( IncentiveRewardsCarouselItemInternal, {} )

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

				IncentiveRewardsCarouselItemInternal:completeAnimation()
				self.IncentiveRewardsCarouselItemInternal:setScale( 1.1 )
				self.clipFinished( IncentiveRewardsCarouselItemInternal, {} )

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

				local IncentiveRewardsCarouselItemInternalFrame2 = function ( IncentiveRewardsCarouselItemInternal, event )
					local IncentiveRewardsCarouselItemInternalFrame3 = function ( IncentiveRewardsCarouselItemInternal, event )
						if not event.interrupted then
							IncentiveRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						IncentiveRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
						IncentiveRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
						IncentiveRewardsCarouselItemInternal:setScale( 1.1 )
						if event.interrupted then
							self.clipFinished( IncentiveRewardsCarouselItemInternal, event )
						else
							IncentiveRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						IncentiveRewardsCarouselItemInternalFrame3( IncentiveRewardsCarouselItemInternal, event )
						return 
					else
						IncentiveRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						IncentiveRewardsCarouselItemInternal:setScale( 1.15 )
						IncentiveRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", IncentiveRewardsCarouselItemInternalFrame3 )
					end
				end
				
				IncentiveRewardsCarouselItemInternal:completeAnimation()
				self.IncentiveRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
				self.IncentiveRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
				self.IncentiveRewardsCarouselItemInternal:setScale( 1 )
				IncentiveRewardsCarouselItemInternalFrame2( IncentiveRewardsCarouselItemInternal, {} )

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
		element.IncentiveRewardsCarouselItemInternal:close()
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

