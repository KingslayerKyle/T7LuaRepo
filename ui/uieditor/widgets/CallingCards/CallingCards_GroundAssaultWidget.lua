-- a5f825172509a4a05a2d134c05205f26
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GroundAssault_Eyes" )

CoD.CallingCards_GroundAssaultWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_GroundAssaultWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_GroundAssaultWidget )
	self.id = "CallingCards_GroundAssaultWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Flipbook = LUI.UIImage.new()
	Flipbook:setLeftRight( true, false, 0, 480 )
	Flipbook:setTopBottom( true, false, 0, 120 )
	Flipbook:setImage( RegisterImage( "uie_t7_callingcards_goundassault_bg2" ) )
	Flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Flipbook:setShaderVector( 0, 2, 0, 0, 0 )
	Flipbook:setShaderVector( 1, 2.8, 0, 0, 0 )
	self:addElement( Flipbook )
	self.Flipbook = Flipbook
	
	local BackLights = LUI.UIImage.new()
	BackLights:setLeftRight( true, false, 0, 480 )
	BackLights:setTopBottom( true, false, 0, 120 )
	BackLights:setImage( RegisterImage( "uie_t7_callingcards_goundassault_bglights" ) )
	self:addElement( BackLights )
	self.BackLights = BackLights
	
	local Man = LUI.UIImage.new()
	Man:setLeftRight( true, false, 0, 480 )
	Man:setTopBottom( true, false, 0, 120 )
	Man:setImage( RegisterImage( "uie_t7_callingcards_goundassault_man" ) )
	self:addElement( Man )
	self.Man = Man
	
	local GlowBlue = LUI.UIImage.new()
	GlowBlue:setLeftRight( true, false, 300.6, 863.21 )
	GlowBlue:setTopBottom( true, false, -173.66, 457.08 )
	GlowBlue:setRGB( 0, 0.22, 1 )
	GlowBlue:setZRot( 80 )
	GlowBlue:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBlue:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBlue )
	self.GlowBlue = GlowBlue
	
	local CallingCardsGroundAssaultEyes = CoD.CallingCards_GroundAssault_Eyes.new( menu, controller )
	CallingCardsGroundAssaultEyes:setLeftRight( true, false, 228.6, 234.78 )
	CallingCardsGroundAssaultEyes:setTopBottom( true, false, -24.93, 51 )
	self:addElement( CallingCardsGroundAssaultEyes )
	self.CallingCardsGroundAssaultEyes = CallingCardsGroundAssaultEyes
	
	local GlowOrange = LUI.UIImage.new()
	GlowOrange:setLeftRight( true, false, -354.41, 208.21 )
	GlowOrange:setTopBottom( true, false, -295.66, 335.08 )
	GlowOrange:setRGB( 1, 0.38, 0 )
	GlowOrange:setAlpha( 0 )
	GlowOrange:setZRot( 80 )
	GlowOrange:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrange:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrange )
	self.GlowOrange = GlowOrange
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local BackLightsFrame2 = function ( BackLights, event )
					local BackLightsFrame3 = function ( BackLights, event )
						local BackLightsFrame4 = function ( BackLights, event )
							local BackLightsFrame5 = function ( BackLights, event )
								local BackLightsFrame6 = function ( BackLights, event )
									local BackLightsFrame7 = function ( BackLights, event )
										local BackLightsFrame8 = function ( BackLights, event )
											if not event.interrupted then
												BackLights:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
											end
											BackLights:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( BackLights, event )
											else
												BackLights:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BackLightsFrame8( BackLights, event )
											return 
										else
											BackLights:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											BackLights:setAlpha( 1 )
											BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame8 )
										end
									end
									
									if event.interrupted then
										BackLightsFrame7( BackLights, event )
										return 
									else
										BackLights:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										BackLights:setAlpha( 0 )
										BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame7 )
									end
								end
								
								if event.interrupted then
									BackLightsFrame6( BackLights, event )
									return 
								else
									BackLights:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									BackLights:setAlpha( 1 )
									BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame6 )
								end
							end
							
							if event.interrupted then
								BackLightsFrame5( BackLights, event )
								return 
							else
								BackLights:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
								BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame5 )
							end
						end
						
						if event.interrupted then
							BackLightsFrame4( BackLights, event )
							return 
						else
							BackLights:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							BackLights:setAlpha( 0 )
							BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame4 )
						end
					end
					
					if event.interrupted then
						BackLightsFrame3( BackLights, event )
						return 
					else
						BackLights:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						BackLights:setAlpha( 1 )
						BackLights:registerEventHandler( "transition_complete_keyframe", BackLightsFrame3 )
					end
				end
				
				BackLights:completeAnimation()
				self.BackLights:setAlpha( 0 )
				BackLightsFrame2( BackLights, {} )
				local GlowBlueFrame2 = function ( GlowBlue, event )
					local GlowBlueFrame3 = function ( GlowBlue, event )
						local GlowBlueFrame4 = function ( GlowBlue, event )
							local GlowBlueFrame5 = function ( GlowBlue, event )
								local GlowBlueFrame6 = function ( GlowBlue, event )
									local GlowBlueFrame7 = function ( GlowBlue, event )
										local GlowBlueFrame8 = function ( GlowBlue, event )
											if not event.interrupted then
												GlowBlue:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
											end
											GlowBlue:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( GlowBlue, event )
											else
												GlowBlue:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowBlueFrame8( GlowBlue, event )
											return 
										else
											GlowBlue:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											GlowBlue:setAlpha( 1 )
											GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame8 )
										end
									end
									
									if event.interrupted then
										GlowBlueFrame7( GlowBlue, event )
										return 
									else
										GlowBlue:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										GlowBlue:setAlpha( 0 )
										GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame7 )
									end
								end
								
								if event.interrupted then
									GlowBlueFrame6( GlowBlue, event )
									return 
								else
									GlowBlue:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									GlowBlue:setAlpha( 1 )
									GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBlueFrame5( GlowBlue, event )
								return 
							else
								GlowBlue:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
								GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBlueFrame4( GlowBlue, event )
							return 
						else
							GlowBlue:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							GlowBlue:setAlpha( 0 )
							GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBlueFrame3( GlowBlue, event )
						return 
					else
						GlowBlue:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowBlue:setAlpha( 1 )
						GlowBlue:registerEventHandler( "transition_complete_keyframe", GlowBlueFrame3 )
					end
				end
				
				GlowBlue:completeAnimation()
				self.GlowBlue:setAlpha( 0 )
				GlowBlueFrame2( GlowBlue, {} )
				local GlowOrangeFrame2 = function ( GlowOrange, event )
					local GlowOrangeFrame3 = function ( GlowOrange, event )
						local GlowOrangeFrame4 = function ( GlowOrange, event )
							local GlowOrangeFrame5 = function ( GlowOrange, event )
								local GlowOrangeFrame6 = function ( GlowOrange, event )
									local GlowOrangeFrame7 = function ( GlowOrange, event )
										local GlowOrangeFrame8 = function ( GlowOrange, event )
											if not event.interrupted then
												GlowOrange:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
											end
											GlowOrange:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( GlowOrange, event )
											else
												GlowOrange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowOrangeFrame8( GlowOrange, event )
											return 
										else
											GlowOrange:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
											GlowOrange:setAlpha( 0.75 )
											GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeFrame7( GlowOrange, event )
										return 
									else
										GlowOrange:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
										GlowOrange:setAlpha( 0 )
										GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeFrame6( GlowOrange, event )
									return 
								else
									GlowOrange:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									GlowOrange:setAlpha( 0.84 )
									GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeFrame5( GlowOrange, event )
								return 
							else
								GlowOrange:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								GlowOrange:setAlpha( 0 )
								GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeFrame4( GlowOrange, event )
							return 
						else
							GlowOrange:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							GlowOrange:setAlpha( 0.45 )
							GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeFrame3( GlowOrange, event )
						return 
					else
						GlowOrange:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						GlowOrange:registerEventHandler( "transition_complete_keyframe", GlowOrangeFrame3 )
					end
				end
				
				GlowOrange:completeAnimation()
				self.GlowOrange:setAlpha( 0 )
				GlowOrangeFrame2( GlowOrange, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGroundAssaultEyes:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
