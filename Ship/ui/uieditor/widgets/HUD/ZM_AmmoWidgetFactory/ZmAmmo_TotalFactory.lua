-- 63e57aba3a9cbf97c8b699120582dc08
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmAmmo_TotalFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_TotalFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_TotalFactory )
	self.id = "ZmAmmo_TotalFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local TotalGlow = LUI.UIImage.new()
	TotalGlow:setLeftRight( true, false, 6.61, 75.39 )
	TotalGlow:setTopBottom( true, false, -9, 59 )
	TotalGlow:setRGB( 0.62, 0.33, 1 )
	TotalGlow:setAlpha( 0 )
	TotalGlow:setZRot( -4 )
	TotalGlow:setZoom( -101 )
	TotalGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	TotalGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TotalGlow )
	self.TotalGlow = TotalGlow
	
	local TotalGlowTop = LUI.UIImage.new()
	TotalGlowTop:setLeftRight( true, false, 13.8, 68.2 )
	TotalGlowTop:setTopBottom( true, false, -1.88, 53.88 )
	TotalGlowTop:setRGB( 0.25, 0.48, 0.79 )
	TotalGlowTop:setAlpha( 0 )
	TotalGlowTop:setZRot( -4 )
	TotalGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( TotalGlowTop )
	self.TotalGlowTop = TotalGlowTop
	
	local Total = LUI.UIText.new()
	Total:setLeftRight( true, false, 7.71, 73.9 )
	Total:setTopBottom( true, false, 4, 48 )
	Total:setRGB( 1, 0.99, 0.93 )
	Total:setAlpha( 0.94 )
	Total:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Total:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	Total:setShaderVector( 0, 0.2, 1, 0, 0 )
	Total:setShaderVector( 1, 0, 0, 0, 0 )
	Total:setShaderVector( 2, 0, 0, 0, 0 )
	Total:setShaderVector( 3, 0, 0, 0, 0 )
	Total:setShaderVector( 4, 0, 0, 0, 0 )
	Total:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Total:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Total:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		if ammoStock then
			Total:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( Total )
	self.Total = Total
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( true, false, 5.21, 82.41 )
	ZmFxSpark20:setTopBottom( true, false, -7, 56 )
	ZmFxSpark20:setRGB( 0, 0.56, 1 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local ZmFxFlsh = LUI.UIImage.new()
	ZmFxFlsh:setLeftRight( true, false, -0.79, 86.38 )
	ZmFxFlsh:setTopBottom( true, false, -9.5, 57.5 )
	ZmFxFlsh:setRGB( 0, 0.23, 1 )
	ZmFxFlsh:setAlpha( 0 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	local Lightning = LUI.UIImage.new()
	Lightning:setLeftRight( true, false, -7.19, 94.81 )
	Lightning:setTopBottom( true, false, -26, 66 )
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
				self:setupElementClipCounter( 5 )

				TotalGlow:completeAnimation()
				self.TotalGlow:setLeftRight( true, false, -6.88, 83.9 )
				self.TotalGlow:setTopBottom( true, false, -17, 69 )
				self.TotalGlow:setRGB( 0, 0.35, 0.58 )
				self.TotalGlow:setAlpha( 0.75 )
				self.clipFinished( TotalGlow, {} )

				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setLeftRight( true, false, 20.8, 65.2 )
				self.TotalGlowTop:setTopBottom( true, false, 4, 48.75 )
				self.TotalGlowTop:setRGB( 0.19, 0.99, 0.96 )
				self.TotalGlowTop:setAlpha( 0.1 )
				self.clipFinished( TotalGlowTop, {} )

				Total:completeAnimation()
				self.Total:setRGB( 1, 0.99, 0.93 )
				self.Total:setAlpha( 0.94 )
				self.Total:setZoom( 0 )
				self.clipFinished( Total, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 4 )

				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.26, 0.25 )
				self.clipFinished( TotalGlow, {} )

				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( TotalGlowTop, {} )

				Total:completeAnimation()
				self.Total:setRGB( 1, 0.49, 0.49 )
				self.Total:setZoom( 0 )
				self.clipFinished( Total, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					if not event.interrupted then
						ZmFxFlsh:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					ZmFxFlsh:setRGB( 1, 0, 0 )
					ZmFxFlsh:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmFxFlsh, event )
					else
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 0, 0 )
				self.ZmFxFlsh:setAlpha( 0.42 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )

				local TotalGlowFrame2 = function ( TotalGlow, event )
					if not event.interrupted then
						TotalGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlow:setRGB( 0.79, 0.5, 0.25 )
					TotalGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalGlow, event )
					else
						TotalGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.5, 0.25 )
				self.TotalGlow:setAlpha( 0.48 )
				TotalGlowFrame2( TotalGlow, {} )
				local TotalGlowTopFrame2 = function ( TotalGlowTop, event )
					if not event.interrupted then
						TotalGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlowTop:setRGB( 1, 0.97, 0.33 )
					TotalGlowTop:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalGlowTop, event )
					else
						TotalGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.97, 0.33 )
				self.TotalGlowTop:setAlpha( 0.27 )
				TotalGlowTopFrame2( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					if not event.interrupted then
						Total:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Total:setRGB( 1, 0.99, 0.93 )
					Total:setAlpha( 0 )
					Total:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Total, event )
					else
						Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Total:completeAnimation()
				self.Total:setRGB( 1, 0.99, 0.93 )
				self.Total:setAlpha( 0.94 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )
			end,
			AmmoPickup = function ()
				self:setupElementClipCounter( 5 )

				TotalGlow:completeAnimation()
				self.TotalGlow:setAlpha( 0.48 )
				self.clipFinished( TotalGlow, {} )

				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setAlpha( 0.27 )
				self.clipFinished( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					if not event.interrupted then
						Total:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Total:setLeftRight( true, false, 7.71, 73.9 )
					Total:setTopBottom( true, false, 4, 48 )
					Total:setRGB( 1, 0.99, 0.93 )
					Total:setAlpha( 0.94 )
					Total:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Total, event )
					else
						Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Total:completeAnimation()
				self.Total:setLeftRight( true, false, 7.71, 73.9 )
				self.Total:setTopBottom( true, false, 34, 78 )
				self.Total:setRGB( 1, 0.99, 0.93 )
				self.Total:setAlpha( 0.05 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.26, 0.25 )
				self.TotalGlow:setAlpha( 0.48 )
				self.clipFinished( TotalGlow, {} )

				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.33, 0.36 )
				self.TotalGlowTop:setAlpha( 0.27 )
				self.clipFinished( TotalGlowTop, {} )

				Total:completeAnimation()
				self.Total:setRGB( 1, 0.49, 0.49 )
				self.Total:setAlpha( 0.94 )
				self.Total:setZoom( 0 )
				self.clipFinished( Total, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 1, 1 )
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )

				local TotalGlowFrame2 = function ( TotalGlow, event )
					if not event.interrupted then
						TotalGlow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					TotalGlow:setRGB( 0.79, 0.5, 0.25 )
					if event.interrupted then
						self.clipFinished( TotalGlow, event )
					else
						TotalGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.26, 0.25 )
				TotalGlowFrame2( TotalGlow, {} )
				local TotalGlowTopFrame2 = function ( TotalGlowTop, event )
					if not event.interrupted then
						TotalGlowTop:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					TotalGlowTop:setRGB( 1, 0.97, 0.33 )
					if event.interrupted then
						self.clipFinished( TotalGlowTop, event )
					else
						TotalGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.33, 0.36 )
				TotalGlowTopFrame2( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					local TotalFrame3 = function ( Total, event )
						if not event.interrupted then
							Total:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
						end
						Total:setRGB( 1, 0.99, 0.93 )
						Total:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( Total, event )
						else
							Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalFrame3( Total, event )
						return 
					else
						Total:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Total:setRGB( 1, 0.94, 0.88 )
						Total:setZoom( 25 )
						Total:registerEventHandler( "transition_complete_keyframe", TotalFrame3 )
					end
				end
				
				Total:completeAnimation()
				self.Total:setRGB( 1, 0.49, 0.49 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							local ZmFxSpark20Frame5 = function ( ZmFxSpark20, event )
								if not event.interrupted then
									ZmFxSpark20:beginAnimation( "keyframe", 499, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark20:setLeftRight( true, false, 14.21, 91.41 )
								ZmFxSpark20:setTopBottom( true, false, -49, 56 )
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
								ZmFxSpark20:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								ZmFxSpark20:setAlpha( 0.87 )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:setTopBottom( true, false, -49, 56 )
							ZmFxSpark20:setAlpha( 0.95 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setTopBottom( true, false, -16.13, 56 )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, 14.21, 91.41 )
				self.ZmFxSpark20:setTopBottom( true, false, -7, 56 )
				self.ZmFxSpark20:setAlpha( 0.67 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setRGB( 0, 0.5, 1 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 0.85 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 0, 0.5, 1 )
				self.ZmFxFlsh:setAlpha( 0.35 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						if not event.interrupted then
							Lightning:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						end
						Lightning:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Lightning, event )
						else
							Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Lightning:setAlpha( 1 )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )

				local TotalGlowFrame2 = function ( TotalGlow, event )
					if not event.interrupted then
						TotalGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlow:setRGB( 0.79, 0.26, 0.25 )
					TotalGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalGlow, event )
					else
						TotalGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.26, 0.25 )
				self.TotalGlow:setAlpha( 0.48 )
				TotalGlowFrame2( TotalGlow, {} )
				local TotalGlowTopFrame2 = function ( TotalGlowTop, event )
					if not event.interrupted then
						TotalGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlowTop:setRGB( 1, 0.33, 0.36 )
					TotalGlowTop:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalGlowTop, event )
					else
						TotalGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.33, 0.36 )
				self.TotalGlowTop:setAlpha( 0.27 )
				TotalGlowTopFrame2( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					if not event.interrupted then
						Total:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Total:setRGB( 1, 0.49, 0.49 )
					Total:setAlpha( 0 )
					Total:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Total, event )
					else
						Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Total:completeAnimation()
				self.Total:setRGB( 1, 0.49, 0.49 )
				self.Total:setAlpha( 0.94 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				TotalGlow:completeAnimation()
				self.TotalGlow:setAlpha( 0 )
				self.clipFinished( TotalGlow, {} )

				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setAlpha( 0 )
				self.clipFinished( TotalGlowTop, {} )

				Total:completeAnimation()
				self.Total:setAlpha( 0 )
				self.clipFinished( Total, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local TotalGlowFrame2 = function ( TotalGlow, event )
					if not event.interrupted then
						TotalGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlow:setRGB( 0.79, 0.5, 0.25 )
					TotalGlow:setAlpha( 0.48 )
					if event.interrupted then
						self.clipFinished( TotalGlow, event )
					else
						TotalGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.5, 0.25 )
				self.TotalGlow:setAlpha( 0 )
				TotalGlowFrame2( TotalGlow, {} )
				local TotalGlowTopFrame2 = function ( TotalGlowTop, event )
					if not event.interrupted then
						TotalGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlowTop:setRGB( 1, 0.97, 0.33 )
					TotalGlowTop:setAlpha( 0.27 )
					if event.interrupted then
						self.clipFinished( TotalGlowTop, event )
					else
						TotalGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.97, 0.33 )
				self.TotalGlowTop:setAlpha( 0 )
				TotalGlowTopFrame2( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					if not event.interrupted then
						Total:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Total:setRGB( 1, 0.99, 0.93 )
					Total:setAlpha( 0.94 )
					Total:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Total, event )
					else
						Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Total:completeAnimation()
				self.Total:setRGB( 1, 0.99, 0.93 )
				self.Total:setAlpha( 0 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 3 )

				local TotalGlowFrame2 = function ( TotalGlow, event )
					if not event.interrupted then
						TotalGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlow:setRGB( 0.79, 0.26, 0.25 )
					TotalGlow:setAlpha( 0.48 )
					if event.interrupted then
						self.clipFinished( TotalGlow, event )
					else
						TotalGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.26, 0.25 )
				self.TotalGlow:setAlpha( 0 )
				TotalGlowFrame2( TotalGlow, {} )
				local TotalGlowTopFrame2 = function ( TotalGlowTop, event )
					if not event.interrupted then
						TotalGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalGlowTop:setRGB( 1, 0.33, 0.36 )
					TotalGlowTop:setAlpha( 0.27 )
					if event.interrupted then
						self.clipFinished( TotalGlowTop, event )
					else
						TotalGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.33, 0.36 )
				self.TotalGlowTop:setAlpha( 0 )
				TotalGlowTopFrame2( TotalGlowTop, {} )
				local TotalFrame2 = function ( Total, event )
					if not event.interrupted then
						Total:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Total:setRGB( 1, 0.49, 0.49 )
					Total:setAlpha( 0.94 )
					Total:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Total, event )
					else
						Total:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Total:completeAnimation()
				self.Total:setRGB( 1, 0.49, 0.49 )
				self.Total:setAlpha( 0 )
				self.Total:setZoom( 0 )
				TotalFrame2( Total, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return ModelValueStartsWithAny( controller, "currentWeapon.equippedWeaponReference", "elemental_bow", "skull_gun_", "dragon_gauntlet" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "hudItems.ammoPickedUp", function ( model )
		local f42_local0 = self
		PlayClip( self, "AmmoPickup", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
		element.Total:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
