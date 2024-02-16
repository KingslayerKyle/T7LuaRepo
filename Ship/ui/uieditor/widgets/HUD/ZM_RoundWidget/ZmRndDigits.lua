-- 1bdc9f1afb4ee4674e271de6fd1da7e1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndDigitsInt" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Flsh1" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.ZmRndDigits = InheritFrom( LUI.UIElement )
CoD.ZmRndDigits.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmRndDigits )
	self.id = "ZmRndDigits"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local DigitsInt = CoD.ZmRndDigitsInt.new( menu, controller )
	DigitsInt:setLeftRight( true, false, 0, 106 )
	DigitsInt:setTopBottom( true, false, 0, 80 )
	DigitsInt:setZRot( -10 )
	DigitsInt:linkToElementModel( self, nil, false, function ( model )
		DigitsInt:setModel( model, controller )
	end )
	DigitsInt:mergeStateConditions( {
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 100 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + 10 )
			end
		}
	} )
	DigitsInt:linkToElementModel( DigitsInt, "roundsPlayed", true, function ( model )
		menu:updateElementState( DigitsInt, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "roundsPlayed"
		} )
	end )
	self:addElement( DigitsInt )
	self.DigitsInt = DigitsInt
	
	local DigitsOverlay = CoD.ZmRndDigitsInt.new( menu, controller )
	DigitsOverlay:setLeftRight( true, false, 0, 106 )
	DigitsOverlay:setTopBottom( true, false, 0, 80 )
	DigitsOverlay:setAlpha( 0 )
	DigitsOverlay:setZRot( -19 )
	DigitsOverlay:setZoom( 52 )
	DigitsOverlay:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DigitsOverlay )
	self.DigitsOverlay = DigitsOverlay
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, -16, 122 )
	GlowOrangeOver:setTopBottom( true, false, -24.5, 96.5 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local ZmFxFlsh10 = CoD.ZmFx_Flsh1.new( menu, controller )
	ZmFxFlsh10:setLeftRight( true, false, -67.5, 173.5 )
	ZmFxFlsh10:setTopBottom( true, false, -27.5, 107.5 )
	ZmFxFlsh10:setRGB( 0, 0, 0 )
	ZmFxFlsh10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh10 )
	self.ZmFxFlsh10 = ZmFxFlsh10
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( true, false, -12, 118 )
	ZmFxSpark20:setTopBottom( true, false, -102, 114 )
	ZmFxSpark20:setRGB( 0.65, 0, 0 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 1.37, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.62, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				DigitsInt:completeAnimation()
				self.DigitsInt:setAlpha( 1 )
				self.DigitsInt:setZRot( -10 )
				self.DigitsInt:setZoom( 0 )
				self.clipFinished( DigitsInt, {} )

				DigitsOverlay:completeAnimation()
				self.DigitsOverlay:setAlpha( 0 )
				self.DigitsOverlay:setZRot( -19 )
				self.clipFinished( DigitsOverlay, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 1 )
				self.clipFinished( ZmFxFlsh10, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( true, false, -12, 118 )
				self.ZmFxSpark20:setTopBottom( true, false, -102, 114 )
				self.ZmFxSpark20:setRGB( 0.65, 0, 0 )
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 5 )

				DigitsInt:completeAnimation()
				self.DigitsInt:setAlpha( 1 )
				self.DigitsInt:setZRot( -10 )
				self.DigitsInt:setZoom( 25 )
				self.clipFinished( DigitsInt, {} )
				local DigitsOverlayFrame2 = function ( DigitsOverlay, event )
					local DigitsOverlayFrame3 = function ( DigitsOverlay, event )
						local DigitsOverlayFrame4 = function ( DigitsOverlay, event )
							local DigitsOverlayFrame5 = function ( DigitsOverlay, event )
								if not event.interrupted then
									DigitsOverlay:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								DigitsOverlay:setAlpha( 0 )
								DigitsOverlay:setZRot( -19 )
								if event.interrupted then
									self.clipFinished( DigitsOverlay, event )
								else
									DigitsOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DigitsOverlayFrame5( DigitsOverlay, event )
								return 
							else
								DigitsOverlay:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								DigitsOverlay:setAlpha( 0.13 )
								DigitsOverlay:setZRot( -2 )
								DigitsOverlay:registerEventHandler( "transition_complete_keyframe", DigitsOverlayFrame5 )
							end
						end
						
						if event.interrupted then
							DigitsOverlayFrame4( DigitsOverlay, event )
							return 
						else
							DigitsOverlay:beginAnimation( "keyframe", 290, false, true, CoD.TweenType.Bounce )
							DigitsOverlay:setAlpha( 0.36 )
							DigitsOverlay:setZRot( -17 )
							DigitsOverlay:registerEventHandler( "transition_complete_keyframe", DigitsOverlayFrame4 )
						end
					end
					
					if event.interrupted then
						DigitsOverlayFrame3( DigitsOverlay, event )
						return 
					else
						DigitsOverlay:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						DigitsOverlay:setAlpha( 1 )
						DigitsOverlay:setZRot( -7.58 )
						DigitsOverlay:registerEventHandler( "transition_complete_keyframe", DigitsOverlayFrame3 )
					end
				end
				
				DigitsOverlay:completeAnimation()
				self.DigitsOverlay:setAlpha( 0 )
				self.DigitsOverlay:setZRot( 5 )
				DigitsOverlayFrame2( DigitsOverlay, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											if not event.interrupted then
												GlowOrangeOver:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Bounce )
											end
											GlowOrangeOver:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( GlowOrangeOver, event )
											else
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:setAlpha( 0.35 )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setAlpha( 0.21 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.36 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.39 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.01 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxFlsh10Frame2 = function ( ZmFxFlsh10, event )
					local ZmFxFlsh10Frame3 = function ( ZmFxFlsh10, event )
						if not event.interrupted then
							ZmFxFlsh10:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh10:setRGB( 0, 0, 0 )
						ZmFxFlsh10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh10, event )
						else
							ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlsh10Frame3( ZmFxFlsh10, event )
						return 
					else
						ZmFxFlsh10:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", ZmFxFlsh10Frame3 )
					end
				end
				
				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
				self.ZmFxFlsh10:setAlpha( 1 )
				ZmFxFlsh10Frame2( ZmFxFlsh10, {} )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "gameScore.roundsPlayed", function ( model )
		local f21_local0 = self
		PlayClip( self, "Update", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DigitsInt:close()
		element.DigitsOverlay:close()
		element.ZmFxFlsh10:close()
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
