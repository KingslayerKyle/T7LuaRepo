-- 30658407916469dbd6e8e2a6402a7a0f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_PromoFrame" )
require( "ui.uieditor.widgets.BlackMarket.BM_Promo_TitleAndCountdown" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
end

CoD.BM_Promo = InheritFrom( LUI.UIElement )
CoD.BM_Promo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Promo )
	self.id = "BM_Promo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1018 )
	self:setTopBottom( true, false, 0, 153 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, false, 25, 95 )
	Backing:setTopBottom( true, false, 5.97, 144.5 )
	Backing:setAlpha( 0.5 )
	Backing:setImage( RegisterImage( "uie_t7_blackmarket_promo_backing_circle" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local BMPromoFrame = CoD.BM_PromoFrame.new( menu, controller )
	BMPromoFrame:setLeftRight( true, false, 136, 1043 )
	BMPromoFrame:setTopBottom( true, false, -24.5, 179.5 )
	BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_DESC" ) ) )
	BMPromoFrame.DescArabic:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_DESC" ) ) )
	self:addElement( BMPromoFrame )
	self.BMPromoFrame = BMPromoFrame
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -18, 136 )
	Image0:setTopBottom( true, false, -24.5, 179.5 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_promo_frameleft" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CODpointIcon = LUI.UIImage.new()
	CODpointIcon:setLeftRight( true, false, 30.5, 162.5 )
	CODpointIcon:setTopBottom( true, false, 10.5, 142.5 )
	CODpointIcon:setImage( RegisterImage( "uie_t7_blackmarket_promo_cp_icon" ) )
	self:addElement( CODpointIcon )
	self.CODpointIcon = CODpointIcon
	
	local CODpointIconglint = LUI.UIImage.new()
	CODpointIconglint:setLeftRight( true, false, 30.5, 162.5 )
	CODpointIconglint:setTopBottom( true, false, 10.5, 142.5 )
	CODpointIconglint:setAlpha( 0 )
	CODpointIconglint:setImage( RegisterImage( "uie_t7_blackmarket_promo_cp_icon" ) )
	CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	CODpointIconglint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( CODpointIconglint )
	self.CODpointIconglint = CODpointIconglint
	
	local BribeBlackMarket = LUI.UIImage.new()
	BribeBlackMarket:setLeftRight( true, false, 31.5, 163.5 )
	BribeBlackMarket:setTopBottom( true, false, 10.5, 142.5 )
	BribeBlackMarket:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		local cycled = Engine.GetModelValue( model )
		if cycled then
			BribeBlackMarket:setImage( RegisterImage( GetImageForCurrentPromoItem( controller, cycled ) ) )
		end
	end )
	self:addElement( BribeBlackMarket )
	self.BribeBlackMarket = BribeBlackMarket
	
	local BribeBlackMarketGlint = LUI.UIImage.new()
	BribeBlackMarketGlint:setLeftRight( true, false, 31.5, 163.5 )
	BribeBlackMarketGlint:setTopBottom( true, false, 10.5, 142.5 )
	BribeBlackMarketGlint:setRGB( 1, 0.94, 0.57 )
	BribeBlackMarketGlint:setAlpha( 0 )
	BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	BribeBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	BribeBlackMarketGlint:subscribeToGlobalModel( controller, "AutoeventsCycled", "cycled", function ( model )
		local cycled = Engine.GetModelValue( model )
		if cycled then
			BribeBlackMarketGlint:setImage( RegisterImage( GetImageForCurrentPromoItem( controller, cycled ) ) )
		end
	end )
	self:addElement( BribeBlackMarketGlint )
	self.BribeBlackMarketGlint = BribeBlackMarketGlint
	
	local BundleBlackMarket = LUI.UIImage.new()
	BundleBlackMarket:setLeftRight( true, false, 31.5, 163.5 )
	BundleBlackMarket:setTopBottom( true, false, 10.5, 142.5 )
	BundleBlackMarket:setAlpha( 0 )
	BundleBlackMarket:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
	self:addElement( BundleBlackMarket )
	self.BundleBlackMarket = BundleBlackMarket
	
	local BundleBlackMarketGlint = LUI.UIImage.new()
	BundleBlackMarketGlint:setLeftRight( true, false, 31.5, 163.5 )
	BundleBlackMarketGlint:setTopBottom( true, false, 10.5, 142.5 )
	BundleBlackMarketGlint:setRGB( 1, 0.94, 0.57 )
	BundleBlackMarketGlint:setAlpha( 0 )
	BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
	BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( BundleBlackMarketGlint )
	self.BundleBlackMarketGlint = BundleBlackMarketGlint
	
	local Cryptokeys = LUI.UIImage.new()
	Cryptokeys:setLeftRight( true, false, 30.5, 162.5 )
	Cryptokeys:setTopBottom( true, false, 10.5, 142.5 )
	Cryptokeys:setAlpha( 0 )
	Cryptokeys:setImage( RegisterImage( "uie_t7_blackmarket_promo_cryptokeys" ) )
	self:addElement( Cryptokeys )
	self.Cryptokeys = Cryptokeys
	
	local CodeBundleIcon = LUI.UIImage.new()
	CodeBundleIcon:setLeftRight( true, false, 30.5, 162.5 )
	CodeBundleIcon:setTopBottom( true, false, 10.5, 142.5 )
	CodeBundleIcon:setAlpha( 0 )
	CodeBundleIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_promo_code3_small" ) )
	self:addElement( CodeBundleIcon )
	self.CodeBundleIcon = CodeBundleIcon
	
	local LimitedItemIcon = LUI.UIImage.new()
	LimitedItemIcon:setLeftRight( true, false, 36, 168 )
	LimitedItemIcon:setTopBottom( true, false, 10.5, 142.5 )
	LimitedItemIcon:setAlpha( 0 )
	LimitedItemIcon:setImage( RegisterImage( GetDvarString( "loot_limitedTimeItemPromo_promoIcon", "uie_t7_blackmarket_promo_cryptokeys" ) ) )
	self:addElement( LimitedItemIcon )
	self.LimitedItemIcon = LimitedItemIcon
	
	local Divider = LUI.UIImage.new()
	Divider:setLeftRight( true, false, 141.5, 201.5 )
	Divider:setTopBottom( true, false, -24.5, 155.5 )
	Divider:setScale( 0.9 )
	Divider:setImage( RegisterImage( "uie_t7_blackmarket_promo_divider" ) )
	self:addElement( Divider )
	self.Divider = Divider
	
	local Light = LUI.UIImage.new()
	Light:setLeftRight( true, false, -26, 34 )
	Light:setTopBottom( true, false, -24.4, 155.6 )
	Light:setImage( RegisterImage( "uie_t7_blackmarket_promo_linelight" ) )
	self:addElement( Light )
	self.Light = Light
	
	local BMPromoTitleAndCountdown = CoD.BM_Promo_TitleAndCountdown.new( menu, controller )
	BMPromoTitleAndCountdown:setLeftRight( true, false, 182.5, 835 )
	BMPromoTitleAndCountdown:setTopBottom( true, false, 21.5, 69.5 )
	BMPromoTitleAndCountdown.BMPromoTitle.Title:setText( LocalizeToUpperString( GetLimitedTimePromoTitleIfActive( controller, "MPUI_BM_NO_DUPES" ) ) )
	BMPromoTitleAndCountdown:mergeStateConditions( {
		{
			stateName = "Notimer",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "CodeBundle" )
			end
		}
	} )
	self:addElement( BMPromoTitleAndCountdown )
	self.BMPromoTitleAndCountdown = BMPromoTitleAndCountdown
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()
				self.BMPromoFrame:setAlpha( 0 )
				self.clipFinished( BMPromoFrame, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				CODpointIconglint:completeAnimation()
				self.CODpointIconglint:setAlpha( 0 )
				self.clipFinished( CODpointIconglint, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 0 )
				self.clipFinished( BundleBlackMarket, {} )

				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 0 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 0 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )
			end
		},
		CodPoints = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()

				BMPromoFrame.Desc:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MENU_50_PERCENT_OFF" ) ) )
				self.clipFinished( BMPromoFrame, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 1 )
				self.clipFinished( CODpointIcon, {} )
				local CODpointIconglintFrame2 = function ( CODpointIconglint, event )
					local CODpointIconglintFrame3 = function ( CODpointIconglint, event )
						local CODpointIconglintFrame4 = function ( CODpointIconglint, event )
							local CODpointIconglintFrame5 = function ( CODpointIconglint, event )
								if not event.interrupted then
									CODpointIconglint:beginAnimation( "keyframe", 3559, false, false, CoD.TweenType.Linear )
								end
								CODpointIconglint:setRGB( 1, 0.94, 0.57 )
								CODpointIconglint:setAlpha( 0 )
								CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								CODpointIconglint:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( CODpointIconglint, event )
								else
									CODpointIconglint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CODpointIconglintFrame5( CODpointIconglint, event )
								return 
							else
								CODpointIconglint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								CODpointIconglint:setAlpha( 0 )
								CODpointIconglint:registerEventHandler( "transition_complete_keyframe", CODpointIconglintFrame5 )
							end
						end
						
						if event.interrupted then
							CODpointIconglintFrame4( CODpointIconglint, event )
							return 
						else
							CODpointIconglint:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							CODpointIconglint:setShaderVector( 0, 0.99, 0, 0, 0 )
							CODpointIconglint:registerEventHandler( "transition_complete_keyframe", CODpointIconglintFrame4 )
						end
					end
					
					if event.interrupted then
						CODpointIconglintFrame3( CODpointIconglint, event )
						return 
					else
						CODpointIconglint:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CODpointIconglint:setShaderVector( 0, 0.01, 0, 0, 0 )
						CODpointIconglint:registerEventHandler( "transition_complete_keyframe", CODpointIconglintFrame3 )
					end
				end
				
				CODpointIconglint:completeAnimation()
				self.CODpointIconglint:setRGB( 1, 0.94, 0.57 )
				self.CODpointIconglint:setAlpha( 1 )
				self.CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.CODpointIconglint:setShaderVector( 0, 0, 0, 0, 0 )
				CODpointIconglintFrame2( CODpointIconglint, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 0 )
				self.clipFinished( BundleBlackMarket, {} )

				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BundleBlackMarketGlint, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )

				self.nextClip = "DefaultClip"
			end
		},
		BlackMarket = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.clipFinished( BMPromoFrame, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 1 )
				self.clipFinished( BundleBlackMarket, {} )
				local BundleBlackMarketGlintFrame2 = function ( BundleBlackMarketGlint, event )
					local BundleBlackMarketGlintFrame3 = function ( BundleBlackMarketGlint, event )
						local BundleBlackMarketGlintFrame4 = function ( BundleBlackMarketGlint, event )
							local BundleBlackMarketGlintFrame5 = function ( BundleBlackMarketGlint, event )
								if not event.interrupted then
									BundleBlackMarketGlint:beginAnimation( "keyframe", 3289, false, false, CoD.TweenType.Linear )
								end
								BundleBlackMarketGlint:setAlpha( 0 )
								BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( BundleBlackMarketGlint, event )
								else
									BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BundleBlackMarketGlintFrame5( BundleBlackMarketGlint, event )
								return 
							else
								BundleBlackMarketGlint:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BundleBlackMarketGlint:setAlpha( 0 )
								BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame5 )
							end
						end
						
						if event.interrupted then
							BundleBlackMarketGlintFrame4( BundleBlackMarketGlint, event )
							return 
						else
							BundleBlackMarketGlint:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
							BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BundleBlackMarketGlintFrame3( BundleBlackMarketGlint, event )
						return 
					else
						BundleBlackMarketGlint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame3 )
					end
				end
				
				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 1 )
				self.BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				BundleBlackMarketGlintFrame2( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Cryptokeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.clipFinished( BMPromoFrame, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 0 )
				self.clipFinished( BundleBlackMarket, {} )

				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 1 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )
			end
		},
		Bribe = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.clipFinished( BMPromoFrame, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				CODpointIconglint:completeAnimation()
				self.CODpointIconglint:setAlpha( 0 )
				self.clipFinished( CODpointIconglint, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 1 )
				self.clipFinished( BribeBlackMarket, {} )
				local BribeBlackMarketGlintFrame2 = function ( BribeBlackMarketGlint, event )
					local BribeBlackMarketGlintFrame3 = function ( BribeBlackMarketGlint, event )
						local BribeBlackMarketGlintFrame4 = function ( BribeBlackMarketGlint, event )
							local BribeBlackMarketGlintFrame5 = function ( BribeBlackMarketGlint, event )
								if not event.interrupted then
									BribeBlackMarketGlint:beginAnimation( "keyframe", 3289, false, false, CoD.TweenType.Linear )
								end
								BribeBlackMarketGlint:setAlpha( 0 )
								BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								BribeBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( BribeBlackMarketGlint, event )
								else
									BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BribeBlackMarketGlintFrame5( BribeBlackMarketGlint, event )
								return 
							else
								BribeBlackMarketGlint:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BribeBlackMarketGlint:setAlpha( 0 )
								BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BribeBlackMarketGlintFrame5 )
							end
						end
						
						if event.interrupted then
							BribeBlackMarketGlintFrame4( BribeBlackMarketGlint, event )
							return 
						else
							BribeBlackMarketGlint:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
							BribeBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BribeBlackMarketGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BribeBlackMarketGlintFrame3( BribeBlackMarketGlint, event )
						return 
					else
						BribeBlackMarketGlint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BribeBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
						BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BribeBlackMarketGlintFrame3 )
					end
				end
				
				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 1 )
				self.BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.BribeBlackMarketGlint:setShaderVector( 0, 0, 0, 0, 0 )
				BribeBlackMarketGlintFrame2( BribeBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Bundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()

				BMPromoFrame.Desc:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_DESC" ) ) )
				self.clipFinished( BMPromoFrame, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 1 )
				self.clipFinished( BundleBlackMarket, {} )
				local BundleBlackMarketGlintFrame2 = function ( BundleBlackMarketGlint, event )
					local BundleBlackMarketGlintFrame3 = function ( BundleBlackMarketGlint, event )
						local BundleBlackMarketGlintFrame4 = function ( BundleBlackMarketGlint, event )
							local BundleBlackMarketGlintFrame5 = function ( BundleBlackMarketGlint, event )
								if not event.interrupted then
									BundleBlackMarketGlint:beginAnimation( "keyframe", 3119, false, false, CoD.TweenType.Linear )
								end
								BundleBlackMarketGlint:setAlpha( 0 )
								BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
								BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( BundleBlackMarketGlint, event )
								else
									BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BundleBlackMarketGlintFrame5( BundleBlackMarketGlint, event )
								return 
							else
								BundleBlackMarketGlint:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
								BundleBlackMarketGlint:setAlpha( 0.5 )
								BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame5 )
							end
						end
						
						if event.interrupted then
							BundleBlackMarketGlintFrame4( BundleBlackMarketGlint, event )
							return 
						else
							BundleBlackMarketGlint:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
							BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BundleBlackMarketGlintFrame3( BundleBlackMarketGlint, event )
						return 
					else
						BundleBlackMarketGlint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame3 )
					end
				end
				
				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 1 )
				self.BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
				self.BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				BundleBlackMarketGlintFrame2( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )

				self.nextClip = "DefaultClip"
			end
		},
		NoDupesPromo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()

				BMPromoFrame.Desc:completeAnimation()

				BMPromoFrame.DescArabic:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_PROMO_DESC" ) ) )
				self.BMPromoFrame.DescArabic:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_PROMO_DESC" ) ) )
				self.clipFinished( BMPromoFrame, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 1 )
				self.clipFinished( BundleBlackMarket, {} )
				local BundleBlackMarketGlintFrame2 = function ( BundleBlackMarketGlint, event )
					local BundleBlackMarketGlintFrame3 = function ( BundleBlackMarketGlint, event )
						local BundleBlackMarketGlintFrame4 = function ( BundleBlackMarketGlint, event )
							local BundleBlackMarketGlintFrame5 = function ( BundleBlackMarketGlint, event )
								if not event.interrupted then
									BundleBlackMarketGlint:beginAnimation( "keyframe", 3119, false, false, CoD.TweenType.Linear )
								end
								BundleBlackMarketGlint:setAlpha( 0 )
								BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
								BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( BundleBlackMarketGlint, event )
								else
									BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BundleBlackMarketGlintFrame5( BundleBlackMarketGlint, event )
								return 
							else
								BundleBlackMarketGlint:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
								BundleBlackMarketGlint:setAlpha( 0.5 )
								BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame5 )
							end
						end
						
						if event.interrupted then
							BundleBlackMarketGlintFrame4( BundleBlackMarketGlint, event )
							return 
						else
							BundleBlackMarketGlint:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
							BundleBlackMarketGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BundleBlackMarketGlintFrame3( BundleBlackMarketGlint, event )
						return 
					else
						BundleBlackMarketGlint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BundleBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", BundleBlackMarketGlintFrame3 )
					end
				end
				
				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 1 )
				self.BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_nodupe" ) )
				self.BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				BundleBlackMarketGlintFrame2( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.clipFinished( BMPromoTitleAndCountdown, {} )

				self.nextClip = "DefaultClip"
			end
		},
		LimitedItemPromo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()

				BMPromoFrame.Desc:completeAnimation()

				BMPromoFrame.DescArabic:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_DESC" ) ) )
				self.BMPromoFrame.DescArabic:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_NO_DUPES_DESC" ) ) )
				self.clipFinished( BMPromoFrame, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 0 )
				self.clipFinished( BundleBlackMarket, {} )

				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 0 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 1 )
				self.LimitedItemIcon:setImage( RegisterImage( GetDvarString( "loot_limitedTimeItemPromo_promoIcon", "uie_t7_blackmarket_promo_cryptokeys" ) ) )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()

				BMPromoTitleAndCountdown.BMPromoTitle.Title:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.BMPromoTitleAndCountdown.BMPromoTitle.Title:setText( LocalizeToUpperString( GetLimitedTimePromoTitleIfActive( controller, "MPUI_BM_NO_DUPES" ) ) )
				self.clipFinished( BMPromoTitleAndCountdown, {} )
			end
		},
		CodeBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0.5 )
				self.clipFinished( Backing, {} )

				BMPromoFrame:completeAnimation()

				BMPromoFrame.Desc:completeAnimation()

				BMPromoFrame.DescArabic:completeAnimation()
				self.BMPromoFrame:setAlpha( 1 )
				self.BMPromoFrame.Desc:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_CODE_BUNDLE_PROMO_DESC" ) ) )
				self.BMPromoFrame.DescArabic:setText( Engine.Localize( GetLimitedTimePromoDescIfActive( controller, "MPUI_BM_CODE_BUNDLE_PROMO_DESC" ) ) )
				self.clipFinished( BMPromoFrame, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )

				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )

				BribeBlackMarketGlint:completeAnimation()
				self.BribeBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BribeBlackMarketGlint, {} )

				BundleBlackMarket:completeAnimation()
				self.BundleBlackMarket:setAlpha( 0 )
				self.clipFinished( BundleBlackMarket, {} )

				BundleBlackMarketGlint:completeAnimation()
				self.BundleBlackMarketGlint:setAlpha( 0 )
				self.clipFinished( BundleBlackMarketGlint, {} )

				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 0 )
				self.clipFinished( Cryptokeys, {} )

				CodeBundleIcon:completeAnimation()
				self.CodeBundleIcon:setAlpha( 1 )
				self.clipFinished( CodeBundleIcon, {} )

				LimitedItemIcon:completeAnimation()
				self.LimitedItemIcon:setAlpha( 0 )
				self.LimitedItemIcon:setImage( RegisterImage( GetDvarString( "loot_limitedTimeItemPromo_promoIcon", "uie_t7_blackmarket_promo_cryptokeys" ) ) )
				self.clipFinished( LimitedItemIcon, {} )

				Divider:completeAnimation()
				self.Divider:setAlpha( 1 )
				self.clipFinished( Divider, {} )

				Light:completeAnimation()
				self.Light:setAlpha( 1 )
				self.clipFinished( Light, {} )

				BMPromoTitleAndCountdown:completeAnimation()

				BMPromoTitleAndCountdown.BMPromoTitle.Title:completeAnimation()
				self.BMPromoTitleAndCountdown:setAlpha( 1 )
				self.BMPromoTitleAndCountdown.BMPromoTitle.Title:setText( LocalizeToUpperString( GetLimitedTimePromoTitleIfActive( controller, "MPUI_BM_CODE_BUNDLE_PROMO" ) ) )
				self.clipFinished( BMPromoTitleAndCountdown, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CodPoints",
			condition = function ( menu, element, event )
				return IsLootSaleActive( controller )
			end
		},
		{
			stateName = "BlackMarket",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Cryptokeys",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsBribeActive( controller )
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return IsBundleActive( controller )
			end
		},
		{
			stateName = "NoDupesPromo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LimitedItemPromo",
			condition = function ( menu, element, event )
				return IsLimitedLootPromoActive( controller )
			end
		},
		{
			stateName = "CodeBundle",
			condition = function ( menu, element, event )
				return IsCodeBundlePromotionActive( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.codeBundleRareBundles" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.codeBundleRareBundles"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		UpdateElementState( self, "BMPromoTitleAndCountdown", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMPromoFrame:close()
		element.BMPromoTitleAndCountdown:close()
		element.BribeBlackMarket:close()
		element.BribeBlackMarketGlint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
