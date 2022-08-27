-- 5fb8675e72f0388560f0a01f309ce19c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherCircleAnim" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherBackBox" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherLine" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherMeters" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherSides" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherMessageArea" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherDistance" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherData" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherMessage" )

CoD.SpikeLauncher = InheritFrom( LUI.UIElement )
CoD.SpikeLauncher.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncher )
	self.id = "SpikeLauncher"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 326 )
	self:setTopBottom( true, false, 0, 268 )
	self.anyChildUsesUpdateState = true
	
	local VignetteState1 = LUI.UIImage.new()
	VignetteState1:setLeftRight( true, false, 89.78, 233.78 )
	VignetteState1:setTopBottom( true, false, 56.17, 200.17 )
	VignetteState1:setAlpha( 0 )
	VignetteState1:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_backvignettemultiplystate1" ) )
	VignetteState1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( VignetteState1 )
	self.VignetteState1 = VignetteState1
	
	local VignetteState2 = LUI.UIImage.new()
	VignetteState2:setLeftRight( true, false, 31, 295 )
	VignetteState2:setTopBottom( true, false, 36, 225.83 )
	VignetteState2:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_backvignettemultiplystate2" ) )
	VignetteState2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( VignetteState2 )
	self.VignetteState2 = VignetteState2
	
	local VignetteState3 = LUI.UIImage.new()
	VignetteState3:setLeftRight( true, false, 0, 400 )
	VignetteState3:setTopBottom( true, false, -87.39, 336.61 )
	VignetteState3:setAlpha( 0 )
	VignetteState3:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_backvignettemultiplystate3" ) )
	VignetteState3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( VignetteState3 )
	self.VignetteState3 = VignetteState3
	
	local CircleAnim = CoD.SpikeLauncherCircleAnim.new( menu, controller )
	CircleAnim:setLeftRight( true, false, 38.11, 286.11 )
	CircleAnim:setTopBottom( true, false, 2.33, 250.33 )
	CircleAnim:setAlpha( 0.32 )
	CircleAnim:setZoom( -150 )
	self:addElement( CircleAnim )
	self.CircleAnim = CircleAnim
	
	local BackBox = CoD.SpikeLauncherBackBox.new( menu, controller )
	BackBox:setLeftRight( true, false, 136.86, 187.38 )
	BackBox:setTopBottom( true, false, 93.83, 158.83 )
	BackBox:setAlpha( 0.64 )
	BackBox:setZoom( -20 )
	self:addElement( BackBox )
	self.BackBox = BackBox
	
	local LargeTriangle = LUI.UIImage.new()
	LargeTriangle:setLeftRight( true, false, 61, 264.95 )
	LargeTriangle:setTopBottom( true, false, 71.89, 238.91 )
	LargeTriangle:setAlpha( 0 )
	LargeTriangle:setZoom( -50 )
	LargeTriangle:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_stroketriangle" ) )
	LargeTriangle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LargeTriangle )
	self.LargeTriangle = LargeTriangle
	
	local TriangleTop = LUI.UIImage.new()
	TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
	TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
	TriangleTop:setRGB( 1, 0.95, 0.9 )
	TriangleTop:setZRot( 180 )
	TriangleTop:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framearrowtop" ) )
	TriangleTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TriangleTop )
	self.TriangleTop = TriangleTop
	
	local FrameTop = LUI.UIImage.new()
	FrameTop:setLeftRight( true, false, 135.95, 188.28 )
	FrameTop:setTopBottom( true, false, 87.84, 104.16 )
	FrameTop:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_frametop" ) )
	FrameTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local IconWeak = LUI.UIImage.new()
	IconWeak:setLeftRight( true, false, 141.61, 181.94 )
	IconWeak:setTopBottom( true, false, 102.17, 151.84 )
	IconWeak:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_iconstate1" ) )
	IconWeak:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconWeak )
	self.IconWeak = IconWeak
	
	local iconDestroy = LUI.UIImage.new()
	iconDestroy:setLeftRight( true, false, 141.61, 181.94 )
	iconDestroy:setTopBottom( true, false, 102.17, 151.84 )
	iconDestroy:setAlpha( 0 )
	iconDestroy:setYRot( -90 )
	iconDestroy:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_iconstate2" ) )
	iconDestroy:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( iconDestroy )
	self.iconDestroy = iconDestroy
	
	local FrameSide = LUI.UIImage.new()
	FrameSide:setLeftRight( true, false, 128, 133 )
	FrameSide:setTopBottom( true, false, 106.5, 146.83 )
	FrameSide:setAlpha( 0 )
	FrameSide:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolsideoutter" ) )
	FrameSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameSide )
	self.FrameSide = FrameSide
	
	local SpikeLauncherLine = CoD.SpikeLauncherLine.new( menu, controller )
	SpikeLauncherLine:setLeftRight( true, false, 141.61, 182.61 )
	SpikeLauncherLine:setTopBottom( true, false, 157.83, 265.83 )
	self:addElement( SpikeLauncherLine )
	self.SpikeLauncherLine = SpikeLauncherLine
	
	local Meters = CoD.SpikeLauncherMeters.new( menu, controller )
	Meters:setLeftRight( true, false, 73.5, 120.83 )
	Meters:setTopBottom( true, false, 0, 268.16 )
	Meters.MetersBase:setAlpha( 0 )
	Meters.MetersTop:setAlpha( 0 )
	self:addElement( Meters )
	self.Meters = Meters
	
	local DestroyLineTop = LUI.UIImage.new()
	DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
	DestroyLineTop:setTopBottom( true, false, 116.84, 120.17 )
	DestroyLineTop:setAlpha( 0 )
	DestroyLineTop:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolsidebasetop" ) )
	DestroyLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DestroyLineTop )
	self.DestroyLineTop = DestroyLineTop
	
	local DestroyLineBottom = LUI.UIImage.new()
	DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
	DestroyLineBottom:setTopBottom( true, false, 136, 132.84 )
	DestroyLineBottom:setAlpha( 0 )
	DestroyLineBottom:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolsidebasetop" ) )
	DestroyLineBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DestroyLineBottom )
	self.DestroyLineBottom = DestroyLineBottom
	
	local ArrowLeft = LUI.UIImage.new()
	ArrowLeft:setLeftRight( true, false, 122.03, 115.36 )
	ArrowLeft:setTopBottom( true, false, 119.66, 133 )
	ArrowLeft:setZRot( 180 )
	ArrowLeft:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framearrowside" ) )
	ArrowLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local Sides = CoD.SpikeLauncherSides.new( menu, controller )
	Sides:setLeftRight( true, false, 128, 195.85 )
	Sides:setTopBottom( true, false, 128.28, 129.71 )
	Sides:setAlpha( 0 )
	self:addElement( Sides )
	self.Sides = Sides
	
	local AreaText = CoD.SpikeLauncherMessageArea.new( menu, controller )
	AreaText:setLeftRight( true, false, 113.28, 210.28 )
	AreaText:setTopBottom( true, false, 96.84, 151.84 )
	AreaText:setAlpha( 0 )
	AreaText.AreaLbl:setText( Engine.Localize( "33" ) )
	self:addElement( AreaText )
	self.AreaText = AreaText
	
	local DistanceText = CoD.SpikeLauncherDistance.new( menu, controller )
	DistanceText:setLeftRight( true, false, 213.61, 265 )
	DistanceText:setTopBottom( true, false, 112.11, 124.61 )
	DistanceText:setAlpha( 0.12 )
	DistanceText.DistanceLbl:setText( Engine.Localize( "243" ) )
	self:addElement( DistanceText )
	self.DistanceText = DistanceText
	
	local DataText = CoD.SpikeLauncherData.new( menu, controller )
	DataText:setLeftRight( true, false, 75.92, 195.98 )
	DataText:setTopBottom( true, false, 146.83, 225.83 )
	DataText:setAlpha( 0 )
	self:addElement( DataText )
	self.DataText = DataText
	
	local MessageText = CoD.SpikeLauncherMessage.new( menu, controller )
	MessageText:setLeftRight( true, false, 206.5, 240.61 )
	MessageText:setTopBottom( true, false, 115.5, 140.83 )
	MessageText:setAlpha( 0 )
	MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
	MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
	MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
	MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local DataTextState2 = LUI.UIText.new()
	DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
	DataTextState2:setTopBottom( true, false, 139.64, 144.64 )
	DataTextState2:setAlpha( 0.64 )
	DataTextState2:setText( Engine.Localize( "//" ) )
	DataTextState2:setTTF( "fonts/UnitedSansRgMd.ttf" )
	DataTextState2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	DataTextState2:setShaderVector( 0, 0.02, 0.5, 0, 0 )
	DataTextState2:setShaderVector( 1, 0, 0, 0, 0 )
	DataTextState2:setShaderVector( 2, 0, 0, 0, 0 )
	DataTextState2:setShaderVector( 3, 0, 0, 0, 0 )
	DataTextState2:setShaderVector( 4, 0, 0, 0, 0 )
	DataTextState2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DataTextState2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DataTextState2 )
	self.DataTextState2 = DataTextState2
	
	local ArrowRight = LUI.UIImage.new()
	ArrowRight:setLeftRight( true, false, 199.71, 193.04 )
	ArrowRight:setTopBottom( true, false, 119.66, 133 )
	ArrowRight:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framearrowside" ) )
	ArrowRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		State1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 1 )
				self.clipFinished( VignetteState1, {} )
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 0 )
				self.clipFinished( VignetteState2, {} )
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 0 )
				self.clipFinished( VignetteState3, {} )
				CircleAnim:completeAnimation()
				self.CircleAnim:setAlpha( 0 )
				self.clipFinished( CircleAnim, {} )
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 161.78, 163 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 0 )
				self.clipFinished( BackBox, {} )
				TriangleTop:completeAnimation()
				self.TriangleTop:setRGB( 1, 1, 1 )
				self.clipFinished( TriangleTop, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 131.67, 125 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.clipFinished( ArrowLeft, {} )
				Sides:completeAnimation()
				self.Sides:setLeftRight( true, false, 128, 195.85 )
				self.Sides:setTopBottom( true, false, 129.16, 128.83 )
				self.Sides:setAlpha( 0 )
				self.clipFinished( Sides, {} )
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 113.91, 126.41 )
				self.DistanceText:setAlpha( 0 )
				self.clipFinished( DistanceText, {} )
				MessageText:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 228.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText:setAlpha( 0 )
				self.clipFinished( MessageText, {} )
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 130, 135 )
				self.DataTextState2:setAlpha( 0 )
				self.clipFinished( DataTextState2, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( true, false, 197.67, 191 )
				self.ArrowRight:setTopBottom( true, false, 119.66, 133 )
				self.ArrowRight:setAlpha( 1 )
				self.clipFinished( ArrowRight, {} )
			end,
			State2 = function ()
				self:setupElementClipCounter( 21 )
				local VignetteState1Frame2 = function ( VignetteState1, event )
					if not event.interrupted then
						VignetteState1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteState1, event )
					else
						VignetteState1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 1 )
				VignetteState1Frame2( VignetteState1, {} )
				local VignetteState2Frame2 = function ( VignetteState2, event )
					if not event.interrupted then
						VignetteState2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteState2, event )
					else
						VignetteState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 0 )
				VignetteState2Frame2( VignetteState2, {} )
				VignetteState3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				VignetteState3:setAlpha( 0 )
				VignetteState3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local CircleAnimFrame2 = function ( CircleAnim, event )
					if not event.interrupted then
						CircleAnim:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					CircleAnim:setAlpha( 0.5 )
					CircleAnim:setZoom( -150 )
					if event.interrupted then
						self.clipFinished( CircleAnim, event )
					else
						CircleAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleAnim:completeAnimation()
				self.CircleAnim:setAlpha( 0 )
				self.CircleAnim:setZoom( -150 )
				CircleAnimFrame2( CircleAnim, {} )
				local BackBoxFrame2 = function ( BackBox, event )
					if not event.interrupted then
						BackBox:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					BackBox:setLeftRight( true, false, 123, 200.94 )
					BackBox:setTopBottom( true, false, 93.83, 158.83 )
					BackBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BackBox, event )
					else
						BackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 161.78, 163 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 0 )
				BackBoxFrame2( BackBox, {} )
				LargeTriangle:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				LargeTriangle:setAlpha( 0 )
				LargeTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local TriangleTopFrame2 = function ( TriangleTop, event )
					if not event.interrupted then
						TriangleTop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
					TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
					TriangleTop:setRGB( 1, 0.55, 0.14 )
					TriangleTop:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( TriangleTop, event )
					else
						TriangleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TriangleTop:completeAnimation()
				self.TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
				self.TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
				self.TriangleTop:setRGB( 1, 1, 1 )
				self.TriangleTop:setZRot( 180 )
				TriangleTopFrame2( TriangleTop, {} )
				IconWeak:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				IconWeak:setAlpha( 1 )
				IconWeak:setYRot( 0 )
				IconWeak:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				iconDestroy:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				iconDestroy:setAlpha( 0 )
				iconDestroy:setYRot( -90 )
				iconDestroy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				FrameSide:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				FrameSide:setLeftRight( true, false, 128, 133 )
				FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				FrameSide:setAlpha( 0 )
				FrameSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Meters:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				Meters.MetersBase:beginAnimation( "subkeyframe", 1000, false, false, CoD.TweenType.Linear )
				Meters.MetersTop:beginAnimation( "subkeyframe", 1000, false, false, CoD.TweenType.Linear )
				Meters.MetersBase:setAlpha( 0 )
				Meters.MetersTop:setAlpha( 0 )
				Meters:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				DestroyLineTop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				DestroyLineTop:setTopBottom( true, false, 116.84, 120.17 )
				DestroyLineTop:setAlpha( 0 )
				DestroyLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				DestroyLineBottom:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				DestroyLineBottom:setTopBottom( true, false, 136, 132.84 )
				DestroyLineBottom:setAlpha( 0 )
				DestroyLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					if not event.interrupted then
						ArrowLeft:beginAnimation( "keyframe", 550, false, true, CoD.TweenType.Back )
					end
					ArrowLeft:setLeftRight( true, false, 116.67, 110 )
					ArrowLeft:setTopBottom( true, false, 119.66, 133 )
					ArrowLeft:setAlpha( 1 )
					ArrowLeft:setYRot( 0 )
					ArrowLeft:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( ArrowLeft, event )
					else
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 131.67, 125 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.ArrowLeft:setYRot( 0 )
				self.ArrowLeft:setZRot( 180 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local f4_local6 = function ( f11_arg0, f11_arg1 )
					if not f11_arg1.interrupted then
						f11_arg0:beginAnimation( "keyframe", 670, true, true, CoD.TweenType.Linear )
					end
					f11_arg0:setLeftRight( true, false, 128, 195.85 )
					f11_arg0:setTopBottom( true, false, 104.16, 153.83 )
					f11_arg0:setAlpha( 0 )
					if f11_arg1.interrupted then
						self.clipFinished( f11_arg0, f11_arg1 )
					else
						f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sides:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Sides:setLeftRight( true, false, 128, 195.85 )
				Sides:setTopBottom( true, false, 129.16, 128.83 )
				Sides:setAlpha( 0 )
				Sides:registerEventHandler( "transition_complete_keyframe", f4_local6 )
				AreaText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				AreaText:setLeftRight( true, false, 113.28, 210.28 )
				AreaText:setTopBottom( true, false, 96.84, 151.84 )
				AreaText:setAlpha( 0 )
				AreaText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f4_local7 = function ( f12_arg0, f12_arg1 )
					if not f12_arg1.interrupted then
						f12_arg0:beginAnimation( "keyframe", 480, false, true, CoD.TweenType.Back )
					end
					f12_arg0:setLeftRight( true, false, 213.61, 265 )
					f12_arg0:setTopBottom( true, false, 98.91, 111.41 )
					f12_arg0:setAlpha( 1 )
					if f12_arg1.interrupted then
						self.clipFinished( f12_arg0, f12_arg1 )
					else
						f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DistanceText:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
				DistanceText:setLeftRight( true, false, 213.61, 265 )
				DistanceText:setTopBottom( true, false, 113.91, 126.41 )
				DistanceText:setAlpha( 0 )
				DistanceText:registerEventHandler( "transition_complete_keyframe", f4_local7 )
				DataText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				DataText:setLeftRight( true, false, 75.92, 195.98 )
				DataText:setTopBottom( true, false, 146.83, 225.83 )
				DataText:setAlpha( 0 )
				DataText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local MessageTextFrame2 = function ( MessageText, event )
					local MessageTextFrame3 = function ( MessageText, event )
						if not event.interrupted then
							MessageText:beginAnimation( "keyframe", 759, false, true, CoD.TweenType.Linear )
							MessageText.LineLowerL:beginAnimation( "subkeyframe", 759, false, true, CoD.TweenType.Linear )
							MessageText.LineLowerM:beginAnimation( "subkeyframe", 759, false, true, CoD.TweenType.Linear )
							MessageText.LineLowerR:beginAnimation( "subkeyframe", 759, false, true, CoD.TweenType.Linear )
							MessageText.DescLbl:beginAnimation( "subkeyframe", 759, false, true, CoD.TweenType.Linear )
						end
						MessageText:setLeftRight( true, false, 206.5, 329.49 )
						MessageText:setTopBottom( true, false, 115.5, 140.83 )
						MessageText:setAlpha( 1 )
						MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
						MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
						MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
						MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
						if event.interrupted then
							self.clipFinished( MessageText, event )
						else
							MessageText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MessageTextFrame3( MessageText, event )
						return 
					else
						MessageText:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MessageText:setLeftRight( true, false, 206.5, 252.73 )
						MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame3 )
					end
				end
				
				MessageText:completeAnimation()
				MessageText.LineLowerL:completeAnimation()
				MessageText.LineLowerM:completeAnimation()
				MessageText.LineLowerR:completeAnimation()
				MessageText.DescLbl:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 228.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText:setAlpha( 0 )
				self.MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
				self.MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
				MessageTextFrame2( MessageText, {} )
				local DataTextState2Frame2 = function ( DataTextState2, event )
					if not event.interrupted then
						DataTextState2:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
					DataTextState2:setTopBottom( true, false, 145, 150 )
					DataTextState2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DataTextState2, event )
					else
						DataTextState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 130, 135 )
				self.DataTextState2:setAlpha( 0 )
				DataTextState2Frame2( DataTextState2, {} )
				local ArrowRightFrame2 = function ( ArrowRight, event )
					local ArrowRightFrame3 = function ( ArrowRight, event )
						local ArrowRightFrame4 = function ( ArrowRight, event )
							local ArrowRightFrame5 = function ( ArrowRight, event )
								local ArrowRightFrame6 = function ( ArrowRight, event )
									if not event.interrupted then
										ArrowRight:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									end
									ArrowRight:setLeftRight( true, false, 346.67, 340 )
									ArrowRight:setTopBottom( true, false, 119.66, 133 )
									ArrowRight:setAlpha( 0 )
									ArrowRight:setZRot( 180 )
									if event.interrupted then
										self.clipFinished( ArrowRight, event )
									else
										ArrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ArrowRightFrame6( ArrowRight, event )
									return 
								else
									ArrowRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									ArrowRight:setLeftRight( true, false, 247.33, 240.66 )
									ArrowRight:setAlpha( 0 )
									ArrowRight:registerEventHandler( "transition_complete_keyframe", ArrowRightFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowRightFrame5( ArrowRight, event )
								return 
							else
								ArrowRight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								ArrowRight:setLeftRight( true, false, 211.86, 205.19 )
								ArrowRight:registerEventHandler( "transition_complete_keyframe", ArrowRightFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowRightFrame4( ArrowRight, event )
							return 
						else
							ArrowRight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							ArrowRight:registerEventHandler( "transition_complete_keyframe", ArrowRightFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowRightFrame3( ArrowRight, event )
						return 
					else
						ArrowRight:beginAnimation( "keyframe", 100, true, true, CoD.TweenType.Linear )
						ArrowRight:setZRot( 180 )
						ArrowRight:registerEventHandler( "transition_complete_keyframe", ArrowRightFrame3 )
					end
				end
				
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( true, false, 197.67, 191 )
				self.ArrowRight:setTopBottom( true, false, 119.66, 133 )
				self.ArrowRight:setAlpha( 1 )
				self.ArrowRight:setZRot( 0 )
				ArrowRightFrame2( ArrowRight, {} )
			end
		},
		State2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 0 )
				self.clipFinished( VignetteState1, {} )
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 1 )
				self.clipFinished( VignetteState2, {} )
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 0 )
				self.clipFinished( VignetteState3, {} )
				CircleAnim:completeAnimation()
				self.CircleAnim:setAlpha( 0.5 )
				self.CircleAnim:setZoom( -150 )
				self.clipFinished( CircleAnim, {} )
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 123, 200.94 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 1 )
				self.clipFinished( BackBox, {} )
				LargeTriangle:completeAnimation()
				self.LargeTriangle:setAlpha( 0 )
				self.clipFinished( LargeTriangle, {} )
				TriangleTop:completeAnimation()
				self.TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
				self.TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
				self.TriangleTop:setRGB( 1, 0.55, 0.14 )
				self.TriangleTop:setZRot( 180 )
				self.clipFinished( TriangleTop, {} )
				IconWeak:completeAnimation()
				self.IconWeak:setAlpha( 1 )
				self.IconWeak:setYRot( 0 )
				self.clipFinished( IconWeak, {} )
				iconDestroy:completeAnimation()
				self.iconDestroy:setAlpha( 0 )
				self.iconDestroy:setYRot( -90 )
				self.clipFinished( iconDestroy, {} )
				FrameSide:completeAnimation()
				self.FrameSide:setLeftRight( true, false, 128, 133 )
				self.FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				self.FrameSide:setAlpha( 0 )
				self.clipFinished( FrameSide, {} )
				Meters:completeAnimation()
				Meters.MetersBase:completeAnimation()
				Meters.MetersTop:completeAnimation()
				self.Meters.MetersBase:setAlpha( 0 )
				self.Meters.MetersTop:setAlpha( 0 )
				self.clipFinished( Meters, {} )
				DestroyLineTop:completeAnimation()
				self.DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineTop:setTopBottom( true, false, 116.84, 120.17 )
				self.DestroyLineTop:setAlpha( 0 )
				self.clipFinished( DestroyLineTop, {} )
				DestroyLineBottom:completeAnimation()
				self.DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineBottom:setTopBottom( true, false, 136, 132.84 )
				self.DestroyLineBottom:setAlpha( 0 )
				self.clipFinished( DestroyLineBottom, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 116.67, 110 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setYRot( 0 )
				self.ArrowLeft:setZRot( 180 )
				self.clipFinished( ArrowLeft, {} )
				Sides:completeAnimation()
				self.Sides:setLeftRight( true, false, 128, 195.85 )
				self.Sides:setTopBottom( true, false, 104.16, 153.83 )
				self.clipFinished( Sides, {} )
				AreaText:completeAnimation()
				self.AreaText:setLeftRight( true, false, 113.28, 210.28 )
				self.AreaText:setTopBottom( true, false, 96.84, 151.84 )
				self.AreaText:setAlpha( 0 )
				self.clipFinished( AreaText, {} )
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 98.91, 111.41 )
				self.DistanceText:setAlpha( 1 )
				self.clipFinished( DistanceText, {} )
				DataText:completeAnimation()
				self.DataText:setLeftRight( true, false, 75.92, 195.98 )
				self.DataText:setTopBottom( true, false, 146.83, 225.83 )
				self.DataText:setAlpha( 0 )
				self.clipFinished( DataText, {} )
				MessageText:completeAnimation()
				MessageText.LineLowerL:completeAnimation()
				MessageText.LineLowerM:completeAnimation()
				MessageText.LineLowerR:completeAnimation()
				MessageText.DescLbl:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 329.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
				self.MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
				self.clipFinished( MessageText, {} )
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 145, 150 )
				self.DataTextState2:setAlpha( 1 )
				self.clipFinished( DataTextState2, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( true, false, 214.67, 208 )
				self.ArrowRight:setTopBottom( true, false, 119.66, 133 )
				self.ArrowRight:setAlpha( 0 )
				self.clipFinished( ArrowRight, {} )
			end,
			State1 = function ()
				self:setupElementClipCounter( 21 )
				local VignetteState1Frame2 = function ( VignetteState1, event )
					if not event.interrupted then
						VignetteState1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteState1, event )
					else
						VignetteState1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 0 )
				VignetteState1Frame2( VignetteState1, {} )
				local VignetteState2Frame2 = function ( VignetteState2, event )
					if not event.interrupted then
						VignetteState2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteState2, event )
					else
						VignetteState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 1 )
				VignetteState2Frame2( VignetteState2, {} )
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 0 )
				self.clipFinished( VignetteState3, {} )
				local CircleAnimFrame2 = function ( CircleAnim, event )
					if not event.interrupted then
						CircleAnim:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					CircleAnim:setAlpha( 0 )
					CircleAnim:setZoom( -150 )
					if event.interrupted then
						self.clipFinished( CircleAnim, event )
					else
						CircleAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleAnim:completeAnimation()
				self.CircleAnim:setAlpha( 0.5 )
				self.CircleAnim:setZoom( -150 )
				CircleAnimFrame2( CircleAnim, {} )
				local BackBoxFrame2 = function ( BackBox, event )
					if not event.interrupted then
						BackBox:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					BackBox:setLeftRight( true, false, 161.78, 163 )
					BackBox:setTopBottom( true, false, 93.83, 158.83 )
					BackBox:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackBox, event )
					else
						BackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 123, 200.94 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 1 )
				BackBoxFrame2( BackBox, {} )
				LargeTriangle:completeAnimation()
				self.LargeTriangle:setAlpha( 0 )
				self.clipFinished( LargeTriangle, {} )
				local TriangleTopFrame2 = function ( TriangleTop, event )
					if not event.interrupted then
						TriangleTop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
					TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
					TriangleTop:setRGB( 1, 1, 1 )
					TriangleTop:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( TriangleTop, event )
					else
						TriangleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TriangleTop:completeAnimation()
				self.TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
				self.TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
				self.TriangleTop:setRGB( 1, 0.55, 0.14 )
				self.TriangleTop:setZRot( 180 )
				TriangleTopFrame2( TriangleTop, {} )
				IconWeak:completeAnimation()
				self.IconWeak:setAlpha( 1 )
				self.IconWeak:setYRot( 0 )
				self.clipFinished( IconWeak, {} )
				iconDestroy:completeAnimation()
				self.iconDestroy:setAlpha( 0 )
				self.iconDestroy:setYRot( -90 )
				self.clipFinished( iconDestroy, {} )
				FrameSide:completeAnimation()
				self.FrameSide:setLeftRight( true, false, 128, 133 )
				self.FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				self.FrameSide:setAlpha( 0 )
				self.clipFinished( FrameSide, {} )
				Meters:completeAnimation()
				Meters.MetersBase:completeAnimation()
				Meters.MetersTop:completeAnimation()
				self.Meters.MetersBase:setAlpha( 0 )
				self.Meters.MetersTop:setAlpha( 0 )
				self.clipFinished( Meters, {} )
				DestroyLineTop:completeAnimation()
				self.DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineTop:setTopBottom( true, false, 116.84, 120.17 )
				self.DestroyLineTop:setAlpha( 0 )
				self.clipFinished( DestroyLineTop, {} )
				DestroyLineBottom:completeAnimation()
				self.DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineBottom:setTopBottom( true, false, 136, 132.84 )
				self.DestroyLineBottom:setAlpha( 0 )
				self.clipFinished( DestroyLineBottom, {} )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					if not event.interrupted then
						ArrowLeft:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ArrowLeft:setLeftRight( true, false, 131.67, 125 )
					ArrowLeft:setTopBottom( true, false, 119.66, 133 )
					ArrowLeft:setAlpha( 1 )
					ArrowLeft:setYRot( 0 )
					ArrowLeft:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( ArrowLeft, event )
					else
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 116.67, 110 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.ArrowLeft:setYRot( 0 )
				self.ArrowLeft:setZRot( 180 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local SidesFrame2 = function ( Sides, event )
					if not event.interrupted then
						Sides:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					Sides:setLeftRight( true, false, 128, 195.85 )
					Sides:setTopBottom( true, false, 129.16, 128.83 )
					Sides:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Sides, event )
					else
						Sides:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sides:completeAnimation()
				self.Sides:setLeftRight( true, false, 128, 195.85 )
				self.Sides:setTopBottom( true, false, 104.16, 153.83 )
				self.Sides:setAlpha( 0 )
				SidesFrame2( Sides, {} )
				AreaText:completeAnimation()
				self.AreaText:setLeftRight( true, false, 113.28, 210.28 )
				self.AreaText:setTopBottom( true, false, 96.84, 151.84 )
				self.AreaText:setAlpha( 0 )
				self.clipFinished( AreaText, {} )
				local DistanceTextFrame2 = function ( DistanceText, event )
					if not event.interrupted then
						DistanceText:beginAnimation( "keyframe", 1000, true, false, CoD.TweenType.Back )
					end
					DistanceText:setLeftRight( true, false, 213.61, 265 )
					DistanceText:setTopBottom( true, false, 113.91, 126.41 )
					DistanceText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DistanceText, event )
					else
						DistanceText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 98.91, 111.41 )
				self.DistanceText:setAlpha( 1 )
				DistanceTextFrame2( DistanceText, {} )
				DataText:completeAnimation()
				self.DataText:setLeftRight( true, false, 75.92, 195.98 )
				self.DataText:setTopBottom( true, false, 146.83, 225.83 )
				self.DataText:setAlpha( 0 )
				self.clipFinished( DataText, {} )
				local MessageTextFrame2 = function ( MessageText, event )
					local MessageTextFrame3 = function ( MessageText, event )
						if not event.interrupted then
							MessageText:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerL:beginAnimation( "subkeyframe", 290, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerM:beginAnimation( "subkeyframe", 290, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerR:beginAnimation( "subkeyframe", 290, false, false, CoD.TweenType.Linear )
							MessageText.DescLbl:beginAnimation( "subkeyframe", 290, false, false, CoD.TweenType.Linear )
						end
						MessageText:setLeftRight( true, false, 206.5, 228.49 )
						MessageText:setTopBottom( true, false, 115.5, 140.83 )
						MessageText:setAlpha( 0 )
						MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
						MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
						MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
						MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
						if event.interrupted then
							self.clipFinished( MessageText, event )
						else
							MessageText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MessageTextFrame3( MessageText, event )
						return 
					else
						MessageText:beginAnimation( "keyframe", 709, true, true, CoD.TweenType.Linear )
						MessageText:setLeftRight( true, false, 206.5, 257.78 )
						MessageText:setAlpha( 0 )
						MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame3 )
					end
				end
				
				MessageText:completeAnimation()
				MessageText.LineLowerL:completeAnimation()
				MessageText.LineLowerM:completeAnimation()
				MessageText.LineLowerR:completeAnimation()
				MessageText.DescLbl:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 329.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText:setAlpha( 1 )
				self.MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
				self.MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
				MessageTextFrame2( MessageText, {} )
				local DataTextState2Frame2 = function ( DataTextState2, event )
					if not event.interrupted then
						DataTextState2:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
					DataTextState2:setTopBottom( true, false, 130, 135 )
					DataTextState2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DataTextState2, event )
					else
						DataTextState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 145, 150 )
				self.DataTextState2:setAlpha( 1 )
				DataTextState2Frame2( DataTextState2, {} )
				local f22_local10 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						local f35_local0 = function ( f36_arg0, f36_arg1 )
							local f36_local0 = function ( f37_arg0, f37_arg1 )
								local f37_local0 = function ( f38_arg0, f38_arg1 )
									if not f38_arg1.interrupted then
										f38_arg0:beginAnimation( "keyframe", 69, true, true, CoD.TweenType.Linear )
									end
									f38_arg0:setLeftRight( true, false, 197.67, 191 )
									f38_arg0:setTopBottom( true, false, 119.66, 133 )
									f38_arg0:setAlpha( 1 )
									f38_arg0:setZRot( 0 )
									if f38_arg1.interrupted then
										self.clipFinished( f38_arg0, f38_arg1 )
									else
										f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f37_arg1.interrupted then
									f37_local0( f37_arg0, f37_arg1 )
									return 
								else
									f37_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
								end
							end
							
							if f36_arg1.interrupted then
								f36_local0( f36_arg0, f36_arg1 )
								return 
							else
								f36_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
								f36_arg0:setLeftRight( true, false, 197.67, 191 )
								f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
							end
						end
						
						if f35_arg1.interrupted then
							f35_local0( f35_arg0, f35_arg1 )
							return 
						else
							f35_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f35_arg0:setLeftRight( true, false, 214.5, 207.83 )
							f35_arg0:setAlpha( 1 )
							f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						f34_arg0:setLeftRight( true, false, 231.32, 224.65 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				ArrowRight:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				ArrowRight:setLeftRight( true, false, 258.67, 252 )
				ArrowRight:setTopBottom( true, false, 119.66, 133 )
				ArrowRight:setAlpha( 0 )
				ArrowRight:setZRot( 180 )
				ArrowRight:registerEventHandler( "transition_complete_keyframe", f22_local10 )
			end,
			State3 = function ()
				self:setupElementClipCounter( 21 )
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 0 )
				self.clipFinished( VignetteState1, {} )
				local VignetteState2Frame2 = function ( VignetteState2, event )
					if not event.interrupted then
						VignetteState2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteState2, event )
					else
						VignetteState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 1 )
				VignetteState2Frame2( VignetteState2, {} )
				local VignetteState3Frame2 = function ( VignetteState3, event )
					if not event.interrupted then
						VignetteState3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteState3, event )
					else
						VignetteState3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 0 )
				VignetteState3Frame2( VignetteState3, {} )
				local f39_local2 = function ( f42_arg0, f42_arg1 )
					if not f42_arg1.interrupted then
						f42_arg0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					f42_arg0:setRGB( 1, 1, 1 )
					f42_arg0:setAlpha( 1 )
					f42_arg0:setZoom( -75 )
					if f42_arg1.interrupted then
						self.clipFinished( f42_arg0, f42_arg1 )
					else
						f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleAnim:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
				CircleAnim:setRGB( 1, 1, 1 )
				CircleAnim:setAlpha( 0.5 )
				CircleAnim:setZoom( -150 )
				CircleAnim:registerEventHandler( "transition_complete_keyframe", f39_local2 )
				local BackBoxFrame2 = function ( BackBox, event )
					if not event.interrupted then
						BackBox:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Back )
					end
					BackBox:setLeftRight( true, false, 37.94, 337.94 )
					BackBox:setTopBottom( true, false, 93.83, 158.83 )
					BackBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BackBox, event )
					else
						BackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 123, 200.94 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 1 )
				BackBoxFrame2( BackBox, {} )
				local f39_local4 = function ( f44_arg0, f44_arg1 )
					if not f44_arg1.interrupted then
						f44_arg0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
					end
					f44_arg0:setLeftRight( true, false, 61, 264.95 )
					f44_arg0:setTopBottom( true, false, 71.89, 238.91 )
					f44_arg0:setAlpha( 1 )
					if f44_arg1.interrupted then
						self.clipFinished( f44_arg0, f44_arg1 )
					else
						f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LargeTriangle:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				LargeTriangle:setLeftRight( true, false, 61, 264.95 )
				LargeTriangle:setTopBottom( true, false, 71.89, 238.91 )
				LargeTriangle:setAlpha( 0 )
				LargeTriangle:registerEventHandler( "transition_complete_keyframe", f39_local4 )
				local TriangleTopFrame2 = function ( TriangleTop, event )
					if not event.interrupted then
						TriangleTop:beginAnimation( "keyframe", 529, false, true, CoD.TweenType.Back )
					end
					TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
					TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
					TriangleTop:setRGB( 0.78, 0.13, 0.13 )
					TriangleTop:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( TriangleTop, event )
					else
						TriangleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TriangleTop:completeAnimation()
				self.TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
				self.TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
				self.TriangleTop:setRGB( 1, 0.55, 0.14 )
				self.TriangleTop:setZRot( 180 )
				TriangleTopFrame2( TriangleTop, {} )
				local IconWeakFrame2 = function ( IconWeak, event )
					if not event.interrupted then
						IconWeak:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Back )
					end
					IconWeak:setAlpha( 1 )
					IconWeak:setYRot( -90 )
					if event.interrupted then
						self.clipFinished( IconWeak, event )
					else
						IconWeak:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconWeak:completeAnimation()
				self.IconWeak:setAlpha( 1 )
				self.IconWeak:setYRot( 0 )
				IconWeakFrame2( IconWeak, {} )
				local f39_local7 = function ( f47_arg0, f47_arg1 )
					if not f47_arg1.interrupted then
						f47_arg0:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Back )
					end
					f47_arg0:setAlpha( 1 )
					f47_arg0:setYRot( 0 )
					if f47_arg1.interrupted then
						self.clipFinished( f47_arg0, f47_arg1 )
					else
						f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconDestroy:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				iconDestroy:setAlpha( 0 )
				iconDestroy:setYRot( -90 )
				iconDestroy:registerEventHandler( "transition_complete_keyframe", f39_local7 )
				local FrameSideFrame2 = function ( FrameSide, event )
					if not event.interrupted then
						FrameSide:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Back )
					end
					FrameSide:setLeftRight( true, false, 64, 69 )
					FrameSide:setTopBottom( true, false, 106.5, 146.83 )
					FrameSide:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FrameSide, event )
					else
						FrameSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FrameSide:completeAnimation()
				self.FrameSide:setLeftRight( true, false, 128, 133 )
				self.FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				self.FrameSide:setAlpha( 0 )
				FrameSideFrame2( FrameSide, {} )
				local f39_local9 = function ( f49_arg0, f49_arg1 )
					if not f49_arg1.interrupted then
						f49_arg0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						f49_arg0.MetersBase:beginAnimation( "subkeyframe", 459, false, false, CoD.TweenType.Linear )
						f49_arg0.MetersTop:beginAnimation( "subkeyframe", 459, false, false, CoD.TweenType.Linear )
					end
					f49_arg0:setAlpha( 1 )
					f49_arg0.MetersBase:setAlpha( 1 )
					f49_arg0.MetersTop:setAlpha( 1 )
					if f49_arg1.interrupted then
						self.clipFinished( f49_arg0, f49_arg1 )
					else
						f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Meters:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
				Meters.MetersBase:beginAnimation( "subkeyframe", 579, false, false, CoD.TweenType.Linear )
				Meters.MetersTop:beginAnimation( "subkeyframe", 579, false, false, CoD.TweenType.Linear )
				Meters:setAlpha( 1 )
				Meters.MetersBase:setAlpha( 0 )
				Meters.MetersTop:setAlpha( 0 )
				Meters:registerEventHandler( "transition_complete_keyframe", f39_local9 )
				local f39_local10 = function ( f50_arg0, f50_arg1 )
					if not f50_arg1.interrupted then
						f50_arg0:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					f50_arg0:setLeftRight( true, false, 71, 123.33 )
					f50_arg0:setTopBottom( true, false, 87.84, 91.16 )
					f50_arg0:setAlpha( 1 )
					if f50_arg1.interrupted then
						self.clipFinished( f50_arg0, f50_arg1 )
					else
						f50_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DestroyLineTop:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				DestroyLineTop:setTopBottom( true, false, 116.84, 120.17 )
				DestroyLineTop:setAlpha( 0 )
				DestroyLineTop:registerEventHandler( "transition_complete_keyframe", f39_local10 )
				local f39_local11 = function ( f51_arg0, f51_arg1 )
					if not f51_arg1.interrupted then
						f51_arg0:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Back )
					end
					f51_arg0:setLeftRight( true, false, 71, 123.33 )
					f51_arg0:setTopBottom( true, false, 164, 160.84 )
					f51_arg0:setAlpha( 1 )
					if f51_arg1.interrupted then
						self.clipFinished( f51_arg0, f51_arg1 )
					else
						f51_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DestroyLineBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				DestroyLineBottom:setTopBottom( true, false, 136, 132.84 )
				DestroyLineBottom:setAlpha( 0 )
				DestroyLineBottom:registerEventHandler( "transition_complete_keyframe", f39_local11 )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					local ArrowLeftFrame3 = function ( ArrowLeft, event )
						local ArrowLeftFrame4 = function ( ArrowLeft, event )
							if not event.interrupted then
								ArrowLeft:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Back )
							end
							ArrowLeft:setLeftRight( true, false, 52.67, 46 )
							ArrowLeft:setTopBottom( true, false, 119.66, 133 )
							ArrowLeft:setAlpha( 1 )
							ArrowLeft:setYRot( 0 )
							ArrowLeft:setZRot( 0 )
							if event.interrupted then
								self.clipFinished( ArrowLeft, event )
							else
								ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ArrowLeftFrame4( ArrowLeft, event )
							return 
						else
							ArrowLeft:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							ArrowLeft:registerEventHandler( "transition_complete_keyframe", ArrowLeftFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowLeftFrame3( ArrowLeft, event )
						return 
					else
						ArrowLeft:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ArrowLeft:setZRot( 0 )
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", ArrowLeftFrame3 )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 116.67, 110 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.ArrowLeft:setYRot( 0 )
				self.ArrowLeft:setZRot( 180 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local f39_local13 = function ( f55_arg0, f55_arg1 )
					if not f55_arg1.interrupted then
						f55_arg0:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Back )
					end
					f55_arg0:setLeftRight( true, false, 128, 195.85 )
					f55_arg0:setTopBottom( true, false, 104.16, 153.83 )
					f55_arg0:setAlpha( 1 )
					if f55_arg1.interrupted then
						self.clipFinished( f55_arg0, f55_arg1 )
					else
						f55_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sides:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				Sides:setLeftRight( true, false, 128, 195.85 )
				Sides:setTopBottom( true, false, 104.16, 153.83 )
				Sides:setAlpha( 1 )
				Sides:registerEventHandler( "transition_complete_keyframe", f39_local13 )
				local f39_local14 = function ( f56_arg0, f56_arg1 )
					if not f56_arg1.interrupted then
						f56_arg0:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Linear )
					end
					f56_arg0:setLeftRight( true, false, 48.16, 145.16 )
					f56_arg0:setTopBottom( true, false, 97.83, 152.83 )
					f56_arg0:setAlpha( 1 )
					if f56_arg1.interrupted then
						self.clipFinished( f56_arg0, f56_arg1 )
					else
						f56_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AreaText:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				AreaText:setLeftRight( true, false, 113.28, 210.28 )
				AreaText:setTopBottom( true, false, 96.84, 151.84 )
				AreaText:setAlpha( 0 )
				AreaText:registerEventHandler( "transition_complete_keyframe", f39_local14 )
				local DistanceTextFrame2 = function ( DistanceText, event )
					if not event.interrupted then
						DistanceText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					DistanceText:setLeftRight( true, false, 213.61, 265 )
					DistanceText:setTopBottom( true, false, 98.91, 111.41 )
					DistanceText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DistanceText, event )
					else
						DistanceText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 98.91, 111.41 )
				self.DistanceText:setAlpha( 1 )
				DistanceTextFrame2( DistanceText, {} )
				local f39_local16 = function ( f58_arg0, f58_arg1 )
					if not f58_arg1.interrupted then
						f58_arg0:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
					end
					f58_arg0:setLeftRight( true, false, 169.94, 290 )
					f58_arg0:setTopBottom( true, false, 146, 225 )
					f58_arg0:setAlpha( 1 )
					if f58_arg1.interrupted then
						self.clipFinished( f58_arg0, f58_arg1 )
					else
						f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataText:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				DataText:setLeftRight( true, false, 75.92, 195.98 )
				DataText:setTopBottom( true, false, 146.83, 225.83 )
				DataText:setAlpha( 0 )
				DataText:registerEventHandler( "transition_complete_keyframe", f39_local16 )
				local MessageTextFrame2 = function ( MessageText, event )
					local MessageTextFrame3 = function ( MessageText, event )
						local MessageTextFrame4 = function ( MessageText, event )
							local MessageTextFrame5 = function ( MessageText, event )
								local MessageTextFrame6 = function ( MessageText, event )
									local MessageTextFrame7 = function ( MessageText, event )
										local MessageTextFrame8 = function ( MessageText, event )
											local MessageTextFrame9 = function ( MessageText, event )
												if not event.interrupted then
													MessageText:beginAnimation( "keyframe", 99, true, true, CoD.TweenType.Linear )
													MessageText.LineLowerL:beginAnimation( "subkeyframe", 99, true, true, CoD.TweenType.Linear )
													MessageText.LineLowerM:beginAnimation( "subkeyframe", 99, true, true, CoD.TweenType.Linear )
													MessageText.LineLowerR:beginAnimation( "subkeyframe", 99, true, true, CoD.TweenType.Linear )
													MessageText.DescLbl:beginAnimation( "subkeyframe", 99, true, true, CoD.TweenType.Linear )
												end
												MessageText:setLeftRight( true, false, 206.5, 310.49 )
												MessageText:setTopBottom( true, false, 115.5, 140.83 )
												MessageText:setAlpha( 1 )
												MessageText.LineLowerL:setRGB( 0.78, 0.13, 0.13 )
												MessageText.LineLowerM:setRGB( 0.78, 0.13, 0.13 )
												MessageText.LineLowerR:setRGB( 0.78, 0.13, 0.13 )
												MessageText.DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
												if event.interrupted then
													self.clipFinished( MessageText, event )
												else
													MessageText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												MessageTextFrame9( MessageText, event )
												return 
											else
												MessageText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MessageText.LineLowerL:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MessageText.LineLowerM:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MessageText.LineLowerR:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MessageText.DescLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MessageText:setLeftRight( true, false, 206.5, 311.85 )
												MessageText.LineLowerL:setRGB( 0.79, 0.16, 0.13 )
												MessageText.LineLowerM:setRGB( 0.79, 0.16, 0.13 )
												MessageText.LineLowerR:setRGB( 0.79, 0.16, 0.13 )
												MessageText.DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
												MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame9 )
											end
										end
										
										if event.interrupted then
											MessageTextFrame8( MessageText, event )
											return 
										else
											MessageText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											MessageText.LineLowerL:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
											MessageText.LineLowerM:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
											MessageText.LineLowerR:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
											MessageText.DescLbl:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
											MessageText:setLeftRight( true, false, 206.5, 312.43 )
											MessageText.LineLowerL:setRGB( 0.8, 0.17, 0.13 )
											MessageText.LineLowerM:setRGB( 0.8, 0.17, 0.13 )
											MessageText.LineLowerR:setRGB( 0.8, 0.17, 0.13 )
											MessageText.DescLbl:setText( Engine.Localize( "D S T Y" ) )
											MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame8 )
										end
									end
									
									if event.interrupted then
										MessageTextFrame7( MessageText, event )
										return 
									else
										MessageText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										MessageText.LineLowerL:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
										MessageText.LineLowerM:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
										MessageText.LineLowerR:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
										MessageText.DescLbl:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
										MessageText:setLeftRight( true, false, 206.5, 316.96 )
										MessageText.LineLowerL:setRGB( 0.85, 0.27, 0.13 )
										MessageText.LineLowerM:setRGB( 0.85, 0.27, 0.13 )
										MessageText.LineLowerR:setRGB( 0.85, 0.27, 0.13 )
										MessageText.DescLbl:setText( Engine.Localize( "W E S N R S S" ) )
										MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame7 )
									end
								end
								
								if event.interrupted then
									MessageTextFrame6( MessageText, event )
									return 
								else
									MessageText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									MessageText.LineLowerL:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
									MessageText.LineLowerM:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
									MessageText.LineLowerR:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
									MessageText.DescLbl:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
									MessageText:setLeftRight( true, false, 206.5, 318.46 )
									MessageText.LineLowerL:setRGB( 0.87, 0.3, 0.13 )
									MessageText.LineLowerM:setRGB( 0.87, 0.3, 0.13 )
									MessageText.LineLowerR:setRGB( 0.87, 0.3, 0.13 )
									MessageText.DescLbl:setText( Engine.Localize( "D E S T N E" ) )
									MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame6 )
								end
							end
							
							if event.interrupted then
								MessageTextFrame5( MessageText, event )
								return 
							else
								MessageText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								MessageText.LineLowerL:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								MessageText.LineLowerM:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								MessageText.LineLowerR:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								MessageText.DescLbl:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								MessageText:setLeftRight( true, false, 206.5, 320.51 )
								MessageText.LineLowerL:setRGB( 0.89, 0.35, 0.13 )
								MessageText.LineLowerM:setRGB( 0.89, 0.35, 0.13 )
								MessageText.LineLowerR:setRGB( 0.89, 0.35, 0.13 )
								MessageText.DescLbl:setText( Engine.Localize( "W E A K N E" ) )
								MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame5 )
							end
						end
						
						if event.interrupted then
							MessageTextFrame4( MessageText, event )
							return 
						else
							MessageText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerL:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerM:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							MessageText.LineLowerR:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							MessageText.DescLbl:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							MessageText:setLeftRight( true, false, 206.5, 322.03 )
							MessageText.LineLowerL:setRGB( 0.91, 0.38, 0.14 )
							MessageText.LineLowerM:setRGB( 0.91, 0.38, 0.14 )
							MessageText.LineLowerR:setRGB( 0.91, 0.38, 0.14 )
							MessageText.DescLbl:setText( Engine.Localize( "W K N S S" ) )
							MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame4 )
						end
					end
					
					if event.interrupted then
						MessageTextFrame3( MessageText, event )
						return 
					else
						MessageText:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MessageText.LineLowerL:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
						MessageText.LineLowerM:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
						MessageText.LineLowerR:beginAnimation( "subkeyframe", 239, false, false, CoD.TweenType.Linear )
						MessageText:setLeftRight( true, false, 206.5, 322.53 )
						MessageText.LineLowerL:setRGB( 0.92, 0.39, 0.14 )
						MessageText.LineLowerM:setRGB( 0.92, 0.39, 0.14 )
						MessageText.LineLowerR:setRGB( 0.92, 0.39, 0.14 )
						MessageText:registerEventHandler( "transition_complete_keyframe", MessageTextFrame3 )
					end
				end
				
				MessageText:completeAnimation()
				MessageText.LineLowerL:completeAnimation()
				MessageText.LineLowerM:completeAnimation()
				MessageText.LineLowerR:completeAnimation()
				MessageText.DescLbl:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 329.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText:setAlpha( 1 )
				self.MessageText.LineLowerL:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerM:setRGB( 1, 0.55, 0.14 )
				self.MessageText.LineLowerR:setRGB( 1, 0.55, 0.14 )
				self.MessageText.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
				MessageTextFrame2( MessageText, {} )
				local DataTextState2Frame2 = function ( DataTextState2, event )
					if not event.interrupted then
						DataTextState2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
					DataTextState2:setTopBottom( true, false, 145, 150 )
					DataTextState2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DataTextState2, event )
					else
						DataTextState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 145, 150 )
				self.DataTextState2:setAlpha( 1 )
				DataTextState2Frame2( DataTextState2, {} )
				local ArrowRightFrame2 = function ( ArrowRight, event )
					if not event.interrupted then
						ArrowRight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					ArrowRight:setLeftRight( true, false, 214.67, 208 )
					ArrowRight:setTopBottom( true, false, 119.66, 133 )
					ArrowRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowRight, event )
					else
						ArrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( true, false, 214.67, 208 )
				self.ArrowRight:setTopBottom( true, false, 119.66, 133 )
				self.ArrowRight:setAlpha( 0 )
				ArrowRightFrame2( ArrowRight, {} )
			end
		},
		State3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 0 )
				self.clipFinished( VignetteState1, {} )
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 0 )
				self.clipFinished( VignetteState2, {} )
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 1 )
				self.clipFinished( VignetteState3, {} )
				CircleAnim:completeAnimation()
				self.CircleAnim:setRGB( 1, 1, 1 )
				self.CircleAnim:setAlpha( 1 )
				self.CircleAnim:setZoom( -75 )
				self.clipFinished( CircleAnim, {} )
				BackBox:completeAnimation()
				self.BackBox:setLeftRight( true, false, 37.94, 337.94 )
				self.BackBox:setTopBottom( true, false, 93.83, 158.83 )
				self.BackBox:setAlpha( 1 )
				self.clipFinished( BackBox, {} )
				LargeTriangle:completeAnimation()
				self.LargeTriangle:setLeftRight( true, false, 61, 264.95 )
				self.LargeTriangle:setTopBottom( true, false, 71.89, 238.91 )
				self.LargeTriangle:setAlpha( 1 )
				self.clipFinished( LargeTriangle, {} )
				TriangleTop:completeAnimation()
				self.TriangleTop:setRGB( 0.78, 0.13, 0.13 )
				self.TriangleTop:setZRot( 0 )
				self.clipFinished( TriangleTop, {} )
				IconWeak:completeAnimation()
				self.IconWeak:setAlpha( 1 )
				self.IconWeak:setYRot( -90 )
				self.clipFinished( IconWeak, {} )
				iconDestroy:completeAnimation()
				self.iconDestroy:setAlpha( 1 )
				self.iconDestroy:setYRot( 0 )
				self.clipFinished( iconDestroy, {} )
				FrameSide:completeAnimation()
				self.FrameSide:setLeftRight( true, false, 64, 69 )
				self.FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				self.FrameSide:setAlpha( 1 )
				self.clipFinished( FrameSide, {} )
				Meters:completeAnimation()
				Meters.MetersBase:completeAnimation()
				Meters.MetersTop:completeAnimation()
				self.Meters:setAlpha( 1 )
				self.Meters.MetersBase:setAlpha( 1 )
				self.Meters.MetersTop:setAlpha( 1 )
				self.clipFinished( Meters, {} )
				DestroyLineTop:completeAnimation()
				self.DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineTop:setTopBottom( true, false, 87.84, 91.16 )
				self.DestroyLineTop:setAlpha( 1 )
				self.clipFinished( DestroyLineTop, {} )
				DestroyLineBottom:completeAnimation()
				self.DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				self.DestroyLineBottom:setTopBottom( true, false, 164, 160.84 )
				self.DestroyLineBottom:setAlpha( 1 )
				self.clipFinished( DestroyLineBottom, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 52.67, 46 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.ArrowLeft:setZRot( 0 )
				self.clipFinished( ArrowLeft, {} )
				Sides:completeAnimation()
				self.Sides:setLeftRight( true, false, 128, 195.85 )
				self.Sides:setTopBottom( true, false, 104.16, 153.83 )
				self.Sides:setAlpha( 1 )
				self.clipFinished( Sides, {} )
				AreaText:completeAnimation()
				self.AreaText:setLeftRight( true, false, 48.16, 145.16 )
				self.AreaText:setTopBottom( true, false, 97.83, 152.83 )
				self.AreaText:setAlpha( 1 )
				self.clipFinished( AreaText, {} )
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 98.91, 111.41 )
				self.DistanceText:setAlpha( 1 )
				self.clipFinished( DistanceText, {} )
				DataText:completeAnimation()
				self.DataText:setLeftRight( true, false, 169.94, 290 )
				self.DataText:setTopBottom( true, false, 146, 225 )
				self.DataText:setAlpha( 1 )
				self.clipFinished( DataText, {} )
				MessageText:completeAnimation()
				MessageText.LineLowerL:completeAnimation()
				MessageText.LineLowerM:completeAnimation()
				MessageText.LineLowerR:completeAnimation()
				MessageText.DescLbl:completeAnimation()
				self.MessageText:setLeftRight( true, false, 206.5, 310.49 )
				self.MessageText:setTopBottom( true, false, 115.5, 140.83 )
				self.MessageText:setAlpha( 1 )
				self.MessageText.LineLowerL:setRGB( 0.78, 0.13, 0.13 )
				self.MessageText.LineLowerM:setRGB( 0.78, 0.13, 0.13 )
				self.MessageText.LineLowerR:setRGB( 0.78, 0.13, 0.13 )
				self.MessageText.DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
				self.clipFinished( MessageText, {} )
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 145, 150 )
				self.DataTextState2:setAlpha( 0 )
				self.clipFinished( DataTextState2, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setAlpha( 0 )
				self.clipFinished( ArrowRight, {} )
			end,
			State2 = function ()
				self:setupElementClipCounter( 21 )
				VignetteState1:completeAnimation()
				self.VignetteState1:setAlpha( 0 )
				self.clipFinished( VignetteState1, {} )
				local VignetteState2Frame2 = function ( VignetteState2, event )
					if not event.interrupted then
						VignetteState2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteState2, event )
					else
						VignetteState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState2:completeAnimation()
				self.VignetteState2:setAlpha( 0 )
				VignetteState2Frame2( VignetteState2, {} )
				local VignetteState3Frame2 = function ( VignetteState3, event )
					if not event.interrupted then
						VignetteState3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					VignetteState3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VignetteState3, event )
					else
						VignetteState3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteState3:completeAnimation()
				self.VignetteState3:setAlpha( 1 )
				VignetteState3Frame2( VignetteState3, {} )
				local f70_local2 = function ( f73_arg0, f73_arg1 )
					if not f73_arg1.interrupted then
						f73_arg0:beginAnimation( "keyframe", 590, true, true, CoD.TweenType.Linear )
					end
					f73_arg0:setRGB( 1, 1, 1 )
					f73_arg0:setAlpha( 0.5 )
					f73_arg0:setZoom( -150 )
					if f73_arg1.interrupted then
						self.clipFinished( f73_arg0, f73_arg1 )
					else
						f73_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleAnim:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
				CircleAnim:setRGB( 1, 1, 1 )
				CircleAnim:setAlpha( 1 )
				CircleAnim:setZoom( -75 )
				CircleAnim:registerEventHandler( "transition_complete_keyframe", f70_local2 )
				local f70_local3 = function ( f74_arg0, f74_arg1 )
					if not f74_arg1.interrupted then
						f74_arg0:beginAnimation( "keyframe", 509, true, true, CoD.TweenType.Linear )
					end
					f74_arg0:setLeftRight( true, false, 123, 200.94 )
					f74_arg0:setTopBottom( true, false, 93.83, 158.83 )
					f74_arg0:setAlpha( 1 )
					if f74_arg1.interrupted then
						self.clipFinished( f74_arg0, f74_arg1 )
					else
						f74_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackBox:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
				BackBox:setLeftRight( true, false, 37.94, 337.94 )
				BackBox:setTopBottom( true, false, 93.83, 158.83 )
				BackBox:setAlpha( 1 )
				BackBox:registerEventHandler( "transition_complete_keyframe", f70_local3 )
				local LargeTriangleFrame2 = function ( LargeTriangle, event )
					if not event.interrupted then
						LargeTriangle:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					LargeTriangle:setLeftRight( true, false, 61, 264.95 )
					LargeTriangle:setTopBottom( true, false, 71.89, 238.91 )
					LargeTriangle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LargeTriangle, event )
					else
						LargeTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LargeTriangle:completeAnimation()
				self.LargeTriangle:setLeftRight( true, false, 61, 264.95 )
				self.LargeTriangle:setTopBottom( true, false, 71.89, 238.91 )
				self.LargeTriangle:setAlpha( 1 )
				LargeTriangleFrame2( LargeTriangle, {} )
				local TriangleTopFrame2 = function ( TriangleTop, event )
					if not event.interrupted then
						TriangleTop:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
					TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
					TriangleTop:setRGB( 1, 0.55, 0.14 )
					TriangleTop:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( TriangleTop, event )
					else
						TriangleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TriangleTop:completeAnimation()
				self.TriangleTop:setLeftRight( true, false, 168.42, 157.14 )
				self.TriangleTop:setTopBottom( true, false, 85.16, 75.5 )
				self.TriangleTop:setRGB( 0.78, 0.13, 0.13 )
				self.TriangleTop:setZRot( 0 )
				TriangleTopFrame2( TriangleTop, {} )
				local f70_local6 = function ( f77_arg0, f77_arg1 )
					if not f77_arg1.interrupted then
						f77_arg0:beginAnimation( "keyframe", 439, false, true, CoD.TweenType.Back )
					end
					f77_arg0:setAlpha( 1 )
					f77_arg0:setYRot( 0 )
					if f77_arg1.interrupted then
						self.clipFinished( f77_arg0, f77_arg1 )
					else
						f77_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconWeak:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				IconWeak:setAlpha( 1 )
				IconWeak:setYRot( -90 )
				IconWeak:registerEventHandler( "transition_complete_keyframe", f70_local6 )
				local f70_local7 = function ( f78_arg0, f78_arg1 )
					if not f78_arg1.interrupted then
						f78_arg0:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Back )
					end
					f78_arg0:setAlpha( 0 )
					f78_arg0:setYRot( -90 )
					if f78_arg1.interrupted then
						self.clipFinished( f78_arg0, f78_arg1 )
					else
						f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconDestroy:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				iconDestroy:setAlpha( 1 )
				iconDestroy:setYRot( 0 )
				iconDestroy:registerEventHandler( "transition_complete_keyframe", f70_local7 )
				local FrameSideFrame2 = function ( FrameSide, event )
					if not event.interrupted then
						FrameSide:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Linear )
					end
					FrameSide:setLeftRight( true, false, 128, 133 )
					FrameSide:setTopBottom( true, false, 106.5, 146.83 )
					FrameSide:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FrameSide, event )
					else
						FrameSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FrameSide:completeAnimation()
				self.FrameSide:setLeftRight( true, false, 64, 69 )
				self.FrameSide:setTopBottom( true, false, 106.5, 146.83 )
				self.FrameSide:setAlpha( 1 )
				FrameSideFrame2( FrameSide, {} )
				local f70_local9 = function ( f80_arg0, f80_arg1 )
					if not f80_arg1.interrupted then
						f80_arg0:beginAnimation( "keyframe", 370, true, true, CoD.TweenType.Linear )
						f80_arg0.MetersBase:beginAnimation( "subkeyframe", 370, true, true, CoD.TweenType.Linear )
						f80_arg0.MetersTop:beginAnimation( "subkeyframe", 370, true, true, CoD.TweenType.Linear )
					end
					f80_arg0:setAlpha( 1 )
					f80_arg0.MetersBase:setAlpha( 0 )
					f80_arg0.MetersTop:setAlpha( 0 )
					if f80_arg1.interrupted then
						self.clipFinished( f80_arg0, f80_arg1 )
					else
						f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Meters:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				Meters.MetersBase:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
				Meters.MetersTop:beginAnimation( "subkeyframe", 529, false, false, CoD.TweenType.Linear )
				Meters:setAlpha( 1 )
				Meters.MetersBase:setAlpha( 1 )
				Meters.MetersTop:setAlpha( 1 )
				Meters:registerEventHandler( "transition_complete_keyframe", f70_local9 )
				local f70_local10 = function ( f81_arg0, f81_arg1 )
					if not f81_arg1.interrupted then
						f81_arg0:beginAnimation( "keyframe", 390, true, false, CoD.TweenType.Linear )
					end
					f81_arg0:setLeftRight( true, false, 71, 123.33 )
					f81_arg0:setTopBottom( true, false, 116.84, 120.17 )
					f81_arg0:setAlpha( 0 )
					if f81_arg1.interrupted then
						self.clipFinished( f81_arg0, f81_arg1 )
					else
						f81_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DestroyLineTop:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				DestroyLineTop:setLeftRight( true, false, 71, 123.33 )
				DestroyLineTop:setTopBottom( true, false, 87.84, 91.16 )
				DestroyLineTop:setAlpha( 1 )
				DestroyLineTop:registerEventHandler( "transition_complete_keyframe", f70_local10 )
				local f70_local11 = function ( f82_arg0, f82_arg1 )
					if not f82_arg1.interrupted then
						f82_arg0:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					f82_arg0:setLeftRight( true, false, 71, 123.33 )
					f82_arg0:setTopBottom( true, false, 136, 132.84 )
					f82_arg0:setAlpha( 0 )
					if f82_arg1.interrupted then
						self.clipFinished( f82_arg0, f82_arg1 )
					else
						f82_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DestroyLineBottom:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				DestroyLineBottom:setLeftRight( true, false, 71, 123.33 )
				DestroyLineBottom:setTopBottom( true, false, 164, 160.84 )
				DestroyLineBottom:setAlpha( 1 )
				DestroyLineBottom:registerEventHandler( "transition_complete_keyframe", f70_local11 )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					local ArrowLeftFrame3 = function ( ArrowLeft, event )
						if not event.interrupted then
							ArrowLeft:beginAnimation( "keyframe", 920, true, true, CoD.TweenType.Linear )
						end
						ArrowLeft:setLeftRight( true, false, 116.67, 110 )
						ArrowLeft:setTopBottom( true, false, 119.66, 133 )
						ArrowLeft:setAlpha( 1 )
						ArrowLeft:setYRot( 0 )
						ArrowLeft:setZRot( 180 )
						if event.interrupted then
							self.clipFinished( ArrowLeft, event )
						else
							ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArrowLeftFrame3( ArrowLeft, event )
						return 
					else
						ArrowLeft:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ArrowLeft:setZRot( 180 )
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", ArrowLeftFrame3 )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( true, false, 52.67, 46 )
				self.ArrowLeft:setTopBottom( true, false, 119.66, 133 )
				self.ArrowLeft:setAlpha( 1 )
				self.ArrowLeft:setYRot( 0 )
				self.ArrowLeft:setZRot( 0 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local SidesFrame2 = function ( Sides, event )
					if not event.interrupted then
						Sides:beginAnimation( "keyframe", 1000, true, false, CoD.TweenType.Linear )
					end
					Sides:setLeftRight( true, false, 128, 195.85 )
					Sides:setTopBottom( true, false, 104.16, 153.83 )
					Sides:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Sides, event )
					else
						Sides:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sides:completeAnimation()
				self.Sides:setLeftRight( true, false, 128, 195.85 )
				self.Sides:setTopBottom( true, false, 104.16, 153.83 )
				self.Sides:setAlpha( 1 )
				SidesFrame2( Sides, {} )
				local AreaTextFrame2 = function ( AreaText, event )
					if not event.interrupted then
						AreaText:beginAnimation( "keyframe", 389, true, false, CoD.TweenType.Linear )
					end
					AreaText:setLeftRight( true, false, 113.28, 210.28 )
					AreaText:setTopBottom( true, false, 96.84, 151.84 )
					AreaText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AreaText, event )
					else
						AreaText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AreaText:completeAnimation()
				self.AreaText:setLeftRight( true, false, 48.16, 145.16 )
				self.AreaText:setTopBottom( true, false, 97.83, 152.83 )
				self.AreaText:setAlpha( 1 )
				AreaTextFrame2( AreaText, {} )
				local DistanceTextFrame2 = function ( DistanceText, event )
					if not event.interrupted then
						DistanceText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					DistanceText:setLeftRight( true, false, 213.61, 265 )
					DistanceText:setTopBottom( true, false, 98.91, 111.41 )
					DistanceText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DistanceText, event )
					else
						DistanceText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DistanceText:completeAnimation()
				self.DistanceText:setLeftRight( true, false, 213.61, 265 )
				self.DistanceText:setTopBottom( true, false, 98.91, 111.41 )
				self.DistanceText:setAlpha( 1 )
				DistanceTextFrame2( DistanceText, {} )
				local f70_local16 = function ( f88_arg0, f88_arg1 )
					if not f88_arg1.interrupted then
						f88_arg0:beginAnimation( "keyframe", 569, true, false, CoD.TweenType.Linear )
					end
					f88_arg0:setLeftRight( true, false, 75.92, 195.98 )
					f88_arg0:setTopBottom( true, false, 146.83, 225.83 )
					f88_arg0:setAlpha( 0 )
					if f88_arg1.interrupted then
						self.clipFinished( f88_arg0, f88_arg1 )
					else
						f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				DataText:setLeftRight( true, false, 169.94, 290 )
				DataText:setTopBottom( true, false, 146, 225 )
				DataText:setAlpha( 1 )
				DataText:registerEventHandler( "transition_complete_keyframe", f70_local16 )
				local f70_local17 = function ( f89_arg0, f89_arg1 )
					local f89_local0 = function ( f90_arg0, f90_arg1 )
						local f90_local0 = function ( f91_arg0, f91_arg1 )
							local f91_local0 = function ( f92_arg0, f92_arg1 )
								local f92_local0 = function ( f93_arg0, f93_arg1 )
									local f93_local0 = function ( f94_arg0, f94_arg1 )
										local f94_local0 = function ( f95_arg0, f95_arg1 )
											local f95_local0 = function ( f96_arg0, f96_arg1 )
												if not f96_arg1.interrupted then
													f96_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													f96_arg0.LineLowerL:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
													f96_arg0.LineLowerM:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
													f96_arg0.LineLowerR:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
													f96_arg0.DescLbl:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
												end
												f96_arg0:setLeftRight( true, false, 206.5, 329.49 )
												f96_arg0:setTopBottom( true, false, 115.5, 140.83 )
												f96_arg0:setAlpha( 1 )
												f96_arg0.LineLowerL:setRGB( 1, 0.55, 0.14 )
												f96_arg0.LineLowerM:setRGB( 1, 0.55, 0.14 )
												f96_arg0.LineLowerR:setRGB( 1, 0.55, 0.14 )
												f96_arg0.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
												if f96_arg1.interrupted then
													self.clipFinished( f96_arg0, f96_arg1 )
												else
													f96_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f95_arg1.interrupted then
												f95_local0( f95_arg0, f95_arg1 )
												return 
											else
												f95_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												f95_arg0.LineLowerL:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
												f95_arg0.LineLowerM:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
												f95_arg0.LineLowerR:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
												f95_arg0.DescLbl:beginAnimation( "subkeyframe", 129, false, false, CoD.TweenType.Linear )
												f95_arg0:setLeftRight( true, false, 206.5, 325.44 )
												f95_arg0.LineLowerL:setRGB( 0.95, 0.46, 0.14 )
												f95_arg0.LineLowerM:setRGB( 0.95, 0.46, 0.14 )
												f95_arg0.LineLowerR:setRGB( 0.95, 0.46, 0.14 )
												f95_arg0.DescLbl:setText( Engine.Localize( "W E A K N E S S" ) )
												f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
											end
										end
										
										if f94_arg1.interrupted then
											f94_local0( f94_arg0, f94_arg1 )
											return 
										else
											f94_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											f94_arg0.LineLowerL:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
											f94_arg0.LineLowerM:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
											f94_arg0.LineLowerR:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
											f94_arg0.DescLbl:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
											f94_arg0:setLeftRight( true, false, 206.5, 321.39 )
											f94_arg0.LineLowerL:setRGB( 0.9, 0.37, 0.13 )
											f94_arg0.LineLowerM:setRGB( 0.9, 0.37, 0.13 )
											f94_arg0.LineLowerR:setRGB( 0.9, 0.37, 0.13 )
											f94_arg0.DescLbl:setText( Engine.Localize( "W W K N E E" ) )
											f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
										end
									end
									
									if f93_arg1.interrupted then
										f93_local0( f93_arg0, f93_arg1 )
										return 
									else
										f93_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f93_arg0.LineLowerL:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										f93_arg0.LineLowerM:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										f93_arg0.LineLowerR:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										f93_arg0.DescLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										f93_arg0:setLeftRight( true, false, 206.5, 319.53 )
										f93_arg0.LineLowerL:setRGB( 0.88, 0.33, 0.13 )
										f93_arg0.LineLowerM:setRGB( 0.88, 0.33, 0.13 )
										f93_arg0.LineLowerR:setRGB( 0.88, 0.33, 0.13 )
										f93_arg0.DescLbl:setText( Engine.Localize( "D S T R Y W" ) )
										f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
									end
								end
								
								if f92_arg1.interrupted then
									f92_local0( f92_arg0, f92_arg1 )
									return 
								else
									f92_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									f92_arg0.LineLowerL:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
									f92_arg0.LineLowerM:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
									f92_arg0.LineLowerR:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
									f92_arg0.DescLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
									f92_arg0:setLeftRight( true, false, 206.5, 318.9 )
									f92_arg0.LineLowerL:setRGB( 0.88, 0.31, 0.13 )
									f92_arg0.LineLowerM:setRGB( 0.88, 0.31, 0.13 )
									f92_arg0.LineLowerR:setRGB( 0.88, 0.31, 0.13 )
									f92_arg0.DescLbl:setText( Engine.Localize( "W K N R O Y" ) )
									f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
								end
							end
							
							if f91_arg1.interrupted then
								f91_local0( f91_arg0, f91_arg1 )
								return 
							else
								f91_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								f91_arg0.LineLowerL:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								f91_arg0.LineLowerM:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								f91_arg0.LineLowerR:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								f91_arg0.DescLbl:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								f91_arg0:setLeftRight( true, false, 206.5, 318.28 )
								f91_arg0.LineLowerL:setRGB( 0.87, 0.3, 0.13 )
								f91_arg0.LineLowerM:setRGB( 0.87, 0.3, 0.13 )
								f91_arg0.LineLowerR:setRGB( 0.87, 0.3, 0.13 )
								f91_arg0.DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
								f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
							end
						end
						
						if f90_arg1.interrupted then
							f90_local0( f90_arg0, f90_arg1 )
							return 
						else
							f90_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f90_arg0.LineLowerL:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							f90_arg0.LineLowerM:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							f90_arg0.LineLowerR:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							f90_arg0.DescLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							f90_arg0:setLeftRight( true, false, 206.5, 317.34 )
							f90_arg0.LineLowerL:setRGB( 0.86, 0.28, 0.13 )
							f90_arg0.LineLowerM:setRGB( 0.86, 0.28, 0.13 )
							f90_arg0.LineLowerR:setRGB( 0.86, 0.28, 0.13 )
							f90_arg0.DescLbl:setText( Engine.Localize( "W E A T R Y" ) )
							f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
						end
					end
					
					if f89_arg1.interrupted then
						f89_local0( f89_arg0, f89_arg1 )
						return 
					else
						f89_arg0:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Linear )
						f89_arg0.LineLowerL:beginAnimation( "subkeyframe", 210, true, true, CoD.TweenType.Linear )
						f89_arg0.LineLowerM:beginAnimation( "subkeyframe", 210, true, true, CoD.TweenType.Linear )
						f89_arg0.LineLowerR:beginAnimation( "subkeyframe", 210, true, true, CoD.TweenType.Linear )
						f89_arg0:setLeftRight( true, false, 206.5, 317.03 )
						f89_arg0.LineLowerL:setRGB( 0.85, 0.27, 0.13 )
						f89_arg0.LineLowerM:setRGB( 0.85, 0.27, 0.13 )
						f89_arg0.LineLowerR:setRGB( 0.85, 0.27, 0.13 )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
				end
				
				MessageText:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				MessageText.LineLowerL:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Linear )
				MessageText.LineLowerM:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Linear )
				MessageText.LineLowerR:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Linear )
				MessageText.DescLbl:beginAnimation( "subkeyframe", 389, false, false, CoD.TweenType.Linear )
				MessageText:setLeftRight( true, false, 206.5, 310.49 )
				MessageText:setTopBottom( true, false, 115.5, 140.83 )
				MessageText:setAlpha( 1 )
				MessageText.LineLowerL:setRGB( 0.78, 0.13, 0.13 )
				MessageText.LineLowerM:setRGB( 0.78, 0.13, 0.13 )
				MessageText.LineLowerR:setRGB( 0.78, 0.13, 0.13 )
				MessageText.DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
				MessageText:registerEventHandler( "transition_complete_keyframe", f70_local17 )
				local DataTextState2Frame2 = function ( DataTextState2, event )
					if not event.interrupted then
						DataTextState2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
					DataTextState2:setTopBottom( true, false, 145, 150 )
					DataTextState2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DataTextState2, event )
					else
						DataTextState2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DataTextState2:completeAnimation()
				self.DataTextState2:setLeftRight( true, false, 212.67, 290.06 )
				self.DataTextState2:setTopBottom( true, false, 145, 150 )
				self.DataTextState2:setAlpha( 0 )
				DataTextState2Frame2( DataTextState2, {} )
				local ArrowRightFrame2 = function ( ArrowRight, event )
					if not event.interrupted then
						ArrowRight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					ArrowRight:setLeftRight( true, false, 214.67, 208 )
					ArrowRight:setTopBottom( true, false, 119.66, 133 )
					ArrowRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowRight, event )
					else
						ArrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( true, false, 214.67, 208 )
				self.ArrowRight:setTopBottom( true, false, 119.66, 133 )
				self.ArrowRight:setAlpha( 0 )
				ArrowRightFrame2( ArrowRight, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CircleAnim:close()
		element.BackBox:close()
		element.SpikeLauncherLine:close()
		element.Meters:close()
		element.Sides:close()
		element.AreaText:close()
		element.DistanceText:close()
		element.DataText:close()
		element.MessageText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

