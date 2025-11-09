require( "ui.uieditor.widgets.Promo.Promo_RewardImage" )

CoD.Promo_UnlockableRewardLargeLock = InheritFrom( LUI.UIElement )
CoD.Promo_UnlockableRewardLargeLock.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Promo_UnlockableRewardLargeLock )
	self.id = "Promo_UnlockableRewardLargeLock"
	self.soundSet = "Blackmarket_extra"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local Frame = LUI.UIImage.new()
	Frame:setLeftRight( true, false, 0, 300 )
	Frame:setTopBottom( true, false, 0, 75 )
	Frame:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_frame" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local PromoRewardImage = CoD.Promo_RewardImage.new( menu, controller )
	PromoRewardImage:setLeftRight( true, false, 36, 288 )
	PromoRewardImage:setTopBottom( true, false, 5.5, 68.5 )
	PromoRewardImage:setAlpha( 0.4 )
	PromoRewardImage:linkToElementModel( self, nil, false, function ( model )
		PromoRewardImage:setModel( model, controller )
	end )
	PromoRewardImage:mergeStateConditions( {
		{
			stateName = "CallingCard",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isContractBG" )
			end
		}
	} )
	PromoRewardImage:linkToElementModel( PromoRewardImage, "isContractBG", true, function ( model )
		menu:updateElementState( PromoRewardImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractBG"
		} )
	end )
	self:addElement( PromoRewardImage )
	self.PromoRewardImage = PromoRewardImage
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( true, false, 36, 288 )
	Lock:setTopBottom( true, false, 5.5, 68.5 )
	Lock:setImage( RegisterImage( "uie_t7_menu_community_bgb_locked" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	local NearCompleteLineGlow = LUI.UIImage.new()
	NearCompleteLineGlow:setLeftRight( true, false, -9, 25 )
	NearCompleteLineGlow:setTopBottom( true, false, 24.5, 58.5 )
	NearCompleteLineGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_circuitbottom" ) )
	self:addElement( NearCompleteLineGlow )
	self.NearCompleteLineGlow = NearCompleteLineGlow
	
	local NearCompleteLineGlow3 = LUI.UIImage.new()
	NearCompleteLineGlow3:setLeftRight( true, false, -42.74, -6.8 )
	NearCompleteLineGlow3:setTopBottom( true, false, 0, 44.5 )
	NearCompleteLineGlow3:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_topglowline" ) )
	self:addElement( NearCompleteLineGlow3 )
	self.NearCompleteLineGlow3 = NearCompleteLineGlow3
	
	local NearCompleteLineGlow2 = LUI.UIImage.new()
	NearCompleteLineGlow2:setLeftRight( true, false, -42.74, -6.8 )
	NearCompleteLineGlow2:setTopBottom( true, false, 32, 76.5 )
	NearCompleteLineGlow2:setXRot( 180 )
	NearCompleteLineGlow2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_topglowline" ) )
	self:addElement( NearCompleteLineGlow2 )
	self.NearCompleteLineGlow2 = NearCompleteLineGlow2
	
	local CompleteGlowBack = LUI.UIImage.new()
	CompleteGlowBack:setLeftRight( true, false, -43.9, 86.6 )
	CompleteGlowBack:setTopBottom( true, false, -26.75, 103.75 )
	CompleteGlowBack:setXRot( 180 )
	CompleteGlowBack:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glow1" ) )
	self:addElement( CompleteGlowBack )
	self.CompleteGlowBack = CompleteGlowBack
	
	local CompleteGlowBack2 = LUI.UIImage.new()
	CompleteGlowBack2:setLeftRight( true, false, -44, 94 )
	CompleteGlowBack2:setTopBottom( true, false, -26.75, 111.25 )
	CompleteGlowBack2:setAlpha( 0.25 )
	CompleteGlowBack2:setXRot( 180 )
	CompleteGlowBack2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glow2" ) )
	self:addElement( CompleteGlowBack2 )
	self.CompleteGlowBack2 = CompleteGlowBack2
	
	local CompleteLineGlow0 = LUI.UIImage.new()
	CompleteLineGlow0:setLeftRight( true, false, -17.8, 61.5 )
	CompleteLineGlow0:setTopBottom( true, false, -2.8, 76.5 )
	CompleteLineGlow0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_circuitback" ) )
	self:addElement( CompleteLineGlow0 )
	self.CompleteLineGlow0 = CompleteLineGlow0
	
	local CompleteLineGlow1 = LUI.UIImage.new()
	CompleteLineGlow1:setLeftRight( true, false, -5.5, 30.5 )
	CompleteLineGlow1:setTopBottom( true, false, 20, 56 )
	CompleteLineGlow1:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_circuitfull" ) )
	self:addElement( CompleteLineGlow1 )
	self.CompleteLineGlow1 = CompleteLineGlow1
	
	local CompleteLineGlow2 = LUI.UIImage.new()
	CompleteLineGlow2:setLeftRight( true, false, -9.65, 52.35 )
	CompleteLineGlow2:setTopBottom( true, false, 7.5, 69.5 )
	CompleteLineGlow2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_circuitthick" ) )
	self:addElement( CompleteLineGlow2 )
	self.CompleteLineGlow2 = CompleteLineGlow2
	
	local CompleteLineCenter = LUI.UIImage.new()
	CompleteLineCenter:setLeftRight( true, false, -48.15, 26.85 )
	CompleteLineCenter:setTopBottom( true, false, 23.71, 52.29 )
	CompleteLineCenter:setXRot( 180 )
	CompleteLineCenter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_centerline" ) )
	CompleteLineCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	CompleteLineCenter:setShaderVector( 0, 0, 1, 0, 0 )
	CompleteLineCenter:setShaderVector( 1, 0, 0, 0, 0 )
	CompleteLineCenter:setShaderVector( 2, 0, 1, 0, 0 )
	CompleteLineCenter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( CompleteLineCenter )
	self.CompleteLineCenter = CompleteLineCenter
	
	local CompleteGlowCenter = LUI.UIImage.new()
	CompleteGlowCenter:setLeftRight( true, false, -62.15, -9.65 )
	CompleteGlowCenter:setTopBottom( true, false, 12.25, 64.75 )
	CompleteGlowCenter:setXRot( 180 )
	CompleteGlowCenter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_centerglow" ) )
	self:addElement( CompleteGlowCenter )
	self.CompleteGlowCenter = CompleteGlowCenter
	
	local CompleteFrameBarTop = LUI.UIImage.new()
	CompleteFrameBarTop:setLeftRight( true, false, 18.5, 308.83 )
	CompleteFrameBarTop:setTopBottom( true, false, -8.89, 19.79 )
	CompleteFrameBarTop:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_framebar" ) )
	self:addElement( CompleteFrameBarTop )
	self.CompleteFrameBarTop = CompleteFrameBarTop
	
	local CompleteFrameBarBottom = LUI.UIImage.new()
	CompleteFrameBarBottom:setLeftRight( true, false, 18.5, 308.83 )
	CompleteFrameBarBottom:setTopBottom( true, false, 54.25, 82.92 )
	CompleteFrameBarBottom:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_framebar" ) )
	self:addElement( CompleteFrameBarBottom )
	self.CompleteFrameBarBottom = CompleteFrameBarBottom
	
	local GlowBarBlurBottom = LUI.UIImage.new()
	GlowBarBlurBottom:setLeftRight( true, false, 18.5, 308.83 )
	GlowBarBlurBottom:setTopBottom( true, false, 53.59, 82.92 )
	GlowBarBlurBottom:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_framebarblur" ) )
	self:addElement( GlowBarBlurBottom )
	self.GlowBarBlurBottom = GlowBarBlurBottom
	
	local GlowBarBlurTop = LUI.UIImage.new()
	GlowBarBlurTop:setLeftRight( true, false, 18.5, 308.83 )
	GlowBarBlurTop:setTopBottom( true, false, -8.89, 19.79 )
	GlowBarBlurTop:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_framebarblur" ) )
	self:addElement( GlowBarBlurTop )
	self.GlowBarBlurTop = GlowBarBlurTop
	
	local CompleteGlowSide = LUI.UIImage.new()
	CompleteGlowSide:setLeftRight( true, false, -22.88, 40.5 )
	CompleteGlowSide:setTopBottom( true, false, 3, 71.67 )
	CompleteGlowSide:setAlpha( 0 )
	CompleteGlowSide:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_frameglow" ) )
	self:addElement( CompleteGlowSide )
	self.CompleteGlowSide = CompleteGlowSide
	
	local CompleteGlowBack0 = LUI.UIImage.new()
	CompleteGlowBack0:setLeftRight( true, false, -19.4, 52.35 )
	CompleteGlowBack0:setTopBottom( true, false, 0.98, 72.73 )
	CompleteGlowBack0:setXRot( 180 )
	CompleteGlowBack0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glow1" ) )
	CompleteGlowBack0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CompleteGlowBack0 )
	self.CompleteGlowBack0 = CompleteGlowBack0
	
	local CompletedPulse1 = LUI.UIImage.new()
	CompletedPulse1:setLeftRight( true, false, -6.42, 30.66 )
	CompletedPulse1:setTopBottom( true, false, 9.13, 64.75 )
	CompletedPulse1:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_circuitpulse1" ) )
	CompletedPulse1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CompletedPulse1 )
	self.CompletedPulse1 = CompletedPulse1
	
	local BlackTextBar = LUI.UIImage.new()
	BlackTextBar:setLeftRight( true, false, 20.85, 294.67 )
	BlackTextBar:setTopBottom( true, false, 54.25, 70.3 )
	BlackTextBar:setAlpha( 0.25 )
	BlackTextBar:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_textbar" ) )
	self:addElement( BlackTextBar )
	self.BlackTextBar = BlackTextBar
	
	local GlowFrame = LUI.UIImage.new()
	GlowFrame:setLeftRight( true, false, 26.85, 100.95 )
	GlowFrame:setTopBottom( true, false, 15.95, 123.05 )
	GlowFrame:setZRot( 90 )
	GlowFrame:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	self:addElement( GlowFrame )
	self.GlowFrame = GlowFrame
	
	local GlowFrame0 = LUI.UIImage.new()
	GlowFrame0:setLeftRight( true, false, 26.85, 100.95 )
	GlowFrame0:setTopBottom( true, false, -47.35, 59.75 )
	GlowFrame0:setZRot( 90 )
	GlowFrame0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	self:addElement( GlowFrame0 )
	self.GlowFrame0 = GlowFrame0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 38.17, 292.34 )
	TextBox0:setTopBottom( true, false, 53.59, 69.59 )
	TextBox0:setAlpha( 0.7 )
	TextBox0:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Tick2 = LUI.UIImage.new()
	Tick2:setLeftRight( true, false, 292.34, 320.34 )
	Tick2:setTopBottom( false, false, 29.09, 33.09 )
	Tick2:setAlpha( 0.5 )
	Tick2:setZRot( 180 )
	Tick2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Tick2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Tick2 )
	self.Tick2 = Tick2
	
	local FlipbookAdd20 = LUI.UIImage.new()
	FlipbookAdd20:setLeftRight( true, false, -22.88, 34.62 )
	FlipbookAdd20:setTopBottom( true, false, 30.75, 53.75 )
	FlipbookAdd20:setAlpha( 0 )
	FlipbookAdd20:setScale( 0.6 )
	FlipbookAdd20:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_spark_flipbook" ) )
	FlipbookAdd20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	FlipbookAdd20:setShaderVector( 0, 5, 0, 0, 0 )
	FlipbookAdd20:setShaderVector( 1, 7.67, 0, 0, 0 )
	self:addElement( FlipbookAdd20 )
	self.FlipbookAdd20 = FlipbookAdd20
	
	local FlipbookAdd = LUI.UIImage.new()
	FlipbookAdd:setLeftRight( true, false, -21.84, 35.66 )
	FlipbookAdd:setTopBottom( true, false, 27, 50 )
	FlipbookAdd:setAlpha( 0 )
	FlipbookAdd:setZRot( -90 )
	FlipbookAdd:setScale( 0.4 )
	FlipbookAdd:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_spark_flipbook" ) )
	FlipbookAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	FlipbookAdd:setShaderVector( 0, 5, 0, 0, 0 )
	FlipbookAdd:setShaderVector( 1, 7.67, 0, 0, 0 )
	self:addElement( FlipbookAdd )
	self.FlipbookAdd = FlipbookAdd
	
	local FlipbookAdd2 = LUI.UIImage.new()
	FlipbookAdd2:setLeftRight( true, false, -21.84, 35.66 )
	FlipbookAdd2:setTopBottom( true, false, 27, 50 )
	FlipbookAdd2:setAlpha( 0.47 )
	FlipbookAdd2:setZRot( -90 )
	FlipbookAdd2:setScale( 0.4 )
	FlipbookAdd2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_spark_flipbook" ) )
	FlipbookAdd2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	FlipbookAdd2:setShaderVector( 0, 5, 0, 0, 0 )
	FlipbookAdd2:setShaderVector( 1, 7.67, 0, 0, 0 )
	self:addElement( FlipbookAdd2 )
	self.FlipbookAdd2 = FlipbookAdd2
	
	local GlowFrame00 = LUI.UIImage.new()
	GlowFrame00:setLeftRight( true, false, -163.05, 170.05 )
	GlowFrame00:setTopBottom( true, false, -26.75, 105.35 )
	GlowFrame00:setAlpha( 0.6 )
	GlowFrame00:setZRot( 90 )
	GlowFrame00:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	GlowFrame00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowFrame00 )
	self.GlowFrame00 = GlowFrame00
	
	local Tick20 = LUI.UIImage.new()
	Tick20:setLeftRight( true, false, 292.34, 320.34 )
	Tick20:setTopBottom( false, false, -34.3, -30.3 )
	Tick20:setAlpha( 0.5 )
	Tick20:setZRot( 180 )
	Tick20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Tick20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Tick20 )
	self.Tick20 = Tick20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 28 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				PromoRewardImage:completeAnimation()
				PromoRewardImage.Image:completeAnimation()
				self.PromoRewardImage:setAlpha( 0.4 )
				self.clipFinished( PromoRewardImage, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow, {} )
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow3, {} )
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack, {} )
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow0, {} )
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow1, {} )
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 0 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 0 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 0 )
				self.clipFinished( CompleteGlowSide, {} )
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0 )
				self.clipFinished( FlipbookAdd2, {} )
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				self.clipFinished( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0 )
				self.clipFinished( Tick20, {} )
			end,
			Complete = function ()
				self:setupElementClipCounter( 27 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow, {} )
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow3, {} )
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 1 )
				self.clipFinished( CompleteGlowBack, {} )
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0.25 )
				self.clipFinished( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 1 )
				self.clipFinished( CompleteLineGlow0, {} )
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 1 )
				self.clipFinished( CompleteLineGlow1, {} )
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 1 )
				self.clipFinished( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 1 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 1 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 1 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 1 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 1 )
				self.clipFinished( CompleteGlowSide, {} )
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 1 )
				self.clipFinished( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0.5 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0.5 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0.9 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0.5 )
				self.FlipbookAdd2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
				self.FlipbookAdd2:setShaderVector( 0, 5, 0, 0, 0 )
				self.FlipbookAdd2:setShaderVector( 1, 15.5, 0, 0, 0 )
				self.clipFinished( FlipbookAdd2, {} )
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				self.clipFinished( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0.5 )
				self.clipFinished( Tick20, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 29 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				PromoRewardImage:completeAnimation()
				self.PromoRewardImage:setAlpha( 0.4 )
				self.clipFinished( PromoRewardImage, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow, {} )
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow3, {} )
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack, {} )
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow0, {} )
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow1, {} )
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 0 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 0 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 0 )
				self.clipFinished( CompleteGlowSide, {} )
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0 )
				self.clipFinished( FlipbookAdd2, {} )
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				self.clipFinished( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0 )
				self.clipFinished( Tick20, {} )
			end,
			NearComplete = function ()
				self:setupElementClipCounter( 28 )
				Frame:completeAnimation()
				self.Frame:setRGB( 1, 1, 1 )
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				PromoRewardImage:completeAnimation()
				self.PromoRewardImage:setAlpha( 0.4 )
				self.clipFinished( PromoRewardImage, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
				local NearCompleteLineGlowFrame2 = function ( NearCompleteLineGlow, event )
					if not event.interrupted then
						NearCompleteLineGlow:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Bounce )
					end
					NearCompleteLineGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NearCompleteLineGlow, event )
					else
						NearCompleteLineGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 0 )
				NearCompleteLineGlowFrame2( NearCompleteLineGlow, {} )
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow3, {} )
				local NearCompleteLineGlow2Frame2 = function ( NearCompleteLineGlow2, event )
					if not event.interrupted then
						NearCompleteLineGlow2:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Bounce )
					end
					NearCompleteLineGlow2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NearCompleteLineGlow2, event )
					else
						NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 0 )
				NearCompleteLineGlow2Frame2( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack, {} )
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow0, {} )
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow1, {} )
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 0 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 0 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 0 )
				self.clipFinished( CompleteGlowSide, {} )
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0 )
				self.clipFinished( FlipbookAdd2, {} )
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				self.clipFinished( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0 )
				self.clipFinished( Tick20, {} )
			end
		},
		NearComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 29 )
				Frame:completeAnimation()
				self.Frame:setRGB( 1, 1, 1 )
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				PromoRewardImage:completeAnimation()
				self.PromoRewardImage:setAlpha( 0.4 )
				self.clipFinished( PromoRewardImage, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow, {} )
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 0 )
				self.clipFinished( NearCompleteLineGlow3, {} )
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack, {} )
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow0, {} )
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow1, {} )
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 0 )
				self.clipFinished( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 0 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 0 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 0 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 0 )
				self.clipFinished( CompleteGlowSide, {} )
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 0 )
				self.clipFinished( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0 )
				self.clipFinished( FlipbookAdd2, {} )
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				self.clipFinished( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0 )
				self.clipFinished( Tick20, {} )
			end,
			Complete = function ()
				self:setupElementClipCounter( 28 )
				Frame:completeAnimation()
				self.Frame:setRGB( 1, 1, 1 )
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				local PromoRewardImageFrame2 = function ( PromoRewardImage, event )
					local PromoRewardImageFrame3 = function ( PromoRewardImage, event )
						if not event.interrupted then
							PromoRewardImage:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						PromoRewardImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PromoRewardImage, event )
						else
							PromoRewardImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PromoRewardImageFrame3( PromoRewardImage, event )
						return 
					else
						PromoRewardImage:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						PromoRewardImage:registerEventHandler( "transition_complete_keyframe", PromoRewardImageFrame3 )
					end
				end
				
				PromoRewardImage:completeAnimation()
				self.PromoRewardImage:setAlpha( 0.4 )
				PromoRewardImageFrame2( PromoRewardImage, {} )
				local LockFrame2 = function ( Lock, event )
					local LockFrame3 = function ( Lock, event )
						if not event.interrupted then
							Lock:beginAnimation( "keyframe", 379, true, false, CoD.TweenType.Bounce )
						end
						Lock:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Lock, event )
						else
							Lock:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LockFrame3( Lock, event )
						return 
					else
						Lock:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Lock:registerEventHandler( "transition_complete_keyframe", LockFrame3 )
					end
				end
				
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				LockFrame2( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow, {} )
				local NearCompleteLineGlow3Frame2 = function ( NearCompleteLineGlow3, event )
					if not event.interrupted then
						NearCompleteLineGlow3:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					NearCompleteLineGlow3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( NearCompleteLineGlow3, event )
					else
						NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 0 )
				NearCompleteLineGlow3Frame2( NearCompleteLineGlow3, {} )
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow2, {} )
				local CompleteGlowBackFrame2 = function ( CompleteGlowBack, event )
					local CompleteGlowBackFrame3 = function ( CompleteGlowBack, event )
						if not event.interrupted then
							CompleteGlowBack:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Bounce )
						end
						CompleteGlowBack:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteGlowBack, event )
						else
							CompleteGlowBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteGlowBackFrame3( CompleteGlowBack, event )
						return 
					else
						CompleteGlowBack:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CompleteGlowBack:registerEventHandler( "transition_complete_keyframe", CompleteGlowBackFrame3 )
					end
				end
				
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 0 )
				CompleteGlowBackFrame2( CompleteGlowBack, {} )
				local CompleteGlowBack2Frame2 = function ( CompleteGlowBack2, event )
					local CompleteGlowBack2Frame3 = function ( CompleteGlowBack2, event )
						if not event.interrupted then
							CompleteGlowBack2:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Bounce )
						end
						CompleteGlowBack2:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( CompleteGlowBack2, event )
						else
							CompleteGlowBack2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteGlowBack2Frame3( CompleteGlowBack2, event )
						return 
					else
						CompleteGlowBack2:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CompleteGlowBack2:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack2Frame3 )
					end
				end
				
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0 )
				CompleteGlowBack2Frame2( CompleteGlowBack2, {} )
				local CompleteLineGlow0Frame2 = function ( CompleteLineGlow0, event )
					local CompleteLineGlow0Frame3 = function ( CompleteLineGlow0, event )
						if not event.interrupted then
							CompleteLineGlow0:beginAnimation( "keyframe", 279, true, false, CoD.TweenType.Bounce )
						end
						CompleteLineGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteLineGlow0, event )
						else
							CompleteLineGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteLineGlow0Frame3( CompleteLineGlow0, event )
						return 
					else
						CompleteLineGlow0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						CompleteLineGlow0:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow0Frame3 )
					end
				end
				
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 0 )
				CompleteLineGlow0Frame2( CompleteLineGlow0, {} )
				local CompleteLineGlow1Frame2 = function ( CompleteLineGlow1, event )
					local CompleteLineGlow1Frame3 = function ( CompleteLineGlow1, event )
						if not event.interrupted then
							CompleteLineGlow1:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
						end
						CompleteLineGlow1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteLineGlow1, event )
						else
							CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteLineGlow1Frame3( CompleteLineGlow1, event )
						return 
					else
						CompleteLineGlow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame3 )
					end
				end
				
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 0 )
				CompleteLineGlow1Frame2( CompleteLineGlow1, {} )
				local CompleteLineGlow2Frame2 = function ( CompleteLineGlow2, event )
					local CompleteLineGlow2Frame3 = function ( CompleteLineGlow2, event )
						if not event.interrupted then
							CompleteLineGlow2:beginAnimation( "keyframe", 199, true, false, CoD.TweenType.Bounce )
						end
						CompleteLineGlow2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteLineGlow2, event )
						else
							CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteLineGlow2Frame3( CompleteLineGlow2, event )
						return 
					else
						CompleteLineGlow2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame3 )
					end
				end
				
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 0 )
				CompleteLineGlow2Frame2( CompleteLineGlow2, {} )
				local f12_local8 = function ( f28_arg0, f28_arg1 )
					local f28_local0 = function ( f29_arg0, f29_arg1 )
						if not f29_arg1.interrupted then
							f29_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						end
						f29_arg0:setAlpha( 1 )
						f29_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
						f29_arg0:setShaderVector( 0, 0, 1, 0, 0 )
						f29_arg0:setShaderVector( 1, 0, 0, 0, 0 )
						f29_arg0:setShaderVector( 2, 0, 1, 0, 0 )
						f29_arg0:setShaderVector( 3, 0, 0, 0, 0 )
						if f29_arg1.interrupted then
							self.clipFinished( f29_arg0, f29_arg1 )
						else
							f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f28_arg1.interrupted then
						f28_local0( f28_arg0, f28_arg1 )
						return 
					else
						f28_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f28_arg0:setAlpha( 1 )
						f28_arg0:setShaderVector( 0, 0, 0.06, 0, 0 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
				end
				
				CompleteLineCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				CompleteLineCenter:setAlpha( 0 )
				CompleteLineCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				CompleteLineCenter:setShaderVector( 0, 0, 0, 0, 0 )
				CompleteLineCenter:setShaderVector( 1, 0, 0, 0, 0 )
				CompleteLineCenter:setShaderVector( 2, 0, 1, 0, 0 )
				CompleteLineCenter:setShaderVector( 3, 0, 0, 0, 0 )
				CompleteLineCenter:registerEventHandler( "transition_complete_keyframe", f12_local8 )
				local CompleteGlowCenterFrame2 = function ( CompleteGlowCenter, event )
					local CompleteGlowCenterFrame3 = function ( CompleteGlowCenter, event )
						local CompleteGlowCenterFrame4 = function ( CompleteGlowCenter, event )
							local CompleteGlowCenterFrame5 = function ( CompleteGlowCenter, event )
								if not event.interrupted then
									CompleteGlowCenter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CompleteGlowCenter:setAlpha( 1 )
								CompleteGlowCenter:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CompleteGlowCenter, event )
								else
									CompleteGlowCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CompleteGlowCenterFrame5( CompleteGlowCenter, event )
								return 
							else
								CompleteGlowCenter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								CompleteGlowCenter:setAlpha( 0.67 )
								CompleteGlowCenter:setScale( 1 )
								CompleteGlowCenter:registerEventHandler( "transition_complete_keyframe", CompleteGlowCenterFrame5 )
							end
						end
						
						if event.interrupted then
							CompleteGlowCenterFrame4( CompleteGlowCenter, event )
							return 
						else
							CompleteGlowCenter:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							CompleteGlowCenter:setAlpha( 1 )
							CompleteGlowCenter:setScale( 2.4 )
							CompleteGlowCenter:registerEventHandler( "transition_complete_keyframe", CompleteGlowCenterFrame4 )
						end
					end
					
					if event.interrupted then
						CompleteGlowCenterFrame3( CompleteGlowCenter, event )
						return 
					else
						CompleteGlowCenter:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						CompleteGlowCenter:registerEventHandler( "transition_complete_keyframe", CompleteGlowCenterFrame3 )
					end
				end
				
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 0 )
				self.CompleteGlowCenter:setScale( 1 )
				CompleteGlowCenterFrame2( CompleteGlowCenter, {} )
				local CompleteFrameBarTopFrame2 = function ( CompleteFrameBarTop, event )
					local CompleteFrameBarTopFrame3 = function ( CompleteFrameBarTop, event )
						if not event.interrupted then
							CompleteFrameBarTop:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Bounce )
						end
						CompleteFrameBarTop:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteFrameBarTop, event )
						else
							CompleteFrameBarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteFrameBarTopFrame3( CompleteFrameBarTop, event )
						return 
					else
						CompleteFrameBarTop:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CompleteFrameBarTop:registerEventHandler( "transition_complete_keyframe", CompleteFrameBarTopFrame3 )
					end
				end
				
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 0 )
				CompleteFrameBarTopFrame2( CompleteFrameBarTop, {} )
				local CompleteFrameBarBottomFrame2 = function ( CompleteFrameBarBottom, event )
					local CompleteFrameBarBottomFrame3 = function ( CompleteFrameBarBottom, event )
						if not event.interrupted then
							CompleteFrameBarBottom:beginAnimation( "keyframe", 209, true, false, CoD.TweenType.Bounce )
						end
						CompleteFrameBarBottom:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteFrameBarBottom, event )
						else
							CompleteFrameBarBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteFrameBarBottomFrame3( CompleteFrameBarBottom, event )
						return 
					else
						CompleteFrameBarBottom:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CompleteFrameBarBottom:registerEventHandler( "transition_complete_keyframe", CompleteFrameBarBottomFrame3 )
					end
				end
				
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 0 )
				CompleteFrameBarBottomFrame2( CompleteFrameBarBottom, {} )
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				self.clipFinished( GlowBarBlurBottom, {} )
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				self.clipFinished( GlowBarBlurTop, {} )
				local CompleteGlowSideFrame2 = function ( CompleteGlowSide, event )
					local CompleteGlowSideFrame3 = function ( CompleteGlowSide, event )
						if not event.interrupted then
							CompleteGlowSide:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						CompleteGlowSide:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteGlowSide, event )
						else
							CompleteGlowSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteGlowSideFrame3( CompleteGlowSide, event )
						return 
					else
						CompleteGlowSide:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						CompleteGlowSide:registerEventHandler( "transition_complete_keyframe", CompleteGlowSideFrame3 )
					end
				end
				
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 0 )
				CompleteGlowSideFrame2( CompleteGlowSide, {} )
				local CompleteGlowBack0Frame2 = function ( CompleteGlowBack0, event )
					local CompleteGlowBack0Frame3 = function ( CompleteGlowBack0, event )
						local CompleteGlowBack0Frame4 = function ( CompleteGlowBack0, event )
							if not event.interrupted then
								CompleteGlowBack0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							CompleteGlowBack0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CompleteGlowBack0, event )
							else
								CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CompleteGlowBack0Frame4( CompleteGlowBack0, event )
							return 
						else
							CompleteGlowBack0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							CompleteGlowBack0:setAlpha( 1 )
							CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame4 )
						end
					end
					
					if event.interrupted then
						CompleteGlowBack0Frame3( CompleteGlowBack0, event )
						return 
					else
						CompleteGlowBack0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame3 )
					end
				end
				
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 0 )
				CompleteGlowBack0Frame2( CompleteGlowBack0, {} )
				local CompletedPulse1Frame2 = function ( CompletedPulse1, event )
					local CompletedPulse1Frame3 = function ( CompletedPulse1, event )
						local CompletedPulse1Frame4 = function ( CompletedPulse1, event )
							local CompletedPulse1Frame5 = function ( CompletedPulse1, event )
								local CompletedPulse1Frame6 = function ( CompletedPulse1, event )
									if not event.interrupted then
										CompletedPulse1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									CompletedPulse1:setLeftRight( true, false, -10.65, 26.43 )
									CompletedPulse1:setTopBottom( true, false, 9.13, 64.75 )
									CompletedPulse1:setAlpha( 0 )
									CompletedPulse1:setScale( 1.6 )
									if event.interrupted then
										self.clipFinished( CompletedPulse1, event )
									else
										CompletedPulse1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CompletedPulse1Frame6( CompletedPulse1, event )
									return 
								else
									CompletedPulse1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									CompletedPulse1:setLeftRight( true, false, -8.94, 28.15 )
									CompletedPulse1:setAlpha( 0.31 )
									CompletedPulse1:setScale( 1.36 )
									CompletedPulse1:registerEventHandler( "transition_complete_keyframe", CompletedPulse1Frame6 )
								end
							end
							
							if event.interrupted then
								CompletedPulse1Frame5( CompletedPulse1, event )
								return 
							else
								CompletedPulse1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								CompletedPulse1:setLeftRight( true, false, -7.68, 29.4 )
								CompletedPulse1:setScale( 1.18 )
								CompletedPulse1:registerEventHandler( "transition_complete_keyframe", CompletedPulse1Frame5 )
							end
						end
						
						if event.interrupted then
							CompletedPulse1Frame4( CompletedPulse1, event )
							return 
						else
							CompletedPulse1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							CompletedPulse1:setAlpha( 1 )
							CompletedPulse1:registerEventHandler( "transition_complete_keyframe", CompletedPulse1Frame4 )
						end
					end
					
					if event.interrupted then
						CompletedPulse1Frame3( CompletedPulse1, event )
						return 
					else
						CompletedPulse1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						CompletedPulse1:registerEventHandler( "transition_complete_keyframe", CompletedPulse1Frame3 )
					end
				end
				
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setLeftRight( true, false, -6.42, 30.66 )
				self.CompletedPulse1:setTopBottom( true, false, 9.13, 64.75 )
				self.CompletedPulse1:setAlpha( 0 )
				self.CompletedPulse1:setScale( 1 )
				CompletedPulse1Frame2( CompletedPulse1, {} )
				local GlowFrameFrame2 = function ( GlowFrame, event )
					local GlowFrameFrame3 = function ( GlowFrame, event )
						local GlowFrameFrame4 = function ( GlowFrame, event )
							local GlowFrameFrame5 = function ( GlowFrame, event )
								if not event.interrupted then
									GlowFrame:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								end
								GlowFrame:setLeftRight( true, false, 248.5, 322.6 )
								GlowFrame:setTopBottom( true, false, 15.95, 123.05 )
								GlowFrame:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowFrame, event )
								else
									GlowFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrameFrame5( GlowFrame, event )
								return 
							else
								GlowFrame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								GlowFrame:setLeftRight( true, false, 196.39, 270.49 )
								GlowFrame:setAlpha( 0.7 )
								GlowFrame:registerEventHandler( "transition_complete_keyframe", GlowFrameFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrameFrame4( GlowFrame, event )
							return 
						else
							GlowFrame:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							GlowFrame:setLeftRight( true, false, 79.15, 153.25 )
							GlowFrame:setTopBottom( true, false, 15.95, 123.05 )
							GlowFrame:setAlpha( 1 )
							GlowFrame:registerEventHandler( "transition_complete_keyframe", GlowFrameFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrameFrame3( GlowFrame, event )
						return 
					else
						GlowFrame:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						GlowFrame:registerEventHandler( "transition_complete_keyframe", GlowFrameFrame3 )
					end
				end
				
				GlowFrame:completeAnimation()
				self.GlowFrame:setLeftRight( true, false, 7.5, 81.6 )
				self.GlowFrame:setTopBottom( true, false, 15.95, 123.05 )
				self.GlowFrame:setAlpha( 0 )
				GlowFrameFrame2( GlowFrame, {} )
				local GlowFrame0Frame2 = function ( GlowFrame0, event )
					local GlowFrame0Frame3 = function ( GlowFrame0, event )
						local GlowFrame0Frame4 = function ( GlowFrame0, event )
							local GlowFrame0Frame5 = function ( GlowFrame0, event )
								if not event.interrupted then
									GlowFrame0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								end
								GlowFrame0:setLeftRight( true, false, 248.5, 322.6 )
								GlowFrame0:setTopBottom( true, false, -47.35, 59.75 )
								GlowFrame0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowFrame0, event )
								else
									GlowFrame0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame0Frame5( GlowFrame0, event )
								return 
							else
								GlowFrame0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								GlowFrame0:setLeftRight( true, false, 196.39, 270.49 )
								GlowFrame0:setAlpha( 0.7 )
								GlowFrame0:registerEventHandler( "transition_complete_keyframe", GlowFrame0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame0Frame4( GlowFrame0, event )
							return 
						else
							GlowFrame0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							GlowFrame0:setLeftRight( true, false, 79.15, 153.25 )
							GlowFrame0:setAlpha( 1 )
							GlowFrame0:registerEventHandler( "transition_complete_keyframe", GlowFrame0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame0Frame3( GlowFrame0, event )
						return 
					else
						GlowFrame0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						GlowFrame0:registerEventHandler( "transition_complete_keyframe", GlowFrame0Frame3 )
					end
				end
				
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setLeftRight( true, false, 7.5, 81.6 )
				self.GlowFrame0:setTopBottom( true, false, -47.35, 59.75 )
				self.GlowFrame0:setAlpha( 0 )
				GlowFrame0Frame2( GlowFrame0, {} )
				local Tick2Frame2 = function ( Tick2, event )
					local Tick2Frame3 = function ( Tick2, event )
						if not event.interrupted then
							Tick2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						end
						Tick2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Tick2, event )
						else
							Tick2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Tick2Frame3( Tick2, event )
						return 
					else
						Tick2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Tick2:registerEventHandler( "transition_complete_keyframe", Tick2Frame3 )
					end
				end
				
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0 )
				Tick2Frame2( Tick2, {} )
				local FlipbookAdd20Frame2 = function ( FlipbookAdd20, event )
					local FlipbookAdd20Frame3 = function ( FlipbookAdd20, event )
						if not event.interrupted then
							FlipbookAdd20:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						FlipbookAdd20:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( FlipbookAdd20, event )
						else
							FlipbookAdd20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlipbookAdd20Frame3( FlipbookAdd20, event )
						return 
					else
						FlipbookAdd20:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						FlipbookAdd20:registerEventHandler( "transition_complete_keyframe", FlipbookAdd20Frame3 )
					end
				end
				
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0 )
				FlipbookAdd20Frame2( FlipbookAdd20, {} )
				local FlipbookAddFrame2 = function ( FlipbookAdd, event )
					local FlipbookAddFrame3 = function ( FlipbookAdd, event )
						if not event.interrupted then
							FlipbookAdd:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						FlipbookAdd:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( FlipbookAdd, event )
						else
							FlipbookAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlipbookAddFrame3( FlipbookAdd, event )
						return 
					else
						FlipbookAdd:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						FlipbookAdd:registerEventHandler( "transition_complete_keyframe", FlipbookAddFrame3 )
					end
				end
				
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				FlipbookAddFrame2( FlipbookAdd, {} )
				local FlipbookAdd2Frame2 = function ( FlipbookAdd2, event )
					local FlipbookAdd2Frame3 = function ( FlipbookAdd2, event )
						if not event.interrupted then
							FlipbookAdd2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						FlipbookAdd2:setAlpha( 0.5 )
						FlipbookAdd2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
						FlipbookAdd2:setShaderVector( 0, 5, 0, 0, 0 )
						FlipbookAdd2:setShaderVector( 1, 15.5, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( FlipbookAdd2, event )
						else
							FlipbookAdd2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlipbookAdd2Frame3( FlipbookAdd2, event )
						return 
					else
						FlipbookAdd2:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						FlipbookAdd2:registerEventHandler( "transition_complete_keyframe", FlipbookAdd2Frame3 )
					end
				end
				
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0 )
				self.FlipbookAdd2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
				self.FlipbookAdd2:setShaderVector( 0, 5, 0, 0, 0 )
				self.FlipbookAdd2:setShaderVector( 1, 15.5, 0, 0, 0 )
				FlipbookAdd2Frame2( FlipbookAdd2, {} )
				local GlowFrame00Frame2 = function ( GlowFrame00, event )
					local GlowFrame00Frame3 = function ( GlowFrame00, event )
						local GlowFrame00Frame4 = function ( GlowFrame00, event )
							if not event.interrupted then
								GlowFrame00:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							end
							GlowFrame00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowFrame00, event )
							else
								GlowFrame00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame00Frame4( GlowFrame00, event )
							return 
						else
							GlowFrame00:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							GlowFrame00:setAlpha( 0.6 )
							GlowFrame00:registerEventHandler( "transition_complete_keyframe", GlowFrame00Frame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame00Frame3( GlowFrame00, event )
						return 
					else
						GlowFrame00:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						GlowFrame00:registerEventHandler( "transition_complete_keyframe", GlowFrame00Frame3 )
					end
				end
				
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				GlowFrame00Frame2( GlowFrame00, {} )
				local Tick20Frame2 = function ( Tick20, event )
					local Tick20Frame3 = function ( Tick20, event )
						if not event.interrupted then
							Tick20:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						end
						Tick20:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Tick20, event )
						else
							Tick20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Tick20Frame3( Tick20, event )
						return 
					else
						Tick20:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Tick20:registerEventHandler( "transition_complete_keyframe", Tick20Frame3 )
					end
				end
				
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0 )
				Tick20Frame2( Tick20, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 28 )
				Frame:completeAnimation()
				self.Frame:setAlpha( 1 )
				self.clipFinished( Frame, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
				NearCompleteLineGlow:completeAnimation()
				self.NearCompleteLineGlow:setAlpha( 1 )
				self.clipFinished( NearCompleteLineGlow, {} )
				local NearCompleteLineGlow3Frame2 = function ( NearCompleteLineGlow3, event )
					local NearCompleteLineGlow3Frame3 = function ( NearCompleteLineGlow3, event )
						local NearCompleteLineGlow3Frame4 = function ( NearCompleteLineGlow3, event )
							local NearCompleteLineGlow3Frame5 = function ( NearCompleteLineGlow3, event )
								local NearCompleteLineGlow3Frame6 = function ( NearCompleteLineGlow3, event )
									local NearCompleteLineGlow3Frame7 = function ( NearCompleteLineGlow3, event )
										local NearCompleteLineGlow3Frame8 = function ( NearCompleteLineGlow3, event )
											local NearCompleteLineGlow3Frame9 = function ( NearCompleteLineGlow3, event )
												local NearCompleteLineGlow3Frame10 = function ( NearCompleteLineGlow3, event )
													local NearCompleteLineGlow3Frame11 = function ( NearCompleteLineGlow3, event )
														local NearCompleteLineGlow3Frame12 = function ( NearCompleteLineGlow3, event )
															if not event.interrupted then
																NearCompleteLineGlow3:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
															end
															NearCompleteLineGlow3:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( NearCompleteLineGlow3, event )
															else
																NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															NearCompleteLineGlow3Frame12( NearCompleteLineGlow3, event )
															return 
														else
															NearCompleteLineGlow3:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
															NearCompleteLineGlow3:setAlpha( 0.78 )
															NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame12 )
														end
													end
													
													if event.interrupted then
														NearCompleteLineGlow3Frame11( NearCompleteLineGlow3, event )
														return 
													else
														NearCompleteLineGlow3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														NearCompleteLineGlow3:setAlpha( 1 )
														NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame11 )
													end
												end
												
												if event.interrupted then
													NearCompleteLineGlow3Frame10( NearCompleteLineGlow3, event )
													return 
												else
													NearCompleteLineGlow3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													NearCompleteLineGlow3:setAlpha( 0.7 )
													NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame10 )
												end
											end
											
											if event.interrupted then
												NearCompleteLineGlow3Frame9( NearCompleteLineGlow3, event )
												return 
											else
												NearCompleteLineGlow3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												NearCompleteLineGlow3:setAlpha( 1 )
												NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame9 )
											end
										end
										
										if event.interrupted then
											NearCompleteLineGlow3Frame8( NearCompleteLineGlow3, event )
											return 
										else
											NearCompleteLineGlow3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											NearCompleteLineGlow3:setAlpha( 0.64 )
											NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame8 )
										end
									end
									
									if event.interrupted then
										NearCompleteLineGlow3Frame7( NearCompleteLineGlow3, event )
										return 
									else
										NearCompleteLineGlow3:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
										NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame7 )
									end
								end
								
								if event.interrupted then
									NearCompleteLineGlow3Frame6( NearCompleteLineGlow3, event )
									return 
								else
									NearCompleteLineGlow3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									NearCompleteLineGlow3:setAlpha( 1 )
									NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame6 )
								end
							end
							
							if event.interrupted then
								NearCompleteLineGlow3Frame5( NearCompleteLineGlow3, event )
								return 
							else
								NearCompleteLineGlow3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								NearCompleteLineGlow3:setAlpha( 0.75 )
								NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame5 )
							end
						end
						
						if event.interrupted then
							NearCompleteLineGlow3Frame4( NearCompleteLineGlow3, event )
							return 
						else
							NearCompleteLineGlow3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							NearCompleteLineGlow3:setAlpha( 1 )
							NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame4 )
						end
					end
					
					if event.interrupted then
						NearCompleteLineGlow3Frame3( NearCompleteLineGlow3, event )
						return 
					else
						NearCompleteLineGlow3:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						NearCompleteLineGlow3:setAlpha( 0.76 )
						NearCompleteLineGlow3:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow3Frame3 )
					end
				end
				
				NearCompleteLineGlow3:completeAnimation()
				self.NearCompleteLineGlow3:setAlpha( 1 )
				NearCompleteLineGlow3Frame2( NearCompleteLineGlow3, {} )
				local NearCompleteLineGlow2Frame2 = function ( NearCompleteLineGlow2, event )
					local NearCompleteLineGlow2Frame3 = function ( NearCompleteLineGlow2, event )
						local NearCompleteLineGlow2Frame4 = function ( NearCompleteLineGlow2, event )
							local NearCompleteLineGlow2Frame5 = function ( NearCompleteLineGlow2, event )
								local NearCompleteLineGlow2Frame6 = function ( NearCompleteLineGlow2, event )
									local NearCompleteLineGlow2Frame7 = function ( NearCompleteLineGlow2, event )
										local NearCompleteLineGlow2Frame8 = function ( NearCompleteLineGlow2, event )
											local NearCompleteLineGlow2Frame9 = function ( NearCompleteLineGlow2, event )
												local NearCompleteLineGlow2Frame10 = function ( NearCompleteLineGlow2, event )
													local NearCompleteLineGlow2Frame11 = function ( NearCompleteLineGlow2, event )
														local NearCompleteLineGlow2Frame12 = function ( NearCompleteLineGlow2, event )
															if not event.interrupted then
																NearCompleteLineGlow2:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
															end
															NearCompleteLineGlow2:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( NearCompleteLineGlow2, event )
															else
																NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															NearCompleteLineGlow2Frame12( NearCompleteLineGlow2, event )
															return 
														else
															NearCompleteLineGlow2:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
															NearCompleteLineGlow2:setAlpha( 0.76 )
															NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame12 )
														end
													end
													
													if event.interrupted then
														NearCompleteLineGlow2Frame11( NearCompleteLineGlow2, event )
														return 
													else
														NearCompleteLineGlow2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														NearCompleteLineGlow2:setAlpha( 1 )
														NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame11 )
													end
												end
												
												if event.interrupted then
													NearCompleteLineGlow2Frame10( NearCompleteLineGlow2, event )
													return 
												else
													NearCompleteLineGlow2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													NearCompleteLineGlow2:setAlpha( 0.68 )
													NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame10 )
												end
											end
											
											if event.interrupted then
												NearCompleteLineGlow2Frame9( NearCompleteLineGlow2, event )
												return 
											else
												NearCompleteLineGlow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												NearCompleteLineGlow2:setAlpha( 1 )
												NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame9 )
											end
										end
										
										if event.interrupted then
											NearCompleteLineGlow2Frame8( NearCompleteLineGlow2, event )
											return 
										else
											NearCompleteLineGlow2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											NearCompleteLineGlow2:setAlpha( 0.64 )
											NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame8 )
										end
									end
									
									if event.interrupted then
										NearCompleteLineGlow2Frame7( NearCompleteLineGlow2, event )
										return 
									else
										NearCompleteLineGlow2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
										NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame7 )
									end
								end
								
								if event.interrupted then
									NearCompleteLineGlow2Frame6( NearCompleteLineGlow2, event )
									return 
								else
									NearCompleteLineGlow2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									NearCompleteLineGlow2:setAlpha( 1 )
									NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame6 )
								end
							end
							
							if event.interrupted then
								NearCompleteLineGlow2Frame5( NearCompleteLineGlow2, event )
								return 
							else
								NearCompleteLineGlow2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								NearCompleteLineGlow2:setAlpha( 0.75 )
								NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame5 )
							end
						end
						
						if event.interrupted then
							NearCompleteLineGlow2Frame4( NearCompleteLineGlow2, event )
							return 
						else
							NearCompleteLineGlow2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							NearCompleteLineGlow2:setAlpha( 1 )
							NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame4 )
						end
					end
					
					if event.interrupted then
						NearCompleteLineGlow2Frame3( NearCompleteLineGlow2, event )
						return 
					else
						NearCompleteLineGlow2:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						NearCompleteLineGlow2:setAlpha( 0.76 )
						NearCompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", NearCompleteLineGlow2Frame3 )
					end
				end
				
				NearCompleteLineGlow2:completeAnimation()
				self.NearCompleteLineGlow2:setAlpha( 1 )
				NearCompleteLineGlow2Frame2( NearCompleteLineGlow2, {} )
				CompleteGlowBack:completeAnimation()
				self.CompleteGlowBack:setAlpha( 1 )
				self.clipFinished( CompleteGlowBack, {} )
				local CompleteGlowBack2Frame2 = function ( CompleteGlowBack2, event )
					local CompleteGlowBack2Frame3 = function ( CompleteGlowBack2, event )
						local CompleteGlowBack2Frame4 = function ( CompleteGlowBack2, event )
							if not event.interrupted then
								CompleteGlowBack2:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
							end
							CompleteGlowBack2:setAlpha( 0.25 )
							if event.interrupted then
								self.clipFinished( CompleteGlowBack2, event )
							else
								CompleteGlowBack2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CompleteGlowBack2Frame4( CompleteGlowBack2, event )
							return 
						else
							CompleteGlowBack2:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
							CompleteGlowBack2:setAlpha( 0.32 )
							CompleteGlowBack2:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack2Frame4 )
						end
					end
					
					if event.interrupted then
						CompleteGlowBack2Frame3( CompleteGlowBack2, event )
						return 
					else
						CompleteGlowBack2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						CompleteGlowBack2:setAlpha( 0.06 )
						CompleteGlowBack2:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack2Frame3 )
					end
				end
				
				CompleteGlowBack2:completeAnimation()
				self.CompleteGlowBack2:setAlpha( 0.25 )
				CompleteGlowBack2Frame2( CompleteGlowBack2, {} )
				CompleteLineGlow0:completeAnimation()
				self.CompleteLineGlow0:setAlpha( 1 )
				self.clipFinished( CompleteLineGlow0, {} )
				local CompleteLineGlow1Frame2 = function ( CompleteLineGlow1, event )
					local CompleteLineGlow1Frame3 = function ( CompleteLineGlow1, event )
						local CompleteLineGlow1Frame4 = function ( CompleteLineGlow1, event )
							local CompleteLineGlow1Frame5 = function ( CompleteLineGlow1, event )
								local CompleteLineGlow1Frame6 = function ( CompleteLineGlow1, event )
									local CompleteLineGlow1Frame7 = function ( CompleteLineGlow1, event )
										local CompleteLineGlow1Frame8 = function ( CompleteLineGlow1, event )
											local CompleteLineGlow1Frame9 = function ( CompleteLineGlow1, event )
												local CompleteLineGlow1Frame10 = function ( CompleteLineGlow1, event )
													local CompleteLineGlow1Frame11 = function ( CompleteLineGlow1, event )
														local CompleteLineGlow1Frame12 = function ( CompleteLineGlow1, event )
															local CompleteLineGlow1Frame13 = function ( CompleteLineGlow1, event )
																if not event.interrupted then
																	CompleteLineGlow1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
																end
																CompleteLineGlow1:setAlpha( 1 )
																if event.interrupted then
																	self.clipFinished( CompleteLineGlow1, event )
																else
																	CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																CompleteLineGlow1Frame13( CompleteLineGlow1, event )
																return 
															else
																CompleteLineGlow1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																CompleteLineGlow1:setAlpha( 0.53 )
																CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame13 )
															end
														end
														
														if event.interrupted then
															CompleteLineGlow1Frame12( CompleteLineGlow1, event )
															return 
														else
															CompleteLineGlow1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															CompleteLineGlow1:setAlpha( 1 )
															CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame12 )
														end
													end
													
													if event.interrupted then
														CompleteLineGlow1Frame11( CompleteLineGlow1, event )
														return 
													else
														CompleteLineGlow1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														CompleteLineGlow1:setAlpha( 0.59 )
														CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame11 )
													end
												end
												
												if event.interrupted then
													CompleteLineGlow1Frame10( CompleteLineGlow1, event )
													return 
												else
													CompleteLineGlow1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
													CompleteLineGlow1:setAlpha( 1 )
													CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame10 )
												end
											end
											
											if event.interrupted then
												CompleteLineGlow1Frame9( CompleteLineGlow1, event )
												return 
											else
												CompleteLineGlow1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
												CompleteLineGlow1:setAlpha( 0.64 )
												CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame9 )
											end
										end
										
										if event.interrupted then
											CompleteLineGlow1Frame8( CompleteLineGlow1, event )
											return 
										else
											CompleteLineGlow1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											CompleteLineGlow1:setAlpha( 1 )
											CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame8 )
										end
									end
									
									if event.interrupted then
										CompleteLineGlow1Frame7( CompleteLineGlow1, event )
										return 
									else
										CompleteLineGlow1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CompleteLineGlow1:setAlpha( 0.62 )
										CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame7 )
									end
								end
								
								if event.interrupted then
									CompleteLineGlow1Frame6( CompleteLineGlow1, event )
									return 
								else
									CompleteLineGlow1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CompleteLineGlow1:setAlpha( 1 )
									CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame6 )
								end
							end
							
							if event.interrupted then
								CompleteLineGlow1Frame5( CompleteLineGlow1, event )
								return 
							else
								CompleteLineGlow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								CompleteLineGlow1:setAlpha( 0.56 )
								CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame5 )
							end
						end
						
						if event.interrupted then
							CompleteLineGlow1Frame4( CompleteLineGlow1, event )
							return 
						else
							CompleteLineGlow1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							CompleteLineGlow1:setAlpha( 1 )
							CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame4 )
						end
					end
					
					if event.interrupted then
						CompleteLineGlow1Frame3( CompleteLineGlow1, event )
						return 
					else
						CompleteLineGlow1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						CompleteLineGlow1:setAlpha( 0.59 )
						CompleteLineGlow1:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow1Frame3 )
					end
				end
				
				CompleteLineGlow1:completeAnimation()
				self.CompleteLineGlow1:setAlpha( 1 )
				CompleteLineGlow1Frame2( CompleteLineGlow1, {} )
				local CompleteLineGlow2Frame2 = function ( CompleteLineGlow2, event )
					local CompleteLineGlow2Frame3 = function ( CompleteLineGlow2, event )
						local CompleteLineGlow2Frame4 = function ( CompleteLineGlow2, event )
							local CompleteLineGlow2Frame5 = function ( CompleteLineGlow2, event )
								local CompleteLineGlow2Frame6 = function ( CompleteLineGlow2, event )
									local CompleteLineGlow2Frame7 = function ( CompleteLineGlow2, event )
										local CompleteLineGlow2Frame8 = function ( CompleteLineGlow2, event )
											local CompleteLineGlow2Frame9 = function ( CompleteLineGlow2, event )
												local CompleteLineGlow2Frame10 = function ( CompleteLineGlow2, event )
													local CompleteLineGlow2Frame11 = function ( CompleteLineGlow2, event )
														local CompleteLineGlow2Frame12 = function ( CompleteLineGlow2, event )
															local CompleteLineGlow2Frame13 = function ( CompleteLineGlow2, event )
																local CompleteLineGlow2Frame14 = function ( CompleteLineGlow2, event )
																	local CompleteLineGlow2Frame15 = function ( CompleteLineGlow2, event )
																		if not event.interrupted then
																			CompleteLineGlow2:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																		end
																		CompleteLineGlow2:setAlpha( 1 )
																		if event.interrupted then
																			self.clipFinished( CompleteLineGlow2, event )
																		else
																			CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		CompleteLineGlow2Frame15( CompleteLineGlow2, event )
																		return 
																	else
																		CompleteLineGlow2:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
																		CompleteLineGlow2:setAlpha( 0.69 )
																		CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame15 )
																	end
																end
																
																if event.interrupted then
																	CompleteLineGlow2Frame14( CompleteLineGlow2, event )
																	return 
																else
																	CompleteLineGlow2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	CompleteLineGlow2:setAlpha( 1 )
																	CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame14 )
																end
															end
															
															if event.interrupted then
																CompleteLineGlow2Frame13( CompleteLineGlow2, event )
																return 
															else
																CompleteLineGlow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																CompleteLineGlow2:setAlpha( 0.53 )
																CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame13 )
															end
														end
														
														if event.interrupted then
															CompleteLineGlow2Frame12( CompleteLineGlow2, event )
															return 
														else
															CompleteLineGlow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															CompleteLineGlow2:setAlpha( 1 )
															CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame12 )
														end
													end
													
													if event.interrupted then
														CompleteLineGlow2Frame11( CompleteLineGlow2, event )
														return 
													else
														CompleteLineGlow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														CompleteLineGlow2:setAlpha( 0.42 )
														CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame11 )
													end
												end
												
												if event.interrupted then
													CompleteLineGlow2Frame10( CompleteLineGlow2, event )
													return 
												else
													CompleteLineGlow2:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													CompleteLineGlow2:setAlpha( 1 )
													CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame10 )
												end
											end
											
											if event.interrupted then
												CompleteLineGlow2Frame9( CompleteLineGlow2, event )
												return 
											else
												CompleteLineGlow2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												CompleteLineGlow2:setAlpha( 0.7 )
												CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame9 )
											end
										end
										
										if event.interrupted then
											CompleteLineGlow2Frame8( CompleteLineGlow2, event )
											return 
										else
											CompleteLineGlow2:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
											CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame8 )
										end
									end
									
									if event.interrupted then
										CompleteLineGlow2Frame7( CompleteLineGlow2, event )
										return 
									else
										CompleteLineGlow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CompleteLineGlow2:setAlpha( 1 )
										CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame7 )
									end
								end
								
								if event.interrupted then
									CompleteLineGlow2Frame6( CompleteLineGlow2, event )
									return 
								else
									CompleteLineGlow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CompleteLineGlow2:setAlpha( 0.5 )
									CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame6 )
								end
							end
							
							if event.interrupted then
								CompleteLineGlow2Frame5( CompleteLineGlow2, event )
								return 
							else
								CompleteLineGlow2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								CompleteLineGlow2:setAlpha( 1 )
								CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame5 )
							end
						end
						
						if event.interrupted then
							CompleteLineGlow2Frame4( CompleteLineGlow2, event )
							return 
						else
							CompleteLineGlow2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							CompleteLineGlow2:setAlpha( 0.48 )
							CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame4 )
						end
					end
					
					if event.interrupted then
						CompleteLineGlow2Frame3( CompleteLineGlow2, event )
						return 
					else
						CompleteLineGlow2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						CompleteLineGlow2:registerEventHandler( "transition_complete_keyframe", CompleteLineGlow2Frame3 )
					end
				end
				
				CompleteLineGlow2:completeAnimation()
				self.CompleteLineGlow2:setAlpha( 1 )
				CompleteLineGlow2Frame2( CompleteLineGlow2, {} )
				CompleteLineCenter:completeAnimation()
				self.CompleteLineCenter:setAlpha( 1 )
				self.clipFinished( CompleteLineCenter, {} )
				CompleteGlowCenter:completeAnimation()
				self.CompleteGlowCenter:setAlpha( 1 )
				self.clipFinished( CompleteGlowCenter, {} )
				CompleteFrameBarTop:completeAnimation()
				self.CompleteFrameBarTop:setAlpha( 1 )
				self.clipFinished( CompleteFrameBarTop, {} )
				CompleteFrameBarBottom:completeAnimation()
				self.CompleteFrameBarBottom:setAlpha( 1 )
				self.clipFinished( CompleteFrameBarBottom, {} )
				local GlowBarBlurBottomFrame2 = function ( GlowBarBlurBottom, event )
					local GlowBarBlurBottomFrame3 = function ( GlowBarBlurBottom, event )
						local GlowBarBlurBottomFrame4 = function ( GlowBarBlurBottom, event )
							local GlowBarBlurBottomFrame5 = function ( GlowBarBlurBottom, event )
								local GlowBarBlurBottomFrame6 = function ( GlowBarBlurBottom, event )
									if not event.interrupted then
										GlowBarBlurBottom:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
									end
									GlowBarBlurBottom:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowBarBlurBottom, event )
									else
										GlowBarBlurBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowBarBlurBottomFrame6( GlowBarBlurBottom, event )
									return 
								else
									GlowBarBlurBottom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									GlowBarBlurBottom:setAlpha( 0.59 )
									GlowBarBlurBottom:registerEventHandler( "transition_complete_keyframe", GlowBarBlurBottomFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBarBlurBottomFrame5( GlowBarBlurBottom, event )
								return 
							else
								GlowBarBlurBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								GlowBarBlurBottom:setAlpha( 1 )
								GlowBarBlurBottom:registerEventHandler( "transition_complete_keyframe", GlowBarBlurBottomFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBarBlurBottomFrame4( GlowBarBlurBottom, event )
							return 
						else
							GlowBarBlurBottom:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							GlowBarBlurBottom:setAlpha( 0.58 )
							GlowBarBlurBottom:registerEventHandler( "transition_complete_keyframe", GlowBarBlurBottomFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBarBlurBottomFrame3( GlowBarBlurBottom, event )
						return 
					else
						GlowBarBlurBottom:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowBarBlurBottom:setAlpha( 1 )
						GlowBarBlurBottom:registerEventHandler( "transition_complete_keyframe", GlowBarBlurBottomFrame3 )
					end
				end
				
				GlowBarBlurBottom:completeAnimation()
				self.GlowBarBlurBottom:setAlpha( 0 )
				GlowBarBlurBottomFrame2( GlowBarBlurBottom, {} )
				local GlowBarBlurTopFrame2 = function ( GlowBarBlurTop, event )
					local GlowBarBlurTopFrame3 = function ( GlowBarBlurTop, event )
						local GlowBarBlurTopFrame4 = function ( GlowBarBlurTop, event )
							local GlowBarBlurTopFrame5 = function ( GlowBarBlurTop, event )
								local GlowBarBlurTopFrame6 = function ( GlowBarBlurTop, event )
									if not event.interrupted then
										GlowBarBlurTop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									end
									GlowBarBlurTop:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowBarBlurTop, event )
									else
										GlowBarBlurTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowBarBlurTopFrame6( GlowBarBlurTop, event )
									return 
								else
									GlowBarBlurTop:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									GlowBarBlurTop:setAlpha( 1 )
									GlowBarBlurTop:registerEventHandler( "transition_complete_keyframe", GlowBarBlurTopFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBarBlurTopFrame5( GlowBarBlurTop, event )
								return 
							else
								GlowBarBlurTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								GlowBarBlurTop:setAlpha( 0.39 )
								GlowBarBlurTop:registerEventHandler( "transition_complete_keyframe", GlowBarBlurTopFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBarBlurTopFrame4( GlowBarBlurTop, event )
							return 
						else
							GlowBarBlurTop:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							GlowBarBlurTop:setAlpha( 1 )
							GlowBarBlurTop:registerEventHandler( "transition_complete_keyframe", GlowBarBlurTopFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBarBlurTopFrame3( GlowBarBlurTop, event )
						return 
					else
						GlowBarBlurTop:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						GlowBarBlurTop:setAlpha( 0.39 )
						GlowBarBlurTop:registerEventHandler( "transition_complete_keyframe", GlowBarBlurTopFrame3 )
					end
				end
				
				GlowBarBlurTop:completeAnimation()
				self.GlowBarBlurTop:setAlpha( 0 )
				GlowBarBlurTopFrame2( GlowBarBlurTop, {} )
				local CompleteGlowSideFrame2 = function ( CompleteGlowSide, event )
					local CompleteGlowSideFrame3 = function ( CompleteGlowSide, event )
						if not event.interrupted then
							CompleteGlowSide:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						CompleteGlowSide:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompleteGlowSide, event )
						else
							CompleteGlowSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompleteGlowSideFrame3( CompleteGlowSide, event )
						return 
					else
						CompleteGlowSide:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						CompleteGlowSide:setAlpha( 0.34 )
						CompleteGlowSide:registerEventHandler( "transition_complete_keyframe", CompleteGlowSideFrame3 )
					end
				end
				
				CompleteGlowSide:completeAnimation()
				self.CompleteGlowSide:setAlpha( 1 )
				CompleteGlowSideFrame2( CompleteGlowSide, {} )
				local CompleteGlowBack0Frame2 = function ( CompleteGlowBack0, event )
					local CompleteGlowBack0Frame3 = function ( CompleteGlowBack0, event )
						local CompleteGlowBack0Frame4 = function ( CompleteGlowBack0, event )
							local CompleteGlowBack0Frame5 = function ( CompleteGlowBack0, event )
								local CompleteGlowBack0Frame6 = function ( CompleteGlowBack0, event )
									local CompleteGlowBack0Frame7 = function ( CompleteGlowBack0, event )
										local CompleteGlowBack0Frame8 = function ( CompleteGlowBack0, event )
											local CompleteGlowBack0Frame9 = function ( CompleteGlowBack0, event )
												local CompleteGlowBack0Frame10 = function ( CompleteGlowBack0, event )
													local CompleteGlowBack0Frame11 = function ( CompleteGlowBack0, event )
														local CompleteGlowBack0Frame12 = function ( CompleteGlowBack0, event )
															if not event.interrupted then
																CompleteGlowBack0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
															end
															CompleteGlowBack0:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( CompleteGlowBack0, event )
															else
																CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															CompleteGlowBack0Frame12( CompleteGlowBack0, event )
															return 
														else
															CompleteGlowBack0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															CompleteGlowBack0:setAlpha( 0.42 )
															CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame12 )
														end
													end
													
													if event.interrupted then
														CompleteGlowBack0Frame11( CompleteGlowBack0, event )
														return 
													else
														CompleteGlowBack0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
														CompleteGlowBack0:setAlpha( 1 )
														CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame11 )
													end
												end
												
												if event.interrupted then
													CompleteGlowBack0Frame10( CompleteGlowBack0, event )
													return 
												else
													CompleteGlowBack0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
													CompleteGlowBack0:setAlpha( 0.26 )
													CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame10 )
												end
											end
											
											if event.interrupted then
												CompleteGlowBack0Frame9( CompleteGlowBack0, event )
												return 
											else
												CompleteGlowBack0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												CompleteGlowBack0:setAlpha( 1 )
												CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame9 )
											end
										end
										
										if event.interrupted then
											CompleteGlowBack0Frame8( CompleteGlowBack0, event )
											return 
										else
											CompleteGlowBack0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
											CompleteGlowBack0:setAlpha( 0.29 )
											CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame8 )
										end
									end
									
									if event.interrupted then
										CompleteGlowBack0Frame7( CompleteGlowBack0, event )
										return 
									else
										CompleteGlowBack0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
										CompleteGlowBack0:setAlpha( 0.49 )
										CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame7 )
									end
								end
								
								if event.interrupted then
									CompleteGlowBack0Frame6( CompleteGlowBack0, event )
									return 
								else
									CompleteGlowBack0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CompleteGlowBack0:setAlpha( 1 )
									CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame6 )
								end
							end
							
							if event.interrupted then
								CompleteGlowBack0Frame5( CompleteGlowBack0, event )
								return 
							else
								CompleteGlowBack0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								CompleteGlowBack0:setAlpha( 0.56 )
								CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame5 )
							end
						end
						
						if event.interrupted then
							CompleteGlowBack0Frame4( CompleteGlowBack0, event )
							return 
						else
							CompleteGlowBack0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							CompleteGlowBack0:setAlpha( 1 )
							CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame4 )
						end
					end
					
					if event.interrupted then
						CompleteGlowBack0Frame3( CompleteGlowBack0, event )
						return 
					else
						CompleteGlowBack0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						CompleteGlowBack0:setAlpha( 0.67 )
						CompleteGlowBack0:registerEventHandler( "transition_complete_keyframe", CompleteGlowBack0Frame3 )
					end
				end
				
				CompleteGlowBack0:completeAnimation()
				self.CompleteGlowBack0:setAlpha( 1 )
				CompleteGlowBack0Frame2( CompleteGlowBack0, {} )
				CompletedPulse1:completeAnimation()
				self.CompletedPulse1:setAlpha( 0 )
				self.clipFinished( CompletedPulse1, {} )
				GlowFrame:completeAnimation()
				self.GlowFrame:setAlpha( 0 )
				self.clipFinished( GlowFrame, {} )
				GlowFrame0:completeAnimation()
				self.GlowFrame0:setAlpha( 0 )
				self.clipFinished( GlowFrame0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0.7 )
				self.clipFinished( TextBox0, {} )
				Tick2:completeAnimation()
				self.Tick2:setAlpha( 0.5 )
				self.clipFinished( Tick2, {} )
				FlipbookAdd20:completeAnimation()
				self.FlipbookAdd20:setAlpha( 0.5 )
				self.clipFinished( FlipbookAdd20, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0.9 )
				self.clipFinished( FlipbookAdd, {} )
				FlipbookAdd2:completeAnimation()
				self.FlipbookAdd2:setAlpha( 0.5 )
				self.FlipbookAdd2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
				self.FlipbookAdd2:setShaderVector( 0, 5, 0, 0, 0 )
				self.FlipbookAdd2:setShaderVector( 1, 15.5, 0, 0, 0 )
				self.clipFinished( FlipbookAdd2, {} )
				local GlowFrame00Frame2 = function ( GlowFrame00, event )
					local GlowFrame00Frame3 = function ( GlowFrame00, event )
						local GlowFrame00Frame4 = function ( GlowFrame00, event )
							if not event.interrupted then
								GlowFrame00:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
							end
							GlowFrame00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GlowFrame00, event )
							else
								GlowFrame00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame00Frame4( GlowFrame00, event )
							return 
						else
							GlowFrame00:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							GlowFrame00:registerEventHandler( "transition_complete_keyframe", GlowFrame00Frame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame00Frame3( GlowFrame00, event )
						return 
					else
						GlowFrame00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowFrame00:setAlpha( 0.41 )
						GlowFrame00:registerEventHandler( "transition_complete_keyframe", GlowFrame00Frame3 )
					end
				end
				
				GlowFrame00:completeAnimation()
				self.GlowFrame00:setAlpha( 0 )
				GlowFrame00Frame2( GlowFrame00, {} )
				Tick20:completeAnimation()
				self.Tick20:setAlpha( 0.5 )
				self.clipFinished( Tick20, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsElementInState( element, "Locked" )
			end
		},
		{
			stateName = "NearComplete",
			condition = function ( menu, element, event )
				return IsElementInState( element, "NearComplete" )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsElementInState( element, "Complete" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PromoRewardImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

