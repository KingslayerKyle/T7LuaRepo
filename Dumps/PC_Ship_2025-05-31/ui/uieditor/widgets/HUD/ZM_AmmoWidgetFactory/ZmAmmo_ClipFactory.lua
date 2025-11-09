require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_ClipPress" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmAmmo_ClipFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ClipFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_ClipFactory )
	self.id = "ZmAmmo_ClipFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local ClipGlowTop = LUI.UIImage.new()
	ClipGlowTop:setLeftRight( true, false, 15.4, 89.6 )
	ClipGlowTop:setTopBottom( true, false, -13.75, 62 )
	ClipGlowTop:setRGB( 0.33, 0.54, 1 )
	ClipGlowTop:setAlpha( 0.75 )
	ClipGlowTop:setZRot( -4 )
	ClipGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ClipGlowTop )
	self.ClipGlowTop = ClipGlowTop
	
	local ClipGlow = LUI.UIImage.new()
	ClipGlow:setLeftRight( true, false, 22.5, 83.28 )
	ClipGlow:setTopBottom( true, false, -9, 53.5 )
	ClipGlow:setRGB( 0, 0.53, 0.82 )
	ClipGlow:setAlpha( 0.3 )
	ClipGlow:setZRot( -4 )
	ClipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ClipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipGlow )
	self.ClipGlow = ClipGlow
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( true, false, 0, 108 )
	Clip:setTopBottom( true, false, -9, 55 )
	Clip:setText( Engine.Localize( "33" ) )
	Clip:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	Clip:setShaderVector( 0, 0.2, 1, 0, 0 )
	Clip:setShaderVector( 1, 0, 0, 0, 0 )
	Clip:setShaderVector( 2, 0, 0, 0, 0 )
	Clip:setShaderVector( 3, 0, 0, 0, 0 )
	Clip:setShaderVector( 4, 0, 0, 0, 0 )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Clip )
	self.Clip = Clip
	
	local ClipContainerPress00 = CoD.ZmAmmo_ClipPress.new( menu, controller )
	ClipContainerPress00:setLeftRight( false, false, -51, 57 )
	ClipContainerPress00:setTopBottom( false, false, -22, 20 )
	ClipContainerPress00:setAlpha( 0 )
	ClipContainerPress00:mergeStateConditions( {
		{
			stateName = "NoAmmoPress",
			condition = function ( menu, element, event )
				return PulseNoAmmo( controller )
			end
		}
	} )
	ClipContainerPress00:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoAmmo" ), function ( model )
		menu:updateElementState( ClipContainerPress00, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.pulseNoAmmo"
		} )
	end )
	self:addElement( ClipContainerPress00 )
	self.ClipContainerPress00 = ClipContainerPress00
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( true, false, 26.27, 81.73 )
	ZmFxSpark20:setTopBottom( true, false, -40, 55 )
	ZmFxSpark20:setRGB( 0, 0.67, 1 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local Lightning = LUI.UIImage.new()
	Lightning:setLeftRight( true, false, -20.5, 130.5 )
	Lightning:setTopBottom( true, false, -59, 85 )
	Lightning:setAlpha( 0 )
	Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning )
	self.Lightning = Lightning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setLeftRight( true, false, 25.8, 108 )
				self.ClipGlowTop:setTopBottom( true, false, -18.38, 64.38 )
				self.ClipGlowTop:setRGB( 0, 0.42, 0.58 )
				self.ClipGlowTop:setAlpha( 0.75 )
				self.clipFinished( ClipGlowTop, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setLeftRight( true, false, 44.01, 87.79 )
				self.ClipGlow:setTopBottom( true, false, 1, 45.25 )
				self.ClipGlow:setRGB( 0.19, 0.99, 0.97 )
				self.ClipGlow:setAlpha( 0.1 )
				self.clipFinished( ClipGlow, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.99, 0.93 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 6 )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 1 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setAlpha( 0 )
				self.clipFinished( ClipGlowTop, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setAlpha( 0 )
				self.clipFinished( ClipGlow, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 0, 0, 0 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								if not event.interrupted then
									Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								Clip:setRGB( 1, 0.99, 0.93 )
								if event.interrupted then
									self.clipFinished( Clip, event )
								else
									Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Clip:setRGB( 1, 0.99, 0.93 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 1, 0.49, 0.49 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.99, 0.93 )
				ClipFrame2( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local ClipGlowTopFrame2 = function ( ClipGlowTop, event )
					if not event.interrupted then
						ClipGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlowTop:setRGB( 0, 0.75, 1 )
					if event.interrupted then
						self.clipFinished( ClipGlowTop, event )
					else
						ClipGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				ClipGlowTopFrame2( ClipGlowTop, {} )
				local ClipGlowFrame2 = function ( ClipGlow, event )
					if not event.interrupted then
						ClipGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlow:setRGB( 0, 0.91, 1 )
					if event.interrupted then
						self.clipFinished( ClipGlow, event )
					else
						ClipGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				ClipGlowFrame2( ClipGlow, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						if not event.interrupted then
							Clip:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
						end
						Clip:setRGB( 1, 0.99, 0.93 )
						Clip:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( Clip, event )
						else
							Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 1, 0.93, 0.87 )
						Clip:setZoom( 46 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.Clip:setZoom( 0 )
				ClipFrame2( Clip, {} )
				local ClipContainerPress00Frame2 = function ( ClipContainerPress00, event )
					if not event.interrupted then
						ClipContainerPress00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipContainerPress00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress00, event )
					else
						ClipContainerPress00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				ClipContainerPress00Frame2( ClipContainerPress00, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setLeftRight( true, false, 5, 105 )
							ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Linear )
							ZmFxSpark20:setLeftRight( true, false, 5, 105 )
							ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setLeftRight( true, false, 16, 94 )
						ZmFxSpark20:setTopBottom( true, false, -9, 53.5 )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, 18, 92 )
				self.ZmFxSpark20:setTopBottom( true, false, -9, 60.5 )
				self.ZmFxSpark20:setAlpha( 0.52 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local f12_local5 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						local f22_local0 = function ( f23_arg0, f23_arg1 )
							if not f23_arg1.interrupted then
								f23_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							f23_arg0:setAlpha( 0 )
							if f23_arg1.interrupted then
								self.clipFinished( f23_arg0, f23_arg1 )
							else
								f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f22_arg1.interrupted then
							f22_local0( f22_arg0, f22_arg1 )
							return 
						else
							f22_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						f21_arg0:setAlpha( 1 )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				Lightning:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				Lightning:setAlpha( 0 )
				Lightning:registerEventHandler( "transition_complete_keyframe", f12_local5 )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 1 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local ClipGlowTopFrame2 = function ( ClipGlowTop, event )
					if not event.interrupted then
						ClipGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlowTop:setRGB( 0, 0.75, 1 )
					if event.interrupted then
						self.clipFinished( ClipGlowTop, event )
					else
						ClipGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				ClipGlowTopFrame2( ClipGlowTop, {} )
				local ClipGlowFrame2 = function ( ClipGlow, event )
					if not event.interrupted then
						ClipGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlow:setRGB( 0, 0.91, 1 )
					if event.interrupted then
						self.clipFinished( ClipGlow, event )
					else
						ClipGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				ClipGlowFrame2( ClipGlow, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						if not event.interrupted then
							Clip:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
						end
						Clip:setRGB( 1, 0.99, 0.93 )
						Clip:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( Clip, event )
						else
							Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 1, 0.93, 0.87 )
						Clip:setZoom( 46 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.Clip:setZoom( 0 )
				ClipFrame2( Clip, {} )
				local ClipContainerPress00Frame2 = function ( ClipContainerPress00, event )
					if not event.interrupted then
						ClipContainerPress00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipContainerPress00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress00, event )
					else
						ClipContainerPress00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				ClipContainerPress00Frame2( ClipContainerPress00, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							local ZmFxSpark20Frame5 = function ( ZmFxSpark20, event )
								if not event.interrupted then
									ZmFxSpark20:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark20:setLeftRight( true, false, 5, 105 )
								ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
								ZmFxSpark20:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark20, event )
								else
									ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark20Frame5( ZmFxSpark20, event )
								return 
							else
								ZmFxSpark20:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
								ZmFxSpark20:setAlpha( 0 )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Linear )
							ZmFxSpark20:setLeftRight( true, false, 5, 105 )
							ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setLeftRight( true, false, 16, 94 )
						ZmFxSpark20:setTopBottom( true, false, -9, 53.5 )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, 18, 92 )
				self.ZmFxSpark20:setTopBottom( true, false, -9, 60.5 )
				self.ZmFxSpark20:setAlpha( 0.52 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							local LightningFrame5 = function ( Lightning, event )
								if not event.interrupted then
									Lightning:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								end
								Lightning:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Lightning, event )
								else
									Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LightningFrame5( Lightning, event )
								return 
							else
								Lightning:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame5 )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							Lightning:setAlpha( 1 )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ClipContainerPress00:close()
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

