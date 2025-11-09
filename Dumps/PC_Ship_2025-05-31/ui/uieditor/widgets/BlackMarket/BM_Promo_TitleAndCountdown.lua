require( "ui.uieditor.widgets.BlackMarket.BM_PromoTitle" )
require( "ui.uieditor.widgets.BlackMarket.BM_Promo_Countdown2" )

CoD.BM_Promo_TitleAndCountdown = InheritFrom( LUI.UIElement )
CoD.BM_Promo_TitleAndCountdown.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Promo_TitleAndCountdown )
	self.id = "BM_Promo_TitleAndCountdown"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 604 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local BMPromoTitle = CoD.BM_PromoTitle.new( menu, controller )
	BMPromoTitle:setLeftRight( true, false, 0, 238 )
	BMPromoTitle:setTopBottom( true, false, 0, 48 )
	BMPromoTitle.Title:setText( LocalizeToUpperString( "MPUI_BM_NO_DUPES" ) )
	self:addElement( BMPromoTitle )
	self.BMPromoTitle = BMPromoTitle
	
	local BMPromoCountdown2 = CoD.BM_Promo_Countdown2.new( menu, controller )
	BMPromoCountdown2:setLeftRight( true, false, 238, 342 )
	BMPromoCountdown2:setTopBottom( true, false, 5, 45 )
	BMPromoCountdown2:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_limited_time", function ( model )
		local autoeventTimerLimitedTime = Engine.GetModelValue( model )
		if autoeventTimerLimitedTime then
			BMPromoCountdown2.Expires:setText( LocalizeIntoString( "MPUI_BM_PROMO_EXPIRES", autoeventTimerLimitedTime ) )
		end
	end )
	self:addElement( BMPromoCountdown2 )
	self.BMPromoCountdown2 = BMPromoCountdown2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BMPromoCountdown2:completeAnimation()
				self.BMPromoCountdown2:setAlpha( 1 )
				self.clipFinished( BMPromoCountdown2, {} )
			end
		},
		Notimer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BMPromoCountdown2:completeAnimation()
				self.BMPromoCountdown2:setAlpha( 0 )
				self.clipFinished( BMPromoCountdown2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMPromoTitle:close()
		element.BMPromoCountdown2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

