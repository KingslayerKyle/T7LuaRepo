-- a3e702996eed0c6fe723bd4f98548aef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )

CoD.GasMaskStatus = InheritFrom( LUI.UIElement )
CoD.GasMaskStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GasMaskStatus )
	self.id = "GasMaskStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 220 )
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -80, 80 )
	GlowOrangeOver:setTopBottom( false, false, -126.5, 126.5 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0.4 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local RingGlow = LUI.UIImage.new()
	RingGlow:setLeftRight( false, false, -70, 70 )
	RingGlow:setTopBottom( false, false, -70, 70 )
	RingGlow:setRGB( 1, 0.72, 0 )
	RingGlow:setAlpha( 0 )
	RingGlow:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringblur" ) )
	RingGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RingGlow )
	self.RingGlow = RingGlow
	
	local RingMiddle = LUI.UIImage.new()
	RingMiddle:setLeftRight( false, false, -70, 70 )
	RingMiddle:setTopBottom( false, false, -70, 70 )
	RingMiddle:setRGB( 1, 0.45, 0 )
	RingMiddle:setAlpha( 0.1 )
	RingMiddle:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringmiddle" ) )
	RingMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RingMiddle )
	self.RingMiddle = RingMiddle
	
	local RingTopBleedOut = LUI.UIImage.new()
	RingTopBleedOut:setLeftRight( false, false, -70, 70 )
	RingTopBleedOut:setTopBottom( false, false, -70, 70 )
	RingTopBleedOut:setRGB( 1, 0.92, 0 )
	RingTopBleedOut:setYRot( 180 )
	RingTopBleedOut:setImage( RegisterImage( "uie_t7_zm_hud_revive_ringtop" ) )
	RingTopBleedOut:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	RingTopBleedOut:setShaderVector( 1, 0.5, 0, 0, 0 )
	RingTopBleedOut:setShaderVector( 2, 0.5, 0, 0, 0 )
	RingTopBleedOut:setShaderVector( 3, 0.05, 0, 0, 0 )
	RingTopBleedOut:subscribeToGlobalModel( controller, "ZMIslandInventory", "gaskmask_gasmask_progress", function ( model )
		local gaskmaskGasmaskProgress = Engine.GetModelValue( model )
		if gaskmaskGasmaskProgress then
			RingTopBleedOut:setShaderVector( 0, CoD.GetVectorComponentFromString( gaskmaskGasmaskProgress, 1 ), CoD.GetVectorComponentFromString( gaskmaskGasmaskProgress, 2 ), CoD.GetVectorComponentFromString( gaskmaskGasmaskProgress, 3 ), CoD.GetVectorComponentFromString( gaskmaskGasmaskProgress, 4 ) )
		end
	end )
	self:addElement( RingTopBleedOut )
	self.RingTopBleedOut = RingTopBleedOut
	
	local gasMask = LUI.UIImage.new()
	gasMask:setLeftRight( false, false, -50, 50 )
	gasMask:setTopBottom( false, false, -50, 50 )
	gasMask:setImage( RegisterImage( "uie_t7_icon_inventory_dlc2_gasmask_piece1" ) )
	self:addElement( gasMask )
	self.gasMask = gasMask
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( false, false, -67.86, 69 )
	AbilitySwirl:setTopBottom( false, false, -69, 67.86 )
	AbilitySwirl:setRGB( 1, 0.64, 0 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setScale( 1.3 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local Glow0 = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow0:setLeftRight( true, true, 4, -4 )
	Glow0:setTopBottom( true, true, 4, -4 )
	Glow0:setRGB( 1, 0.49, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setZoom( 13.47 )
	Glow0:setScale( 0.7 )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0.92, 0 )
				self.RingTopBleedOut:setAlpha( 0 )
				self.clipFinished( RingTopBleedOut, {} )

				gasMask:completeAnimation()
				self.gasMask:setAlpha( 0 )
				self.clipFinished( gasMask, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			Acquired = function ()
				self:setupElementClipCounter( 7 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							if not event.interrupted then
								GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							GlowOrangeOver:setAlpha( 0.4 )
							if event.interrupted then
								self.clipFinished( GlowOrangeOver, event )
							else
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.4 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )
				local RingMiddleFrame2 = function ( RingMiddle, event )
					local RingMiddleFrame3 = function ( RingMiddle, event )
						local RingMiddleFrame4 = function ( RingMiddle, event )
							if not event.interrupted then
								RingMiddle:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							RingMiddle:setAlpha( 0.1 )
							if event.interrupted then
								self.clipFinished( RingMiddle, event )
							else
								RingMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RingMiddleFrame4( RingMiddle, event )
							return 
						else
							RingMiddle:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							RingMiddle:setAlpha( 0 )
							RingMiddle:registerEventHandler( "transition_complete_keyframe", RingMiddleFrame4 )
						end
					end
					
					if event.interrupted then
						RingMiddleFrame3( RingMiddle, event )
						return 
					else
						RingMiddle:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						RingMiddle:setAlpha( 0.1 )
						RingMiddle:registerEventHandler( "transition_complete_keyframe", RingMiddleFrame3 )
					end
				end
				
				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				RingMiddleFrame2( RingMiddle, {} )
				local RingTopBleedOutFrame2 = function ( RingTopBleedOut, event )
					local RingTopBleedOutFrame3 = function ( RingTopBleedOut, event )
						local RingTopBleedOutFrame4 = function ( RingTopBleedOut, event )
							if not event.interrupted then
								RingTopBleedOut:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							RingTopBleedOut:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RingTopBleedOut, event )
							else
								RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RingTopBleedOutFrame4( RingTopBleedOut, event )
							return 
						else
							RingTopBleedOut:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							RingTopBleedOut:setAlpha( 0 )
							RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", RingTopBleedOutFrame4 )
						end
					end
					
					if event.interrupted then
						RingTopBleedOutFrame3( RingTopBleedOut, event )
						return 
					else
						RingTopBleedOut:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						RingTopBleedOut:setAlpha( 1 )
						RingTopBleedOut:registerEventHandler( "transition_complete_keyframe", RingTopBleedOutFrame3 )
					end
				end
				
				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setAlpha( 0 )
				RingTopBleedOutFrame2( RingTopBleedOut, {} )
				local gasMaskFrame2 = function ( gasMask, event )
					local gasMaskFrame3 = function ( gasMask, event )
						local gasMaskFrame4 = function ( gasMask, event )
							if not event.interrupted then
								gasMask:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							gasMask:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( gasMask, event )
							else
								gasMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							gasMaskFrame4( gasMask, event )
							return 
						else
							gasMask:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							gasMask:setAlpha( 0 )
							gasMask:registerEventHandler( "transition_complete_keyframe", gasMaskFrame4 )
						end
					end
					
					if event.interrupted then
						gasMaskFrame3( gasMask, event )
						return 
					else
						gasMask:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						gasMask:setAlpha( 1 )
						gasMask:registerEventHandler( "transition_complete_keyframe", gasMaskFrame3 )
					end
				end
				
				gasMask:completeAnimation()
				self.gasMask:setAlpha( 0 )
				gasMaskFrame2( gasMask, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0.92, 0 )
				self.RingTopBleedOut:setAlpha( 0 )
				self.clipFinished( RingTopBleedOut, {} )

				gasMask:completeAnimation()
				self.gasMask:setAlpha( 0 )
				self.clipFinished( gasMask, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end
		},
		MaskEmpty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setRGB( 0.61, 0.01, 0 )
								GlowOrangeOver:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.8 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.4 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.8 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0.61, 0.01, 0 )
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setRGB( 1, 0, 0.12 )
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setRGB( 1, 0, 0 )
				self.RingMiddle:setAlpha( 0.06 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0, 0.06 )
				self.RingTopBleedOut:setAlpha( 1 )
				self.clipFinished( RingTopBleedOut, {} )
				local gasMaskFrame2 = function ( gasMask, event )
					local gasMaskFrame3 = function ( gasMask, event )
						if not event.interrupted then
							gasMask:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						gasMask:setAlpha( 1 )
						gasMask:setScale( 1 )
						if event.interrupted then
							self.clipFinished( gasMask, event )
						else
							gasMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gasMaskFrame3( gasMask, event )
						return 
					else
						gasMask:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						gasMask:setScale( 1.1 )
						gasMask:registerEventHandler( "transition_complete_keyframe", gasMaskFrame3 )
					end
				end
				
				gasMask:completeAnimation()
				self.gasMask:setAlpha( 1 )
				self.gasMask:setScale( 1 )
				gasMaskFrame2( gasMask, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						Glow0:setRGB( 1, 0, 0 )
						Glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.2 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setRGB( 1, 0, 0 )
				self.Glow0:setAlpha( 0.1 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.6 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0.1 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setRGB( 1, 0.92, 0 )
				self.RingTopBleedOut:setAlpha( 1 )
				self.clipFinished( RingTopBleedOut, {} )
				local gasMaskFrame2 = function ( gasMask, event )
					local gasMaskFrame3 = function ( gasMask, event )
						if not event.interrupted then
							gasMask:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						gasMask:setAlpha( 1 )
						gasMask:setScale( 1 )
						if event.interrupted then
							self.clipFinished( gasMask, event )
						else
							gasMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gasMaskFrame3( gasMask, event )
						return 
					else
						gasMask:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						gasMask:setScale( 1.1 )
						gasMask:registerEventHandler( "transition_complete_keyframe", gasMaskFrame3 )
					end
				end
				
				gasMask:completeAnimation()
				self.gasMask:setAlpha( 1 )
				self.gasMask:setScale( 1 )
				gasMaskFrame2( gasMask, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setLeftRight( false, false, -67.86, 69 )
				self.AbilitySwirl:setTopBottom( false, false, -69, 67.86 )
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						if not event.interrupted then
							Glow0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow0, event )
						else
							Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.3 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Acquired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				RingGlow:completeAnimation()
				self.RingGlow:setAlpha( 0 )
				self.clipFinished( RingGlow, {} )

				RingMiddle:completeAnimation()
				self.RingMiddle:setAlpha( 0 )
				self.clipFinished( RingMiddle, {} )

				RingTopBleedOut:completeAnimation()
				self.RingTopBleedOut:setAlpha( 0 )
				self.clipFinished( RingTopBleedOut, {} )

				gasMask:completeAnimation()
				self.gasMask:setAlpha( 0 )
				self.clipFinished( gasMask, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "MaskEmpty",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.gaskmask_gasmask_active", 1 ) and IsModelValueEqualTo( controller, "zmInventory.gaskmask_gasmask_progress", 0 )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.gaskmask_gasmask_active", 1 )
			end
		},
		{
			stateName = "Acquired",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.gaskmask_gasmask_progress", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_gasmask_active" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_gasmask_active"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_gasmask_progress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_gasmask_progress"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Glow0:close()
		element.RingTopBleedOut:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

