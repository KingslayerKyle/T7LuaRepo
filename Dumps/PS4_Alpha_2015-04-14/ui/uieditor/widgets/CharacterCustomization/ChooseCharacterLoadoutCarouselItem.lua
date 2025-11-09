require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_Internal" )

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
	item:setTopBottom( true, true, 0, 0 )
	item:setRGB( 1, 1, 1 )
	item.background:setRGB( 1, 1, 1 )
	item.ExtraCamLiveFeed:setAlpha( 1 )
	item.border:setRGB( 1, 0.41, 0 )
	item:linkToElementModel( self, nil, false, function ( model )
		item:setModel( model, controller )
	end )
	item:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroLoadoutChanged( self, element, controller )
		return retVal
	end )
	self:addElement( item )
	self.item = item
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.heroNumber:completeAnimation()
				item.lockImage:completeAnimation()
				item.border:completeAnimation()
				item.FocusBarT:completeAnimation()
				item.FocusBarB:completeAnimation()
				item.infoArea:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 1 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.FocusBarT:setAlpha( 0 )
				self.item.FocusBarB:setAlpha( 0 )
				self.item.infoArea:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.heroNumber:completeAnimation()
				item.lockImage:completeAnimation()
				item.border:completeAnimation()
				item.FocusBarT:completeAnimation()
				item.FocusBarB:completeAnimation()
				item.infoArea:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 1 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.border:setRGB( 1, 0.41, 0 )
				self.item.FocusBarT:setAlpha( 1 )
				self.item.FocusBarB:setAlpha( 1 )
				self.item.infoArea:setAlpha( 1 )
				self.clipFinished( item, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.heroNumber:completeAnimation()
				item.lockImage:completeAnimation()
				item.border:completeAnimation()
				item.FocusBarT:completeAnimation()
				item.FocusBarB:completeAnimation()
				item.infoArea:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 1 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.border:setRGB( 0.29, 0.29, 0.29 )
				self.item.FocusBarT:setAlpha( 0 )
				self.item.FocusBarB:setAlpha( 0 )
				self.item.infoArea:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.apeRender:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.Silhouette:completeAnimation()
				item.heroNumber:completeAnimation()
				item.lockImage:completeAnimation()
				item.border:completeAnimation()
				item.FocusBarT:completeAnimation()
				item.FocusBarB:completeAnimation()
				item.infoArea:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 1 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.item.border:setRGB( 0.57, 0.57, 0.57 )
				self.item.FocusBarT:setAlpha( 0 )
				self.item.FocusBarB:setAlpha( 0 )
				self.item.infoArea:setAlpha( 1 )
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
	self.close = function ( self )
		self.item:close()
		CoD.ChooseCharacterLoadoutCarouselItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

