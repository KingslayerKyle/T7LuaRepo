require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_ClipPress" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmAmmo_Clip = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_Clip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_Clip )
	self.id = "ZmAmmo_Clip"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local TotalGlowMult = LUI.UIImage.new()
	TotalGlowMult:setLeftRight( true, false, 5, 100.78 )
	TotalGlowMult:setTopBottom( true, false, -21, 67 )
	TotalGlowMult:setRGB( 0.59, 0.33, 0.11 )
	TotalGlowMult:setAlpha( 0.58 )
	TotalGlowMult:setZRot( -4 )
	TotalGlowMult:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	TotalGlowMult:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( TotalGlowMult )
	self.TotalGlowMult = TotalGlowMult
	
	local ClipBack = LUI.UIText.new()
	ClipBack:setLeftRight( true, false, 1, 109 )
	ClipBack:setTopBottom( true, false, -9, 55 )
	ClipBack:setRGB( 1, 0.41, 0 )
	ClipBack:setAlpha( 0.2 )
	ClipBack:setXRot( 180 )
	ClipBack:setYRot( 180 )
	ClipBack:setZoom( -20 )
	ClipBack:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ClipBack:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ClipBack:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ClipBack:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			ClipBack:setText( Engine.Localize( ammoInClip ) )
		end
	end )
	self:addElement( ClipBack )
	self.ClipBack = ClipBack
	
	local ClipElem = LUI.UIImage.new()
	ClipElem:setLeftRight( true, false, 18, 90 )
	ClipElem:setTopBottom( true, false, -13, 59 )
	ClipElem:setRGB( 1, 0.54, 0 )
	ClipElem:setAlpha( 0.98 )
	ClipElem:setZoom( -10 )
	ClipElem:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elmclipamo" ) )
	ClipElem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipElem )
	self.ClipElem = ClipElem
	
	local ClipGlow = LUI.UIImage.new()
	ClipGlow:setLeftRight( true, false, -15.39, 123.39 )
	ClipGlow:setTopBottom( true, false, -22, 64.5 )
	ClipGlow:setRGB( 0.79, 0.26, 0.25 )
	ClipGlow:setAlpha( 0.42 )
	ClipGlow:setZRot( -4 )
	ClipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ClipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipGlow )
	self.ClipGlow = ClipGlow
	
	local ClipGlowTop = LUI.UIImage.new()
	ClipGlowTop:setLeftRight( true, false, 5.5, 97.7 )
	ClipGlowTop:setTopBottom( true, false, -13, 60.5 )
	ClipGlowTop:setRGB( 1, 0.33, 0.36 )
	ClipGlowTop:setAlpha( 0.25 )
	ClipGlowTop:setZRot( -4 )
	ClipGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ClipGlowTop )
	self.ClipGlowTop = ClipGlowTop
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( true, false, -1, 107 )
	Clip:setTopBottom( true, false, -9, 55 )
	Clip:setRGB( 1, 0, 0.12 )
	Clip:setText( Engine.Localize( "33" ) )
	Clip:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
	ZmFxSpark20:setLeftRight( true, false, 5, 105 )
	ZmFxSpark20:setTopBottom( true, false, -94.5, 60.5 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local ZmFxFlsh = LUI.UIImage.new()
	ZmFxFlsh:setLeftRight( true, false, -4.77, 123.39 )
	ZmFxFlsh:setTopBottom( true, false, -22, 69 )
	ZmFxFlsh:setAlpha( 0 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				ClipBack:completeAnimation()
				self.ClipBack:setRGB( 1, 0.41, 0 )
				self.clipFinished( ClipBack, {} )
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.54, 0 )
				self.clipFinished( ClipElem, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.79, 0.48, 0.25 )
				self.clipFinished( ClipGlow, {} )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.97, 0.33 )
				self.clipFinished( ClipGlowTop, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.99, 0.93 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 0 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 7 )
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.15, 0 )
				self.clipFinished( ClipElem, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 1 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setRGB( 1, 0, 0 )
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
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 0, 0 )
				self.ZmFxFlsh:setAlpha( 0.29 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.15, 0 )
				self.clipFinished( ClipElem, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
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
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setRGB( 1, 0, 0 )
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
						ZmFxFlsh:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 0.27 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 0, 0 )
				self.ZmFxFlsh:setAlpha( 0 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				ClipBack:completeAnimation()
				self.ClipBack:setRGB( 1, 0.41, 0 )
				self.clipFinished( ClipBack, {} )
				local ClipElemFrame2 = function ( ClipElem, event )
					if not event.interrupted then
						ClipElem:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					ClipElem:setRGB( 1, 0.54, 0 )
					if event.interrupted then
						self.clipFinished( ClipElem, event )
					else
						ClipElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.15, 0 )
				ClipElemFrame2( ClipElem, {} )
				local ClipGlowFrame2 = function ( ClipGlow, event )
					if not event.interrupted then
						ClipGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlow:setRGB( 0.79, 0.48, 0.25 )
					if event.interrupted then
						self.clipFinished( ClipGlow, event )
					else
						ClipGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				ClipGlowFrame2( ClipGlow, {} )
				local ClipGlowTopFrame2 = function ( ClipGlowTop, event )
					if not event.interrupted then
						ClipGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlowTop:setRGB( 1, 0.97, 0.33 )
					if event.interrupted then
						self.clipFinished( ClipGlowTop, event )
					else
						ClipGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				ClipGlowTopFrame2( ClipGlowTop, {} )
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
							ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, 5, 105 )
				self.ZmFxSpark20:setTopBottom( true, false, -9, 60.5 )
				self.ZmFxSpark20:setAlpha( 0.52 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
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
						ZmFxFlsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 1, 1 )
				self.ZmFxFlsh:setAlpha( 0.46 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.15, 0 )
				self.clipFinished( ClipElem, {} )
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				self.clipFinished( ClipGlow, {} )
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				self.clipFinished( ClipGlowTop, {} )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.49, 0.49 )
				self.clipFinished( Clip, {} )
				ClipContainerPress00:completeAnimation()
				self.ClipContainerPress00:setAlpha( 1 )
				self.clipFinished( ClipContainerPress00, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 1, 1 )
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				ClipBack:completeAnimation()
				self.ClipBack:setRGB( 1, 0.41, 0 )
				self.clipFinished( ClipBack, {} )
				local ClipElemFrame2 = function ( ClipElem, event )
					if not event.interrupted then
						ClipElem:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					ClipElem:setRGB( 1, 0.54, 0 )
					if event.interrupted then
						self.clipFinished( ClipElem, event )
					else
						ClipElem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipElem:completeAnimation()
				self.ClipElem:setRGB( 1, 0.15, 0 )
				ClipElemFrame2( ClipElem, {} )
				local ClipGlowFrame2 = function ( ClipGlow, event )
					if not event.interrupted then
						ClipGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlow:setRGB( 0.79, 0.48, 0.25 )
					if event.interrupted then
						self.clipFinished( ClipGlow, event )
					else
						ClipGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlow:completeAnimation()
				self.ClipGlow:setRGB( 0.48, 0.06, 0.05 )
				ClipGlowFrame2( ClipGlow, {} )
				local ClipGlowTopFrame2 = function ( ClipGlowTop, event )
					if not event.interrupted then
						ClipGlowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ClipGlowTop:setRGB( 1, 0.97, 0.33 )
					if event.interrupted then
						self.clipFinished( ClipGlowTop, event )
					else
						ClipGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setRGB( 1, 0.33, 0.36 )
				ClipGlowTopFrame2( ClipGlowTop, {} )
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
								ZmFxSpark20:setAlpha( 0.07 )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Linear )
							ZmFxSpark20:setTopBottom( true, false, -75, 60.5 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, 5, 105 )
				self.ZmFxSpark20:setTopBottom( true, false, -9, 60.5 )
				self.ZmFxSpark20:setAlpha( 0.52 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
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
						ZmFxFlsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setRGB( 1, 1, 1 )
				self.ZmFxFlsh:setAlpha( 0.46 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ClipContainerPress00:close()
		element.ZmFxSpark20:close()
		element.ClipBack:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

