require( "ui.uieditor.widgets.AAR.RewardsScreen.MP.BlackmarketRewardsCarouselItemInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.BlackmarketRewardsCarouselItemRare = InheritFrom( LUI.UIElement )
CoD.BlackmarketRewardsCarouselItemRare.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackmarketRewardsCarouselItemRare )
	self.id = "BlackmarketRewardsCarouselItemRare"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 444 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackmarketRewardsCarouselItemInternal = CoD.BlackmarketRewardsCarouselItemInternal.new( menu, controller )
	BlackmarketRewardsCarouselItemInternal:setLeftRight( true, true, 0, 0 )
	BlackmarketRewardsCarouselItemInternal:setTopBottom( true, true, 0, 0 )
	BlackmarketRewardsCarouselItemInternal.highlight:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	BlackmarketRewardsCarouselItemInternal.BlackmarketRewardsCarouselFX.glow00:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	BlackmarketRewardsCarouselItemInternal.BlackmarketRewardsCarouselFX.fxEmber2:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	BlackmarketRewardsCarouselItemInternal.BlackmarketRewardsCarouselFX.fxEmber:setRGB( ColorSet.BlackMarketRare.r, ColorSet.BlackMarketRare.g, ColorSet.BlackMarketRare.b )
	BlackmarketRewardsCarouselItemInternal:linkToElementModel( self, nil, false, function ( model )
		BlackmarketRewardsCarouselItemInternal:setModel( model, controller )
	end )
	self:addElement( BlackmarketRewardsCarouselItemInternal )
	self.BlackmarketRewardsCarouselItemInternal = BlackmarketRewardsCarouselItemInternal
	
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
				BlackmarketRewardsCarouselItemInternal:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.CardTitleBacking:completeAnimation()
				self.BlackmarketRewardsCarouselItemInternal:setScale( 1 )
				self.BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.BlackmarketRewardsCarouselItemInternal.CardTitleBacking:setRGB( 0.31, 0.31, 0.82 )
				self.clipFinished( BlackmarketRewardsCarouselItemInternal, {} )
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
				BlackmarketRewardsCarouselItemInternal:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.CardTitleBacking:completeAnimation()
				self.BlackmarketRewardsCarouselItemInternal:setScale( 1.1 )
				self.BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
				self.BlackmarketRewardsCarouselItemInternal.CardTitleBacking:setRGB( 0.31, 0.31, 0.82 )
				self.clipFinished( BlackmarketRewardsCarouselItemInternal, {} )
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
				local BlackmarketRewardsCarouselItemInternalFrame2 = function ( BlackmarketRewardsCarouselItemInternal, event )
					local BlackmarketRewardsCarouselItemInternalFrame3 = function ( BlackmarketRewardsCarouselItemInternal, event )
						if not event.interrupted then
							BlackmarketRewardsCarouselItemInternal:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
							BlackmarketRewardsCarouselItemInternal.CardTitleBacking:beginAnimation( "subkeyframe", 60, false, true, CoD.TweenType.Linear )
						end
						BlackmarketRewardsCarouselItemInternal:setScale( 1.1 )
						BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.75 )
						BlackmarketRewardsCarouselItemInternal.CardTitleBacking:setRGB( 0.31, 0.31, 0.82 )
						if event.interrupted then
							self.clipFinished( BlackmarketRewardsCarouselItemInternal, event )
						else
							BlackmarketRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackmarketRewardsCarouselItemInternalFrame3( BlackmarketRewardsCarouselItemInternal, event )
						return 
					else
						BlackmarketRewardsCarouselItemInternal:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
						BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Linear )
						BlackmarketRewardsCarouselItemInternal:setScale( 1.15 )
						BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.66 )
						BlackmarketRewardsCarouselItemInternal:registerEventHandler( "transition_complete_keyframe", BlackmarketRewardsCarouselItemInternalFrame3 )
					end
				end
				
				BlackmarketRewardsCarouselItemInternal:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.CardTitleBacking:completeAnimation()
				self.BlackmarketRewardsCarouselItemInternal:setScale( 1 )
				self.BlackmarketRewardsCarouselItemInternal.FEButtonPanel0:setAlpha( 0.5 )
				self.BlackmarketRewardsCarouselItemInternal.CardTitleBacking:setRGB( 0.31, 0.31, 0.82 )
				BlackmarketRewardsCarouselItemInternalFrame2( BlackmarketRewardsCarouselItemInternal, {} )
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
				self:setupElementClipCounter( 6 )
				BlackmarketRewardsCarouselItemInternal:completeAnimation()
				BlackmarketRewardsCarouselItemInternal.CardTitleBacking:completeAnimation()
				self.BlackmarketRewardsCarouselItemInternal.CardTitleBacking:setRGB( 0.31, 0.31, 0.82 )
				self.clipFinished( BlackmarketRewardsCarouselItemInternal, {} )
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
		element.BlackmarketRewardsCarouselItemInternal:close()
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

