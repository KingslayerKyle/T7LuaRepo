require( "ui.uieditor.widgets.BlackMarket.BM_WiresAllStatic" )
require( "ui.uieditor.widgets.BlackMarket.BM_Wires1" )
require( "ui.uieditor.widgets.BlackMarket.BMWire2" )
require( "ui.uieditor.widgets.BlackMarket.BM_WiresGlow" )

CoD.BM_DecryptionBonusKeys = InheritFrom( LUI.UIElement )
CoD.BM_DecryptionBonusKeys.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DecryptionBonusKeys )
	self.id = "BM_DecryptionBonusKeys"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local Support = LUI.UIImage.new()
	Support:setLeftRight( false, true, -80, 41 )
	Support:setTopBottom( false, false, -68, 61.06 )
	Support:setAlpha( 0 )
	Support:setImage( RegisterImage( "uie_t7_blackmarket_cryptokeysupport" ) )
	self:addElement( Support )
	self.Support = Support
	
	local slow = LUI.UIImage.new()
	slow:setLeftRight( true, false, -79, 161 )
	slow:setTopBottom( true, false, -81, 159 )
	slow:setAlpha( 0 )
	slow:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow )
	self.slow = slow
	
	local regular = LUI.UIImage.new()
	regular:setLeftRight( true, false, -79, 161 )
	regular:setTopBottom( true, false, -91, 173 )
	regular:setAlpha( 0 )
	regular:setImage( RegisterImage( "uie_t7_icon_cryptokey_regular" ) )
	self:addElement( regular )
	self.regular = regular
	
	local fast = LUI.UIImage.new()
	fast:setLeftRight( true, false, -74, 202 )
	fast:setTopBottom( true, false, -91, 185 )
	fast:setAlpha( 0 )
	fast:setImage( RegisterImage( "uie_t7_icon_cryptokey_fast" ) )
	self:addElement( fast )
	self.fast = fast
	
	local BMWiresAllStatic = CoD.BM_WiresAllStatic.new( menu, controller )
	BMWiresAllStatic:setLeftRight( false, false, -59, 61 )
	BMWiresAllStatic:setTopBottom( true, false, -251, 109 )
	BMWiresAllStatic:setAlpha( 0 )
	BMWiresAllStatic:setScale( 0.7 )
	self:addElement( BMWiresAllStatic )
	self.BMWiresAllStatic = BMWiresAllStatic
	
	local BMWires1 = CoD.BM_Wires1.new( menu, controller )
	BMWires1:setLeftRight( false, false, -59, 61 )
	BMWires1:setTopBottom( true, false, -251, 109 )
	BMWires1:setScale( 0.7 )
	BMWires1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWires1 )
	self.BMWires1 = BMWires1
	
	local BMWires2 = CoD.BMWire2.new( menu, controller )
	BMWires2:setLeftRight( false, false, -59, 61 )
	BMWires2:setTopBottom( true, false, -251, 109 )
	BMWires2:setScale( 0.7 )
	BMWires2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWires2 )
	self.BMWires2 = BMWires2
	
	local BMWiresGlow = CoD.BM_WiresGlow.new( menu, controller )
	BMWiresGlow:setLeftRight( true, false, -70, 151.49 )
	BMWiresGlow:setTopBottom( true, false, -284, 155 )
	BMWiresGlow:setScale( 0.7 )
	BMWiresGlow:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWiresGlow )
	self.BMWiresGlow = BMWiresGlow
	
	local cryptokeyFront = LUI.UIImage.new()
	cryptokeyFront:setLeftRight( false, false, -40, 40 )
	cryptokeyFront:setTopBottom( true, false, 0, 80 )
	cryptokeyFront:setAlpha( 0 )
	cryptokeyFront:setYRot( -180 )
	cryptokeyFront:setImage( RegisterImage( "uie_t7_icon_cryptokey_front" ) )
	self:addElement( cryptokeyFront )
	self.cryptokeyFront = cryptokeyFront
	
	local cryptokeyBack = LUI.UIImage.new()
	cryptokeyBack:setLeftRight( false, true, -79.5, 0.5 )
	cryptokeyBack:setTopBottom( false, false, -40, 40 )
	cryptokeyBack:setAlpha( 0 )
	cryptokeyBack:setImage( RegisterImage( "uie_t7_icon_cryptokey_back" ) )
	self:addElement( cryptokeyBack )
	self.cryptokeyBack = cryptokeyBack
	
	local cryptokeyCount = LUI.UIText.new()
	cryptokeyCount:setLeftRight( false, true, -84, 3 )
	cryptokeyCount:setTopBottom( false, false, -24.5, 20.5 )
	cryptokeyCount:setRGB( 1, 0.98, 0.8 )
	cryptokeyCount:setAlpha( 0 )
	cryptokeyCount:setTTF( "fonts/escom.ttf" )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	cryptokeyCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "bonusKeysAwarded", function ( model )
		local bonusKeysAwarded = Engine.GetModelValue( model )
		if bonusKeysAwarded then
			cryptokeyCount:setText( Engine.Localize( bonusKeysAwarded ) )
		end
	end )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local CoinFlip = LUI.UIElement.new()
	CoinFlip:setLeftRight( true, false, 49.5, 97.5 )
	CoinFlip:setTopBottom( true, false, -149, -101 )
	self:addElement( CoinFlip )
	self.CoinFlip = CoinFlip
	
	local Bonus = LUI.UIText.new()
	Bonus:setLeftRight( true, false, -0.5, 83.93 )
	Bonus:setTopBottom( true, false, 93, 110 )
	Bonus:setRGB( 0.69, 0.9, 0.8 )
	Bonus:setAlpha( 0 )
	Bonus:setScale( 0.9 )
	Bonus:setText( Engine.Localize( LocalizeToUpperString( "MPUI_CRYPTOKEY_BONUS_CAPS" ) ) )
	Bonus:setTTF( "fonts/escom.ttf" )
	Bonus:setLetterSpacing( -0 )
	Bonus:setLineSpacing( -1.7 )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Bonus )
	self.Bonus = Bonus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bonus = function ()
				self:setupElementClipCounter( 9 )
				local SupportFrame2 = function ( Support, event )
					local SupportFrame3 = function ( Support, event )
						local SupportFrame4 = function ( Support, event )
							local SupportFrame5 = function ( Support, event )
								if not event.interrupted then
									Support:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
								end
								Support:setAlpha( 0.95 )
								if event.interrupted then
									self.clipFinished( Support, event )
								else
									Support:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SupportFrame5( Support, event )
								return 
							else
								Support:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								Support:setAlpha( 0.03 )
								Support:registerEventHandler( "transition_complete_keyframe", SupportFrame5 )
							end
						end
						
						if event.interrupted then
							SupportFrame4( Support, event )
							return 
						else
							Support:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Support:setAlpha( 0.72 )
							Support:registerEventHandler( "transition_complete_keyframe", SupportFrame4 )
						end
					end
					
					if event.interrupted then
						SupportFrame3( Support, event )
						return 
					else
						Support:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						Support:registerEventHandler( "transition_complete_keyframe", SupportFrame3 )
					end
				end
				
				Support:completeAnimation()
				self.Support:setAlpha( 0 )
				SupportFrame2( Support, {} )
				local slowFrame2 = function ( slow, event )
					local slowFrame3 = function ( slow, event )
						local slowFrame4 = function ( slow, event )
							local slowFrame5 = function ( slow, event )
								local slowFrame6 = function ( slow, event )
									if not event.interrupted then
										slow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									slow:setLeftRight( true, false, -24.18, 106.18 )
									slow:setTopBottom( true, false, -27.18, 103.18 )
									slow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( slow, event )
									else
										slow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									slowFrame6( slow, event )
									return 
								else
									slow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
									slow:setLeftRight( true, false, -23.35, 104.98 )
									slow:setTopBottom( true, false, -25.98, 102.35 )
									slow:setAlpha( 0 )
									slow:registerEventHandler( "transition_complete_keyframe", slowFrame6 )
								end
							end
							
							if event.interrupted then
								slowFrame5( slow, event )
								return 
							else
								slow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								slow:setLeftRight( true, false, -17.5, 96.59 )
								slow:setTopBottom( true, false, -17.59, 96.5 )
								slow:registerEventHandler( "transition_complete_keyframe", slowFrame5 )
							end
						end
						
						if event.interrupted then
							slowFrame4( slow, event )
							return 
						else
							slow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							slow:setAlpha( 1 )
							slow:registerEventHandler( "transition_complete_keyframe", slowFrame4 )
						end
					end
					
					if event.interrupted then
						slowFrame3( slow, event )
						return 
					else
						slow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						slow:registerEventHandler( "transition_complete_keyframe", slowFrame3 )
					end
				end
				
				slow:completeAnimation()
				self.slow:setLeftRight( true, false, -15, 93 )
				self.slow:setTopBottom( true, false, -14, 94 )
				self.slow:setAlpha( 0 )
				slowFrame2( slow, {} )
				local regularFrame2 = function ( regular, event )
					local regularFrame3 = function ( regular, event )
						local regularFrame4 = function ( regular, event )
							local regularFrame5 = function ( regular, event )
								if not event.interrupted then
									regular:beginAnimation( "keyframe", 310, false, true, CoD.TweenType.Linear )
								end
								regular:setLeftRight( true, false, -61.68, 143.32 )
								regular:setTopBottom( true, false, -68.75, 156.75 )
								regular:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( regular, event )
								else
									regular:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								regularFrame5( regular, event )
								return 
							else
								regular:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								regular:setLeftRight( true, false, -31.18, 110.41 )
								regular:setTopBottom( true, false, -32.13, 123.62 )
								regular:setAlpha( 1 )
								regular:registerEventHandler( "transition_complete_keyframe", regularFrame5 )
							end
						end
						
						if event.interrupted then
							regularFrame4( regular, event )
							return 
						else
							regular:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							regular:registerEventHandler( "transition_complete_keyframe", regularFrame4 )
						end
					end
					
					if event.interrupted then
						regularFrame3( regular, event )
						return 
					else
						regular:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						regular:registerEventHandler( "transition_complete_keyframe", regularFrame3 )
					end
				end
				
				regular:completeAnimation()
				self.regular:setLeftRight( true, false, -22.33, 100.85 )
				self.regular:setTopBottom( true, false, -21.5, 114 )
				self.regular:setAlpha( 0 )
				regularFrame2( regular, {} )
				local fastFrame2 = function ( fast, event )
					local fastFrame3 = function ( fast, event )
						local fastFrame4 = function ( fast, event )
							local fastFrame5 = function ( fast, event )
								if not event.interrupted then
									fast:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
								end
								fast:setLeftRight( true, false, -79, 186 )
								fast:setTopBottom( true, false, -87, 178 )
								fast:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fast, event )
								else
									fast:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fastFrame5( fast, event )
								return 
							else
								fast:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								fast:setLeftRight( true, false, -65, 165 )
								fast:setTopBottom( true, false, -70, 160 )
								fast:registerEventHandler( "transition_complete_keyframe", fastFrame5 )
							end
						end
						
						if event.interrupted then
							fastFrame4( fast, event )
							return 
						else
							fast:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							fast:setAlpha( 1 )
							fast:registerEventHandler( "transition_complete_keyframe", fastFrame4 )
						end
					end
					
					if event.interrupted then
						fastFrame3( fast, event )
						return 
					else
						fast:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						fast:registerEventHandler( "transition_complete_keyframe", fastFrame3 )
					end
				end
				
				fast:completeAnimation()
				self.fast:setLeftRight( true, false, -17, 99 )
				self.fast:setTopBottom( true, false, -14, 102 )
				self.fast:setAlpha( 0 )
				fastFrame2( fast, {} )
				local BMWiresAllStaticFrame2 = function ( BMWiresAllStatic, event )
					local BMWiresAllStaticFrame3 = function ( BMWiresAllStatic, event )
						local BMWiresAllStaticFrame4 = function ( BMWiresAllStatic, event )
							local BMWiresAllStaticFrame5 = function ( BMWiresAllStatic, event )
								if not event.interrupted then
									BMWiresAllStatic:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								end
								BMWiresAllStatic:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( BMWiresAllStatic, event )
								else
									BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BMWiresAllStaticFrame5( BMWiresAllStatic, event )
								return 
							else
								BMWiresAllStatic:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", BMWiresAllStaticFrame5 )
							end
						end
						
						if event.interrupted then
							BMWiresAllStaticFrame4( BMWiresAllStatic, event )
							return 
						else
							BMWiresAllStatic:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							BMWiresAllStatic:setAlpha( 1 )
							BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", BMWiresAllStaticFrame4 )
						end
					end
					
					if event.interrupted then
						BMWiresAllStaticFrame3( BMWiresAllStatic, event )
						return 
					else
						BMWiresAllStatic:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", BMWiresAllStaticFrame3 )
					end
				end
				
				BMWiresAllStatic:completeAnimation()
				self.BMWiresAllStatic:setAlpha( 0 )
				BMWiresAllStaticFrame2( BMWiresAllStatic, {} )
				local cryptokeyFrontFrame2 = function ( cryptokeyFront, event )
					local cryptokeyFrontFrame3 = function ( cryptokeyFront, event )
						local cryptokeyFrontFrame4 = function ( cryptokeyFront, event )
							local cryptokeyFrontFrame5 = function ( cryptokeyFront, event )
								if not event.interrupted then
									cryptokeyFront:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								cryptokeyFront:setAlpha( 0 )
								cryptokeyFront:setYRot( 90 )
								cryptokeyFront:setScale( 1 )
								if event.interrupted then
									self.clipFinished( cryptokeyFront, event )
								else
									cryptokeyFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cryptokeyFrontFrame5( cryptokeyFront, event )
								return 
							else
								cryptokeyFront:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								cryptokeyFront:setYRot( 90 )
								cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyFrontFrame4( cryptokeyFront, event )
							return 
						else
							cryptokeyFront:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyFrontFrame3( cryptokeyFront, event )
						return 
					else
						cryptokeyFront:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cryptokeyFront:setScale( 1 )
						cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame3 )
					end
				end
				
				cryptokeyFront:completeAnimation()
				self.cryptokeyFront:setAlpha( 1 )
				self.cryptokeyFront:setYRot( 0 )
				self.cryptokeyFront:setScale( 2.5 )
				cryptokeyFrontFrame2( cryptokeyFront, {} )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					local cryptokeyBackFrame3 = function ( cryptokeyBack, event )
						local cryptokeyBackFrame4 = function ( cryptokeyBack, event )
							local cryptokeyBackFrame5 = function ( cryptokeyBack, event )
								local cryptokeyBackFrame6 = function ( cryptokeyBack, event )
									if not event.interrupted then
										cryptokeyBack:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									end
									cryptokeyBack:setAlpha( 1 )
									cryptokeyBack:setYRot( 0 )
									cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
									cryptokeyBack:setShaderVector( 0, 0.99, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( cryptokeyBack, event )
									else
										cryptokeyBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									cryptokeyBackFrame6( cryptokeyBack, event )
									return 
								else
									cryptokeyBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyBackFrame5( cryptokeyBack, event )
								return 
							else
								cryptokeyBack:beginAnimation( "keyframe", 69, true, false, CoD.TweenType.Linear )
								cryptokeyBack:setYRot( 0 )
								cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyBackFrame4( cryptokeyBack, event )
							return 
						else
							cryptokeyBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							cryptokeyBack:setAlpha( 1 )
							cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyBackFrame3( cryptokeyBack, event )
						return 
					else
						cryptokeyBack:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame3 )
					end
				end
				
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 0 )
				self.cryptokeyBack:setYRot( -89 )
				self.cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				self.cryptokeyBack:setShaderVector( 0, 0.01, 0, 0, 0 )
				cryptokeyBackFrame2( cryptokeyBack, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					local cryptokeyCountFrame3 = function ( cryptokeyCount, event )
						local cryptokeyCountFrame4 = function ( cryptokeyCount, event )
							local cryptokeyCountFrame5 = function ( cryptokeyCount, event )
								if not event.interrupted then
									cryptokeyCount:beginAnimation( "keyframe", 69, true, false, CoD.TweenType.Linear )
								end
								cryptokeyCount:setAlpha( 1 )
								cryptokeyCount:setYRot( 0 )
								cryptokeyCount:setScale( 1 )
								if event.interrupted then
									self.clipFinished( cryptokeyCount, event )
								else
									cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								cryptokeyCountFrame5( cryptokeyCount, event )
								return 
							else
								cryptokeyCount:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								cryptokeyCount:setAlpha( 1 )
								cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyCountFrame4( cryptokeyCount, event )
							return 
						else
							cryptokeyCount:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
							cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyCountFrame3( cryptokeyCount, event )
						return 
					else
						cryptokeyCount:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						cryptokeyCount:setScale( 1 )
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame3 )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 0 )
				self.cryptokeyCount:setYRot( -87 )
				self.cryptokeyCount:setScale( 2.5 )
				cryptokeyCountFrame2( cryptokeyCount, {} )
				local BonusFrame2 = function ( Bonus, event )
					local BonusFrame3 = function ( Bonus, event )
						if not event.interrupted then
							Bonus:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Bounce )
						end
						Bonus:setAlpha( 0.95 )
						if event.interrupted then
							self.clipFinished( Bonus, event )
						else
							Bonus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BonusFrame3( Bonus, event )
						return 
					else
						Bonus:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
						Bonus:registerEventHandler( "transition_complete_keyframe", BonusFrame3 )
					end
				end
				
				Bonus:completeAnimation()
				self.Bonus:setAlpha( 0 )
				BonusFrame2( Bonus, {} )
			end,
			backup = function ()
				self:setupElementClipCounter( 6 )
				local slowFrame2 = function ( slow, event )
					local slowFrame3 = function ( slow, event )
						local slowFrame4 = function ( slow, event )
							local slowFrame5 = function ( slow, event )
								if not event.interrupted then
									slow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								end
								slow:setLeftRight( true, false, -50.68, 128.32 )
								slow:setTopBottom( true, false, -46.5, 132.5 )
								slow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( slow, event )
								else
									slow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								slowFrame5( slow, event )
								return 
							else
								slow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								slow:setLeftRight( true, false, -26.42, 104.3 )
								slow:setTopBottom( true, false, -24.4, 106.32 )
								slow:registerEventHandler( "transition_complete_keyframe", slowFrame5 )
							end
						end
						
						if event.interrupted then
							slowFrame4( slow, event )
							return 
						else
							slow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							slow:setAlpha( 1 )
							slow:registerEventHandler( "transition_complete_keyframe", slowFrame4 )
						end
					end
					
					if event.interrupted then
						slowFrame3( slow, event )
						return 
					else
						slow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						slow:registerEventHandler( "transition_complete_keyframe", slowFrame3 )
					end
				end
				
				slow:completeAnimation()
				self.slow:setLeftRight( true, false, -15, 93 )
				self.slow:setTopBottom( true, false, -14, 94 )
				self.slow:setAlpha( 0 )
				slowFrame2( slow, {} )
				local regularFrame2 = function ( regular, event )
					local regularFrame3 = function ( regular, event )
						local regularFrame4 = function ( regular, event )
							local regularFrame5 = function ( regular, event )
								if not event.interrupted then
									regular:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								regular:setLeftRight( true, false, -61.68, 143.32 )
								regular:setTopBottom( true, false, -68.75, 156.75 )
								regular:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( regular, event )
								else
									regular:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								regularFrame5( regular, event )
								return 
							else
								regular:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								regular:setLeftRight( true, false, -49.88, 130.58 )
								regular:setTopBottom( true, false, -54.58, 143.93 )
								regular:setAlpha( 1 )
								regular:registerEventHandler( "transition_complete_keyframe", regularFrame5 )
							end
						end
						
						if event.interrupted then
							regularFrame4( regular, event )
							return 
						else
							regular:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							regular:registerEventHandler( "transition_complete_keyframe", regularFrame4 )
						end
					end
					
					if event.interrupted then
						regularFrame3( regular, event )
						return 
					else
						regular:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						regular:registerEventHandler( "transition_complete_keyframe", regularFrame3 )
					end
				end
				
				regular:completeAnimation()
				self.regular:setLeftRight( true, false, -22.33, 100.85 )
				self.regular:setTopBottom( true, false, -21.5, 114 )
				self.regular:setAlpha( 0 )
				regularFrame2( regular, {} )
				local fastFrame2 = function ( fast, event )
					local fastFrame3 = function ( fast, event )
						local fastFrame4 = function ( fast, event )
							local fastFrame5 = function ( fast, event )
								if not event.interrupted then
									fast:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								fast:setLeftRight( true, false, -79, 186 )
								fast:setTopBottom( true, false, -87, 178 )
								fast:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fast, event )
								else
									fast:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fastFrame5( fast, event )
								return 
							else
								fast:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								fast:setLeftRight( true, false, -65, 165 )
								fast:setTopBottom( true, false, -70, 160 )
								fast:registerEventHandler( "transition_complete_keyframe", fastFrame5 )
							end
						end
						
						if event.interrupted then
							fastFrame4( fast, event )
							return 
						else
							fast:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							fast:setAlpha( 1 )
							fast:registerEventHandler( "transition_complete_keyframe", fastFrame4 )
						end
					end
					
					if event.interrupted then
						fastFrame3( fast, event )
						return 
					else
						fast:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						fast:registerEventHandler( "transition_complete_keyframe", fastFrame3 )
					end
				end
				
				fast:completeAnimation()
				self.fast:setLeftRight( true, false, -17, 99 )
				self.fast:setTopBottom( true, false, -14, 102 )
				self.fast:setAlpha( 0 )
				fastFrame2( fast, {} )
				local BMWiresAllStaticFrame2 = function ( BMWiresAllStatic, event )
					local BMWiresAllStaticFrame3 = function ( BMWiresAllStatic, event )
						local BMWiresAllStaticFrame4 = function ( BMWiresAllStatic, event )
							if not event.interrupted then
								BMWiresAllStatic:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							BMWiresAllStatic:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BMWiresAllStatic, event )
							else
								BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BMWiresAllStaticFrame4( BMWiresAllStatic, event )
							return 
						else
							BMWiresAllStatic:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							BMWiresAllStatic:setAlpha( 1 )
							BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", BMWiresAllStaticFrame4 )
						end
					end
					
					if event.interrupted then
						BMWiresAllStaticFrame3( BMWiresAllStatic, event )
						return 
					else
						BMWiresAllStatic:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						BMWiresAllStatic:registerEventHandler( "transition_complete_keyframe", BMWiresAllStaticFrame3 )
					end
				end
				
				BMWiresAllStatic:completeAnimation()
				self.BMWiresAllStatic:setAlpha( 0 )
				BMWiresAllStaticFrame2( BMWiresAllStatic, {} )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					if not event.interrupted then
						cryptokeyBack:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					cryptokeyBack:setAlpha( 1 )
					cryptokeyBack:setScale( 1 )
					if event.interrupted then
						self.clipFinished( cryptokeyBack, event )
					else
						cryptokeyBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.cryptokeyBack:setScale( 2.5 )
				cryptokeyBackFrame2( cryptokeyBack, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					if not event.interrupted then
						cryptokeyCount:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					cryptokeyCount:setAlpha( 1 )
					cryptokeyCount:setScale( 1 )
					if event.interrupted then
						self.clipFinished( cryptokeyCount, event )
					else
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.cryptokeyCount:setScale( 2.5 )
				cryptokeyCountFrame2( cryptokeyCount, {} )
			end,
			backup = function ()
				self:setupElementClipCounter( 4 )
				local cryptokeyFrontFrame2 = function ( cryptokeyFront, event )
					local cryptokeyFrontFrame3 = function ( cryptokeyFront, event )
						local cryptokeyFrontFrame4 = function ( cryptokeyFront, event )
							local cryptokeyFrontFrame5 = function ( cryptokeyFront, event )
								local cryptokeyFrontFrame6 = function ( cryptokeyFront, event )
									local cryptokeyFrontFrame7 = function ( cryptokeyFront, event )
										local cryptokeyFrontFrame8 = function ( cryptokeyFront, event )
											local cryptokeyFrontFrame9 = function ( cryptokeyFront, event )
												if not event.interrupted then
													cryptokeyFront:beginAnimation( "keyframe", 3599, false, false, CoD.TweenType.Linear )
												end
												cryptokeyFront:setAlpha( 0 )
												cryptokeyFront:setYRot( 84 )
												if event.interrupted then
													self.clipFinished( cryptokeyFront, event )
												else
													cryptokeyFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												cryptokeyFrontFrame9( cryptokeyFront, event )
												return 
											else
												cryptokeyFront:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyFront:setYRot( 84 )
												cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyFrontFrame8( cryptokeyFront, event )
											return 
										else
											cryptokeyFront:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
											cryptokeyFront:setYRot( -94 )
											cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyFrontFrame7( cryptokeyFront, event )
										return 
									else
										cryptokeyFront:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
										cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyFrontFrame6( cryptokeyFront, event )
									return 
								else
									cryptokeyFront:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
									cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyFrontFrame5( cryptokeyFront, event )
								return 
							else
								cryptokeyFront:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
								cryptokeyFront:setYRot( 0 )
								cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyFrontFrame4( cryptokeyFront, event )
							return 
						else
							cryptokeyFront:beginAnimation( "keyframe", 1689, false, false, CoD.TweenType.Linear )
							cryptokeyFront:setAlpha( 1 )
							cryptokeyFront:setYRot( 84 )
							cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyFrontFrame3( cryptokeyFront, event )
						return 
					else
						cryptokeyFront:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyFront:setYRot( 16.08 )
						cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame3 )
					end
				end
				
				cryptokeyFront:completeAnimation()
				self.cryptokeyFront:setAlpha( 0 )
				self.cryptokeyFront:setYRot( 0 )
				cryptokeyFrontFrame2( cryptokeyFront, {} )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					local cryptokeyBackFrame3 = function ( cryptokeyBack, event )
						local cryptokeyBackFrame4 = function ( cryptokeyBack, event )
							local cryptokeyBackFrame5 = function ( cryptokeyBack, event )
								local cryptokeyBackFrame6 = function ( cryptokeyBack, event )
									local cryptokeyBackFrame7 = function ( cryptokeyBack, event )
										local cryptokeyBackFrame8 = function ( cryptokeyBack, event )
											local cryptokeyBackFrame9 = function ( cryptokeyBack, event )
												local cryptokeyBackFrame10 = function ( cryptokeyBack, event )
													if not event.interrupted then
														cryptokeyBack:beginAnimation( "keyframe", 3449, false, false, CoD.TweenType.Linear )
													end
													cryptokeyBack:setAlpha( 1 )
													cryptokeyBack:setYRot( 0 )
													if event.interrupted then
														self.clipFinished( cryptokeyBack, event )
													else
														cryptokeyBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													cryptokeyBackFrame10( cryptokeyBack, event )
													return 
												else
													cryptokeyBack:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
													cryptokeyBack:setYRot( 0 )
													cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame10 )
												end
											end
											
											if event.interrupted then
												cryptokeyBackFrame9( cryptokeyBack, event )
												return 
											else
												cryptokeyBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyBack:setAlpha( 1 )
												cryptokeyBack:setYRot( 84 )
												cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyBackFrame8( cryptokeyBack, event )
											return 
										else
											cryptokeyBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											cryptokeyBack:setYRot( 1.5 )
											cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyBackFrame7( cryptokeyBack, event )
										return 
									else
										cryptokeyBack:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										cryptokeyBack:setYRot( -81 )
										cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyBackFrame6( cryptokeyBack, event )
									return 
								else
									cryptokeyBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									cryptokeyBack:setAlpha( 0 )
									cryptokeyBack:setYRot( -83.98 )
									cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyBackFrame5( cryptokeyBack, event )
								return 
							else
								cryptokeyBack:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cryptokeyBack:setYRot( -84 )
								cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyBackFrame4( cryptokeyBack, event )
							return 
						else
							cryptokeyBack:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
							cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyBackFrame3( cryptokeyBack, event )
						return 
					else
						cryptokeyBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame3 )
					end
				end
				
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.cryptokeyBack:setYRot( 0 )
				cryptokeyBackFrame2( cryptokeyBack, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					local cryptokeyCountFrame3 = function ( cryptokeyCount, event )
						local cryptokeyCountFrame4 = function ( cryptokeyCount, event )
							local cryptokeyCountFrame5 = function ( cryptokeyCount, event )
								local cryptokeyCountFrame6 = function ( cryptokeyCount, event )
									local cryptokeyCountFrame7 = function ( cryptokeyCount, event )
										local cryptokeyCountFrame8 = function ( cryptokeyCount, event )
											local cryptokeyCountFrame9 = function ( cryptokeyCount, event )
												local cryptokeyCountFrame10 = function ( cryptokeyCount, event )
													if not event.interrupted then
														cryptokeyCount:beginAnimation( "keyframe", 3449, false, false, CoD.TweenType.Linear )
													end
													cryptokeyCount:setAlpha( 1 )
													cryptokeyCount:setXRot( 0 )
													cryptokeyCount:setYRot( 0 )
													if event.interrupted then
														self.clipFinished( cryptokeyCount, event )
													else
														cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													cryptokeyCountFrame10( cryptokeyCount, event )
													return 
												else
													cryptokeyCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
													cryptokeyCount:setYRot( 0 )
													cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame10 )
												end
											end
											
											if event.interrupted then
												cryptokeyCountFrame9( cryptokeyCount, event )
												return 
											else
												cryptokeyCount:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyCount:setAlpha( 1 )
												cryptokeyCount:setYRot( 81 )
												cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyCountFrame8( cryptokeyCount, event )
											return 
										else
											cryptokeyCount:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											cryptokeyCount:setYRot( 0 )
											cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyCountFrame7( cryptokeyCount, event )
										return 
									else
										cryptokeyCount:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyCountFrame6( cryptokeyCount, event )
									return 
								else
									cryptokeyCount:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									cryptokeyCount:setAlpha( 0 )
									cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyCountFrame5( cryptokeyCount, event )
								return 
							else
								cryptokeyCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cryptokeyCount:setYRot( -81 )
								cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyCountFrame4( cryptokeyCount, event )
							return 
						else
							cryptokeyCount:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
							cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyCountFrame3( cryptokeyCount, event )
						return 
					else
						cryptokeyCount:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame3 )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.cryptokeyCount:setXRot( 0 )
				self.cryptokeyCount:setYRot( 0 )
				cryptokeyCountFrame2( cryptokeyCount, {} )
				local f59_local3 = function ( f86_arg0, f86_arg1 )
					local f86_local0 = function ( f87_arg0, f87_arg1 )
						local f87_local0 = function ( f88_arg0, f88_arg1 )
							if not f88_arg1.interrupted then
								f88_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f88_arg0:setPlaySoundDirect( true )
							f88_arg0:playSound( "uin_bm_keydrop_flip_01", controller )
							if f88_arg1.interrupted then
								self.clipFinished( f88_arg0, f88_arg1 )
							else
								f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f87_arg1.interrupted then
							f87_local0( f87_arg0, f87_arg1 )
							return 
						else
							f87_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							f87_arg0:playSound( "0", controller )
							f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
						end
					end
					
					if f86_arg1.interrupted then
						f86_local0( f86_arg0, f86_arg1 )
						return 
					else
						f86_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f86_arg0:playSound( "uin_bm_keydrop_flip_00", controller )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
					end
				end
				
				CoinFlip:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
				CoinFlip:setPlaySoundDirect( true )
				CoinFlip:playSound( "0", controller )
				CoinFlip:registerEventHandler( "transition_complete_keyframe", f59_local3 )
				self.nextClip = "backup"
			end
		},
		Bonus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local SupportFrame2 = function ( Support, event )
					if not event.interrupted then
						Support:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Bounce )
					end
					Support:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Support, event )
					else
						Support:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Support:completeAnimation()
				self.Support:setAlpha( 0.95 )
				SupportFrame2( Support, {} )
				cryptokeyFront:completeAnimation()
				self.cryptokeyFront:setAlpha( 0 )
				self.cryptokeyFront:setYRot( 0 )
				self.clipFinished( cryptokeyFront, {} )
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.cryptokeyBack:setYRot( 0 )
				self.clipFinished( cryptokeyBack, {} )
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.clipFinished( cryptokeyCount, {} )
				local BonusFrame2 = function ( Bonus, event )
					if not event.interrupted then
						Bonus:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Bounce )
					end
					Bonus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Bonus, event )
					else
						Bonus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bonus:completeAnimation()
				self.Bonus:setAlpha( 0.95 )
				BonusFrame2( Bonus, {} )
				self.nextClip = "DefaultClip"
			end,
			backup = function ()
				self:setupElementClipCounter( 4 )
				local cryptokeyFrontFrame2 = function ( cryptokeyFront, event )
					local cryptokeyFrontFrame3 = function ( cryptokeyFront, event )
						local cryptokeyFrontFrame4 = function ( cryptokeyFront, event )
							local cryptokeyFrontFrame5 = function ( cryptokeyFront, event )
								local cryptokeyFrontFrame6 = function ( cryptokeyFront, event )
									local cryptokeyFrontFrame7 = function ( cryptokeyFront, event )
										local cryptokeyFrontFrame8 = function ( cryptokeyFront, event )
											local cryptokeyFrontFrame9 = function ( cryptokeyFront, event )
												if not event.interrupted then
													cryptokeyFront:beginAnimation( "keyframe", 3599, false, false, CoD.TweenType.Linear )
												end
												cryptokeyFront:setAlpha( 0 )
												cryptokeyFront:setYRot( 84 )
												if event.interrupted then
													self.clipFinished( cryptokeyFront, event )
												else
													cryptokeyFront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												cryptokeyFrontFrame9( cryptokeyFront, event )
												return 
											else
												cryptokeyFront:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyFront:setYRot( 84 )
												cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyFrontFrame8( cryptokeyFront, event )
											return 
										else
											cryptokeyFront:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
											cryptokeyFront:setYRot( -94 )
											cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyFrontFrame7( cryptokeyFront, event )
										return 
									else
										cryptokeyFront:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
										cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyFrontFrame6( cryptokeyFront, event )
									return 
								else
									cryptokeyFront:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
									cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyFrontFrame5( cryptokeyFront, event )
								return 
							else
								cryptokeyFront:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
								cryptokeyFront:setYRot( 0 )
								cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyFrontFrame4( cryptokeyFront, event )
							return 
						else
							cryptokeyFront:beginAnimation( "keyframe", 1689, false, false, CoD.TweenType.Linear )
							cryptokeyFront:setAlpha( 1 )
							cryptokeyFront:setYRot( 84 )
							cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyFrontFrame3( cryptokeyFront, event )
						return 
					else
						cryptokeyFront:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyFront:setYRot( 16.08 )
						cryptokeyFront:registerEventHandler( "transition_complete_keyframe", cryptokeyFrontFrame3 )
					end
				end
				
				cryptokeyFront:completeAnimation()
				self.cryptokeyFront:setAlpha( 0 )
				self.cryptokeyFront:setYRot( 0 )
				cryptokeyFrontFrame2( cryptokeyFront, {} )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					local cryptokeyBackFrame3 = function ( cryptokeyBack, event )
						local cryptokeyBackFrame4 = function ( cryptokeyBack, event )
							local cryptokeyBackFrame5 = function ( cryptokeyBack, event )
								local cryptokeyBackFrame6 = function ( cryptokeyBack, event )
									local cryptokeyBackFrame7 = function ( cryptokeyBack, event )
										local cryptokeyBackFrame8 = function ( cryptokeyBack, event )
											local cryptokeyBackFrame9 = function ( cryptokeyBack, event )
												local cryptokeyBackFrame10 = function ( cryptokeyBack, event )
													if not event.interrupted then
														cryptokeyBack:beginAnimation( "keyframe", 3449, false, false, CoD.TweenType.Linear )
													end
													cryptokeyBack:setAlpha( 1 )
													cryptokeyBack:setYRot( 0 )
													if event.interrupted then
														self.clipFinished( cryptokeyBack, event )
													else
														cryptokeyBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													cryptokeyBackFrame10( cryptokeyBack, event )
													return 
												else
													cryptokeyBack:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
													cryptokeyBack:setYRot( 0 )
													cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame10 )
												end
											end
											
											if event.interrupted then
												cryptokeyBackFrame9( cryptokeyBack, event )
												return 
											else
												cryptokeyBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyBack:setAlpha( 1 )
												cryptokeyBack:setYRot( 84 )
												cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyBackFrame8( cryptokeyBack, event )
											return 
										else
											cryptokeyBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											cryptokeyBack:setYRot( 1.5 )
											cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyBackFrame7( cryptokeyBack, event )
										return 
									else
										cryptokeyBack:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										cryptokeyBack:setYRot( -81 )
										cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyBackFrame6( cryptokeyBack, event )
									return 
								else
									cryptokeyBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									cryptokeyBack:setAlpha( 0 )
									cryptokeyBack:setYRot( -83.98 )
									cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyBackFrame5( cryptokeyBack, event )
								return 
							else
								cryptokeyBack:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cryptokeyBack:setYRot( -84 )
								cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyBackFrame4( cryptokeyBack, event )
							return 
						else
							cryptokeyBack:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
							cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyBackFrame3( cryptokeyBack, event )
						return 
					else
						cryptokeyBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame3 )
					end
				end
				
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.cryptokeyBack:setYRot( 0 )
				cryptokeyBackFrame2( cryptokeyBack, {} )
				local cryptokeyCountFrame2 = function ( cryptokeyCount, event )
					local cryptokeyCountFrame3 = function ( cryptokeyCount, event )
						local cryptokeyCountFrame4 = function ( cryptokeyCount, event )
							local cryptokeyCountFrame5 = function ( cryptokeyCount, event )
								local cryptokeyCountFrame6 = function ( cryptokeyCount, event )
									local cryptokeyCountFrame7 = function ( cryptokeyCount, event )
										local cryptokeyCountFrame8 = function ( cryptokeyCount, event )
											local cryptokeyCountFrame9 = function ( cryptokeyCount, event )
												local cryptokeyCountFrame10 = function ( cryptokeyCount, event )
													if not event.interrupted then
														cryptokeyCount:beginAnimation( "keyframe", 3449, false, false, CoD.TweenType.Linear )
													end
													cryptokeyCount:setAlpha( 1 )
													cryptokeyCount:setXRot( 0 )
													cryptokeyCount:setYRot( 0 )
													if event.interrupted then
														self.clipFinished( cryptokeyCount, event )
													else
														cryptokeyCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													cryptokeyCountFrame10( cryptokeyCount, event )
													return 
												else
													cryptokeyCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
													cryptokeyCount:setYRot( 0 )
													cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame10 )
												end
											end
											
											if event.interrupted then
												cryptokeyCountFrame9( cryptokeyCount, event )
												return 
											else
												cryptokeyCount:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												cryptokeyCount:setAlpha( 1 )
												cryptokeyCount:setYRot( 81 )
												cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame9 )
											end
										end
										
										if event.interrupted then
											cryptokeyCountFrame8( cryptokeyCount, event )
											return 
										else
											cryptokeyCount:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											cryptokeyCount:setYRot( 0 )
											cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame8 )
										end
									end
									
									if event.interrupted then
										cryptokeyCountFrame7( cryptokeyCount, event )
										return 
									else
										cryptokeyCount:beginAnimation( "keyframe", 1269, false, false, CoD.TweenType.Linear )
										cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyCountFrame6( cryptokeyCount, event )
									return 
								else
									cryptokeyCount:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									cryptokeyCount:setAlpha( 0 )
									cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyCountFrame5( cryptokeyCount, event )
								return 
							else
								cryptokeyCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								cryptokeyCount:setYRot( -81 )
								cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyCountFrame4( cryptokeyCount, event )
							return 
						else
							cryptokeyCount:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
							cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyCountFrame3( cryptokeyCount, event )
						return 
					else
						cryptokeyCount:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						cryptokeyCount:registerEventHandler( "transition_complete_keyframe", cryptokeyCountFrame3 )
					end
				end
				
				cryptokeyCount:completeAnimation()
				self.cryptokeyCount:setAlpha( 1 )
				self.cryptokeyCount:setXRot( 0 )
				self.cryptokeyCount:setYRot( 0 )
				cryptokeyCountFrame2( cryptokeyCount, {} )
				local f92_local3 = function ( f119_arg0, f119_arg1 )
					local f119_local0 = function ( f120_arg0, f120_arg1 )
						local f120_local0 = function ( f121_arg0, f121_arg1 )
							if not f121_arg1.interrupted then
								f121_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							f121_arg0:setPlaySoundDirect( true )
							f121_arg0:playSound( "uin_bm_keydrop_flip_01", controller )
							if f121_arg1.interrupted then
								self.clipFinished( f121_arg0, f121_arg1 )
							else
								f121_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f120_arg1.interrupted then
							f120_local0( f120_arg0, f120_arg1 )
							return 
						else
							f120_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							f120_arg0:playSound( "0", controller )
							f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
						end
					end
					
					if f119_arg1.interrupted then
						f119_local0( f119_arg0, f119_arg1 )
						return 
					else
						f119_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f119_arg0:playSound( "uin_bm_keydrop_flip_00", controller )
						f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
					end
				end
				
				CoinFlip:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
				CoinFlip:setPlaySoundDirect( true )
				CoinFlip:playSound( "0", controller )
				CoinFlip:registerEventHandler( "transition_complete_keyframe", f92_local3 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMWiresAllStatic:close()
		element.BMWires1:close()
		element.BMWires2:close()
		element.BMWiresGlow:close()
		element.cryptokeyCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

