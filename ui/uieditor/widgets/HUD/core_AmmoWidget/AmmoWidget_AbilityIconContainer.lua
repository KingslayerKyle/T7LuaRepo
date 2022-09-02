-- 33057376cac676f0f7eac76ce9428dcd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityAftStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityFill" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityForeStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityIcon" )

CoD.AmmoWidget_AbilityIconContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityIconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityIconContainer )
	self.id = "AmmoWidget_AbilityIconContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( false, false, -63.83, 64.17 )
	BackGlow:setTopBottom( false, false, -64, 64 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0.3 )
	BackGlow:setScale( 0.7 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local AbilityAftStroke = CoD.AmmoWidget_AbilityAftStroke.new( menu, controller )
	AbilityAftStroke:setLeftRight( true, true, 0.33, 0 )
	AbilityAftStroke:setTopBottom( true, true, 0, 0.33 )
	AbilityAftStroke:setZoom( -15 )
	AbilityAftStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityAftStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
	AbilityAftStroke:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityAftStroke )
	self.AbilityAftStroke = AbilityAftStroke
	
	local Fill = CoD.AmmoWidget_AbilityFill.new( menu, controller )
	Fill:setLeftRight( true, false, 0.33, 47 )
	Fill:setTopBottom( true, false, 0, 57.33 )
	Fill:setAlpha( 0.6 )
	Fill:setZoom( 5 )
	Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
	Fill:setShaderVector( 1, 0, 0, 0, 0 )
	Fill:setShaderVector( 2, 0, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	Fill:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local ForeStroke = CoD.AmmoWidget_AbilityForeStroke.new( menu, controller )
	ForeStroke:setLeftRight( true, false, 0, 48 )
	ForeStroke:setTopBottom( true, false, 0, 57 )
	ForeStroke:setZoom( -8 )
	ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
	ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ForeStroke )
	self.ForeStroke = ForeStroke
	
	local AbilityIcon = CoD.AmmoWidget_AbilityIcon.new( menu, controller )
	AbilityIcon:setLeftRight( true, false, 5, 42 )
	AbilityIcon:setTopBottom( true, false, 10, 47 )
	AbilityIcon:setZoom( 8 )
	AbilityIcon:setScale( 1.9 )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				self.clipFinished( BackGlow, {} )

				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				self.clipFinished( Fill, {} )

				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				self.clipFinished( ForeStroke, {} )

				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 8 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.2 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					local AbilityIconFrame3 = function ( AbilityIcon, event )
						if not event.interrupted then
							AbilityIcon:beginAnimation( "keyframe", 560, true, true, CoD.TweenType.Back )
						end
						AbilityIcon:setLeftRight( true, false, 5, 42 )
						AbilityIcon:setTopBottom( true, false, 10, 47 )
						AbilityIcon:setAlpha( 0.5 )
						AbilityIcon:setZoom( 8 )
						if event.interrupted then
							self.clipFinished( AbilityIcon, event )
						else
							AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityIconFrame3( AbilityIcon, event )
						return 
					else
						AbilityIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", AbilityIconFrame3 )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				self.clipFinished( Fill, {} )

				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				self.clipFinished( ForeStroke, {} )

				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 8 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )
				local f36_local0 = function ( f37_arg0, f37_arg1 )
					if not f37_arg1.interrupted then
						f37_arg0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					f37_arg0:setAlpha( 0.5 )
					f37_arg0:setZoom( -15 )
					if f37_arg1.interrupted then
						self.clipFinished( f37_arg0, f37_arg1 )
					else
						f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				AbilityAftStroke:setAlpha( 1 )
				AbilityAftStroke:setZoom( -15 )
				AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", f36_local0 )
				local f36_local1 = function ( f38_arg0, f38_arg1 )
					if not f38_arg1.interrupted then
						f38_arg0:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Back )
					end
					f38_arg0:setAlpha( 0 )
					f38_arg0:setZoom( -10 )
					if f38_arg1.interrupted then
						self.clipFinished( f38_arg0, f38_arg1 )
					else
						f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0.2 )
				Fill:setZoom( -10 )
				Fill:registerEventHandler( "transition_complete_keyframe", f36_local1 )
				local f36_local2 = function ( f39_arg0, f39_arg1 )
					if not f39_arg1.interrupted then
						f39_arg0:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					f39_arg0:setAlpha( 0.5 )
					f39_arg0:setZoom( -5 )
					if f39_arg1.interrupted then
						self.clipFinished( f39_arg0, f39_arg1 )
					else
						f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 1 )
				ForeStroke:setZoom( -5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", f36_local2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 540, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				self.clipFinished( BackGlow, {} )

				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				self.clipFinished( Fill, {} )

				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				self.clipFinished( ForeStroke, {} )

				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 8 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.2 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.5 )
					AbilityIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.3 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local f54_local2 = function ( f57_arg0, f57_arg1 )
					if not f57_arg1.interrupted then
						f57_arg0:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					f57_arg0:setAlpha( 0 )
					f57_arg0:setZoom( -10 )
					if f57_arg1.interrupted then
						self.clipFinished( f57_arg0, f57_arg1 )
					else
						f57_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0.4 )
				Fill:setZoom( -8 )
				Fill:registerEventHandler( "transition_complete_keyframe", f54_local2 )
				local f54_local3 = function ( f58_arg0, f58_arg1 )
					if not f58_arg1.interrupted then
						f58_arg0:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					f58_arg0:setAlpha( 0.5 )
					f58_arg0:setZoom( -5 )
					if f58_arg1.interrupted then
						self.clipFinished( f58_arg0, f58_arg1 )
					else
						f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 1 )
				ForeStroke:setZoom( 5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", f54_local3 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 469, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		NoGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.clipFinished( Fill, {} )

				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				self.clipFinished( ForeStroke, {} )

				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 0 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )
				local f67_local0 = function ( f68_arg0, f68_arg1 )
					if not f68_arg1.interrupted then
						f68_arg0:beginAnimation( "keyframe", 749, false, true, CoD.TweenType.Back )
					end
					f68_arg0:setAlpha( 1 )
					f68_arg0:setZoom( -15 )
					if f68_arg1.interrupted then
						self.clipFinished( f68_arg0, f68_arg1 )
					else
						f68_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				AbilityAftStroke:setAlpha( 0.5 )
				AbilityAftStroke:setZoom( -15 )
				AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", f67_local0 )
				local f67_local1 = function ( f69_arg0, f69_arg1 )
					if not f69_arg1.interrupted then
						f69_arg0:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					f69_arg0:setAlpha( 0.2 )
					f69_arg0:setZoom( -10 )
					if f69_arg1.interrupted then
						self.clipFinished( f69_arg0, f69_arg1 )
					else
						f69_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0 )
				Fill:setZoom( -10 )
				Fill:registerEventHandler( "transition_complete_keyframe", f67_local1 )
				local f67_local2 = function ( f70_arg0, f70_arg1 )
					if not f70_arg1.interrupted then
						f70_arg0:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					f70_arg0:setAlpha( 1 )
					f70_arg0:setZoom( -5 )
					if f70_arg1.interrupted then
						self.clipFinished( f70_arg0, f70_arg1 )
					else
						f70_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 0.5 )
				ForeStroke:setZoom( -5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", f67_local2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.5 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 8 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )

				local BackGlowFrame2 = function ( BackGlow, event )
					if not event.interrupted then
						BackGlow:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					BackGlow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( BackGlow, event )
					else
						BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 8 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 0 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f78_local0
				if not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f78_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f78_local0 then
						if not WasHeroWeaponGadgetActivated( menu ) then
							f78_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.powerRatio", 1 )
						else
							f78_local0 = false
						end
					end
				else
					f78_local0 = false
				end
				return f78_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsSpecialGadgetAvailable( controller ) and not IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "NoGadget",
			condition = function ( menu, element, event )
				return not IsSpecialGadgetAvailable( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityAftStroke:close()
		element.Fill:close()
		element.ForeStroke:close()
		element.AbilityIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

