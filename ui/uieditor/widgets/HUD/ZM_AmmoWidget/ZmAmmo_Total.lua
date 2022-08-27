-- 38bfddfa67135731e917ec7ea212125e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmAmmo_Total = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_Total.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_Total )
	self.id = "ZmAmmo_Total"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local TotalGlowMult = LUI.UIImage.new()
	TotalGlowMult:setLeftRight( true, false, -9.29, 86.49 )
	TotalGlowMult:setTopBottom( true, false, -7, 59 )
	TotalGlowMult:setRGB( 0.59, 0.33, 0.11 )
	TotalGlowMult:setAlpha( 0.58 )
	TotalGlowMult:setZRot( -4 )
	TotalGlowMult:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	TotalGlowMult:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( TotalGlowMult )
	self.TotalGlowMult = TotalGlowMult
	
	local TotalBack = LUI.UIText.new()
	TotalBack:setLeftRight( true, false, 10.71, 76.9 )
	TotalBack:setTopBottom( true, false, 3, 47 )
	TotalBack:setRGB( 0.75, 0.47, 0.27 )
	TotalBack:setAlpha( 0.38 )
	TotalBack:setXRot( 180 )
	TotalBack:setYRot( 180 )
	TotalBack:setZoom( -20 )
	TotalBack:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TotalBack:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TotalBack:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TotalBack:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		if ammoStock then
			TotalBack:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( TotalBack )
	self.TotalBack = TotalBack
	
	local TotalElem = LUI.UIImage.new()
	TotalElem:setLeftRight( true, false, 25, 65 )
	TotalElem:setTopBottom( true, false, 8, 44 )
	TotalElem:setRGB( 1, 0.54, 0 )
	TotalElem:setZoom( -10 )
	TotalElem:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elmttlamo" ) )
	TotalElem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TotalElem )
	self.TotalElem = TotalElem
	
	local TotalGlow = LUI.UIImage.new()
	TotalGlow:setLeftRight( true, false, 10.71, 86.49 )
	TotalGlow:setTopBottom( true, false, -7, 59 )
	TotalGlow:setRGB( 0.79, 0.5, 0.25 )
	TotalGlow:setAlpha( 0.21 )
	TotalGlow:setZRot( -4 )
	TotalGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	TotalGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TotalGlow )
	self.TotalGlow = TotalGlow
	
	local TotalGlowTop = LUI.UIImage.new()
	TotalGlowTop:setLeftRight( true, false, 15.8, 70.2 )
	TotalGlowTop:setTopBottom( true, false, -6, 55.5 )
	TotalGlowTop:setRGB( 1, 0.97, 0.33 )
	TotalGlowTop:setAlpha( 0.18 )
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
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local ZmFxFlsh = LUI.UIImage.new()
	ZmFxFlsh:setLeftRight( true, false, -0.79, 86.38 )
	ZmFxFlsh:setTopBottom( true, false, -9.5, 57.5 )
	ZmFxFlsh:setAlpha( 0 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0.38 )
				self.clipFinished( TotalBack, {} )
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.54, 0 )
				self.TotalElem:setAlpha( 1 )
				self.clipFinished( TotalElem, {} )
				TotalGlow:completeAnimation()
				self.TotalGlow:setRGB( 0.79, 0.5, 0.25 )
				self.TotalGlow:setAlpha( 0.48 )
				self.clipFinished( TotalGlow, {} )
				TotalGlowTop:completeAnimation()
				self.TotalGlowTop:setRGB( 1, 0.97, 0.33 )
				self.TotalGlowTop:setAlpha( 0.27 )
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
				self:setupElementClipCounter( 5 )
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.15, 0 )
				self.clipFinished( TotalElem, {} )
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
				self:setupElementClipCounter( 5 )
				local TotalBackFrame2 = function ( TotalBack, event )
					if not event.interrupted then
						TotalBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalBack, event )
					else
						TotalBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0.38 )
				TotalBackFrame2( TotalBack, {} )
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalElem:setRGB( 1, 0.54, 0 )
					TotalElem:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.54, 0 )
				self.TotalElem:setAlpha( 1 )
				TotalElemFrame2( TotalElem, {} )
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
				self:setupElementClipCounter( 7 )
				local TotalBackFrame2 = function ( TotalBack, event )
					if not event.interrupted then
						TotalBack:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TotalBack:setLeftRight( true, false, 10.71, 76.9 )
					TotalBack:setTopBottom( true, false, 3, 47 )
					TotalBack:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( TotalBack, event )
					else
						TotalBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalBack:completeAnimation()
				self.TotalBack:setLeftRight( true, false, 10.71, 76.9 )
				self.TotalBack:setTopBottom( true, false, 38, 82 )
				self.TotalBack:setAlpha( 0.75 )
				TotalBackFrame2( TotalBack, {} )
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TotalElem:setLeftRight( true, false, 25, 65 )
					TotalElem:setTopBottom( true, false, 8, 44 )
					TotalElem:setRGB( 1, 0.54, 0 )
					TotalElem:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setLeftRight( true, false, 25, 65 )
				self.TotalElem:setTopBottom( true, false, 43, 79 )
				self.TotalElem:setRGB( 1, 0.54, 0 )
				self.TotalElem:setAlpha( 0.49 )
				TotalElemFrame2( TotalElem, {} )
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
				self:setupElementClipCounter( 7 )
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0.38 )
				self.clipFinished( TotalBack, {} )
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.15, 0 )
				self.TotalElem:setAlpha( 1 )
				self.clipFinished( TotalElem, {} )
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
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					TotalElem:setRGB( 1, 0.54, 0 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.15, 0 )
				TotalElemFrame2( TotalElem, {} )
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
						ZmFxFlsh:setRGB( 1, 1, 1 )
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
				self.ZmFxFlsh:setRGB( 1, 1, 1 )
				self.ZmFxFlsh:setAlpha( 0.35 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 5 )
				local TotalBackFrame2 = function ( TotalBack, event )
					if not event.interrupted then
						TotalBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalBack, event )
					else
						TotalBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0.38 )
				TotalBackFrame2( TotalBack, {} )
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalElem:setRGB( 1, 0.15, 0 )
					TotalElem:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.15, 0 )
				self.TotalElem:setAlpha( 1 )
				TotalElemFrame2( TotalElem, {} )
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
				self:setupElementClipCounter( 7 )
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0 )
				self.clipFinished( TotalBack, {} )
				TotalElem:completeAnimation()
				self.TotalElem:setAlpha( 0 )
				self.clipFinished( TotalElem, {} )
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
				self:setupElementClipCounter( 5 )
				local TotalBackFrame2 = function ( TotalBack, event )
					if not event.interrupted then
						TotalBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalBack:setAlpha( 0.38 )
					if event.interrupted then
						self.clipFinished( TotalBack, event )
					else
						TotalBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0 )
				TotalBackFrame2( TotalBack, {} )
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalElem:setRGB( 1, 0.54, 0 )
					TotalElem:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.54, 0 )
				self.TotalElem:setAlpha( 0 )
				TotalElemFrame2( TotalElem, {} )
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
				self:setupElementClipCounter( 5 )
				local TotalBackFrame2 = function ( TotalBack, event )
					if not event.interrupted then
						TotalBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalBack:setAlpha( 0.38 )
					if event.interrupted then
						self.clipFinished( TotalBack, event )
					else
						TotalBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalBack:completeAnimation()
				self.TotalBack:setAlpha( 0 )
				TotalBackFrame2( TotalBack, {} )
				local TotalElemFrame2 = function ( TotalElem, event )
					if not event.interrupted then
						TotalElem:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					TotalElem:setRGB( 1, 0.15, 0 )
					TotalElem:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TotalElem, event )
					else
						TotalElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalElem:completeAnimation()
				self.TotalElem:setRGB( 1, 0.15, 0 )
				self.TotalElem:setAlpha( 0 )
				TotalElemFrame2( TotalElem, {} )
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
				return IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "zod_riotshield_zm" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "hudItems.ammoPickedUp", function ( model )
		local f52_local0 = self
		PlayClip( self, "AmmoPickup", controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
		element.TotalBack:close()
		element.Total:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

