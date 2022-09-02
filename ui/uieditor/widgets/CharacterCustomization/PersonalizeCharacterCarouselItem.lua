-- 29f40040765a7446e3887c518d06fe09
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem_Internal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1 = f1_arg0:getLocalSize()
	f1_arg0.getWidthInList = function ()
		if f1_arg0.gridInfoTable then
			if f1_arg0.gridInfoTable.parentGrid.activeWidget == f1_arg0 then
				return f1_local0
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
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local item = CoD.PersonalizeCharacterCarouselItem_Internal.new( menu, controller )
	item:setLeftRight( true, true, 0, 0 )
	item:setTopBottom( true, true, 30, -30 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				item:completeAnimation()

				item.background:completeAnimation()

				item.apeRender:completeAnimation()

				item.ExtraCamLiveFeed:completeAnimation()

				item.Silhouette:completeAnimation()

				item.CenteredSilhouette:completeAnimation()

				item.heroNumber:completeAnimation()

				item.lockImage:completeAnimation()

				item.FocusBarT:completeAnimation()

				item.FocusBarB:completeAnimation()

				item.FETitleNumBrdr00:completeAnimation()

				item.infoPanel:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 1 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.lockImage:setAlpha( 0 )
				self.item.FocusBarT:setAlpha( 0 )
				self.item.FocusBarB:setAlpha( 0 )
				self.item.FETitleNumBrdr00:setAlpha( 0 )
				self.item.infoPanel:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				item:completeAnimation()

				item.background:completeAnimation()

				item.apeRender:completeAnimation()

				item.ExtraCamLiveFeed:completeAnimation()

				item.Silhouette:completeAnimation()

				item.CenteredSilhouette:completeAnimation()

				item.heroNumber:completeAnimation()

				item.lockImage:completeAnimation()

				item.FocusBarT:completeAnimation()

				item.FocusBarB:completeAnimation()

				item.FETitleNumBrdr00:completeAnimation()

				item.infoPanel:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 1, 1, 1 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 1 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.lockImage:setAlpha( 0 )
				self.item.FocusBarT:setAlpha( 1 )
				self.item.FocusBarB:setAlpha( 1 )
				self.item.FETitleNumBrdr00:setAlpha( 1 )
				self.item.infoPanel:setAlpha( 1 )
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

				item.Silhouette:completeAnimation()

				item.CenteredSilhouette:completeAnimation()

				item.heroNumber:completeAnimation()

				item.lockImage:completeAnimation()

				item.infoPanel:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 30, -30 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 0 )
				self.item.CenteredSilhouette:setAlpha( 1 )
				self.item.heroNumber:setAlpha( 0 )
				self.item.lockImage:setAlpha( 1 )
				self.item.infoPanel:setAlpha( 0 )
				self.clipFinished( item, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				item:completeAnimation()

				item.background:completeAnimation()

				item.apeRender:completeAnimation()

				item.ExtraCamLiveFeed:completeAnimation()

				item.Silhouette:completeAnimation()

				item.CenteredSilhouette:completeAnimation()

				item.heroNumber:completeAnimation()

				item.lockImage:completeAnimation()

				item.infoPanel:completeAnimation()
				self.item:setLeftRight( true, true, 0, 0 )
				self.item:setTopBottom( true, true, 0, 0 )
				self.item.background:setRGB( 0.38, 0.38, 0.38 )
				self.item.apeRender:setAlpha( 0 )
				self.item.ExtraCamLiveFeed:setAlpha( 0 )
				self.item.Silhouette:setAlpha( 1 )
				self.item.CenteredSilhouette:setAlpha( 0 )
				self.item.heroNumber:setAlpha( 1 )
				self.item.lockImage:setAlpha( 1 )
				self.item.infoPanel:setAlpha( 1 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.item:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

