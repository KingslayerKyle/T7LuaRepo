-- 2a47caf361e9684214c3ff0149de8a99
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.ZmRndDigitWidget = InheritFrom( LUI.UIElement )
CoD.ZmRndDigitWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmRndDigitWidget )
	self.id = "ZmRndDigitWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 80 )
	
	local Nine = LUI.UIImage.new()
	Nine:setLeftRight( true, false, 0, 56 )
	Nine:setTopBottom( true, false, 0, 80 )
	Nine:setAlpha( 0 )
	Nine:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9" ) )
	Nine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Nine )
	self.Nine = Nine
	
	local NineLight = LUI.UIImage.new()
	NineLight:setLeftRight( true, false, 0, 56 )
	NineLight:setTopBottom( true, false, 0, 80 )
	NineLight:setAlpha( 0 )
	NineLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9_act" ) )
	NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	NineLight:setShaderVector( 0, 1, 0, 0, 0 )
	NineLight:setShaderVector( 1, 0, 0, 0, 0 )
	NineLight:setShaderVector( 2, 1, 0, 0, 0 )
	NineLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( NineLight )
	self.NineLight = NineLight
	
	local NineGlow = LUI.UIImage.new()
	NineGlow:setLeftRight( true, false, 0, 56 )
	NineGlow:setTopBottom( true, false, 0, 80 )
	NineGlow:setRGB( 1, 0.31, 0 )
	NineGlow:setAlpha( 0 )
	NineGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9_glow" ) )
	NineGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NineGlow )
	self.NineGlow = NineGlow
	
	local Eight = LUI.UIImage.new()
	Eight:setLeftRight( true, false, 0, 56 )
	Eight:setTopBottom( true, false, 0, 80 )
	Eight:setAlpha( 0 )
	Eight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8" ) )
	Eight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Eight )
	self.Eight = Eight
	
	local EightLight = LUI.UIImage.new()
	EightLight:setLeftRight( true, false, 0, 56 )
	EightLight:setTopBottom( true, false, 0, 80 )
	EightLight:setAlpha( 0 )
	EightLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8_act" ) )
	EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EightLight:setShaderVector( 0, 1, 0, 0, 0 )
	EightLight:setShaderVector( 1, 0, 0, 0, 0 )
	EightLight:setShaderVector( 2, 1, 0, 0, 0 )
	EightLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( EightLight )
	self.EightLight = EightLight
	
	local EightGlow = LUI.UIImage.new()
	EightGlow:setLeftRight( true, false, 0, 56 )
	EightGlow:setTopBottom( true, false, 0, 80 )
	EightGlow:setRGB( 1, 0.31, 0 )
	EightGlow:setAlpha( 0 )
	EightGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8_glow" ) )
	EightGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EightGlow )
	self.EightGlow = EightGlow
	
	local Seven = LUI.UIImage.new()
	Seven:setLeftRight( true, false, 0, 56 )
	Seven:setTopBottom( true, false, 0, 80 )
	Seven:setAlpha( 0 )
	Seven:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7" ) )
	Seven:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Seven )
	self.Seven = Seven
	
	local SevenLight = LUI.UIImage.new()
	SevenLight:setLeftRight( true, false, 0, 56 )
	SevenLight:setTopBottom( true, false, 0, 80 )
	SevenLight:setAlpha( 0 )
	SevenLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7_act" ) )
	SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
	SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
	SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
	SevenLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( SevenLight )
	self.SevenLight = SevenLight
	
	local SevenGlow = LUI.UIImage.new()
	SevenGlow:setLeftRight( true, false, 0, 56 )
	SevenGlow:setTopBottom( true, false, 0, 80 )
	SevenGlow:setRGB( 1, 0.31, 0 )
	SevenGlow:setAlpha( 0 )
	SevenGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7_glow" ) )
	SevenGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SevenGlow )
	self.SevenGlow = SevenGlow
	
	local Six = LUI.UIImage.new()
	Six:setLeftRight( true, false, 0, 56 )
	Six:setTopBottom( true, false, 0, 80 )
	Six:setAlpha( 0 )
	Six:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6" ) )
	self:addElement( Six )
	self.Six = Six
	
	local SixLight = LUI.UIImage.new()
	SixLight:setLeftRight( true, false, 0, 56 )
	SixLight:setTopBottom( true, false, 0, 80 )
	SixLight:setAlpha( 0 )
	SixLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6_act" ) )
	SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	SixLight:setShaderVector( 0, 1, 0, 0, 0 )
	SixLight:setShaderVector( 1, 0, 0, 0, 0 )
	SixLight:setShaderVector( 2, 1, 0, 0, 0 )
	SixLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( SixLight )
	self.SixLight = SixLight
	
	local SixGlow = LUI.UIImage.new()
	SixGlow:setLeftRight( true, false, 0, 56 )
	SixGlow:setTopBottom( true, false, 0, 80 )
	SixGlow:setRGB( 1, 0.31, 0 )
	SixGlow:setAlpha( 0 )
	SixGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6_glow" ) )
	SixGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SixGlow )
	self.SixGlow = SixGlow
	
	local Five = LUI.UIImage.new()
	Five:setLeftRight( true, false, 0, 56 )
	Five:setTopBottom( true, false, 0, 80 )
	Five:setAlpha( 0 )
	Five:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5" ) )
	Five:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Five )
	self.Five = Five
	
	local FiveLight = LUI.UIImage.new()
	FiveLight:setLeftRight( true, false, 0, 56 )
	FiveLight:setTopBottom( true, false, 0, 80 )
	FiveLight:setAlpha( 0 )
	FiveLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5_act" ) )
	FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
	FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
	FiveLight:setShaderVector( 2, 1, 0, 0, 0 )
	FiveLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( FiveLight )
	self.FiveLight = FiveLight
	
	local FiveGlow = LUI.UIImage.new()
	FiveGlow:setLeftRight( true, false, 0, 56 )
	FiveGlow:setTopBottom( true, false, 0, 80 )
	FiveGlow:setRGB( 1, 0.31, 0 )
	FiveGlow:setAlpha( 0 )
	FiveGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5_glow" ) )
	FiveGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FiveGlow )
	self.FiveGlow = FiveGlow
	
	local Four = LUI.UIImage.new()
	Four:setLeftRight( true, false, 0, 56 )
	Four:setTopBottom( true, false, 0, 80 )
	Four:setAlpha( 0 )
	Four:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4" ) )
	Four:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Four )
	self.Four = Four
	
	local FourLight = LUI.UIImage.new()
	FourLight:setLeftRight( true, false, 0, 56 )
	FourLight:setTopBottom( true, false, 0, 80 )
	FourLight:setAlpha( 0 )
	FourLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4_act" ) )
	FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	FourLight:setShaderVector( 0, 1, 0, 0, 0 )
	FourLight:setShaderVector( 1, 0, 0, 0, 0 )
	FourLight:setShaderVector( 2, 1, 0, 0, 0 )
	FourLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( FourLight )
	self.FourLight = FourLight
	
	local FourGlow = LUI.UIImage.new()
	FourGlow:setLeftRight( true, false, 0, 56 )
	FourGlow:setTopBottom( true, false, 0, 80 )
	FourGlow:setRGB( 1, 0.31, 0 )
	FourGlow:setAlpha( 0 )
	FourGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4_glow" ) )
	FourGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FourGlow )
	self.FourGlow = FourGlow
	
	local Three = LUI.UIImage.new()
	Three:setLeftRight( true, false, 0, 56 )
	Three:setTopBottom( true, false, 0, 80 )
	Three:setAlpha( 0 )
	Three:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3" ) )
	Three:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Three )
	self.Three = Three
	
	local ThreeLight = LUI.UIImage.new()
	ThreeLight:setLeftRight( true, false, 0, 56 )
	ThreeLight:setTopBottom( true, false, 0, 80 )
	ThreeLight:setAlpha( 0 )
	ThreeLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3_act" ) )
	ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
	ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
	ThreeLight:setShaderVector( 2, 1, 0, 0, 0 )
	ThreeLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ThreeLight )
	self.ThreeLight = ThreeLight
	
	local ThreeGlow = LUI.UIImage.new()
	ThreeGlow:setLeftRight( true, false, 0, 56 )
	ThreeGlow:setTopBottom( true, false, 0, 80 )
	ThreeGlow:setRGB( 1, 0.31, 0 )
	ThreeGlow:setAlpha( 0 )
	ThreeGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3_glow" ) )
	ThreeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ThreeGlow )
	self.ThreeGlow = ThreeGlow
	
	local Two = LUI.UIImage.new()
	Two:setLeftRight( true, false, 0, 56 )
	Two:setTopBottom( true, false, 0, 80 )
	Two:setAlpha( 0 )
	Two:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2" ) )
	self:addElement( Two )
	self.Two = Two
	
	local TwoLight = LUI.UIImage.new()
	TwoLight:setLeftRight( true, false, 0, 56 )
	TwoLight:setTopBottom( true, false, 0, 80 )
	TwoLight:setAlpha( 0 )
	TwoLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2_act" ) )
	TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
	TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
	TwoLight:setShaderVector( 2, 1, 0, 0, 0 )
	TwoLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( TwoLight )
	self.TwoLight = TwoLight
	
	local TwoGlow = LUI.UIImage.new()
	TwoGlow:setLeftRight( true, false, 0, 56 )
	TwoGlow:setTopBottom( true, false, 0, 80 )
	TwoGlow:setRGB( 1, 0.31, 0 )
	TwoGlow:setAlpha( 0 )
	TwoGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2_glow" ) )
	TwoGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoGlow )
	self.TwoGlow = TwoGlow
	
	local One = LUI.UIImage.new()
	One:setLeftRight( true, false, 0, 56 )
	One:setTopBottom( true, false, 0, 80 )
	One:setAlpha( 0 )
	One:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1" ) )
	One:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( One )
	self.One = One
	
	local OneLight = LUI.UIImage.new()
	OneLight:setLeftRight( true, false, 0, 56 )
	OneLight:setTopBottom( true, false, 0, 80 )
	OneLight:setAlpha( 0 )
	OneLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1_act" ) )
	OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	OneLight:setShaderVector( 0, 1, 0, 0, 0 )
	OneLight:setShaderVector( 1, 0, 0, 0, 0 )
	OneLight:setShaderVector( 2, 1, 0, 0, 0 )
	OneLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( OneLight )
	self.OneLight = OneLight
	
	local OneGlow = LUI.UIImage.new()
	OneGlow:setLeftRight( true, false, 0, 56 )
	OneGlow:setTopBottom( true, false, 0, 80 )
	OneGlow:setRGB( 1, 0.31, 0 )
	OneGlow:setAlpha( 0 )
	OneGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1_glow" ) )
	OneGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OneGlow )
	self.OneGlow = OneGlow
	
	local Zero = LUI.UIImage.new()
	Zero:setLeftRight( true, false, 0, 56 )
	Zero:setTopBottom( true, false, 0, 80 )
	Zero:setAlpha( 0 )
	Zero:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0" ) )
	Zero:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Zero )
	self.Zero = Zero
	
	local ZeroLight = LUI.UIImage.new()
	ZeroLight:setLeftRight( true, false, 0, 56 )
	ZeroLight:setTopBottom( true, false, 0, 80 )
	ZeroLight:setAlpha( 0 )
	ZeroLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0_act" ) )
	ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
	ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
	ZeroLight:setShaderVector( 2, 1, 0, 0, 0 )
	ZeroLight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ZeroLight )
	self.ZeroLight = ZeroLight
	
	local ZeroGlow = LUI.UIImage.new()
	ZeroGlow:setLeftRight( true, false, 0, 56 )
	ZeroGlow:setTopBottom( true, false, 0, 80 )
	ZeroGlow:setRGB( 1, 0.31, 0 )
	ZeroGlow:setAlpha( 0 )
	ZeroGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0_glow" ) )
	ZeroGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZeroGlow )
	self.ZeroGlow = ZeroGlow
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext0:setLeftRight( true, false, -17.56, 94.44 )
	ZmFxSpark2Ext0:setTopBottom( true, false, -137.29, 30.71 )
	ZmFxSpark2Ext0:setAlpha( 0 )
	ZmFxSpark2Ext0:setZRot( 9 )
	ZmFxSpark2Ext0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local ZmFxSpark2Ext00 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00:setLeftRight( true, false, -3.56, 108.44 )
	ZmFxSpark2Ext00:setTopBottom( true, false, -128, 40 )
	ZmFxSpark2Ext00:setAlpha( 0 )
	ZmFxSpark2Ext00:setZRot( 9 )
	ZmFxSpark2Ext00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00 )
	self.ZmFxSpark2Ext00 = ZmFxSpark2Ext00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		One = {
			DefaultClip = function ()
				self:setupElementClipCounter( 31 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				local OneFrame2 = function ( One, event )
					local OneFrame3 = function ( One, event )
						if not event.interrupted then
							One:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
						end
						One:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( One, event )
						else
							One:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OneFrame3( One, event )
						return 
					else
						One:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						One:registerEventHandler( "transition_complete_keyframe", OneFrame3 )
					end
				end
				
				One:completeAnimation()
				self.One:setAlpha( 0 )
				OneFrame2( One, {} )
				local OneLightFrame2 = function ( OneLight, event )
					local OneLightFrame3 = function ( OneLight, event )
						local OneLightFrame4 = function ( OneLight, event )
							if not event.interrupted then
								OneLight:beginAnimation( "keyframe", 2210, false, false, CoD.TweenType.Linear )
							end
							OneLight:setAlpha( 0 )
							OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							OneLight:setShaderVector( 0, 1, 0, 0, 0 )
							OneLight:setShaderVector( 1, 0, 0, 0, 0 )
							OneLight:setShaderVector( 2, 1.16, 0, 0, 0 )
							OneLight:setShaderVector( 3, 0.26, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( OneLight, event )
							else
								OneLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OneLightFrame4( OneLight, event )
							return 
						else
							OneLight:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
							OneLight:setShaderVector( 2, 1.16, 0, 0, 0 )
							OneLight:registerEventHandler( "transition_complete_keyframe", OneLightFrame4 )
						end
					end
					
					if event.interrupted then
						OneLightFrame3( OneLight, event )
						return 
					else
						OneLight:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						OneLight:registerEventHandler( "transition_complete_keyframe", OneLightFrame3 )
					end
				end
				
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 1 )
				self.OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.OneLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.OneLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.OneLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.OneLight:setShaderVector( 3, 0.26, 0, 0, 0 )
				OneLightFrame2( OneLight, {} )
				local OneGlowFrame2 = function ( OneGlow, event )
					local OneGlowFrame3 = function ( OneGlow, event )
						local OneGlowFrame4 = function ( OneGlow, event )
							if not event.interrupted then
								OneGlow:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							end
							OneGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( OneGlow, event )
							else
								OneGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OneGlowFrame4( OneGlow, event )
							return 
						else
							OneGlow:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
							OneGlow:registerEventHandler( "transition_complete_keyframe", OneGlowFrame4 )
						end
					end
					
					if event.interrupted then
						OneGlowFrame3( OneGlow, event )
						return 
					else
						OneGlow:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						OneGlow:setAlpha( 1 )
						OneGlow:registerEventHandler( "transition_complete_keyframe", OneGlowFrame3 )
					end
				end
				
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				OneGlowFrame2( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								if not event.interrupted then
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark2Ext0:setLeftRight( true, false, -13.56, 98.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -75.29, 92.71 )
								ZmFxSpark2Ext0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark2Ext0, event )
								else
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -13.56, 98.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -75.29, 92.71 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setAlpha( 0.8 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -17.56, 94.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -137.29, 30.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
			end
		},
		Two = {
			DefaultClip = function ()
				self:setupElementClipCounter( 29 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				local TwoFrame2 = function ( Two, event )
					local TwoFrame3 = function ( Two, event )
						if not event.interrupted then
							Two:beginAnimation( "keyframe", 1519, false, false, CoD.TweenType.Linear )
						end
						Two:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Two, event )
						else
							Two:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TwoFrame3( Two, event )
						return 
					else
						Two:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						Two:registerEventHandler( "transition_complete_keyframe", TwoFrame3 )
					end
				end
				
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				TwoFrame2( Two, {} )
				local TwoLightFrame2 = function ( TwoLight, event )
					local TwoLightFrame3 = function ( TwoLight, event )
						local TwoLightFrame4 = function ( TwoLight, event )
							if not event.interrupted then
								TwoLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							TwoLight:setAlpha( 0 )
							TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
							TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
							TwoLight:setShaderVector( 2, 1, 0, 0, 0 )
							TwoLight:setShaderVector( 3, 0.22, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( TwoLight, event )
							else
								TwoLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TwoLightFrame4( TwoLight, event )
							return 
						else
							TwoLight:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
							TwoLight:setAlpha( 0.55 )
							TwoLight:setShaderVector( 2, 1, 0, 0, 0 )
							TwoLight:registerEventHandler( "transition_complete_keyframe", TwoLightFrame4 )
						end
					end
					
					if event.interrupted then
						TwoLightFrame3( TwoLight, event )
						return 
					else
						TwoLight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						TwoLight:setAlpha( 1 )
						TwoLight:registerEventHandler( "transition_complete_keyframe", TwoLightFrame3 )
					end
				end
				
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.TwoLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.TwoLight:setShaderVector( 3, 0.22, 0, 0, 0 )
				TwoLightFrame2( TwoLight, {} )
				local TwoGlowFrame2 = function ( TwoGlow, event )
					local TwoGlowFrame3 = function ( TwoGlow, event )
						local TwoGlowFrame4 = function ( TwoGlow, event )
							local TwoGlowFrame5 = function ( TwoGlow, event )
								if not event.interrupted then
									TwoGlow:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								end
								TwoGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( TwoGlow, event )
								else
									TwoGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TwoGlowFrame5( TwoGlow, event )
								return 
							else
								TwoGlow:beginAnimation( "keyframe", 1379, false, false, CoD.TweenType.Linear )
								TwoGlow:registerEventHandler( "transition_complete_keyframe", TwoGlowFrame5 )
							end
						end
						
						if event.interrupted then
							TwoGlowFrame4( TwoGlow, event )
							return 
						else
							TwoGlow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							TwoGlow:setAlpha( 1 )
							TwoGlow:registerEventHandler( "transition_complete_keyframe", TwoGlowFrame4 )
						end
					end
					
					if event.interrupted then
						TwoGlowFrame3( TwoGlow, event )
						return 
					else
						TwoGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						TwoGlow:registerEventHandler( "transition_complete_keyframe", TwoGlowFrame3 )
					end
				end
				
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				TwoGlowFrame2( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													if not event.interrupted then
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
													end
													ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -86, 82 )
													ZmFxSpark2Ext0:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( ZmFxSpark2Ext0, event )
													else
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -86, 82 )
													ZmFxSpark2Ext0:setAlpha( 0.7 )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -12.56, 99.44 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -82.54, 85.46 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setLeftRight( true, false, -20.56, 91.44 )
											ZmFxSpark2Ext0:setTopBottom( true, false, -77, 91 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -16.56, 95.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -92, 76 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -11.56, 100.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -113, 55 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -10.56, 101.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -128, 40 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -19.56, 92.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -132.29, 35.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -29.56, 82.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -121.29, 46.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
			end
		},
		Three = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				local ThreeFrame2 = function ( Three, event )
					local ThreeFrame3 = function ( Three, event )
						if not event.interrupted then
							Three:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						end
						Three:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Three, event )
						else
							Three:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ThreeFrame3( Three, event )
						return 
					else
						Three:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
						Three:registerEventHandler( "transition_complete_keyframe", ThreeFrame3 )
					end
				end
				
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				ThreeFrame2( Three, {} )
				local ThreeLightFrame2 = function ( ThreeLight, event )
					local ThreeLightFrame3 = function ( ThreeLight, event )
						local ThreeLightFrame4 = function ( ThreeLight, event )
							if not event.interrupted then
								ThreeLight:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							end
							ThreeLight:setAlpha( 0 )
							ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
							ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
							ThreeLight:setShaderVector( 2, 1, 0, 0, 0 )
							ThreeLight:setShaderVector( 3, 0.21, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( ThreeLight, event )
							else
								ThreeLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ThreeLightFrame4( ThreeLight, event )
							return 
						else
							ThreeLight:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
							ThreeLight:setShaderVector( 2, 1, 0, 0, 0 )
							ThreeLight:registerEventHandler( "transition_complete_keyframe", ThreeLightFrame4 )
						end
					end
					
					if event.interrupted then
						ThreeLightFrame3( ThreeLight, event )
						return 
					else
						ThreeLight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ThreeLight:registerEventHandler( "transition_complete_keyframe", ThreeLightFrame3 )
					end
				end
				
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 1 )
				self.ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.ThreeLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.ThreeLight:setShaderVector( 3, 0.21, 0, 0, 0 )
				ThreeLightFrame2( ThreeLight, {} )
				local ThreeGlowFrame2 = function ( ThreeGlow, event )
					local ThreeGlowFrame3 = function ( ThreeGlow, event )
						local ThreeGlowFrame4 = function ( ThreeGlow, event )
							local ThreeGlowFrame5 = function ( ThreeGlow, event )
								if not event.interrupted then
									ThreeGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								ThreeGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ThreeGlow, event )
								else
									ThreeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ThreeGlowFrame5( ThreeGlow, event )
								return 
							else
								ThreeGlow:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
								ThreeGlow:registerEventHandler( "transition_complete_keyframe", ThreeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							ThreeGlowFrame4( ThreeGlow, event )
							return 
						else
							ThreeGlow:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							ThreeGlow:setAlpha( 1 )
							ThreeGlow:registerEventHandler( "transition_complete_keyframe", ThreeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ThreeGlowFrame3( ThreeGlow, event )
						return 
					else
						ThreeGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ThreeGlow:registerEventHandler( "transition_complete_keyframe", ThreeGlowFrame3 )
					end
				end
				
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				ThreeGlowFrame2( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													local ZmFxSpark2Ext0Frame11 = function ( ZmFxSpark2Ext0, event )
														local ZmFxSpark2Ext0Frame12 = function ( ZmFxSpark2Ext0, event )
															local ZmFxSpark2Ext0Frame13 = function ( ZmFxSpark2Ext0, event )
																local ZmFxSpark2Ext0Frame14 = function ( ZmFxSpark2Ext0, event )
																	if not event.interrupted then
																		ZmFxSpark2Ext0:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
																	end
																	ZmFxSpark2Ext0:setLeftRight( true, false, -19.56, 92.44 )
																	ZmFxSpark2Ext0:setTopBottom( true, false, -72, 96 )
																	ZmFxSpark2Ext0:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( ZmFxSpark2Ext0, event )
																	else
																		ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	ZmFxSpark2Ext0Frame14( ZmFxSpark2Ext0, event )
																	return 
																else
																	ZmFxSpark2Ext0:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
																	ZmFxSpark2Ext0:setLeftRight( true, false, -18.73, 93.27 )
																	ZmFxSpark2Ext0:setAlpha( 0 )
																	ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame14 )
																end
															end
															
															if event.interrupted then
																ZmFxSpark2Ext0Frame13( ZmFxSpark2Ext0, event )
																return 
															else
																ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																ZmFxSpark2Ext0:setLeftRight( true, false, -18.56, 93.44 )
																ZmFxSpark2Ext0:setTopBottom( true, false, -72, 96 )
																ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame13 )
															end
														end
														
														if event.interrupted then
															ZmFxSpark2Ext0Frame12( ZmFxSpark2Ext0, event )
															return 
														else
															ZmFxSpark2Ext0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
															ZmFxSpark2Ext0:setLeftRight( true, false, -2.56, 109.44 )
															ZmFxSpark2Ext0:setTopBottom( true, false, -86, 82 )
															ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame12 )
														end
													end
													
													if event.interrupted then
														ZmFxSpark2Ext0Frame11( ZmFxSpark2Ext0, event )
														return 
													else
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														ZmFxSpark2Ext0:setLeftRight( true, false, -3.56, 108.44 )
														ZmFxSpark2Ext0:setTopBottom( true, false, -95, 73 )
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame11 )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:setLeftRight( true, false, -16, 96 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -103, 65 )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -11, 101 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -110, 58 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setLeftRight( true, false, -5, 107 )
											ZmFxSpark2Ext0:setTopBottom( true, false, -120, 48 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -10, 102 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -135, 33 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -19, 93 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -137, 31 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -26.06, 85.94 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -127, 41 )
								ZmFxSpark2Ext0:setAlpha( 0.8 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setAlpha( 0.29 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -31, 81 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -120, 48 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
			end
		},
		Four = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				local FourFrame2 = function ( Four, event )
					local FourFrame3 = function ( Four, event )
						if not event.interrupted then
							Four:beginAnimation( "keyframe", 1539, false, false, CoD.TweenType.Linear )
						end
						Four:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Four, event )
						else
							Four:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FourFrame3( Four, event )
						return 
					else
						Four:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						Four:registerEventHandler( "transition_complete_keyframe", FourFrame3 )
					end
				end
				
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				FourFrame2( Four, {} )
				local FourLightFrame2 = function ( FourLight, event )
					local FourLightFrame3 = function ( FourLight, event )
						local FourLightFrame4 = function ( FourLight, event )
							local FourLightFrame5 = function ( FourLight, event )
								if not event.interrupted then
									FourLight:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
								end
								FourLight:setAlpha( 0 )
								FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								FourLight:setShaderVector( 0, 1, 0, 0, 0 )
								FourLight:setShaderVector( 1, 0, 0, 0, 0 )
								FourLight:setShaderVector( 2, 1, 0, 0, 0 )
								FourLight:setShaderVector( 3, 0.22, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( FourLight, event )
								else
									FourLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FourLightFrame5( FourLight, event )
								return 
							else
								FourLight:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
								FourLight:registerEventHandler( "transition_complete_keyframe", FourLightFrame5 )
							end
						end
						
						if event.interrupted then
							FourLightFrame4( FourLight, event )
							return 
						else
							FourLight:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							FourLight:setShaderVector( 2, 1, 0, 0, 0 )
							FourLight:registerEventHandler( "transition_complete_keyframe", FourLightFrame4 )
						end
					end
					
					if event.interrupted then
						FourLightFrame3( FourLight, event )
						return 
					else
						FourLight:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						FourLight:registerEventHandler( "transition_complete_keyframe", FourLightFrame3 )
					end
				end
				
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 1 )
				self.FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.FourLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.FourLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.FourLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.FourLight:setShaderVector( 3, 0.22, 0, 0, 0 )
				FourLightFrame2( FourLight, {} )
				local FourGlowFrame2 = function ( FourGlow, event )
					local FourGlowFrame3 = function ( FourGlow, event )
						local FourGlowFrame4 = function ( FourGlow, event )
							if not event.interrupted then
								FourGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							FourGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FourGlow, event )
							else
								FourGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FourGlowFrame4( FourGlow, event )
							return 
						else
							FourGlow:beginAnimation( "keyframe", 1779, false, false, CoD.TweenType.Linear )
							FourGlow:registerEventHandler( "transition_complete_keyframe", FourGlowFrame4 )
						end
					end
					
					if event.interrupted then
						FourGlowFrame3( FourGlow, event )
						return 
					else
						FourGlow:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						FourGlow:setAlpha( 1 )
						FourGlow:registerEventHandler( "transition_complete_keyframe", FourGlowFrame3 )
					end
				end
				
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				FourGlowFrame2( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									if not event.interrupted then
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									ZmFxSpark2Ext0:setLeftRight( true, false, -4.56, 107.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -117.29, 50.71 )
									ZmFxSpark2Ext0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( ZmFxSpark2Ext0, event )
									else
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -4.56, 107.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -117.29, 50.71 )
									ZmFxSpark2Ext0:setAlpha( 0.43 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -14.67, 97.33 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -111.03, 56.97 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -25.56, 86.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -104.29, 63.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, -22.59, 89.41 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -127.27, 40.73 )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -21.56, 90.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -135.29, 32.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								if not event.interrupted then
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark2Ext00:setLeftRight( true, false, -10.56, 101.44 )
								ZmFxSpark2Ext00:setTopBottom( true, false, -76, 92 )
								ZmFxSpark2Ext00:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark2Ext00, event )
								else
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setLeftRight( true, false, -10.56, 101.44 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -76, 92 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:setLeftRight( true, false, -5.9, 106.1 )
						ZmFxSpark2Ext00:setTopBottom( true, false, -117.91, 50.09 )
						ZmFxSpark2Ext00:setAlpha( 0.8 )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, -4.56, 107.44 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -130, 38 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
			end
		},
		Five = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				local FiveFrame2 = function ( Five, event )
					local FiveFrame3 = function ( Five, event )
						if not event.interrupted then
							Five:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
						end
						Five:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Five, event )
						else
							Five:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FiveFrame3( Five, event )
						return 
					else
						Five:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
						Five:registerEventHandler( "transition_complete_keyframe", FiveFrame3 )
					end
				end
				
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				FiveFrame2( Five, {} )
				local FiveLightFrame2 = function ( FiveLight, event )
					local FiveLightFrame3 = function ( FiveLight, event )
						local FiveLightFrame4 = function ( FiveLight, event )
							if not event.interrupted then
								FiveLight:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							FiveLight:setAlpha( 0 )
							FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
							FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
							FiveLight:setShaderVector( 2, 1, 0, 0, 0 )
							FiveLight:setShaderVector( 3, 0.2, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( FiveLight, event )
							else
								FiveLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FiveLightFrame4( FiveLight, event )
							return 
						else
							FiveLight:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
							FiveLight:setShaderVector( 2, 1, 0, 0, 0 )
							FiveLight:registerEventHandler( "transition_complete_keyframe", FiveLightFrame4 )
						end
					end
					
					if event.interrupted then
						FiveLightFrame3( FiveLight, event )
						return 
					else
						FiveLight:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						FiveLight:registerEventHandler( "transition_complete_keyframe", FiveLightFrame3 )
					end
				end
				
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 1 )
				self.FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.FiveLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.FiveLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				FiveLightFrame2( FiveLight, {} )
				local FiveGlowFrame2 = function ( FiveGlow, event )
					local FiveGlowFrame3 = function ( FiveGlow, event )
						local FiveGlowFrame4 = function ( FiveGlow, event )
							if not event.interrupted then
								FiveGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							FiveGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FiveGlow, event )
							else
								FiveGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FiveGlowFrame4( FiveGlow, event )
							return 
						else
							FiveGlow:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
							FiveGlow:registerEventHandler( "transition_complete_keyframe", FiveGlowFrame4 )
						end
					end
					
					if event.interrupted then
						FiveGlowFrame3( FiveGlow, event )
						return 
					else
						FiveGlow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						FiveGlow:setAlpha( 1 )
						FiveGlow:registerEventHandler( "transition_complete_keyframe", FiveGlowFrame3 )
					end
				end
				
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				FiveGlowFrame2( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													local ZmFxSpark2Ext0Frame11 = function ( ZmFxSpark2Ext0, event )
														if not event.interrupted then
															ZmFxSpark2Ext0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
														end
														ZmFxSpark2Ext0:setLeftRight( true, false, -22.56, 89.44 )
														ZmFxSpark2Ext0:setTopBottom( true, false, -73.29, 94.71 )
														ZmFxSpark2Ext0:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( ZmFxSpark2Ext0, event )
														else
															ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														ZmFxSpark2Ext0Frame11( ZmFxSpark2Ext0, event )
														return 
													else
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														ZmFxSpark2Ext0:setLeftRight( true, false, -22.56, 89.44 )
														ZmFxSpark2Ext0:setTopBottom( true, false, -73.29, 94.71 )
														ZmFxSpark2Ext0:setAlpha( 0.59 )
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame11 )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:setLeftRight( true, false, -18.56, 93.44 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -72.29, 95.71 )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -9.56, 102.44 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -75.29, 92.71 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setLeftRight( true, false, -5.56, 106.44 )
											ZmFxSpark2Ext0:setTopBottom( true, false, -82.29, 85.71 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -94.29, 73.71 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -14.09, 97.91 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -110.82, 57.18 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -23.56, 88.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -110.29, 57.71 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -22.56, 89.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -133.29, 34.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, -15.45, 96.55 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -136.61, 31.39 )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -140.29, 27.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
			end
		},
		Six = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				local SixFrame2 = function ( Six, event )
					local SixFrame3 = function ( Six, event )
						if not event.interrupted then
							Six:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
						end
						Six:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Six, event )
						else
							Six:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SixFrame3( Six, event )
						return 
					else
						Six:beginAnimation( "keyframe", 1470, false, false, CoD.TweenType.Linear )
						Six:registerEventHandler( "transition_complete_keyframe", SixFrame3 )
					end
				end
				
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				SixFrame2( Six, {} )
				local SixLightFrame2 = function ( SixLight, event )
					local SixLightFrame3 = function ( SixLight, event )
						local SixLightFrame4 = function ( SixLight, event )
							local SixLightFrame5 = function ( SixLight, event )
								if not event.interrupted then
									SixLight:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
								end
								SixLight:setAlpha( 0 )
								SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								SixLight:setShaderVector( 0, 1, 0, 0, 0 )
								SixLight:setShaderVector( 1, 0, 0, 0, 0 )
								SixLight:setShaderVector( 2, 1, 0, 0, 0 )
								SixLight:setShaderVector( 3, 0.2, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( SixLight, event )
								else
									SixLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SixLightFrame5( SixLight, event )
								return 
							else
								SixLight:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
								SixLight:registerEventHandler( "transition_complete_keyframe", SixLightFrame5 )
							end
						end
						
						if event.interrupted then
							SixLightFrame4( SixLight, event )
							return 
						else
							SixLight:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
							SixLight:setShaderVector( 2, 1, 0, 0, 0 )
							SixLight:registerEventHandler( "transition_complete_keyframe", SixLightFrame4 )
						end
					end
					
					if event.interrupted then
						SixLightFrame3( SixLight, event )
						return 
					else
						SixLight:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						SixLight:registerEventHandler( "transition_complete_keyframe", SixLightFrame3 )
					end
				end
				
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 1 )
				self.SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.SixLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.SixLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.SixLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.SixLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				SixLightFrame2( SixLight, {} )
				local SixGlowFrame2 = function ( SixGlow, event )
					local SixGlowFrame3 = function ( SixGlow, event )
						local SixGlowFrame4 = function ( SixGlow, event )
							if not event.interrupted then
								SixGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							SixGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( SixGlow, event )
							else
								SixGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SixGlowFrame4( SixGlow, event )
							return 
						else
							SixGlow:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
							SixGlow:registerEventHandler( "transition_complete_keyframe", SixGlowFrame4 )
						end
					end
					
					if event.interrupted then
						SixGlowFrame3( SixGlow, event )
						return 
					else
						SixGlow:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						SixGlow:setAlpha( 1 )
						SixGlow:registerEventHandler( "transition_complete_keyframe", SixGlowFrame3 )
					end
				end
				
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				SixGlowFrame2( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													local ZmFxSpark2Ext0Frame11 = function ( ZmFxSpark2Ext0, event )
														if not event.interrupted then
															ZmFxSpark2Ext0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
														end
														ZmFxSpark2Ext0:setLeftRight( true, false, -21.56, 90.44 )
														ZmFxSpark2Ext0:setTopBottom( true, false, -96.29, 71.71 )
														ZmFxSpark2Ext0:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( ZmFxSpark2Ext0, event )
														else
															ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														ZmFxSpark2Ext0Frame11( ZmFxSpark2Ext0, event )
														return 
													else
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														ZmFxSpark2Ext0:setLeftRight( true, false, -21.56, 90.44 )
														ZmFxSpark2Ext0:setTopBottom( true, false, -96.29, 71.71 )
														ZmFxSpark2Ext0:setAlpha( 0.65 )
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame11 )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:setLeftRight( true, false, -16.76, 95.24 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -102.69, 65.31 )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -15.56, 96.44 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
											ZmFxSpark2Ext0:setTopBottom( true, false, -104.29, 63.71 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -14.21, 97.79 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -78.46, 89.54 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -23.56, 88.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -73.29, 94.71 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -25.52, 86.48 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -94.65, 73.35 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -25.56, 86.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -105.29, 62.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, -14, 98 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -127.05, 40.95 )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -8.56, 103.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -137.29, 30.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
			end
		},
		Seven = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				local SevenFrame2 = function ( Seven, event )
					local SevenFrame3 = function ( Seven, event )
						if not event.interrupted then
							Seven:beginAnimation( "keyframe", 1559, false, false, CoD.TweenType.Linear )
						end
						Seven:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Seven, event )
						else
							Seven:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SevenFrame3( Seven, event )
						return 
					else
						Seven:beginAnimation( "keyframe", 1450, false, false, CoD.TweenType.Linear )
						Seven:registerEventHandler( "transition_complete_keyframe", SevenFrame3 )
					end
				end
				
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				SevenFrame2( Seven, {} )
				local SevenLightFrame2 = function ( SevenLight, event )
					local SevenLightFrame3 = function ( SevenLight, event )
						if not event.interrupted then
							SevenLight:beginAnimation( "keyframe", 929, false, false, CoD.TweenType.Linear )
						end
						SevenLight:setAlpha( 0 )
						SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
						SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
						SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
						SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
						SevenLight:setShaderVector( 3, 0.2, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( SevenLight, event )
						else
							SevenLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SevenLightFrame3( SevenLight, event )
						return 
					else
						SevenLight:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
						SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
						SevenLight:registerEventHandler( "transition_complete_keyframe", SevenLightFrame3 )
					end
				end
				
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 1 )
				self.SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.SevenLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.SevenLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				SevenLightFrame2( SevenLight, {} )
				local SevenGlowFrame2 = function ( SevenGlow, event )
					local SevenGlowFrame3 = function ( SevenGlow, event )
						local SevenGlowFrame4 = function ( SevenGlow, event )
							if not event.interrupted then
								SevenGlow:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
							end
							SevenGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( SevenGlow, event )
							else
								SevenGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SevenGlowFrame4( SevenGlow, event )
							return 
						else
							SevenGlow:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
							SevenGlow:registerEventHandler( "transition_complete_keyframe", SevenGlowFrame4 )
						end
					end
					
					if event.interrupted then
						SevenGlowFrame3( SevenGlow, event )
						return 
					else
						SevenGlow:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						SevenGlow:setAlpha( 1 )
						SevenGlow:registerEventHandler( "transition_complete_keyframe", SevenGlowFrame3 )
					end
				end
				
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				SevenGlowFrame2( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										if not event.interrupted then
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
										end
										ZmFxSpark2Ext0:setLeftRight( true, false, -11.56, 100.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -73.29, 94.71 )
										ZmFxSpark2Ext0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ZmFxSpark2Ext0, event )
										else
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -11.56, 100.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -73.29, 94.71 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -7.56, 104.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -132.29, 35.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -29.56, 82.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -121.29, 46.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )
			end
		},
		Eight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				local EightFrame2 = function ( Eight, event )
					local EightFrame3 = function ( Eight, event )
						if not event.interrupted then
							Eight:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
						end
						Eight:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Eight, event )
						else
							Eight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EightFrame3( Eight, event )
						return 
					else
						Eight:beginAnimation( "keyframe", 1470, false, false, CoD.TweenType.Linear )
						Eight:registerEventHandler( "transition_complete_keyframe", EightFrame3 )
					end
				end
				
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				EightFrame2( Eight, {} )
				local EightLightFrame2 = function ( EightLight, event )
					local EightLightFrame3 = function ( EightLight, event )
						local EightLightFrame4 = function ( EightLight, event )
							local EightLightFrame5 = function ( EightLight, event )
								if not event.interrupted then
									EightLight:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
								end
								EightLight:setAlpha( 0 )
								EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								EightLight:setShaderVector( 0, 1, 0, 0, 0 )
								EightLight:setShaderVector( 1, 0, 0, 0, 0 )
								EightLight:setShaderVector( 2, 1, 0, 0, 0 )
								EightLight:setShaderVector( 3, 0.2, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( EightLight, event )
								else
									EightLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EightLightFrame5( EightLight, event )
								return 
							else
								EightLight:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
								EightLight:registerEventHandler( "transition_complete_keyframe", EightLightFrame5 )
							end
						end
						
						if event.interrupted then
							EightLightFrame4( EightLight, event )
							return 
						else
							EightLight:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
							EightLight:setShaderVector( 2, 1, 0, 0, 0 )
							EightLight:registerEventHandler( "transition_complete_keyframe", EightLightFrame4 )
						end
					end
					
					if event.interrupted then
						EightLightFrame3( EightLight, event )
						return 
					else
						EightLight:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						EightLight:registerEventHandler( "transition_complete_keyframe", EightLightFrame3 )
					end
				end
				
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 1 )
				self.EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.EightLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.EightLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.EightLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.EightLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				EightLightFrame2( EightLight, {} )
				local EightGlowFrame2 = function ( EightGlow, event )
					local EightGlowFrame3 = function ( EightGlow, event )
						local EightGlowFrame4 = function ( EightGlow, event )
							if not event.interrupted then
								EightGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							EightGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( EightGlow, event )
							else
								EightGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							EightGlowFrame4( EightGlow, event )
							return 
						else
							EightGlow:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
							EightGlow:registerEventHandler( "transition_complete_keyframe", EightGlowFrame4 )
						end
					end
					
					if event.interrupted then
						EightGlowFrame3( EightGlow, event )
						return 
					else
						EightGlow:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						EightGlow:setAlpha( 1 )
						EightGlow:registerEventHandler( "transition_complete_keyframe", EightGlowFrame3 )
					end
				end
				
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				EightGlowFrame2( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													if not event.interrupted then
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													end
													ZmFxSpark2Ext0:setLeftRight( true, false, -15.56, 96.44 )
													ZmFxSpark2Ext0:setTopBottom( true, false, -76, 92 )
													ZmFxSpark2Ext0:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( ZmFxSpark2Ext0, event )
													else
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -15.56, 96.44 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -76, 92 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setTopBottom( true, false, -88, 80 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -6.56, 105.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -99.29, 68.71 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -17.56, 94.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -107.29, 60.71 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -29.56, 82.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -118.29, 49.71 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -24.56, 87.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -130.29, 37.71 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -19.56, 92.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -137.29, 30.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								local ZmFxSpark2Ext00Frame6 = function ( ZmFxSpark2Ext00, event )
									local ZmFxSpark2Ext00Frame7 = function ( ZmFxSpark2Ext00, event )
										local ZmFxSpark2Ext00Frame8 = function ( ZmFxSpark2Ext00, event )
											local ZmFxSpark2Ext00Frame9 = function ( ZmFxSpark2Ext00, event )
												local ZmFxSpark2Ext00Frame10 = function ( ZmFxSpark2Ext00, event )
													if not event.interrupted then
														ZmFxSpark2Ext00:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													end
													ZmFxSpark2Ext00:setLeftRight( true, false, -17, 95 )
													ZmFxSpark2Ext00:setTopBottom( true, false, -76, 92 )
													ZmFxSpark2Ext00:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( ZmFxSpark2Ext00, event )
													else
														ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext00Frame10( ZmFxSpark2Ext00, event )
													return 
												else
													ZmFxSpark2Ext00:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext00Frame9( ZmFxSpark2Ext00, event )
												return 
											else
												ZmFxSpark2Ext00:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext00:setLeftRight( true, false, -17, 95 )
												ZmFxSpark2Ext00:setTopBottom( true, false, -76, 92 )
												ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext00Frame8( ZmFxSpark2Ext00, event )
											return 
										else
											ZmFxSpark2Ext00:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext00:setLeftRight( true, false, -31, 81 )
											ZmFxSpark2Ext00:setTopBottom( true, false, -82.29, 85.71 )
											ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext00Frame7( ZmFxSpark2Ext00, event )
										return 
									else
										ZmFxSpark2Ext00:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext00:setLeftRight( true, false, -28, 84 )
										ZmFxSpark2Ext00:setTopBottom( true, false, -94.29, 73.71 )
										ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext00Frame6( ZmFxSpark2Ext00, event )
									return 
								else
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext00:setLeftRight( true, false, -17.56, 94.44 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -111.29, 56.71 )
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:setLeftRight( true, false, -3.56, 108.44 )
								ZmFxSpark2Ext00:setTopBottom( true, false, -118.29, 49.71 )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setLeftRight( true, false, -6.56, 105.44 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -134.29, 33.71 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:setAlpha( 0.8 )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, -19.56, 92.44 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -137.29, 30.71 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
			end
		},
		Nine = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				local NineFrame2 = function ( Nine, event )
					local NineFrame3 = function ( Nine, event )
						if not event.interrupted then
							Nine:beginAnimation( "keyframe", 1460, false, false, CoD.TweenType.Linear )
						end
						Nine:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Nine, event )
						else
							Nine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NineFrame3( Nine, event )
						return 
					else
						Nine:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
						Nine:registerEventHandler( "transition_complete_keyframe", NineFrame3 )
					end
				end
				
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				NineFrame2( Nine, {} )
				local NineLightFrame2 = function ( NineLight, event )
					local NineLightFrame3 = function ( NineLight, event )
						local NineLightFrame4 = function ( NineLight, event )
							if not event.interrupted then
								NineLight:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							end
							NineLight:setAlpha( 0 )
							NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							NineLight:setShaderVector( 0, 1, 0, 0, 0 )
							NineLight:setShaderVector( 1, 0, 0, 0, 0 )
							NineLight:setShaderVector( 2, 1, 0, 0, 0 )
							NineLight:setShaderVector( 3, 0.2, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( NineLight, event )
							else
								NineLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							NineLightFrame4( NineLight, event )
							return 
						else
							NineLight:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							NineLight:registerEventHandler( "transition_complete_keyframe", NineLightFrame4 )
						end
					end
					
					if event.interrupted then
						NineLightFrame3( NineLight, event )
						return 
					else
						NineLight:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						NineLight:setShaderVector( 2, 1, 0, 0, 0 )
						NineLight:registerEventHandler( "transition_complete_keyframe", NineLightFrame3 )
					end
				end
				
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 1 )
				self.NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.NineLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.NineLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.NineLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.NineLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				NineLightFrame2( NineLight, {} )
				local NineGlowFrame2 = function ( NineGlow, event )
					local NineGlowFrame3 = function ( NineGlow, event )
						local NineGlowFrame4 = function ( NineGlow, event )
							if not event.interrupted then
								NineGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							NineGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( NineGlow, event )
							else
								NineGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							NineGlowFrame4( NineGlow, event )
							return 
						else
							NineGlow:beginAnimation( "keyframe", 1620, false, false, CoD.TweenType.Linear )
							NineGlow:registerEventHandler( "transition_complete_keyframe", NineGlowFrame4 )
						end
					end
					
					if event.interrupted then
						NineGlowFrame3( NineGlow, event )
						return 
					else
						NineGlow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						NineGlow:setAlpha( 1 )
						NineGlow:registerEventHandler( "transition_complete_keyframe", NineGlowFrame3 )
					end
				end
				
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				NineGlowFrame2( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				self.clipFinished( Zero, {} )
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 0 )
				self.clipFinished( ZeroLight, {} )
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				self.clipFinished( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										if not event.interrupted then
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
										end
										ZmFxSpark2Ext0:setLeftRight( true, false, -8.56, 103.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -120.9, 47.1 )
										ZmFxSpark2Ext0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ZmFxSpark2Ext0, event )
										else
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -8.56, 103.44 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -120.9, 47.1 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -19.91, 92.09 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -107.78, 60.22 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -30.56, 81.44 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -107.9, 60.1 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setLeftRight( true, false, -22.56, 89.44 )
						ZmFxSpark2Ext0:setTopBottom( true, false, -130, 38 )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -4.56, 107.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -135, 33 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							if not event.interrupted then
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext00:setLeftRight( true, false, -19.56, 92.44 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -71, 97 )
							ZmFxSpark2Ext00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext00, event )
							else
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setLeftRight( true, false, -19.56, 92.44 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -71, 97 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:setAlpha( 0.8 )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, 4.44, 116.44 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -135, 33 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
			end
		},
		Zero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				Nine:completeAnimation()
				self.Nine:setAlpha( 0 )
				self.clipFinished( Nine, {} )
				NineLight:completeAnimation()
				self.NineLight:setAlpha( 0 )
				self.clipFinished( NineLight, {} )
				NineGlow:completeAnimation()
				self.NineGlow:setAlpha( 0 )
				self.clipFinished( NineGlow, {} )
				Eight:completeAnimation()
				self.Eight:setAlpha( 0 )
				self.clipFinished( Eight, {} )
				EightLight:completeAnimation()
				self.EightLight:setAlpha( 0 )
				self.clipFinished( EightLight, {} )
				EightGlow:completeAnimation()
				self.EightGlow:setAlpha( 0 )
				self.clipFinished( EightGlow, {} )
				Seven:completeAnimation()
				self.Seven:setAlpha( 0 )
				self.clipFinished( Seven, {} )
				SevenLight:completeAnimation()
				self.SevenLight:setAlpha( 0 )
				self.clipFinished( SevenLight, {} )
				SevenGlow:completeAnimation()
				self.SevenGlow:setAlpha( 0 )
				self.clipFinished( SevenGlow, {} )
				Six:completeAnimation()
				self.Six:setAlpha( 0 )
				self.clipFinished( Six, {} )
				SixLight:completeAnimation()
				self.SixLight:setAlpha( 0 )
				self.clipFinished( SixLight, {} )
				SixGlow:completeAnimation()
				self.SixGlow:setAlpha( 0 )
				self.clipFinished( SixGlow, {} )
				Five:completeAnimation()
				self.Five:setAlpha( 0 )
				self.clipFinished( Five, {} )
				FiveLight:completeAnimation()
				self.FiveLight:setAlpha( 0 )
				self.clipFinished( FiveLight, {} )
				FiveGlow:completeAnimation()
				self.FiveGlow:setAlpha( 0 )
				self.clipFinished( FiveGlow, {} )
				Four:completeAnimation()
				self.Four:setAlpha( 0 )
				self.clipFinished( Four, {} )
				FourLight:completeAnimation()
				self.FourLight:setAlpha( 0 )
				self.clipFinished( FourLight, {} )
				FourGlow:completeAnimation()
				self.FourGlow:setAlpha( 0 )
				self.clipFinished( FourGlow, {} )
				Three:completeAnimation()
				self.Three:setAlpha( 0 )
				self.clipFinished( Three, {} )
				ThreeLight:completeAnimation()
				self.ThreeLight:setAlpha( 0 )
				self.clipFinished( ThreeLight, {} )
				ThreeGlow:completeAnimation()
				self.ThreeGlow:setAlpha( 0 )
				self.clipFinished( ThreeGlow, {} )
				Two:completeAnimation()
				self.Two:setAlpha( 0 )
				self.clipFinished( Two, {} )
				TwoLight:completeAnimation()
				self.TwoLight:setAlpha( 0 )
				self.clipFinished( TwoLight, {} )
				TwoGlow:completeAnimation()
				self.TwoGlow:setAlpha( 0 )
				self.clipFinished( TwoGlow, {} )
				One:completeAnimation()
				self.One:setAlpha( 0 )
				self.clipFinished( One, {} )
				OneLight:completeAnimation()
				self.OneLight:setAlpha( 0 )
				self.clipFinished( OneLight, {} )
				OneGlow:completeAnimation()
				self.OneGlow:setAlpha( 0 )
				self.clipFinished( OneGlow, {} )
				local ZeroFrame2 = function ( Zero, event )
					local ZeroFrame3 = function ( Zero, event )
						if not event.interrupted then
							Zero:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						end
						Zero:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Zero, event )
						else
							Zero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZeroFrame3( Zero, event )
						return 
					else
						Zero:beginAnimation( "keyframe", 1529, false, false, CoD.TweenType.Linear )
						Zero:registerEventHandler( "transition_complete_keyframe", ZeroFrame3 )
					end
				end
				
				Zero:completeAnimation()
				self.Zero:setAlpha( 0 )
				ZeroFrame2( Zero, {} )
				local ZeroLightFrame2 = function ( ZeroLight, event )
					local ZeroLightFrame3 = function ( ZeroLight, event )
						local ZeroLightFrame4 = function ( ZeroLight, event )
							if not event.interrupted then
								ZeroLight:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							end
							ZeroLight:setAlpha( 0 )
							ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
							ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
							ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
							ZeroLight:setShaderVector( 2, 1.08, 0, 0, 0 )
							ZeroLight:setShaderVector( 3, 0.21, -0.23, 0, 0 )
							if event.interrupted then
								self.clipFinished( ZeroLight, event )
							else
								ZeroLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZeroLightFrame4( ZeroLight, event )
							return 
						else
							ZeroLight:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
							ZeroLight:setShaderVector( 2, 1.08, 0, 0, 0 )
							ZeroLight:registerEventHandler( "transition_complete_keyframe", ZeroLightFrame4 )
						end
					end
					
					if event.interrupted then
						ZeroLightFrame3( ZeroLight, event )
						return 
					else
						ZeroLight:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						ZeroLight:setShaderVector( 2, 0.26, 0, 0, 0 )
						ZeroLight:registerEventHandler( "transition_complete_keyframe", ZeroLightFrame3 )
					end
				end
				
				ZeroLight:completeAnimation()
				self.ZeroLight:setAlpha( 1 )
				self.ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
				self.ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.ZeroLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.ZeroLight:setShaderVector( 3, 0.21, -0.23, 0, 0 )
				ZeroLightFrame2( ZeroLight, {} )
				local ZeroGlowFrame2 = function ( ZeroGlow, event )
					local ZeroGlowFrame3 = function ( ZeroGlow, event )
						local ZeroGlowFrame4 = function ( ZeroGlow, event )
							if not event.interrupted then
								ZeroGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							ZeroGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZeroGlow, event )
							else
								ZeroGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZeroGlowFrame4( ZeroGlow, event )
							return 
						else
							ZeroGlow:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
							ZeroGlow:registerEventHandler( "transition_complete_keyframe", ZeroGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ZeroGlowFrame3( ZeroGlow, event )
						return 
					else
						ZeroGlow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						ZeroGlow:setAlpha( 1 )
						ZeroGlow:registerEventHandler( "transition_complete_keyframe", ZeroGlowFrame3 )
					end
				end
				
				ZeroGlow:completeAnimation()
				self.ZeroGlow:setAlpha( 0 )
				ZeroGlowFrame2( ZeroGlow, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												if not event.interrupted then
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												end
												ZmFxSpark2Ext0:setLeftRight( true, false, -21.56, 90.44 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -73, 95 )
												ZmFxSpark2Ext0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( ZmFxSpark2Ext0, event )
												else
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, -21.56, 90.44 )
												ZmFxSpark2Ext0:setTopBottom( true, false, -73, 95 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:setLeftRight( true, false, -28, 84 )
											ZmFxSpark2Ext0:setTopBottom( true, false, -79.83, 88.17 )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, -34.56, 77.44 )
										ZmFxSpark2Ext0:setTopBottom( true, false, -88, 80 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setLeftRight( true, false, -36.08, 75.92 )
									ZmFxSpark2Ext0:setTopBottom( true, false, -98.38, 69.62 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -33.56, 78.44 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -120.29, 47.71 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -28, 84 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -128, 40 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setAlpha( 0.8 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, -14.56, 97.44 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -137.29, 30.71 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								local ZmFxSpark2Ext00Frame6 = function ( ZmFxSpark2Ext00, event )
									if not event.interrupted then
										ZmFxSpark2Ext00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									end
									ZmFxSpark2Ext00:setLeftRight( true, false, -10, 102 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -74.01, 94.01 )
									ZmFxSpark2Ext00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( ZmFxSpark2Ext00, event )
									else
										ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext00Frame6( ZmFxSpark2Ext00, event )
									return 
								else
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext00:setLeftRight( true, false, -10, 102 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -74.01, 94.01 )
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:setLeftRight( true, false, 4.44, 116.44 )
								ZmFxSpark2Ext00:setTopBottom( true, false, -94, 74 )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setLeftRight( true, false, 1.57, 113.57 )
							ZmFxSpark2Ext00:setTopBottom( true, false, -113.45, 54.55 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:setAlpha( 0.8 )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, -3.56, 108.44 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -128, 40 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark2Ext0:close()
		element.ZmFxSpark2Ext00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

