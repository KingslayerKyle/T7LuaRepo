require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Internal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PCSpecific = function ( self, controller )
	self.m_preventFromBeingCurrentMouseFocus = true
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
	
	if CoD.isPC then
		PCSpecific( self, controller )
	end
end

CoD.ChooseCharacterLoadoutCarouselItem = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem )
	self.id = "ChooseCharacterLoadoutCarouselItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.ChooseCharacterLoadoutCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( true, true, 0, 0 )
	item:setTopBottom( true, true, 30, -30 )
	item.apeRender:setAlpha( 1 )
	item.heroNumber:setAlpha( 0 )
	item.border:setRGB( 0.29, 0.29, 0.29 )
	item.infoArea:setAlpha( 0 )
	item:linkToElementModel( self, nil, false, function ( model )
		item:setModel( model, controller )
	end )
	item:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroLoadoutPreviewChange( element, controller )
		return retVal
	end )
	self:addElement( item )
	self.item = item
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarB0:setTopBottom( false, false, 70, 74 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 1 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 1 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.characterPlusBackground:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.characterOverlay:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 1 )
				self.item.characterPlusBackground:setAlpha( 1 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.characterOverlay:setAlpha( 1 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.infoArea:setAlpha( 1 )
				self.item.FETitleNumBrdr0:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.FETitleNumBrdr0:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 0.9 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.characterPlusBackground:setAlpha( 1 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.characterOverlay:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.FETitleNumBrdr0:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.clipFinished( item, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( false, false, -45.5, 45.5 )
				self.FocusBarB0:setTopBottom( false, false, 221, 217 )
				self.FocusBarB0:setAlpha( 1 )
				self.FocusBarB0:setScale( 1 )
				self.clipFinished( FocusBarB0, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item:setAlpha( 1 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.characterPlusBackground:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 1 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.characterOverlay:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.characterPlusBackground:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 1 )
				self.item.characterOverlay:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.border:setRGB( 0.57, 0.57, 0.57 )
				self.item.infoArea:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.clipFinished( item, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.characterPlusBackground:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.characterOverlay:completeAnimation()
				item.heroNumber:completeAnimation()
				item.border:completeAnimation()
				item.infoArea:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.characterPlusBackground:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 1 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.characterOverlay:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.infoArea:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.clipFinished( item, {} )
			end
		},
		Flipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				self.item:setAlpha( 0 )
				self.clipFinished( item, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsHeroLocked( element, controller )
			end
		},
		{
			stateName = "Flipped",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Flipped" )
			end
		}
	} )
	item.id = "item"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.item:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.item:close()
		self.FocusBarB0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

