require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_Internal" )

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

CoD.PersonalizeCharacterCarouselItem = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacterCarouselItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacterCarouselItem )
	self.id = "PersonalizeCharacterCarouselItem"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.PersonalizeCharacterCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( 0, 1, 0, 0 )
	item:setTopBottom( 0, 1, 45, -45 )
	item.Silhouette:setAlpha( 0 )
	item.heroNumber:setAlpha( 0 )
	item.FocusBarT:setAlpha( 0 )
	item.FocusBarB:setAlpha( 0 )
	item.FETitleNumBrdr00:setAlpha( 0 )
	item:linkToElementModel( self, nil, false, function ( model )
		item:setModel( model, controller )
	end )
	self:addElement( item )
	self.item = item
	
	self.resetProperties = function ()
		item:completeAnimation()
		item:setLeftRight( 0, 1, 0, 0 )
		item:setTopBottom( 0, 1, 45, -45 )
		item.background:setRGB( 1, 1, 1 )
		item.apeRender:setAlpha( 0 )
		item.ExtraCamLiveFeed:setAlpha( 0 )
		item.Silhouette:setAlpha( 0 )
		item.CenteredSilhouette:setAlpha( 0 )
		item.heroNumber:setAlpha( 0 )
		item.lockImage:setAlpha( 0 )
		item.FocusBarT:setAlpha( 0 )
		item.FocusBarB:setAlpha( 0 )
		item.FETitleNumBrdr00:setAlpha( 0 )
		item.infoPanel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.apeRender:completeAnimation()
				item.infoPanel:completeAnimation()
				self.item.apeRender:setAlpha( 1 )
				self.item.infoPanel:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.ExtraCamLiveFeed:completeAnimation()
				item.heroNumber:completeAnimation()
				item.FocusBarT:completeAnimation()
				item.FocusBarB:completeAnimation()
				item.FETitleNumBrdr00:completeAnimation()
				self.item:setLeftRight( 0, 1, 0, 0 )
				self.item:setTopBottom( 0, 1, 0, 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 1 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.FocusBarT:setAlpha( 1 )
				self.item.FocusBarB:setAlpha( 1 )
				self.item.FETitleNumBrdr00:setAlpha( 1 )
				self.clipFinished( item, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.CenteredSilhouette:completeAnimation()
				item.lockImage:completeAnimation()
				item.infoPanel:completeAnimation()
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.CenteredSilhouette:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.item.infoPanel:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				item:completeAnimation()
				item.background:completeAnimation()
				item.Silhouette:completeAnimation()
				item.heroNumber:completeAnimation()
				item.lockImage:completeAnimation()
				self.item:setLeftRight( 0, 1, 0, 0 )
				self.item:setTopBottom( 0, 1, 0, 0 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.Silhouette:setAlpha( 1 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.item:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

