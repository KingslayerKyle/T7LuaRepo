require( "ui.uieditor.widgets.Heroes.heroCarouselItem_Front" )
require( "ui.uieditor.widgets.Heroes.heroCarouselItem_Back" )

CoD.HeroCarouselItemStates = {
	Inspecting = 1,
	EdittingLoadout = 2
}
local PreLoadFunc = function ( self, controller )
	self.restoreState = function ()
		return true
	end
	
end

local PostLoadFunc = function ( self, controller )
	local originalWidth, originalHeight = self:getLocalSize()
	self.getWidthInList = function ()
		if self.gridInfoTable then
			if self.gridInfoTable.parentGrid.activeWidget == self then
				return originalWidth
			else
				return 90
			end
		else
			
		end
	end
	
	self.setMode = function ( self, mode )
		self.currentMode = mode
		if mode == CoD.HeroCarouselItemStates.Inspecting then
			self:setState( "DefaultState" )
			if self:isInFocus() then
				CoD.SwapFocusableElements( controller, self.cardBack, self.cardFront )
			end
			self.forceChildNavigation = false
		elseif mode == CoD.HeroCarouselItemStates.EdittingLoadout then
			self:setState( "Flipped" )
			if self:isInFocus() then
				CoD.SwapFocusableElements( controller, self.cardFront, self.cardBack )
			end
			self.forceChildNavigation = true
		end
	end
	
	self:setMode( CoD.HeroCarouselItemStates.Inspecting )
	self.cardFront.navigation = nil
	self.cardBack.navigation = nil
end

