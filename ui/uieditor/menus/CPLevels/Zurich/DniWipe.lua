-- 442d05eeddb31a1a0c723602fef8b368
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.GenericUpdateBar" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisOutterThinInternal" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_LinesSide" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_dotblinkwidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_DniWidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_CenterAngledBlurLines" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_CenterAngledLines" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_CircleSpinWidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_DottedCircleWidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_PurgingTextWidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_DniTextWidget" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_OuterIrisBlink" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_NumbersInternal" )

LUI.createMenu.DniWipe = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DniWipe" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DniWipe.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( true, false, 506.63, 780.47 )
	BlackFrame:setTopBottom( true, false, 399.5, 404.5 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0.3 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local GenericUpdateBar0 = CoD.GenericUpdateBar.new( f1_local1, controller )
	GenericUpdateBar0:setLeftRight( true, false, 510.63, 775.5 )
	GenericUpdateBar0:setTopBottom( true, false, 401.5, 403 )
	self:addElement( GenericUpdateBar0 )
	self.GenericUpdateBar0 = GenericUpdateBar0
	
	local IrisOutterEdge = LUI.UIImage.new()
	IrisOutterEdge:setLeftRight( true, false, 0, 272 )
	IrisOutterEdge:setTopBottom( true, true, 0, 0 )
	IrisOutterEdge:setAlpha( 0.3 )
	IrisOutterEdge:setZoom( 71 )
	IrisOutterEdge:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdge )
	self.IrisOutterEdge = IrisOutterEdge
	
	local IrisOutterEdgeR = LUI.UIImage.new()
	IrisOutterEdgeR:setLeftRight( false, true, -272, 0 )
	IrisOutterEdgeR:setTopBottom( true, true, 0, 0 )
	IrisOutterEdgeR:setAlpha( 0.3 )
	IrisOutterEdgeR:setYRot( -180 )
	IrisOutterEdgeR:setZoom( 69 )
	IrisOutterEdgeR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdgeR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdgeR )
	self.IrisOutterEdgeR = IrisOutterEdgeR
	
	local OutterThinInternal0 = CoD.VehicleGround_IrisOutterThinInternal.new( f1_local1, controller )
	OutterThinInternal0:setLeftRight( true, false, -69, 1354 )
	OutterThinInternal0:setTopBottom( true, false, -142.5, 800.5 )
	OutterThinInternal0:setRGB( 0.47, 0.56, 0.83 )
	OutterThinInternal0:setAlpha( 0.35 )
	OutterThinInternal0:setZoom( 68.51 )
	self:addElement( OutterThinInternal0 )
	self.OutterThinInternal0 = OutterThinInternal0
	
	local DniWipeLinesSide = CoD.DniWipe_LinesSide.new( f1_local1, controller )
	DniWipeLinesSide:setLeftRight( true, false, 645.5, 1226.5 )
	DniWipeLinesSide:setTopBottom( true, false, 293, 322 )
	DniWipeLinesSide:setRGB( 0.8, 0.95, 0.97 )
	self:addElement( DniWipeLinesSide )
	self.DniWipeLinesSide = DniWipeLinesSide
	
	local DniWipeLinesSide0 = CoD.DniWipe_LinesSide.new( f1_local1, controller )
	DniWipeLinesSide0:setLeftRight( true, false, 645.06, 1226.5 )
	DniWipeLinesSide0:setTopBottom( true, false, 401.5, 430.5 )
	DniWipeLinesSide0:setRGB( 0.8, 0.95, 0.97 )
	DniWipeLinesSide0:setXRot( 180 )
	self:addElement( DniWipeLinesSide0 )
	self.DniWipeLinesSide0 = DniWipeLinesSide0
	
	local DniWipeLinesSide1 = CoD.DniWipe_LinesSide.new( f1_local1, controller )
	DniWipeLinesSide1:setLeftRight( true, false, 41.5, 640 )
	DniWipeLinesSide1:setTopBottom( true, false, 293, 322 )
	DniWipeLinesSide1:setRGB( 0.8, 0.95, 0.97 )
	DniWipeLinesSide1:setYRot( 180 )
	self:addElement( DniWipeLinesSide1 )
	self.DniWipeLinesSide1 = DniWipeLinesSide1
	
	local DniWipeLinesSide2 = CoD.DniWipe_LinesSide.new( f1_local1, controller )
	DniWipeLinesSide2:setLeftRight( true, false, 41.5, 642.5 )
	DniWipeLinesSide2:setTopBottom( true, false, 401.5, 430.5 )
	DniWipeLinesSide2:setRGB( 0.8, 0.95, 0.97 )
	DniWipeLinesSide2:setXRot( 180 )
	DniWipeLinesSide2:setYRot( 180 )
	self:addElement( DniWipeLinesSide2 )
	self.DniWipeLinesSide2 = DniWipeLinesSide2
	
	local dotUL = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	dotUL:setLeftRight( false, false, 310.5, 318.5 )
	dotUL:setTopBottom( false, false, -237, -229 )
	self:addElement( dotUL )
	self.dotUL = dotUL
	
	local dotUR = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	dotUR:setLeftRight( false, false, -308.5, -300.5 )
	dotUR:setTopBottom( false, false, -237, -229 )
	self:addElement( dotUR )
	self.dotUR = dotUR
	
	local outofboundsdotblinkwidget0 = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	outofboundsdotblinkwidget0:setLeftRight( false, false, 310.5, 318.5 )
	outofboundsdotblinkwidget0:setTopBottom( false, false, 234, 242 )
	self:addElement( outofboundsdotblinkwidget0 )
	self.outofboundsdotblinkwidget0 = outofboundsdotblinkwidget0
	
	local outofboundsdotblinkwidget1 = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	outofboundsdotblinkwidget1:setLeftRight( false, false, -308.5, -300.5 )
	outofboundsdotblinkwidget1:setTopBottom( false, false, 234, 242 )
	self:addElement( outofboundsdotblinkwidget1 )
	self.outofboundsdotblinkwidget1 = outofboundsdotblinkwidget1
	
	local DNImod = CoD.DniWipe_DniWidget.new( f1_local1, controller )
	DNImod:setLeftRight( true, false, 616.06, 668.06 )
	DNImod:setTopBottom( true, false, 428, 485 )
	DNImod:setScale( 0.8 )
	self:addElement( DNImod )
	self.DNImod = DNImod
	
	local CenterDotLR = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	CenterDotLR:setLeftRight( false, false, 144.88, 152.88 )
	CenterDotLR:setTopBottom( false, false, 39, 47 )
	CenterDotLR:setScale( 0.7 )
	self:addElement( CenterDotLR )
	self.CenterDotLR = CenterDotLR
	
	local CenterDotR = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	CenterDotR:setLeftRight( false, false, 144.88, 152.88 )
	CenterDotR:setTopBottom( false, false, -37.5, -29.5 )
	CenterDotR:setScale( 0.7 )
	self:addElement( CenterDotR )
	self.CenterDotR = CenterDotR
	
	local CenterDotLL = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	CenterDotLL:setLeftRight( false, false, -145.13, -137.13 )
	CenterDotLL:setTopBottom( false, false, 39, 47 )
	CenterDotLL:setScale( 0.7 )
	self:addElement( CenterDotLL )
	self.CenterDotLL = CenterDotLL
	
	local CenterDotL = CoD.outofbounds_dotblinkwidget.new( f1_local1, controller )
	CenterDotL:setLeftRight( false, false, -145.13, -137.13 )
	CenterDotL:setTopBottom( false, false, -37.5, -29.5 )
	CenterDotL:setScale( 0.7 )
	self:addElement( CenterDotL )
	self.CenterDotL = CenterDotL
	
	local DniWipeCenterAngledLines = CoD.DniWipe_CenterAngledBlurLines.new( f1_local1, controller )
	DniWipeCenterAngledLines:setLeftRight( true, false, 0, 1280 )
	DniWipeCenterAngledLines:setTopBottom( true, false, 0, 720 )
	self:addElement( DniWipeCenterAngledLines )
	self.DniWipeCenterAngledLines = DniWipeCenterAngledLines
	
	local DniWipeCenterAngledBlurLines = CoD.DniWipe_CenterAngledLines.new( f1_local1, controller )
	DniWipeCenterAngledBlurLines:setLeftRight( true, false, 0, 1280 )
	DniWipeCenterAngledBlurLines:setTopBottom( true, false, 0, 720 )
	DniWipeCenterAngledBlurLines:setScale( 1.5 )
	self:addElement( DniWipeCenterAngledBlurLines )
	self.DniWipeCenterAngledBlurLines = DniWipeCenterAngledBlurLines
	
	local DniWipeCircleSpinWidget = CoD.DniWipe_CircleSpinWidget.new( f1_local1, controller )
	DniWipeCircleSpinWidget:setLeftRight( true, false, 0, 1280 )
	DniWipeCircleSpinWidget:setTopBottom( true, false, 0, 720 )
	DniWipeCircleSpinWidget:setRGB( 0.8, 0.95, 0.97 )
	self:addElement( DniWipeCircleSpinWidget )
	self.DniWipeCircleSpinWidget = DniWipeCircleSpinWidget
	
	local DniWipeDottedCircleWidget0 = CoD.DniWipe_DottedCircleWidget.new( f1_local1, controller )
	DniWipeDottedCircleWidget0:setLeftRight( true, false, 0, 1280 )
	DniWipeDottedCircleWidget0:setTopBottom( true, false, 0, 720 )
	self:addElement( DniWipeDottedCircleWidget0 )
	self.DniWipeDottedCircleWidget0 = DniWipeDottedCircleWidget0
	
	local DniWipePurgingTextWidget = CoD.DniWipe_PurgingTextWidget.new( f1_local1, controller )
	DniWipePurgingTextWidget:setLeftRight( true, false, 526.56, 757.56 )
	DniWipePurgingTextWidget:setTopBottom( true, false, 340.67, 389.33 )
	self:addElement( DniWipePurgingTextWidget )
	self.DniWipePurgingTextWidget = DniWipePurgingTextWidget
	
	local DniWipeDniTextWidget = CoD.DniWipe_DniTextWidget.new( f1_local1, controller )
	DniWipeDniTextWidget:setLeftRight( true, false, 532.1, 755 )
	DniWipeDniTextWidget:setTopBottom( true, false, 322, 336 )
	self:addElement( DniWipeDniTextWidget )
	self.DniWipeDniTextWidget = DniWipeDniTextWidget
	
	local DniWipeOuterIrisBlink0 = CoD.DniWipe_OuterIrisBlink.new( f1_local1, controller )
	DniWipeOuterIrisBlink0:setLeftRight( true, false, 0, 1280 )
	DniWipeOuterIrisBlink0:setTopBottom( true, false, 0, 720 )
	self:addElement( DniWipeOuterIrisBlink0 )
	self.DniWipeOuterIrisBlink0 = DniWipeOuterIrisBlink0
	
	local Numbers = CoD.PrematchCountdown_NumbersInternal.new( f1_local1, controller )
	Numbers:setLeftRight( false, false, -60, 60 )
	Numbers:setTopBottom( false, false, -30, 40 )
	Numbers:setAlpha( 0 )
	Numbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Numbers:setShaderVector( 0, 0.2, 0, 0, 0 )
	Numbers:setShaderVector( 1, 7.72, 0, 0, 0 )
	Numbers:setShaderVector( 2, -50, -100, 0, 0 )
	Numbers:setShaderVector( 3, 6.89, 9.87, 0, 0 )
	Numbers:setShaderVector( 4, 0, 0.02, 0, 0 )
	Numbers.Numbers:setText( Engine.Localize( "3" ) )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, false, -20.69, 24.81 )
	TextBox0:setTopBottom( false, false, 50, 64 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.TextBox0:linkToElementModel( self, "percentageVisible", true, function ( model )
		local percentageVisible = Engine.GetModelValue( model )
		if percentageVisible then
			TextBox0:setAlpha( percentageVisible )
		end
	end )
	self.TextBox0:linkToElementModel( self, "percentage", true, function ( model )
		local percentage = Engine.GetModelValue( model )
		if percentage then
			TextBox0:setText( NumberAsPercentRounded( percentage ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				local f4_local0 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setLeftRight( true, false, 506.63, 780.47 )
					f5_arg0:setTopBottom( true, false, 399.5, 404.5 )
					f5_arg0:setAlpha( 0.3 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackFrame:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
				BlackFrame:setLeftRight( true, false, 506.63, 780.47 )
				BlackFrame:setTopBottom( true, false, 399.5, 404.5 )
				BlackFrame:setAlpha( 0 )
				BlackFrame:registerEventHandler( "transition_complete_keyframe", f4_local0 )
				local f4_local1 = function ( f6_arg0, f6_arg1 )
					if not f6_arg1.interrupted then
						f6_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
					end
					f6_arg0:setLeftRight( true, false, 510.63, 775.5 )
					f6_arg0:setTopBottom( true, false, 401.5, 403 )
					f6_arg0:setAlpha( 1 )
					if f6_arg1.interrupted then
						self.clipFinished( f6_arg0, f6_arg1 )
					else
						f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GenericUpdateBar0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
				GenericUpdateBar0:setLeftRight( true, false, 510.63, 775.5 )
				GenericUpdateBar0:setTopBottom( true, false, 401.5, 403 )
				GenericUpdateBar0:setAlpha( 0 )
				GenericUpdateBar0:registerEventHandler( "transition_complete_keyframe", f4_local1 )
				local IrisOutterEdgeFrame2 = function ( IrisOutterEdge, event )
					if not event.interrupted then
						IrisOutterEdge:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Bounce )
					end
					IrisOutterEdge:setLeftRight( true, false, 0, 272 )
					IrisOutterEdge:setTopBottom( true, true, 0, 0 )
					IrisOutterEdge:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdge, event )
					else
						IrisOutterEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdge:completeAnimation()
				self.IrisOutterEdge:setLeftRight( true, false, 0, 272 )
				self.IrisOutterEdge:setTopBottom( true, true, 0, 0 )
				self.IrisOutterEdge:setAlpha( 0 )
				IrisOutterEdgeFrame2( IrisOutterEdge, {} )
				local IrisOutterEdgeRFrame2 = function ( IrisOutterEdgeR, event )
					if not event.interrupted then
						IrisOutterEdgeR:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Bounce )
					end
					IrisOutterEdgeR:setLeftRight( false, true, -272, 0 )
					IrisOutterEdgeR:setTopBottom( true, true, 0, 0 )
					IrisOutterEdgeR:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdgeR, event )
					else
						IrisOutterEdgeR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdgeR:completeAnimation()
				self.IrisOutterEdgeR:setLeftRight( false, true, -272, 0 )
				self.IrisOutterEdgeR:setTopBottom( true, true, 0, 0 )
				self.IrisOutterEdgeR:setAlpha( 0 )
				IrisOutterEdgeRFrame2( IrisOutterEdgeR, {} )
				local OutterThinInternal0Frame2 = function ( OutterThinInternal0, event )
					if not event.interrupted then
						OutterThinInternal0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					OutterThinInternal0:setLeftRight( true, false, -69, 1354 )
					OutterThinInternal0:setTopBottom( true, false, -142.5, 800.5 )
					OutterThinInternal0:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( OutterThinInternal0, event )
					else
						OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterThinInternal0:completeAnimation()
				self.OutterThinInternal0:setLeftRight( true, false, -69, 1354 )
				self.OutterThinInternal0:setTopBottom( true, false, -142.5, 800.5 )
				self.OutterThinInternal0:setAlpha( 0 )
				OutterThinInternal0Frame2( OutterThinInternal0, {} )
				local DniWipeLinesSideFrame2 = function ( DniWipeLinesSide, event )
					if not event.interrupted then
						DniWipeLinesSide:beginAnimation( "keyframe", 259, true, false, CoD.TweenType.Bounce )
					end
					DniWipeLinesSide:setLeftRight( true, false, 645.5, 1226.5 )
					DniWipeLinesSide:setTopBottom( true, false, 293, 322 )
					DniWipeLinesSide:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DniWipeLinesSide, event )
					else
						DniWipeLinesSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeLinesSide:completeAnimation()
				self.DniWipeLinesSide:setLeftRight( true, false, 645.5, 1226.5 )
				self.DniWipeLinesSide:setTopBottom( true, false, 293, 322 )
				self.DniWipeLinesSide:setAlpha( 0 )
				DniWipeLinesSideFrame2( DniWipeLinesSide, {} )
				local f4_local6 = function ( f11_arg0, f11_arg1 )
					if not f11_arg1.interrupted then
						f11_arg0:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
					end
					f11_arg0:setLeftRight( true, false, 645.06, 1226.5 )
					f11_arg0:setTopBottom( true, false, 401.5, 430.5 )
					f11_arg0:setAlpha( 1 )
					if f11_arg1.interrupted then
						self.clipFinished( f11_arg0, f11_arg1 )
					else
						f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeLinesSide0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				DniWipeLinesSide0:setLeftRight( true, false, 645.06, 1226.5 )
				DniWipeLinesSide0:setTopBottom( true, false, 401.5, 430.5 )
				DniWipeLinesSide0:setAlpha( 0 )
				DniWipeLinesSide0:registerEventHandler( "transition_complete_keyframe", f4_local6 )
				local f4_local7 = function ( f12_arg0, f12_arg1 )
					if not f12_arg1.interrupted then
						f12_arg0:beginAnimation( "keyframe", 350, true, false, CoD.TweenType.Bounce )
					end
					f12_arg0:setLeftRight( true, false, 41.5, 640 )
					f12_arg0:setTopBottom( true, false, 293, 322 )
					f12_arg0:setAlpha( 1 )
					if f12_arg1.interrupted then
						self.clipFinished( f12_arg0, f12_arg1 )
					else
						f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeLinesSide1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				DniWipeLinesSide1:setLeftRight( true, false, 41.5, 640 )
				DniWipeLinesSide1:setTopBottom( true, false, 293, 322 )
				DniWipeLinesSide1:setAlpha( 0 )
				DniWipeLinesSide1:registerEventHandler( "transition_complete_keyframe", f4_local7 )
				local f4_local8 = function ( f13_arg0, f13_arg1 )
					if not f13_arg1.interrupted then
						f13_arg0:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Bounce )
					end
					f13_arg0:setLeftRight( true, false, 41.5, 642.5 )
					f13_arg0:setTopBottom( true, false, 401.5, 430.5 )
					f13_arg0:setAlpha( 1 )
					if f13_arg1.interrupted then
						self.clipFinished( f13_arg0, f13_arg1 )
					else
						f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeLinesSide2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				DniWipeLinesSide2:setLeftRight( true, false, 41.5, 642.5 )
				DniWipeLinesSide2:setTopBottom( true, false, 401.5, 430.5 )
				DniWipeLinesSide2:setAlpha( 0 )
				DniWipeLinesSide2:registerEventHandler( "transition_complete_keyframe", f4_local8 )
				local f4_local9 = function ( f14_arg0, f14_arg1 )
					if not f14_arg1.interrupted then
						f14_arg0:beginAnimation( "keyframe", 160, true, false, CoD.TweenType.Bounce )
					end
					f14_arg0:setLeftRight( false, false, 310.5, 318.5 )
					f14_arg0:setTopBottom( false, false, -237, -229 )
					f14_arg0:setAlpha( 1 )
					if f14_arg1.interrupted then
						self.clipFinished( f14_arg0, f14_arg1 )
					else
						f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dotUL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				dotUL:setLeftRight( false, false, 310.5, 318.5 )
				dotUL:setTopBottom( false, false, -237, -229 )
				dotUL:setAlpha( 0 )
				dotUL:registerEventHandler( "transition_complete_keyframe", f4_local9 )
				local f4_local10 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 160, true, false, CoD.TweenType.Bounce )
					end
					f15_arg0:setLeftRight( false, false, -308.5, -300.5 )
					f15_arg0:setTopBottom( false, false, -237, -229 )
					f15_arg0:setAlpha( 1 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dotUR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				dotUR:setLeftRight( false, false, -308.5, -300.5 )
				dotUR:setTopBottom( false, false, -237, -229 )
				dotUR:setAlpha( 0 )
				dotUR:registerEventHandler( "transition_complete_keyframe", f4_local10 )
				local f4_local11 = function ( f16_arg0, f16_arg1 )
					if not f16_arg1.interrupted then
						f16_arg0:beginAnimation( "keyframe", 170, true, false, CoD.TweenType.Bounce )
					end
					f16_arg0:setLeftRight( false, false, 310.5, 318.5 )
					f16_arg0:setTopBottom( false, false, 234, 242 )
					f16_arg0:setAlpha( 1 )
					if f16_arg1.interrupted then
						self.clipFinished( f16_arg0, f16_arg1 )
					else
						f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				outofboundsdotblinkwidget0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				outofboundsdotblinkwidget0:setLeftRight( false, false, 310.5, 318.5 )
				outofboundsdotblinkwidget0:setTopBottom( false, false, 234, 242 )
				outofboundsdotblinkwidget0:setAlpha( 0 )
				outofboundsdotblinkwidget0:registerEventHandler( "transition_complete_keyframe", f4_local11 )
				local f4_local12 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 170, true, false, CoD.TweenType.Bounce )
					end
					f17_arg0:setLeftRight( false, false, -308.5, -300.5 )
					f17_arg0:setTopBottom( false, false, 234, 242 )
					f17_arg0:setAlpha( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				outofboundsdotblinkwidget1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				outofboundsdotblinkwidget1:setLeftRight( false, false, -308.5, -300.5 )
				outofboundsdotblinkwidget1:setTopBottom( false, false, 234, 242 )
				outofboundsdotblinkwidget1:setAlpha( 0 )
				outofboundsdotblinkwidget1:registerEventHandler( "transition_complete_keyframe", f4_local12 )
				local f4_local13 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Bounce )
					end
					f18_arg0:setLeftRight( true, false, 616.06, 668.06 )
					f18_arg0:setTopBottom( true, false, 428, 485 )
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DNImod:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				DNImod:setLeftRight( true, false, 616.06, 668.06 )
				DNImod:setTopBottom( true, false, 428, 485 )
				DNImod:setAlpha( 0 )
				DNImod:registerEventHandler( "transition_complete_keyframe", f4_local13 )
				local f4_local14 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					f19_arg0:setLeftRight( false, false, 144.88, 152.88 )
					f19_arg0:setTopBottom( false, false, 39, 47 )
					f19_arg0:setAlpha( 1 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterDotLR:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
				CenterDotLR:setLeftRight( false, false, 144.88, 152.88 )
				CenterDotLR:setTopBottom( false, false, 39, 47 )
				CenterDotLR:setAlpha( 0 )
				CenterDotLR:registerEventHandler( "transition_complete_keyframe", f4_local14 )
				local f4_local15 = function ( f20_arg0, f20_arg1 )
					if not f20_arg1.interrupted then
						f20_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					f20_arg0:setLeftRight( false, false, 144.88, 152.88 )
					f20_arg0:setTopBottom( false, false, -37.5, -29.5 )
					f20_arg0:setAlpha( 1 )
					if f20_arg1.interrupted then
						self.clipFinished( f20_arg0, f20_arg1 )
					else
						f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterDotR:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				CenterDotR:setLeftRight( false, false, 144.88, 152.88 )
				CenterDotR:setTopBottom( false, false, -37.5, -29.5 )
				CenterDotR:setAlpha( 0 )
				CenterDotR:registerEventHandler( "transition_complete_keyframe", f4_local15 )
				local f4_local16 = function ( f21_arg0, f21_arg1 )
					if not f21_arg1.interrupted then
						f21_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					f21_arg0:setLeftRight( false, false, -145.13, -137.13 )
					f21_arg0:setTopBottom( false, false, 39, 47 )
					f21_arg0:setAlpha( 1 )
					if f21_arg1.interrupted then
						self.clipFinished( f21_arg0, f21_arg1 )
					else
						f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterDotLL:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
				CenterDotLL:setLeftRight( false, false, -145.13, -137.13 )
				CenterDotLL:setTopBottom( false, false, 39, 47 )
				CenterDotLL:setAlpha( 0 )
				CenterDotLL:registerEventHandler( "transition_complete_keyframe", f4_local16 )
				local f4_local17 = function ( f22_arg0, f22_arg1 )
					if not f22_arg1.interrupted then
						f22_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					f22_arg0:setLeftRight( false, false, -145.13, -137.13 )
					f22_arg0:setTopBottom( false, false, -37.5, -29.5 )
					f22_arg0:setAlpha( 1 )
					if f22_arg1.interrupted then
						self.clipFinished( f22_arg0, f22_arg1 )
					else
						f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterDotL:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				CenterDotL:setLeftRight( false, false, -145.13, -137.13 )
				CenterDotL:setTopBottom( false, false, -37.5, -29.5 )
				CenterDotL:setAlpha( 0 )
				CenterDotL:registerEventHandler( "transition_complete_keyframe", f4_local17 )
				local f4_local18 = function ( f23_arg0, f23_arg1 )
					if not f23_arg1.interrupted then
						f23_arg0:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Bounce )
					end
					f23_arg0:setLeftRight( true, false, 0, 1280 )
					f23_arg0:setTopBottom( true, false, 0, 720 )
					f23_arg0:setAlpha( 1 )
					if f23_arg1.interrupted then
						self.clipFinished( f23_arg0, f23_arg1 )
					else
						f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeCenterAngledLines:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				DniWipeCenterAngledLines:setLeftRight( true, false, 0, 1280 )
				DniWipeCenterAngledLines:setTopBottom( true, false, 0, 720 )
				DniWipeCenterAngledLines:setAlpha( 0 )
				DniWipeCenterAngledLines:registerEventHandler( "transition_complete_keyframe", f4_local18 )
				local f4_local19 = function ( f24_arg0, f24_arg1 )
					if not f24_arg1.interrupted then
						f24_arg0:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Bounce )
					end
					f24_arg0:setLeftRight( true, false, 0, 1280 )
					f24_arg0:setTopBottom( true, false, 0, 720 )
					f24_arg0:setAlpha( 1 )
					if f24_arg1.interrupted then
						self.clipFinished( f24_arg0, f24_arg1 )
					else
						f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeCenterAngledBlurLines:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				DniWipeCenterAngledBlurLines:setLeftRight( true, false, 0, 1280 )
				DniWipeCenterAngledBlurLines:setTopBottom( true, false, 0, 720 )
				DniWipeCenterAngledBlurLines:setAlpha( 0 )
				DniWipeCenterAngledBlurLines:registerEventHandler( "transition_complete_keyframe", f4_local19 )
				local f4_local20 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
					end
					f25_arg0:setLeftRight( true, false, 0, 1280 )
					f25_arg0:setTopBottom( true, false, 0, 720 )
					f25_arg0:setAlpha( 1 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeCircleSpinWidget:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				DniWipeCircleSpinWidget:setLeftRight( true, false, 0, 1280 )
				DniWipeCircleSpinWidget:setTopBottom( true, false, 0, 720 )
				DniWipeCircleSpinWidget:setAlpha( 0 )
				DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", f4_local20 )
				local f4_local21 = function ( f26_arg0, f26_arg1 )
					if not f26_arg1.interrupted then
						f26_arg0:beginAnimation( "keyframe", 230, true, false, CoD.TweenType.Bounce )
					end
					f26_arg0:setLeftRight( true, false, 0, 1280 )
					f26_arg0:setTopBottom( true, false, 0, 720 )
					f26_arg0:setAlpha( 1 )
					if f26_arg1.interrupted then
						self.clipFinished( f26_arg0, f26_arg1 )
					else
						f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeDottedCircleWidget0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				DniWipeDottedCircleWidget0:setLeftRight( true, false, 0, 1280 )
				DniWipeDottedCircleWidget0:setTopBottom( true, false, 0, 720 )
				DniWipeDottedCircleWidget0:setAlpha( 0 )
				DniWipeDottedCircleWidget0:registerEventHandler( "transition_complete_keyframe", f4_local21 )
				local f4_local22 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							if not f29_arg1.interrupted then
								f29_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							end
							f29_arg0:setLeftRight( true, false, 528, 751 )
							f29_arg0:setTopBottom( true, false, 343.35, 392 )
							f29_arg0:setRGB( 0.85, 0.97, 1 )
							f29_arg0:setAlpha( 1 )
							f29_arg0:setScale( 1 )
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
							f28_arg0:setAlpha( 0.32 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 1 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				DniWipePurgingTextWidget:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
				DniWipePurgingTextWidget:setLeftRight( true, false, 528, 751 )
				DniWipePurgingTextWidget:setTopBottom( true, false, 343.35, 392 )
				DniWipePurgingTextWidget:setRGB( 0.85, 0.97, 1 )
				DniWipePurgingTextWidget:setAlpha( 0 )
				DniWipePurgingTextWidget:setScale( 1 )
				DniWipePurgingTextWidget:registerEventHandler( "transition_complete_keyframe", f4_local22 )
				local f4_local23 = function ( f30_arg0, f30_arg1 )
					local f30_local0 = function ( f31_arg0, f31_arg1 )
						local f31_local0 = function ( f32_arg0, f32_arg1 )
							if not f32_arg1.interrupted then
								f32_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							end
							f32_arg0:setLeftRight( true, false, 526, 754 )
							f32_arg0:setTopBottom( true, false, 322, 336 )
							f32_arg0:setAlpha( 1 )
							if f32_arg1.interrupted then
								self.clipFinished( f32_arg0, f32_arg1 )
							else
								f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f31_arg1.interrupted then
							f31_local0( f31_arg0, f31_arg1 )
							return 
						else
							f31_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							f31_arg0:setAlpha( 0.4 )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
						end
					end
					
					if f30_arg1.interrupted then
						f30_local0( f30_arg0, f30_arg1 )
						return 
					else
						f30_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						f30_arg0:setAlpha( 1 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
				end
				
				DniWipeDniTextWidget:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				DniWipeDniTextWidget:setLeftRight( true, false, 526, 754 )
				DniWipeDniTextWidget:setTopBottom( true, false, 322, 336 )
				DniWipeDniTextWidget:setAlpha( 0 )
				DniWipeDniTextWidget:registerEventHandler( "transition_complete_keyframe", f4_local23 )
				local f4_local24 = function ( f33_arg0, f33_arg1 )
					if not f33_arg1.interrupted then
						f33_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
					end
					f33_arg0:setLeftRight( true, false, 0, 1280 )
					f33_arg0:setTopBottom( true, false, 0, 720 )
					f33_arg0:setAlpha( 1 )
					if f33_arg1.interrupted then
						self.clipFinished( f33_arg0, f33_arg1 )
					else
						f33_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DniWipeOuterIrisBlink0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				DniWipeOuterIrisBlink0:setLeftRight( true, false, 0, 1280 )
				DniWipeOuterIrisBlink0:setTopBottom( true, false, 0, 720 )
				DniWipeOuterIrisBlink0:setAlpha( 0 )
				DniWipeOuterIrisBlink0:registerEventHandler( "transition_complete_keyframe", f4_local24 )
				local f4_local25 = function ( f34_arg0, f34_arg1 )
					if not f34_arg1.interrupted then
						f34_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					if f34_arg1.interrupted then
						self.clipFinished( f34_arg0, f34_arg1 )
					else
						f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				TextBox0:registerEventHandler( "transition_complete_keyframe", f4_local25 )
			end
		},
		Die = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				BlackFrame:completeAnimation()
				self.BlackFrame:setAlpha( 0 )
				self.clipFinished( BlackFrame, {} )
				GenericUpdateBar0:completeAnimation()
				self.GenericUpdateBar0:setAlpha( 0 )
				self.clipFinished( GenericUpdateBar0, {} )
				IrisOutterEdge:completeAnimation()
				self.IrisOutterEdge:setAlpha( 0 )
				self.clipFinished( IrisOutterEdge, {} )
				IrisOutterEdgeR:completeAnimation()
				self.IrisOutterEdgeR:setAlpha( 0 )
				self.clipFinished( IrisOutterEdgeR, {} )
				OutterThinInternal0:completeAnimation()
				self.OutterThinInternal0:setAlpha( 0 )
				self.clipFinished( OutterThinInternal0, {} )
				DniWipeLinesSide:completeAnimation()
				self.DniWipeLinesSide:setAlpha( 0 )
				self.clipFinished( DniWipeLinesSide, {} )
				DniWipeLinesSide0:completeAnimation()
				self.DniWipeLinesSide0:setAlpha( 0 )
				self.clipFinished( DniWipeLinesSide0, {} )
				DniWipeLinesSide1:completeAnimation()
				self.DniWipeLinesSide1:setAlpha( 0 )
				self.clipFinished( DniWipeLinesSide1, {} )
				DniWipeLinesSide2:completeAnimation()
				self.DniWipeLinesSide2:setAlpha( 0 )
				self.clipFinished( DniWipeLinesSide2, {} )
				dotUL:completeAnimation()
				self.dotUL:setAlpha( 0 )
				self.clipFinished( dotUL, {} )
				dotUR:completeAnimation()
				self.dotUR:setAlpha( 0 )
				self.clipFinished( dotUR, {} )
				outofboundsdotblinkwidget0:completeAnimation()
				self.outofboundsdotblinkwidget0:setAlpha( 0 )
				self.clipFinished( outofboundsdotblinkwidget0, {} )
				outofboundsdotblinkwidget1:completeAnimation()
				self.outofboundsdotblinkwidget1:setAlpha( 0 )
				self.clipFinished( outofboundsdotblinkwidget1, {} )
				DNImod:completeAnimation()
				self.DNImod:setAlpha( 0 )
				self.clipFinished( DNImod, {} )
				CenterDotLR:completeAnimation()
				self.CenterDotLR:setAlpha( 0 )
				self.clipFinished( CenterDotLR, {} )
				CenterDotR:completeAnimation()
				self.CenterDotR:setAlpha( 0 )
				self.clipFinished( CenterDotR, {} )
				CenterDotLL:completeAnimation()
				self.CenterDotLL:setAlpha( 0 )
				self.clipFinished( CenterDotLL, {} )
				CenterDotL:completeAnimation()
				self.CenterDotL:setAlpha( 0 )
				self.clipFinished( CenterDotL, {} )
				DniWipeCenterAngledLines:completeAnimation()
				self.DniWipeCenterAngledLines:setAlpha( 0 )
				self.clipFinished( DniWipeCenterAngledLines, {} )
				DniWipeCenterAngledBlurLines:completeAnimation()
				self.DniWipeCenterAngledBlurLines:setAlpha( 0 )
				self.clipFinished( DniWipeCenterAngledBlurLines, {} )
				local DniWipeCircleSpinWidgetFrame2 = function ( DniWipeCircleSpinWidget, event )
					local DniWipeCircleSpinWidgetFrame3 = function ( DniWipeCircleSpinWidget, event )
						local DniWipeCircleSpinWidgetFrame4 = function ( DniWipeCircleSpinWidget, event )
							local DniWipeCircleSpinWidgetFrame5 = function ( DniWipeCircleSpinWidget, event )
								local DniWipeCircleSpinWidgetFrame6 = function ( DniWipeCircleSpinWidget, event )
									if not event.interrupted then
										DniWipeCircleSpinWidget:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
									end
									DniWipeCircleSpinWidget:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( DniWipeCircleSpinWidget, event )
									else
										DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									DniWipeCircleSpinWidgetFrame6( DniWipeCircleSpinWidget, event )
									return 
								else
									DniWipeCircleSpinWidget:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
									DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", DniWipeCircleSpinWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								DniWipeCircleSpinWidgetFrame5( DniWipeCircleSpinWidget, event )
								return 
							else
								DniWipeCircleSpinWidget:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								DniWipeCircleSpinWidget:setAlpha( 0.4 )
								DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", DniWipeCircleSpinWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							DniWipeCircleSpinWidgetFrame4( DniWipeCircleSpinWidget, event )
							return 
						else
							DniWipeCircleSpinWidget:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							DniWipeCircleSpinWidget:setAlpha( 0.86 )
							DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", DniWipeCircleSpinWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						DniWipeCircleSpinWidgetFrame3( DniWipeCircleSpinWidget, event )
						return 
					else
						DniWipeCircleSpinWidget:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						DniWipeCircleSpinWidget:registerEventHandler( "transition_complete_keyframe", DniWipeCircleSpinWidgetFrame3 )
					end
				end
				
				DniWipeCircleSpinWidget:completeAnimation()
				self.DniWipeCircleSpinWidget:setAlpha( 0 )
				DniWipeCircleSpinWidgetFrame2( DniWipeCircleSpinWidget, {} )
				local DniWipeDottedCircleWidget0Frame2 = function ( DniWipeDottedCircleWidget0, event )
					local DniWipeDottedCircleWidget0Frame3 = function ( DniWipeDottedCircleWidget0, event )
						if not event.interrupted then
							DniWipeDottedCircleWidget0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						DniWipeDottedCircleWidget0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( DniWipeDottedCircleWidget0, event )
						else
							DniWipeDottedCircleWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DniWipeDottedCircleWidget0Frame3( DniWipeDottedCircleWidget0, event )
						return 
					else
						DniWipeDottedCircleWidget0:beginAnimation( "keyframe", 2529, false, false, CoD.TweenType.Linear )
						DniWipeDottedCircleWidget0:registerEventHandler( "transition_complete_keyframe", DniWipeDottedCircleWidget0Frame3 )
					end
				end
				
				DniWipeDottedCircleWidget0:completeAnimation()
				self.DniWipeDottedCircleWidget0:setAlpha( 1 )
				DniWipeDottedCircleWidget0Frame2( DniWipeDottedCircleWidget0, {} )
				DniWipePurgingTextWidget:completeAnimation()
				self.DniWipePurgingTextWidget:setAlpha( 0 )
				self.clipFinished( DniWipePurgingTextWidget, {} )
				DniWipeDniTextWidget:completeAnimation()
				self.DniWipeDniTextWidget:setAlpha( 0 )
				self.clipFinished( DniWipeDniTextWidget, {} )
				DniWipeOuterIrisBlink0:completeAnimation()
				self.DniWipeOuterIrisBlink0:setAlpha( 0 )
				self.clipFinished( DniWipeOuterIrisBlink0, {} )
				local NumbersFrame2 = function ( Numbers, event )
					local NumbersFrame3 = function ( Numbers, event )
						local NumbersFrame4 = function ( Numbers, event )
							local NumbersFrame5 = function ( Numbers, event )
								local NumbersFrame6 = function ( Numbers, event )
									local NumbersFrame7 = function ( Numbers, event )
										if not event.interrupted then
											Numbers:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
											Numbers.Numbers:beginAnimation( "subkeyframe", 789, false, false, CoD.TweenType.Linear )
										end
										Numbers:setLeftRight( false, false, -60, 60 )
										Numbers:setTopBottom( false, false, -24, 40 )
										Numbers:setAlpha( 0 )
										Numbers.Numbers:setText( Engine.Localize( "1" ) )
										if event.interrupted then
											self.clipFinished( Numbers, event )
										else
											Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										NumbersFrame7( Numbers, event )
										return 
									else
										Numbers:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
										Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame7 )
									end
								end
								
								if event.interrupted then
									NumbersFrame6( Numbers, event )
									return 
								else
									Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Numbers.Numbers:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									Numbers.Numbers:setText( Engine.Localize( "1" ) )
									Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame6 )
								end
							end
							
							if event.interrupted then
								NumbersFrame5( Numbers, event )
								return 
							else
								Numbers:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
								Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame5 )
							end
						end
						
						if event.interrupted then
							NumbersFrame4( Numbers, event )
							return 
						else
							Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Numbers.Numbers:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							Numbers.Numbers:setText( Engine.Localize( "2" ) )
							Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame4 )
						end
					end
					
					if event.interrupted then
						NumbersFrame3( Numbers, event )
						return 
					else
						Numbers:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame3 )
					end
				end
				
				Numbers:completeAnimation()
				Numbers.Numbers:completeAnimation()
				self.Numbers:setLeftRight( false, false, -60, 60 )
				self.Numbers:setTopBottom( false, false, -24, 40 )
				self.Numbers:setAlpha( 1 )
				self.Numbers.Numbers:setText( Engine.Localize( "3" ) )
				NumbersFrame2( Numbers, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Die",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "Die", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "Die", true, function ( model )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Die"
		} )
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericUpdateBar0:close()
		element.OutterThinInternal0:close()
		element.DniWipeLinesSide:close()
		element.DniWipeLinesSide0:close()
		element.DniWipeLinesSide1:close()
		element.DniWipeLinesSide2:close()
		element.dotUL:close()
		element.dotUR:close()
		element.outofboundsdotblinkwidget0:close()
		element.outofboundsdotblinkwidget1:close()
		element.DNImod:close()
		element.CenterDotLR:close()
		element.CenterDotR:close()
		element.CenterDotLL:close()
		element.CenterDotL:close()
		element.DniWipeCenterAngledLines:close()
		element.DniWipeCenterAngledBlurLines:close()
		element.DniWipeCircleSpinWidget:close()
		element.DniWipeDottedCircleWidget0:close()
		element.DniWipePurgingTextWidget:close()
		element.DniWipeDniTextWidget:close()
		element.DniWipeOuterIrisBlink0:close()
		element.Numbers:close()
		element.TextBox0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DniWipe.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

