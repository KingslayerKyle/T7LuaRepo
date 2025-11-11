require( "ui.uieditor.widgets.BlackMarket.BM_PromoFrame" )
require( "ui.uieditor.widgets.BlackMarket.BM_PromoTitle" )

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
	self:setLeftRight( 0, 0, 0, 1527 )
	self:setTopBottom( 0, 0, 0, 229 )
	self.anyChildUsesUpdateState = true
	
	local BMPromoFrame = CoD.BM_PromoFrame.new( menu, controller )
	BMPromoFrame:setLeftRight( 0, 0, 205, 1016 )
	BMPromoFrame:setTopBottom( 0, 0, -37, 269 )
	BMPromoFrame.Desc:setText( Engine.Localize( GetDescriptionForCurrentPromoItem( controller, "MENU_50_PERCENT_OFF" ) ) )
	self:addElement( BMPromoFrame )
	self.BMPromoFrame = BMPromoFrame
	
	local BMPromoFrameGlint = CoD.BM_PromoFrame.new( menu, controller )
	BMPromoFrameGlint:setLeftRight( 0, 1, -31, 9 )
	BMPromoFrameGlint:setTopBottom( 0, 0, -38, 268 )
	BMPromoFrameGlint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	BMPromoFrameGlint:setShaderVector( 0, 0.1, 0, 0, 0 )
	BMPromoFrameGlint.Desc:setText( Engine.Localize( "MENU_50_PERCENT_OFF" ) )
	self:addElement( BMPromoFrameGlint )
	self.BMPromoFrameGlint = BMPromoFrameGlint
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -27, 205 )
	Image0:setTopBottom( 0, 0, -37, 269 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_promo_frameleft" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CODpointIcon = LUI.UIImage.new()
	CODpointIcon:setLeftRight( 0, 0, 46, 244 )
	CODpointIcon:setTopBottom( 0, 0, 16, 214 )
	CODpointIcon:setImage( RegisterImage( "uie_t7_blackmarket_promo_cp_icon" ) )
	self:addElement( CODpointIcon )
	self.CODpointIcon = CODpointIcon
	
	local CODpointIconglint = LUI.UIImage.new()
	CODpointIconglint:setLeftRight( 0, 0, 46, 244 )
	CODpointIconglint:setTopBottom( 0, 0, 16, 214 )
	CODpointIconglint:setAlpha( 0 )
	CODpointIconglint:setImage( RegisterImage( "uie_t7_blackmarket_promo_cp_icon" ) )
	CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	CODpointIconglint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( CODpointIconglint )
	self.CODpointIconglint = CODpointIconglint
	
	local BribeBlackMarket = LUI.UIImage.new()
	BribeBlackMarket:setLeftRight( 0, 0, 47, 245 )
	BribeBlackMarket:setTopBottom( 0, 0, 16, 214 )
	BribeBlackMarket:setImage( RegisterImage( "uie_t7_blackmarket_promo_bribe" ) )
	self:addElement( BribeBlackMarket )
	self.BribeBlackMarket = BribeBlackMarket
	
	local BribeBlackMarketGlint = LUI.UIImage.new()
	BribeBlackMarketGlint:setLeftRight( 0, 0, 47, 245 )
	BribeBlackMarketGlint:setTopBottom( 0, 0, 16, 214 )
	BribeBlackMarketGlint:setRGB( 1, 0.94, 0.57 )
	BribeBlackMarketGlint:setAlpha( 0 )
	BribeBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_bribe" ) )
	BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	BribeBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( BribeBlackMarketGlint )
	self.BribeBlackMarketGlint = BribeBlackMarketGlint
	
	local BundleBlackMarket = LUI.UIImage.new()
	BundleBlackMarket:setLeftRight( 0, 0, 47, 245 )
	BundleBlackMarket:setTopBottom( 0, 0, 16, 214 )
	BundleBlackMarket:setAlpha( 0 )
	BundleBlackMarket:setImage( RegisterImage( "uie_t7_blackmarket_promo_bundles" ) )
	self:addElement( BundleBlackMarket )
	self.BundleBlackMarket = BundleBlackMarket
	
	local BundleBlackMarketGlint = LUI.UIImage.new()
	BundleBlackMarketGlint:setLeftRight( 0, 0, 47, 245 )
	BundleBlackMarketGlint:setTopBottom( 0, 0, 16, 214 )
	BundleBlackMarketGlint:setRGB( 1, 0.94, 0.57 )
	BundleBlackMarketGlint:setAlpha( 0 )
	BundleBlackMarketGlint:setImage( RegisterImage( "uie_t7_blackmarket_promo_bundles" ) )
	BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
	self:addElement( BundleBlackMarketGlint )
	self.BundleBlackMarketGlint = BundleBlackMarketGlint
	
	local Cryptokeys = LUI.UIImage.new()
	Cryptokeys:setLeftRight( 0, 0, 46, 244 )
	Cryptokeys:setTopBottom( 0, 0, 16, 214 )
	Cryptokeys:setAlpha( 0 )
	Cryptokeys:setImage( RegisterImage( "uie_t7_blackmarket_promo_cryptokeys" ) )
	self:addElement( Cryptokeys )
	self.Cryptokeys = Cryptokeys
	
	local BMPromoTitle = CoD.BM_PromoTitle.new( menu, controller )
	BMPromoTitle:setLeftRight( 0, 0, 276, 536 )
	BMPromoTitle:setTopBottom( 0, 0, 34, 106 )
	BMPromoTitle.Title:setText( Engine.Localize( GetTitleForCurrentPromoItem( controller, "MENU_HALF_OFF" ) ) )
	self:addElement( BMPromoTitle )
	self.BMPromoTitle = BMPromoTitle
	
	local Divider = LUI.UIImage.new()
	Divider:setLeftRight( 0, 0, 212, 302 )
	Divider:setTopBottom( 0, 0, -37, 233 )
	Divider:setScale( 0.9 )
	Divider:setImage( RegisterImage( "uie_t7_blackmarket_promo_divider" ) )
	self:addElement( Divider )
	self.Divider = Divider
	
	local Light = LUI.UIImage.new()
	Light:setLeftRight( 0, 0, -39, 51 )
	Light:setTopBottom( 0, 0, -37, 233 )
	Light:setImage( RegisterImage( "uie_t7_blackmarket_promo_linelight" ) )
	self:addElement( Light )
	self.Light = Light
	
	self.resetProperties = function ()
		CODpointIcon:completeAnimation()
		Light:completeAnimation()
		Divider:completeAnimation()
		BMPromoTitle:completeAnimation()
		BMPromoFrame:completeAnimation()
		BribeBlackMarket:completeAnimation()
		Image0:completeAnimation()
		BribeBlackMarketGlint:completeAnimation()
		CODpointIconglint:completeAnimation()
		BMPromoFrameGlint:completeAnimation()
		BundleBlackMarket:completeAnimation()
		BundleBlackMarketGlint:completeAnimation()
		Cryptokeys:completeAnimation()
		CODpointIcon:setAlpha( 1 )
		Light:setAlpha( 1 )
		Divider:setAlpha( 1 )
		BMPromoTitle:setAlpha( 1 )
		BMPromoFrame:setAlpha( 1 )
		BribeBlackMarket:setAlpha( 1 )
		Image0:setAlpha( 1 )
		BribeBlackMarketGlint:setAlpha( 0 )
		BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		BribeBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
		CODpointIconglint:setRGB( 1, 1, 1 )
		CODpointIconglint:setAlpha( 0 )
		CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		CODpointIconglint:setShaderVector( 0, 0.01, 0, 0, 0 )
		BMPromoFrameGlint:setAlpha( 1 )
		BMPromoFrameGlint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		BMPromoFrameGlint:setShaderVector( 0, 0.1, 0, 0, 0 )
		BundleBlackMarket:setAlpha( 0 )
		BundleBlackMarketGlint:setAlpha( 0 )
		BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
		Cryptokeys:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				BMPromoFrame:completeAnimation()
				self.BMPromoFrame:setAlpha( 0 )
				self.clipFinished( BMPromoFrame, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )
				CODpointIconglint:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
				CODpointIconglint:setAlpha( 0 )
				CODpointIconglint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )
				BribeBlackMarketGlint:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
				BribeBlackMarketGlint:setAlpha( 0 )
				BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				BMPromoTitle:completeAnimation()
				self.BMPromoTitle:setAlpha( 0 )
				self.clipFinished( BMPromoTitle, {} )
				Divider:completeAnimation()
				self.Divider:setAlpha( 0 )
				self.clipFinished( Divider, {} )
				Light:completeAnimation()
				self.Light:setAlpha( 0 )
				self.clipFinished( Light, {} )
			end
		},
		CodPoints = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BMPromoFrameGlintFrame2 = function ( BMPromoFrameGlint, event )
					local BMPromoFrameGlintFrame3 = function ( BMPromoFrameGlint, event )
						local BMPromoFrameGlintFrame4 = function ( BMPromoFrameGlint, event )
							if not event.interrupted then
								BMPromoFrameGlint:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							BMPromoFrameGlint:setAlpha( 0 )
							BMPromoFrameGlint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
							BMPromoFrameGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( BMPromoFrameGlint, event )
							else
								BMPromoFrameGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BMPromoFrameGlintFrame4( BMPromoFrameGlint, event )
							return 
						else
							BMPromoFrameGlint:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
							BMPromoFrameGlint:setShaderVector( 0, 0.99, 0, 0, 0 )
							BMPromoFrameGlint:registerEventHandler( "transition_complete_keyframe", BMPromoFrameGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BMPromoFrameGlintFrame3( BMPromoFrameGlint, event )
						return 
					else
						BMPromoFrameGlint:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						BMPromoFrameGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
						BMPromoFrameGlint:registerEventHandler( "transition_complete_keyframe", BMPromoFrameGlintFrame3 )
					end
				end
				
				BMPromoFrameGlint:completeAnimation()
				self.BMPromoFrameGlint:setAlpha( 1 )
				self.BMPromoFrameGlint:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.BMPromoFrameGlint:setShaderVector( 0, 0, 0, 0, 0 )
				BMPromoFrameGlintFrame2( BMPromoFrameGlint, {} )
				local CODpointIconglintFrame2 = function ( CODpointIconglint, event )
					local CODpointIconglintFrame3 = function ( CODpointIconglint, event )
						local CODpointIconglintFrame4 = function ( CODpointIconglint, event )
							local CODpointIconglintFrame5 = function ( CODpointIconglint, event )
								if not event.interrupted then
									CODpointIconglint:beginAnimation( "keyframe", 3559, false, false, CoD.TweenType.Linear )
								end
								CODpointIconglint:setRGB( 1, 0.94, 0.57 )
								CODpointIconglint:setAlpha( 0 )
								CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
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
				self.CODpointIconglint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.CODpointIconglint:setShaderVector( 0, 0, 0, 0, 0 )
				CODpointIconglintFrame2( CODpointIconglint, {} )
				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )
				BribeBlackMarketGlint:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
				BribeBlackMarketGlint:setAlpha( 0 )
				BribeBlackMarketGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				self.nextClip = "DefaultClip"
			end
		},
		BlackMarket = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )
				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )
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
								BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
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
				self.BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				BundleBlackMarketGlintFrame2( BundleBlackMarketGlint, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Cryptokeys = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )
				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )
				Cryptokeys:completeAnimation()
				self.Cryptokeys:setAlpha( 1 )
				self.clipFinished( Cryptokeys, {} )
			end
		},
		Bribe = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )
				CODpointIconglint:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
				CODpointIconglint:setAlpha( 0 )
				CODpointIconglint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local BribeBlackMarketGlintFrame2 = function ( BribeBlackMarketGlint, event )
					local BribeBlackMarketGlintFrame3 = function ( BribeBlackMarketGlint, event )
						local BribeBlackMarketGlintFrame4 = function ( BribeBlackMarketGlint, event )
							local BribeBlackMarketGlintFrame5 = function ( BribeBlackMarketGlint, event )
								if not event.interrupted then
									BribeBlackMarketGlint:beginAnimation( "keyframe", 3289, false, false, CoD.TweenType.Linear )
								end
								BribeBlackMarketGlint:setAlpha( 0 )
								BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
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
				self.BribeBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.BribeBlackMarketGlint:setShaderVector( 0, 0, 0, 0, 0 )
				BribeBlackMarketGlintFrame2( BribeBlackMarketGlint, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Bundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CODpointIcon:completeAnimation()
				self.CODpointIcon:setAlpha( 0 )
				self.clipFinished( CODpointIcon, {} )
				BribeBlackMarket:completeAnimation()
				self.BribeBlackMarket:setAlpha( 0 )
				self.clipFinished( BribeBlackMarket, {} )
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
								BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
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
				self.BundleBlackMarketGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				self.BundleBlackMarketGlint:setShaderVector( 0, 0.01, 0, 0, 0 )
				BundleBlackMarketGlintFrame2( BundleBlackMarketGlint, {} )
				self.nextClip = "DefaultClip"
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
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMPromoFrame:close()
		self.BMPromoFrameGlint:close()
		self.BMPromoTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

