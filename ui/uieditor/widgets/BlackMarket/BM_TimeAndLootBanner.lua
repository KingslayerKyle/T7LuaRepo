-- 83b2638e22621294c9e76854576aac61
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_DateTimeAndTotalCount" )

CoD.BM_TimeAndLootBanner = InheritFrom( LUI.UIElement )
CoD.BM_TimeAndLootBanner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_TimeAndLootBanner )
	self.id = "BM_TimeAndLootBanner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 245 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, -32.5, 279.5 )
	backing:setTopBottom( true, false, -2.5, 45.5 )
	backing:setAlpha( 0 )
	backing:setImage( RegisterImage( "uie_t7_blackmarket_common_timedate_backing" ) )
	self:addElement( backing )
	self.backing = backing
	
	local BMDateTimeAndTotalCount = CoD.BM_DateTimeAndTotalCount.new( menu, controller )
	BMDateTimeAndTotalCount:setLeftRight( true, false, 0, 245 )
	BMDateTimeAndTotalCount:setTopBottom( true, false, 0, 38 )
	BMDateTimeAndTotalCount:linkToElementModel( self, "dateTime", true, function ( model )
		local dateTime = Engine.GetModelValue( model )
		if dateTime then
			BMDateTimeAndTotalCount.dateTimeReceived:setText( Engine.Localize( dateTime ) )
		end
	end )
	BMDateTimeAndTotalCount:linkToElementModel( self, "duplicateText", true, function ( model )
		local duplicateText = Engine.GetModelValue( model )
		if duplicateText then
			BMDateTimeAndTotalCount.TotalCount:setText( Engine.Localize( duplicateText ) )
		end
	end )
	BMDateTimeAndTotalCount:mergeStateConditions( {
		{
			stateName = "Condensed",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "LootBanner" )
			end
		}
	} )
	self:addElement( BMDateTimeAndTotalCount )
	self.BMDateTimeAndTotalCount = BMDateTimeAndTotalCount
	
	local LootBanner = LUI.UIImage.new()
	LootBanner:setLeftRight( true, false, -28, 241 )
	LootBanner:setTopBottom( true, false, -26, 63.67 )
	LootBanner:setAlpha( 0 )
	LootBanner:setImage( RegisterImage( "uie_t7_blackmarket_contraband_banner" ) )
	self:addElement( LootBanner )
	self.LootBanner = LootBanner
	
	local LimitedItemBanner = LUI.UIImage.new()
	LimitedItemBanner:setLeftRight( true, false, -28, 241 )
	LimitedItemBanner:setTopBottom( true, false, -26, 63.67 )
	LimitedItemBanner:setAlpha( 0 )
	LimitedItemBanner:setImage( RegisterImage( "uie_t7_blackmarket_contraband_banner" ) )
	self:addElement( LimitedItemBanner )
	self.LimitedItemBanner = LimitedItemBanner
	
	local LootBannerText = LUI.UIText.new()
	LootBannerText:setLeftRight( true, false, 12, 233 )
	LootBannerText:setTopBottom( true, false, 9.5, 28.5 )
	LootBannerText:setRGB( 0, 0, 0 )
	LootBannerText:setAlpha( 0 )
	LootBannerText:setText( Engine.Localize( "MENU_NEW" ) )
	LootBannerText:setTTF( "fonts/default.ttf" )
	LootBannerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LootBannerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LootBannerText )
	self.LootBannerText = LootBannerText
	
	local LimitedItemBannerText = LUI.UIText.new()
	LimitedItemBannerText:setLeftRight( true, false, 12, 233 )
	LimitedItemBannerText:setTopBottom( true, false, 9.5, 28.5 )
	LimitedItemBannerText:setRGB( 0, 0, 0 )
	LimitedItemBannerText:setAlpha( 0 )
	LimitedItemBannerText:setText( Engine.Localize( "EM_ICON_EMBLEM_3" ) )
	LimitedItemBannerText:setTTF( "fonts/default.ttf" )
	LimitedItemBannerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LimitedItemBannerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LimitedItemBannerText )
	self.LimitedItemBannerText = LimitedItemBannerText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				self.clipFinished( backing, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( true, false, 0, 245 )
				self.BMDateTimeAndTotalCount:setTopBottom( true, false, 0, 38 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				LootBanner:completeAnimation()
				self.LootBanner:setAlpha( 0 )
				self.clipFinished( LootBanner, {} )
				LimitedItemBanner:completeAnimation()
				self.LimitedItemBanner:setAlpha( 0 )
				self.clipFinished( LimitedItemBanner, {} )
				LootBannerText:completeAnimation()
				self.LootBannerText:setAlpha( 0 )
				self.clipFinished( LootBannerText, {} )
				LimitedItemBannerText:completeAnimation()
				self.LimitedItemBannerText:setAlpha( 0 )
				self.clipFinished( LimitedItemBannerText, {} )
			end
		},
		LimitedItemBanner = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.backing:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( true, false, 1, 246 )
				self.BMDateTimeAndTotalCount:setTopBottom( true, false, 31, 69 )
				self.BMDateTimeAndTotalCount.backing:setAlpha( 0 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				LootBanner:completeAnimation()
				self.LootBanner:setAlpha( 0 )
				self.clipFinished( LootBanner, {} )
				LimitedItemBanner:completeAnimation()
				self.LimitedItemBanner:setAlpha( 1 )
				self.clipFinished( LimitedItemBanner, {} )
				LootBannerText:completeAnimation()
				self.LootBannerText:setAlpha( 0 )
				self.clipFinished( LootBannerText, {} )
				LimitedItemBannerText:completeAnimation()
				self.LimitedItemBannerText:setLeftRight( true, false, 32, 222 )
				self.LimitedItemBannerText:setTopBottom( true, false, 7, 26 )
				self.LimitedItemBannerText:setAlpha( 1 )
				self.clipFinished( LimitedItemBannerText, {} )
			end
		},
		LootBanner = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.backing:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( true, false, 1, 246 )
				self.BMDateTimeAndTotalCount:setTopBottom( true, false, 31, 69 )
				self.BMDateTimeAndTotalCount.backing:setAlpha( 0 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				LootBanner:completeAnimation()
				self.LootBanner:setAlpha( 1 )
				self.clipFinished( LootBanner, {} )
				LimitedItemBanner:completeAnimation()
				self.LimitedItemBanner:setAlpha( 0 )
				self.clipFinished( LimitedItemBanner, {} )
				LootBannerText:completeAnimation()
				self.LootBannerText:setLeftRight( true, false, 32, 222 )
				self.LootBannerText:setTopBottom( true, false, 7, 26 )
				self.LootBannerText:setAlpha( 1 )
				self.clipFinished( LootBannerText, {} )
				LimitedItemBannerText:completeAnimation()
				self.LimitedItemBannerText:setAlpha( 0 )
				self.clipFinished( LimitedItemBannerText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMDateTimeAndTotalCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