CoD.heroCarouselItem = InheritFrom( LUI.UIElement )
CoD.heroCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.heroCarouselItem )
	self.id = "heroCarouselItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local cardFront = CoD.heroCarouselItem_Front.new( menu, controller )
	cardFront:setLeftRight( true, true, 0, 0 )
	cardFront:setTopBottom( true, true, 0, 0 )
	cardFront:setRGB( 1, 1, 1 )
	cardFront.border:setRGB( 1, 1, 1 )
	cardFront:linkToElementModel( self, nil, false, function ( model )
		cardFront:setModel( model, controller )
	end )
	self:addElement( cardFront )
	self.cardFront = cardFront
	
	local cardBack = CoD.heroCarouselItem_Back.new( menu, controller )
	cardBack:setLeftRight( true, true, 0, 0 )
	cardBack:setTopBottom( true, true, 0, 0 )
	cardBack:setRGB( 1, 1, 1 )
	cardBack:setAlpha( 0 )
	cardBack.border:setRGB( 1, 1, 1 )
	cardBack:linkToElementModel( self, nil, false, function ( model )
		cardBack:setModel( model, controller )
	end )
	self:addElement( cardBack )
	self.cardBack = cardBack
	
	cardFront.navigation = {
		left = cardBack,
		up = cardBack
	}
	cardBack.navigation = {
		left = cardFront,
		up = cardFront
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cardFront:completeAnimation()
				cardFront.HeroExtraCamRender:completeAnimation()
				cardFront.HeroLiveFeed:completeAnimation()
				cardFront.heroNumber:completeAnimation()
				cardFront.lockImage:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 40, -40 )
				self.cardFront:setAlpha( 1 )
				self.cardFront:setYRot( 0 )
				self.cardFront.HeroExtraCamRender:setAlpha( 1 )
				self.cardFront.HeroLiveFeed:setAlpha( 0 )
				self.cardFront.heroNumber:setAlpha( 0 )
				self.cardFront.border:setRGB( 0.32, 0.32, 0.32 )
				self.clipFinished( cardFront, {} )
				cardBack:completeAnimation()
				self.cardBack:setAlpha( 0 )
				self.cardBack:setYRot( 0 )
				self.cardBack:setZoom( 0 )
				self.clipFinished( cardBack, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				cardFront:completeAnimation()
				cardFront.HeroExtraCamRender:completeAnimation()
				cardFront.HeroLiveFeed:completeAnimation()
				cardFront.heroNumber:completeAnimation()
				cardFront.lockImage:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 0, 0 )
				self.cardFront:setAlpha( 1 )
				self.cardFront:setYRot( 0 )
				self.cardFront:setZoom( 0 )
				self.cardFront.HeroExtraCamRender:setAlpha( 0 )
				self.cardFront.HeroLiveFeed:setAlpha( 1 )
				self.cardFront.heroNumber:setAlpha( 1 )
				self.cardFront.border:setRGB( 1, 1, 1 )
				self.clipFinished( cardFront, {} )
			end,
			Flipped = function ()
				self:setupElementClipCounter( 2 )
				local cardFrontFrame2 = function ( cardFront, event )
					local cardFrontFrame3 = function ( cardFront, event )
						local cardFrontFrame4 = function ( cardFront, event )
							if not event.interrupted then
								cardFront:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								cardFront.border:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							end
							cardFront:setLeftRight( true, true, 0, 0 )
							cardFront:setTopBottom( true, true, 0, 0 )
							cardFront:setAlpha( 0 )
							cardFront:setYRot( 90 )
							cardFront:setZoom( 100 )
							cardFront.border:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( cardFront, event )
							else
								cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							cardFrontFrame4( cardFront, event )
							return 
						else
							cardFront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							cardFront:setYRot( 90 )
							cardFront:registerEventHandler( "transition_complete_keyframe", cardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						cardFrontFrame3( cardFront, event )
						return 
					else
						cardFront:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						cardFront:setZoom( 100 )
						cardFront:registerEventHandler( "transition_complete_keyframe", cardFrontFrame3 )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 0, 0 )
				self.cardFront:setAlpha( 1 )
				self.cardFront:setYRot( 0 )
				self.cardFront:setZoom( 0 )
				self.cardFront.border:setRGB( 1, 1, 1 )
				cardFrontFrame2( cardFront, {} )
				local cardBackFrame2 = function ( cardBack, event )
					local cardBackFrame3 = function ( cardBack, event )
						local cardBackFrame4 = function ( cardBack, event )
							local cardBackFrame5 = function ( cardBack, event )
								if not event.interrupted then
									cardBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									cardBack.border:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
								end
								cardBack:setAlpha( 1 )
								cardBack:setYRot( 0 )
								cardBack:setZoom( 0 )
								cardBack.border:setRGB( 1, 1, 1 )
								if event.interrupted then
									self.clipFinished( cardBack, event )
								else
									cardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cardBackFrame5( cardBack, event )
								return 
							else
								cardBack:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cardBack:setYRot( 0 )
								cardBack:registerEventHandler( "transition_complete_keyframe", cardBackFrame5 )
							end
						end
						
						if event.interrupted then
							cardBackFrame4( cardBack, event )
							return 
						else
							cardBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							cardBack:setAlpha( 1 )
							cardBack:registerEventHandler( "transition_complete_keyframe", cardBackFrame4 )
						end
					end
					
					if event.interrupted then
						cardBackFrame3( cardBack, event )
						return 
					else
						cardBack:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cardBack:registerEventHandler( "transition_complete_keyframe", cardBackFrame3 )
					end
				end
				
				cardBack:completeAnimation()
				cardBack.border:completeAnimation()
				self.cardBack:setAlpha( 0 )
				self.cardBack:setYRot( -90 )
				self.cardBack:setZoom( 100 )
				self.cardBack.border:setRGB( 1, 1, 1 )
				cardBackFrame2( cardBack, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local cardFrontFrame2 = function ( cardFront, event )
					if not event.interrupted then
						cardFront:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.HeroExtraCamRender:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.HeroLiveFeed:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.heroNumber:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.border:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					cardFront:setLeftRight( true, true, 0, 0 )
					cardFront:setTopBottom( true, true, 0, 0 )
					cardFront.HeroExtraCamRender:setAlpha( 1 )
					cardFront.HeroLiveFeed:setAlpha( 0 )
					cardFront.heroNumber:setAlpha( 1 )
					cardFront.border:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( cardFront, event )
					else
						cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.HeroExtraCamRender:completeAnimation()
				cardFront.HeroLiveFeed:completeAnimation()
				cardFront.heroNumber:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 40, -40 )
				self.cardFront.HeroExtraCamRender:setAlpha( 1 )
				self.cardFront.HeroLiveFeed:setAlpha( 0 )
				self.cardFront.heroNumber:setAlpha( 0 )
				self.cardFront.border:setRGB( 0.25, 0.25, 0.25 )
				cardFrontFrame2( cardFront, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local cardFrontFrame2 = function ( cardFront, event )
					if not event.interrupted then
						cardFront:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.HeroExtraCamRender:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.HeroLiveFeed:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.heroNumber:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						cardFront.border:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					cardFront:setLeftRight( true, true, 0, 0 )
					cardFront:setTopBottom( true, true, 40, -40 )
					cardFront.HeroExtraCamRender:setAlpha( 1 )
					cardFront.HeroLiveFeed:setAlpha( 0 )
					cardFront.heroNumber:setAlpha( 0 )
					cardFront.border:setRGB( 0.25, 0.25, 0.25 )
					if event.interrupted then
						self.clipFinished( cardFront, event )
					else
						cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.HeroExtraCamRender:completeAnimation()
				cardFront.HeroLiveFeed:completeAnimation()
				cardFront.heroNumber:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 0, 0 )
				self.cardFront.HeroExtraCamRender:setAlpha( 1 )
				self.cardFront.HeroLiveFeed:setAlpha( 0 )
				self.cardFront.heroNumber:setAlpha( 1 )
				self.cardFront.border:setRGB( 1, 1, 1 )
				cardFrontFrame2( cardFront, {} )
			end,
			EdittingOtherItem = function ()
				self:setupElementClipCounter( 2 )
				local cardFrontFrame2 = function ( cardFront, event )
					if not event.interrupted then
						cardFront:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						cardFront.border:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					cardFront:setLeftRight( true, true, 0, 0 )
					cardFront:setTopBottom( true, true, 40, -40 )
					cardFront:setAlpha( 0.05 )
					cardFront.border:setRGB( 0.25, 0.25, 0.25 )
					if event.interrupted then
						self.clipFinished( cardFront, event )
					else
						cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 40, -40 )
				self.cardFront:setAlpha( 1 )
				self.cardFront.border:setRGB( 0.25, 0.25, 0.25 )
				cardFrontFrame2( cardFront, {} )
				cardBack:completeAnimation()
				self.cardBack:setAlpha( 0 )
				self.clipFinished( cardBack, {} )
			end
		},
		Flipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cardFront:completeAnimation()
				self.cardFront:setAlpha( 0 )
				self.cardFront:setYRot( 0 )
				self.cardFront:setZoom( 0 )
				self.clipFinished( cardFront, {} )
				cardBack:completeAnimation()
				cardBack.border:completeAnimation()
				self.cardBack:setAlpha( 1 )
				self.cardBack:setYRot( 0 )
				self.cardBack:setZoom( 0 )
				self.cardBack.border:setRGB( 1, 1, 1 )
				self.clipFinished( cardBack, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local cardFrontFrame2 = function ( cardFront, event )
					local cardFrontFrame3 = function ( cardFront, event )
						local cardFrontFrame4 = function ( cardFront, event )
							local cardFrontFrame5 = function ( cardFront, event )
								if not event.interrupted then
									cardFront:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									cardFront.border:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
								end
								cardFront:setAlpha( 1 )
								cardFront:setYRot( 0 )
								cardFront:setZoom( 0 )
								cardFront.border:setRGB( 1, 1, 1 )
								if event.interrupted then
									self.clipFinished( cardFront, event )
								else
									cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cardFrontFrame5( cardFront, event )
								return 
							else
								cardFront:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cardFront:setYRot( 0 )
								cardFront:registerEventHandler( "transition_complete_keyframe", cardFrontFrame5 )
							end
						end
						
						if event.interrupted then
							cardFrontFrame4( cardFront, event )
							return 
						else
							cardFront:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							cardFront:setAlpha( 1 )
							cardFront:registerEventHandler( "transition_complete_keyframe", cardFrontFrame4 )
						end
					end
					
					if event.interrupted then
						cardFrontFrame3( cardFront, event )
						return 
					else
						cardFront:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cardFront:registerEventHandler( "transition_complete_keyframe", cardFrontFrame3 )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setAlpha( 0 )
				self.cardFront:setYRot( -90 )
				self.cardFront:setZoom( 100 )
				self.cardFront.border:setRGB( 1, 1, 1 )
				cardFrontFrame2( cardFront, {} )
				local cardBackFrame2 = function ( cardBack, event )
					local cardBackFrame3 = function ( cardBack, event )
						local cardBackFrame4 = function ( cardBack, event )
							if not event.interrupted then
								cardBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								cardBack.border:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							end
							cardBack:setAlpha( 0 )
							cardBack:setYRot( 90 )
							cardBack:setZoom( 100 )
							cardBack.border:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( cardBack, event )
							else
								cardBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							cardBackFrame4( cardBack, event )
							return 
						else
							cardBack:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							cardBack:setYRot( 90 )
							cardBack:registerEventHandler( "transition_complete_keyframe", cardBackFrame4 )
						end
					end
					
					if event.interrupted then
						cardBackFrame3( cardBack, event )
						return 
					else
						cardBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						cardBack:setZoom( 100 )
						cardBack:registerEventHandler( "transition_complete_keyframe", cardBackFrame3 )
					end
				end
				
				cardBack:completeAnimation()
				cardBack.border:completeAnimation()
				self.cardBack:setAlpha( 1 )
				self.cardBack:setYRot( 0 )
				self.cardBack:setZoom( 0 )
				self.cardBack.border:setRGB( 1, 1, 1 )
				cardBackFrame2( cardBack, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				cardFront:completeAnimation()
				self.cardFront:setAlpha( 0 )
				self.clipFinished( cardFront, {} )
				cardBack:completeAnimation()
				cardBack.border:completeAnimation()
				self.cardBack:setAlpha( 1 )
				self.cardBack:setYRot( 0 )
				self.cardBack:setZoom( 0 )
				self.cardBack.border:setRGB( 1, 1, 1 )
				self.clipFinished( cardBack, {} )
			end
		},
		EdittingOtherItem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				cardFront:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setAlpha( 0.05 )
				self.cardFront.border:setRGB( 0.25, 0.25, 0.25 )
				self.clipFinished( cardFront, {} )
				cardBack:completeAnimation()
				self.cardBack:setAlpha( 0 )
				self.clipFinished( cardBack, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local cardFrontFrame2 = function ( cardFront, event )
					if not event.interrupted then
						cardFront:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						cardFront.border:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					cardFront:setLeftRight( true, true, 0, 0 )
					cardFront:setTopBottom( true, true, 40, -40 )
					cardFront:setAlpha( 1 )
					cardFront.border:setRGB( 0.25, 0.25, 0.25 )
					if event.interrupted then
						self.clipFinished( cardFront, event )
					else
						cardFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cardFront:completeAnimation()
				cardFront.border:completeAnimation()
				self.cardFront:setLeftRight( true, true, 0, 0 )
				self.cardFront:setTopBottom( true, true, 40, -40 )
				self.cardFront:setAlpha( 0.05 )
				self.cardFront.border:setRGB( 0.25, 0.25, 0.25 )
				cardFrontFrame2( cardFront, {} )
				cardBack:completeAnimation()
				self.cardBack:setAlpha( 0 )
				self.clipFinished( cardBack, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Flipped",
			condition = function ( menu, element, event )
				return IsEdittingLoadoutForHero() and IsCurrentEdittingLoadForHeroWidget( self )
			end
		},
		{
			stateName = "EdittingOtherItem",
			condition = function ( menu, element, event )
				return IsEdittingLoadoutForHero() and not IsCurrentEdittingLoadForHeroWidget( self )
			end
		}
	} )
	cardFront.id = "cardFront"
	cardBack.id = "cardBack"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.cardFront:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.cardFront:close()
		self.cardBack:close()
		CoD.heroCarouselItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

