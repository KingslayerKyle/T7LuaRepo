require( "ui.uieditor.widgets.BlackMarket.BM_Wires1" )
require( "ui.uieditor.widgets.BlackMarket.BM_WiresAllStatic" )
require( "ui.uieditor.widgets.BlackMarket.BM_WiresGlow" )
require( "ui.uieditor.widgets.BlackMarket.BMWire2" )

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
	self:setLeftRight( 0, 0, 0, 120 )
	self:setTopBottom( 0, 0, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Support = LUI.UIImage.new()
	Support:setLeftRight( 1, 1, -120, 62 )
	Support:setTopBottom( 0.5, 0.5, -102, 92 )
	Support:setAlpha( 0 )
	Support:setImage( RegisterImage( "uie_t7_blackmarket_cryptokeysupport" ) )
	self:addElement( Support )
	self.Support = Support
	
	local slow = LUI.UIImage.new()
	slow:setLeftRight( 0, 0, -118, 242 )
	slow:setTopBottom( 0, 0, -122, 238 )
	slow:setAlpha( 0 )
	slow:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow )
	self.slow = slow
	
	local regular = LUI.UIImage.new()
	regular:setLeftRight( 0, 0, -118, 242 )
	regular:setTopBottom( 0, 0, -136, 260 )
	regular:setAlpha( 0 )
	regular:setImage( RegisterImage( "uie_t7_icon_cryptokey_regular" ) )
	self:addElement( regular )
	self.regular = regular
	
	local fast = LUI.UIImage.new()
	fast:setLeftRight( 0, 0, -111, 303 )
	fast:setTopBottom( 0, 0, -137, 277 )
	fast:setAlpha( 0 )
	fast:setImage( RegisterImage( "uie_t7_icon_cryptokey_fast" ) )
	self:addElement( fast )
	self.fast = fast
	
	local BMWiresAllStatic = CoD.BM_WiresAllStatic.new( menu, controller )
	BMWiresAllStatic:setLeftRight( 0.5, 0.5, -88, 92 )
	BMWiresAllStatic:setTopBottom( 0, 0, -376, 164 )
	BMWiresAllStatic:setAlpha( 0 )
	BMWiresAllStatic:setScale( 0.7 )
	self:addElement( BMWiresAllStatic )
	self.BMWiresAllStatic = BMWiresAllStatic
	
	local BMWires1 = CoD.BM_Wires1.new( menu, controller )
	BMWires1:setLeftRight( 0.5, 0.5, -88, 92 )
	BMWires1:setTopBottom( 0, 0, -376, 164 )
	BMWires1:setScale( 0.7 )
	BMWires1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWires1 )
	self.BMWires1 = BMWires1
	
	local BMWires2 = CoD.BMWire2.new( menu, controller )
	BMWires2:setLeftRight( 0.5, 0.5, -88, 92 )
	BMWires2:setTopBottom( 0, 0, -376, 164 )
	BMWires2:setScale( 0.7 )
	BMWires2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWires2 )
	self.BMWires2 = BMWires2
	
	local BMWiresGlow = CoD.BM_WiresGlow.new( menu, controller )
	BMWiresGlow:setLeftRight( 0, 0, -105, 227 )
	BMWiresGlow:setTopBottom( 0, 0, -426, 232 )
	BMWiresGlow:setScale( 0.7 )
	BMWiresGlow:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMWiresGlow )
	self.BMWiresGlow = BMWiresGlow
	
	local cryptokeyFront = LUI.UIImage.new()
	cryptokeyFront:setLeftRight( 0.5, 0.5, -60, 60 )
	cryptokeyFront:setTopBottom( 0, 0, 0, 120 )
	cryptokeyFront:setAlpha( 0 )
	cryptokeyFront:setYRot( -180 )
	cryptokeyFront:setImage( RegisterImage( "uie_t7_icon_cryptokey_front" ) )
	self:addElement( cryptokeyFront )
	self.cryptokeyFront = cryptokeyFront
	
	local cryptokeyBack = LUI.UIImage.new()
	cryptokeyBack:setLeftRight( 1, 1, -119, 1 )
	cryptokeyBack:setTopBottom( 0.5, 0.5, -60, 60 )
	cryptokeyBack:setAlpha( 0 )
	cryptokeyBack:setImage( RegisterImage( "uie_t7_icon_cryptokey_back" ) )
	self:addElement( cryptokeyBack )
	self.cryptokeyBack = cryptokeyBack
	
	local cryptokeyCount = LUI.UIText.new()
	cryptokeyCount:setLeftRight( 1, 1, -126, 4 )
	cryptokeyCount:setTopBottom( 0.5, 0.5, -36, 31 )
	cryptokeyCount:setRGB( 1, 0.98, 0.8 )
	cryptokeyCount:setAlpha( 0 )
	cryptokeyCount:setTTF( "fonts/escom.ttf" )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	cryptokeyCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	cryptokeyCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "bonusKeysAwarded", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cryptokeyCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cryptokeyCount )
	self.cryptokeyCount = cryptokeyCount
	
	local CoinFlip = LUI.UIElement.new()
	CoinFlip:setLeftRight( 0, 0, 74, 146 )
	CoinFlip:setTopBottom( 0, 0, -224, -152 )
	self:addElement( CoinFlip )
	self.CoinFlip = CoinFlip
	
	local Bonus = LUI.UIText.new()
	Bonus:setLeftRight( 0, 0, -1, 126 )
	Bonus:setTopBottom( 0, 0, 140, 165 )
	Bonus:setRGB( 0.69, 0.9, 0.8 )
	Bonus:setAlpha( 0 )
	Bonus:setScale( 0.9 )
	Bonus:setText( LocalizeToUpperString( "MPUI_CRYPTOKEY_BONUS_CAPS" ) )
	Bonus:setTTF( "fonts/escom.ttf" )
	Bonus:setLineSpacing( -1.7 )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Bonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Bonus )
	self.Bonus = Bonus
	
	self.resetProperties = function ()
		slow:completeAnimation()
		regular:completeAnimation()
		cryptokeyCount:completeAnimation()
		cryptokeyBack:completeAnimation()
		fast:completeAnimation()
		BMWiresAllStatic:completeAnimation()
		cryptokeyFront:completeAnimation()
		Bonus:completeAnimation()
		Support:completeAnimation()
		CoinFlip:completeAnimation()
		slow:setLeftRight( 0, 0, -118, 242 )
		slow:setTopBottom( 0, 0, -122, 238 )
		slow:setAlpha( 0 )
		regular:setLeftRight( 0, 0, -118, 242 )
		regular:setTopBottom( 0, 0, -136, 260 )
		regular:setAlpha( 0 )
		cryptokeyCount:setAlpha( 0 )
		cryptokeyCount:setXRot( 0 )
		cryptokeyCount:setYRot( 0 )
		cryptokeyCount:setScale( 1 )
		cryptokeyBack:setAlpha( 0 )
		cryptokeyBack:setYRot( 0 )
		cryptokeyBack:setScale( 1 )
		cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		fast:setLeftRight( 0, 0, -111, 303 )
		fast:setTopBottom( 0, 0, -137, 277 )
		fast:setAlpha( 0 )
		BMWiresAllStatic:setAlpha( 0 )
		cryptokeyFront:setAlpha( 0 )
		cryptokeyFront:setYRot( -180 )
		cryptokeyFront:setScale( 1 )
		Bonus:setAlpha( 0 )
		Support:setAlpha( 0 )
		CoinFlip:setPlaySoundDirect( false )
		CoinFlip:playSound( "", controller )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Bonus = function ()
				self.resetProperties()
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
									slow:setLeftRight( 0, 0, -36, 160 )
									slow:setTopBottom( 0, 0, -41, 155 )
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
									slow:setLeftRight( 0, 0, -34.73, 158.19 )
									slow:setTopBottom( 0, 0, -39.19, 153.73 )
									slow:setAlpha( 0 )
									slow:registerEventHandler( "transition_complete_keyframe", slowFrame6 )
								end
							end
							
							if event.interrupted then
								slowFrame5( slow, event )
								return 
							else
								slow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								slow:setLeftRight( 0, 0, -25.82, 145.46 )
								slow:setTopBottom( 0, 0, -26.46, 144.82 )
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
				self.slow:setLeftRight( 0, 0, -22, 140 )
				self.slow:setTopBottom( 0, 0, -21, 141 )
				self.slow:setAlpha( 0 )
				slowFrame2( slow, {} )
				local regularFrame2 = function ( regular, event )
					local regularFrame3 = function ( regular, event )
						local regularFrame4 = function ( regular, event )
							local regularFrame5 = function ( regular, event )
								if not event.interrupted then
									regular:beginAnimation( "keyframe", 310, false, true, CoD.TweenType.Linear )
								end
								regular:setLeftRight( 0, 0, -93, 215 )
								regular:setTopBottom( 0, 0, -103, 235 )
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
								regular:setLeftRight( 0, 0, -46.89, 165.79 )
								regular:setTopBottom( 0, 0, -48.36, 185.02 )
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
				self.regular:setLeftRight( 0, 0, -33.5, 151.5 )
				self.regular:setTopBottom( 0, 0, -32.5, 170.5 )
				self.regular:setAlpha( 0 )
				regularFrame2( regular, {} )
				local fastFrame2 = function ( fast, event )
					local fastFrame3 = function ( fast, event )
						local fastFrame4 = function ( fast, event )
							local fastFrame5 = function ( fast, event )
								if not event.interrupted then
									fast:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
								end
								fast:setLeftRight( 0, 0, -118.5, 278.5 )
								fast:setTopBottom( 0, 0, -131, 267 )
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
								fast:setLeftRight( 0, 0, -97.5, 247.5 )
								fast:setTopBottom( 0, 0, -104.5, 240.5 )
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
				self.fast:setLeftRight( 0, 0, -25, 149 )
				self.fast:setTopBottom( 0, 0, -21, 153 )
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
									cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
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
				self.cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
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
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local slowFrame2 = function ( slow, event )
					local slowFrame3 = function ( slow, event )
						local slowFrame4 = function ( slow, event )
							local slowFrame5 = function ( slow, event )
								if not event.interrupted then
									slow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								end
								slow:setLeftRight( 0, 0, -76.5, 192.5 )
								slow:setTopBottom( 0, 0, -70, 198 )
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
								slow:setLeftRight( 0, 0, -39.44, 156.8 )
								slow:setTopBottom( 0, 0, -36.68, 159.24 )
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
				self.slow:setLeftRight( 0, 0, -22, 140 )
				self.slow:setTopBottom( 0, 0, -21, 141 )
				self.slow:setAlpha( 0 )
				slowFrame2( slow, {} )
				local regularFrame2 = function ( regular, event )
					local regularFrame3 = function ( regular, event )
						local regularFrame4 = function ( regular, event )
							local regularFrame5 = function ( regular, event )
								if not event.interrupted then
									regular:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								regular:setLeftRight( 0, 0, -93, 215 )
								regular:setTopBottom( 0, 0, -103, 235 )
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
								regular:setLeftRight( 0, 0, -75.15, 195.95 )
								regular:setTopBottom( 0, 0, -81.85, 215.65 )
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
				self.regular:setLeftRight( 0, 0, -33.5, 151.5 )
				self.regular:setTopBottom( 0, 0, -32.5, 170.5 )
				self.regular:setAlpha( 0 )
				regularFrame2( regular, {} )
				local fastFrame2 = function ( fast, event )
					local fastFrame3 = function ( fast, event )
						local fastFrame4 = function ( fast, event )
							local fastFrame5 = function ( fast, event )
								if not event.interrupted then
									fast:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								fast:setLeftRight( 0, 0, -118.5, 278.5 )
								fast:setTopBottom( 0, 0, -131, 267 )
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
								fast:setLeftRight( 0, 0, -97.5, 247.5 )
								fast:setTopBottom( 0, 0, -104.5, 240.5 )
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
				self.fast:setLeftRight( 0, 0, -25, 149 )
				self.fast:setTopBottom( 0, 0, -21, 153 )
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
				self.resetProperties()
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
						cryptokeyFront:setYRot( 16 )
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
											cryptokeyBack:setYRot( 2 )
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
									cryptokeyBack:setYRot( -84 )
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
				local CoinFlipFrame2 = function ( CoinFlip, event )
					local CoinFlipFrame3 = function ( CoinFlip, event )
						local CoinFlipFrame4 = function ( CoinFlip, event )
							if not event.interrupted then
								CoinFlip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							CoinFlip:setPlaySoundDirect( true )
							CoinFlip:playSound( "uin_bm_keydrop_flip_01", controller )
							if event.interrupted then
								self.clipFinished( CoinFlip, event )
							else
								CoinFlip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CoinFlipFrame4( CoinFlip, event )
							return 
						else
							CoinFlip:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							CoinFlip:playSound( "0", controller )
							CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame4 )
						end
					end
					
					if event.interrupted then
						CoinFlipFrame3( CoinFlip, event )
						return 
					else
						CoinFlip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						CoinFlip:playSound( "uin_bm_keydrop_flip_00", controller )
						CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame3 )
					end
				end
				
				CoinFlip:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
				CoinFlip:setPlaySoundDirect( true )
				CoinFlip:playSound( "0", controller )
				CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame2 )
				self.nextClip = "backup"
			end
		},
		Bonus = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.cryptokeyFront:setYRot( 0 )
				self.clipFinished( cryptokeyFront, {} )
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
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
				self.resetProperties()
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
						cryptokeyFront:setYRot( 16 )
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
											cryptokeyBack:setYRot( 2 )
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
									cryptokeyBack:setYRot( -84 )
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
				local CoinFlipFrame2 = function ( CoinFlip, event )
					local CoinFlipFrame3 = function ( CoinFlip, event )
						local CoinFlipFrame4 = function ( CoinFlip, event )
							if not event.interrupted then
								CoinFlip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							CoinFlip:setPlaySoundDirect( true )
							CoinFlip:playSound( "uin_bm_keydrop_flip_01", controller )
							if event.interrupted then
								self.clipFinished( CoinFlip, event )
							else
								CoinFlip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CoinFlipFrame4( CoinFlip, event )
							return 
						else
							CoinFlip:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
							CoinFlip:playSound( "0", controller )
							CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame4 )
						end
					end
					
					if event.interrupted then
						CoinFlipFrame3( CoinFlip, event )
						return 
					else
						CoinFlip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						CoinFlip:playSound( "uin_bm_keydrop_flip_00", controller )
						CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame3 )
					end
				end
				
				CoinFlip:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
				CoinFlip:setPlaySoundDirect( true )
				CoinFlip:playSound( "0", controller )
				CoinFlip:registerEventHandler( "transition_complete_keyframe", CoinFlipFrame2 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMWiresAllStatic:close()
		self.BMWires1:close()
		self.BMWires2:close()
		self.BMWiresGlow:close()
		self.cryptokeyCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

