require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_BarTop" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_Element" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ArrowFull" )
require( "ui.uieditor.widgets.HUD.CompassMinimapMap" )
require( "ui.uieditor.widgets.HUD.CompassMinimapItems" )
require( "ui.uieditor.widgets.HUD.CompassMinimapOverlay" )
require( "ui.uieditor.widgets.HUD.map.HorizontalCompassGroupMPContainer" )
require( "ui.uieditor.widgets.Notifications.Notification_SixthSense" )

local PreLoadFunc = function ( self, controller )
	local hudItemsModel = DataSources.HUDItems.getModel( controller )
	if hudItemsModel then
		local smokeEffectModel = Engine.CreateModel( hudItemsModel, "smokeEffect" )
		if smokeEffectModel then
			Engine.SetModelValue( smokeEffectModel, -0.1 )
		end
	end
end

CoD.CompassGroupMP = InheritFrom( LUI.UIElement )
CoD.CompassGroupMP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompassGroupMP )
	self.id = "CompassGroupMP"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 283 )
	self:setTopBottom( true, false, 0, 204 )
	self.anyChildUsesUpdateState = true
	
	local PanelMap = CoD.ScoreInfo_PanelScale.new( menu, controller )
	PanelMap:setLeftRight( true, false, 15.5, 266.5 )
	PanelMap:setTopBottom( true, false, 21, 184 )
	PanelMap:setRGB( 0.46, 0.48, 0.5 )
	self:addElement( PanelMap )
	self.PanelMap = PanelMap
	
	local GlowBack0 = LUI.UIImage.new()
	GlowBack0:setLeftRight( true, false, -107.87, 370.54 )
	GlowBack0:setTopBottom( true, false, -48.09, 213.42 )
	GlowBack0:setRGB( 0.36, 0.37, 0.38 )
	GlowBack0:setAlpha( 0.4 )
	GlowBack0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBack0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowBack0 )
	self.GlowBack0 = GlowBack0
	
	local GlowBack = LUI.UIImage.new()
	GlowBack:setLeftRight( true, false, -20.58, 293.58 )
	GlowBack:setTopBottom( true, false, -17.67, 198.83 )
	GlowBack:setRGB( 0.36, 0.37, 0.38 )
	GlowBack:setAlpha( 0.6 )
	GlowBack:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowBack )
	self.GlowBack = GlowBack
	
	local BarTop = CoD.MapWidget_BarTop.new( menu, controller )
	BarTop:setLeftRight( true, false, 16, 268 )
	BarTop:setTopBottom( true, false, 19, 27 )
	BarTop:setRGB( 1, 1, 1 )
	BarTop:setAlpha( 0.4 )
	BarTop:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarTop:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarTop:setShaderVector( 1, 1, 0, 0, 0 )
	BarTop:setShaderVector( 2, 0, 0, 0, 0 )
	BarTop:setShaderVector( 3, 0, 0, 0, 0 )
	BarTop:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarTop )
	self.BarTop = BarTop
	
	local BarBase = CoD.MapWidget_BarTop.new( menu, controller )
	BarBase:setLeftRight( true, false, 16, 268 )
	BarBase:setTopBottom( true, false, 158, 166 )
	BarBase:setRGB( 1, 1, 1 )
	BarBase:setAlpha( 0.4 )
	BarBase:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarBase:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarBase:setShaderVector( 1, 1, 0, 0, 0 )
	BarBase:setShaderVector( 2, 0, 0, 0, 0 )
	BarBase:setShaderVector( 3, 0, 0, 0, 0 )
	BarBase:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarBase )
	self.BarBase = BarBase
	
	local BaseElement = CoD.MapWidget_Element.new( menu, controller )
	BaseElement:setLeftRight( true, false, 131.34, 152.67 )
	BaseElement:setTopBottom( true, false, 180, 192.33 )
	BaseElement:setRGB( 1, 1, 1 )
	BaseElement:setAlpha( 0.7 )
	BaseElement:setYRot( -180 )
	BaseElement:setZRot( 180 )
	BaseElement:setZoom( -3 )
	self:addElement( BaseElement )
	self.BaseElement = BaseElement
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 7, 11 )
	Dot1:setTopBottom( true, false, 19, 23 )
	Dot1:setRGB( 1, 1, 1 )
	Dot1:setAlpha( 0 )
	Dot1:setZoom( 5 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 272, 276 )
	Dot2:setTopBottom( true, false, 19, 23 )
	Dot2:setRGB( 1, 1, 1 )
	Dot2:setAlpha( 0 )
	Dot2:setZoom( 5 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 7, 11 )
	Dot3:setTopBottom( true, false, 160, 164 )
	Dot3:setRGB( 1, 1, 1 )
	Dot3:setAlpha( 0 )
	Dot3:setZoom( 5 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 272, 276 )
	Dot4:setTopBottom( true, false, 160, 164 )
	Dot4:setRGB( 1, 1, 1 )
	Dot4:setAlpha( 0 )
	Dot4:setZoom( 5 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local BackCircleOutter = CoD.DamageWidget_BackCircleOutter.new( menu, controller )
	BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
	BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
	BackCircleOutter:setRGB( 1, 1, 1 )
	BackCircleOutter:setAlpha( 0 )
	self:addElement( BackCircleOutter )
	self.BackCircleOutter = BackCircleOutter
	
	local ArrowFull = CoD.AmmoWidget_ArrowFull.new( menu, controller )
	ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
	ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
	ArrowFull:setRGB( 1, 1, 1 )
	ArrowFull:setAlpha( 0 )
	self:addElement( ArrowFull )
	self.ArrowFull = ArrowFull
	
	local CompassMinimap = CoD.CompassMinimapMap.new( menu, controller )
	CompassMinimap:setLeftRight( true, true, -13, 9 )
	CompassMinimap:setTopBottom( true, true, 2, -25 )
	CompassMinimap:setRGB( 1, 1, 1 )
	self:addElement( CompassMinimap )
	self.CompassMinimap = CompassMinimap
	
	local CompassItems0 = CoD.CompassMinimapItems.new( menu, controller )
	CompassItems0:setLeftRight( true, true, -1, -2 )
	CompassItems0:setTopBottom( true, true, 9, -31.83 )
	CompassItems0:setRGB( 0, 0, 0 )
	CompassItems0:setAlpha( 0.6 )
	self:addElement( CompassItems0 )
	self.CompassItems0 = CompassItems0
	
	local CompassItems = CoD.CompassMinimapItems.new( menu, controller )
	CompassItems:setLeftRight( true, true, -1, -2 )
	CompassItems:setTopBottom( true, true, 9, -31.83 )
	CompassItems:setRGB( 1, 1, 1 )
	CompassItems:setAlpha( 0.75 )
	CompassItems:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CompassItems )
	self.CompassItems = CompassItems
	
	local CompassOverlay = CoD.CompassMinimapOverlay.new( menu, controller )
	CompassOverlay:setLeftRight( true, true, -13, 9 )
	CompassOverlay:setTopBottom( true, true, 2, -25 )
	CompassOverlay:setRGB( 1, 1, 1 )
	self:addElement( CompassOverlay )
	self.CompassOverlay = CompassOverlay
	
	local HorizontalCompass = CoD.HorizontalCompassGroupMPContainer.new( menu, controller )
	HorizontalCompass:setLeftRight( true, false, 20.9, 268.01 )
	HorizontalCompass:setTopBottom( true, false, 155, 193 )
	HorizontalCompass:setRGB( 1, 1, 1 )
	HorizontalCompass.HorizontalCompass:setAlpha( 0.7 )
	self:addElement( HorizontalCompass )
	self.HorizontalCompass = HorizontalCompass
	
	local NotificationSixthSense = CoD.Notification_SixthSense.new( menu, controller )
	NotificationSixthSense:setLeftRight( true, false, 16.5, 266.5 )
	NotificationSixthSense:setTopBottom( true, false, 21, 163 )
	NotificationSixthSense:setRGB( 1, 0, 0 )
	self:addElement( NotificationSixthSense )
	self.NotificationSixthSense = NotificationSixthSense
	
	local NotificationSixthSense0 = CoD.Notification_SixthSense.new( menu, controller )
	NotificationSixthSense0:setLeftRight( true, false, 16.5, 266.5 )
	NotificationSixthSense0:setTopBottom( true, false, 21, 163 )
	NotificationSixthSense0:setRGB( 1, 0, 0 )
	self:addElement( NotificationSixthSense0 )
	self.NotificationSixthSense0 = NotificationSixthSense0
	
	local smokeGrenadeEffect = LUI.UIImage.new()
	smokeGrenadeEffect:setLeftRight( true, true, 16.9, -18 )
	smokeGrenadeEffect:setTopBottom( true, true, 22, -43 )
	smokeGrenadeEffect:setRGB( 1, 1, 1 )
	smokeGrenadeEffect:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_smoke" ) )
	smokeGrenadeEffect:subscribeToGlobalModel( controller, "HUDItems", "smokeEffect", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			smokeGrenadeEffect:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( smokeGrenadeEffect )
	self.smokeGrenadeEffect = smokeGrenadeEffect
	
	local HorizontalCompass0 = CoD.HorizontalCompassGroupMPContainer.new( menu, controller )
	HorizontalCompass0:setLeftRight( true, false, 20.9, 268.01 )
	HorizontalCompass0:setTopBottom( true, false, 155, 193 )
	HorizontalCompass0:setRGB( 1, 1, 1 )
	HorizontalCompass0.HorizontalCompass:setAlpha( 0.7 )
	self:addElement( HorizontalCompass0 )
	self.HorizontalCompass0 = HorizontalCompass0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				PanelMap:completeAnimation()
				self.PanelMap:setAlpha( 0 )
				self.clipFinished( PanelMap, {} )
				GlowBack0:completeAnimation()
				self.GlowBack0:setAlpha( 0 )
				self.clipFinished( GlowBack0, {} )
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0 )
				self.clipFinished( GlowBack, {} )
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 99.67 )
				self.BarTop:setAlpha( 0 )
				self.clipFinished( BarTop, {} )
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 99.67 )
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.66 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.clipFinished( BaseElement, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				self.clipFinished( ArrowFull, {} )
				CompassMinimap:completeAnimation()
				CompassMinimap.CompassMinimapMap:completeAnimation()
				self.CompassMinimap:setZoom( 20 )
				self.CompassMinimap.CompassMinimapMap:setAlpha( 0 )
				self.clipFinished( CompassMinimap, {} )
				CompassItems0:completeAnimation()
				self.CompassItems0:setAlpha( 0 )
				self.clipFinished( CompassItems0, {} )
				CompassItems:completeAnimation()
				self.CompassItems:setAlpha( 0 )
				self.CompassItems:setZoom( 20 )
				self.clipFinished( CompassItems, {} )
				CompassOverlay:completeAnimation()
				self.CompassOverlay:setAlpha( 0 )
				self.CompassOverlay:setZoom( 20 )
				self.clipFinished( CompassOverlay, {} )
				HorizontalCompass:completeAnimation()
				HorizontalCompass.HorizontalCompass:completeAnimation()
				self.HorizontalCompass.HorizontalCompass:setAlpha( 0 )
				self.clipFinished( HorizontalCompass, {} )
				NotificationSixthSense:completeAnimation()
				self.NotificationSixthSense:setAlpha( 0 )
				self.clipFinished( NotificationSixthSense, {} )
				smokeGrenadeEffect:completeAnimation()
				self.smokeGrenadeEffect:setAlpha( 0 )
				self.clipFinished( smokeGrenadeEffect, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 19 )
				local PanelMapFrame2 = function ( PanelMap, event )
					local PanelMapFrame3 = function ( PanelMap, event )
						if not event.interrupted then
							PanelMap:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						PanelMap:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PanelMap, event )
						else
							PanelMap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelMapFrame3( PanelMap, event )
						return 
					else
						PanelMap:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						PanelMap:registerEventHandler( "transition_complete_keyframe", PanelMapFrame3 )
					end
				end
				
				PanelMap:completeAnimation()
				self.PanelMap:setAlpha( 0 )
				PanelMapFrame2( PanelMap, {} )
				local GlowBack0Frame2 = function ( GlowBack0, event )
					local GlowBack0Frame3 = function ( GlowBack0, event )
						if not event.interrupted then
							GlowBack0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						end
						GlowBack0:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( GlowBack0, event )
						else
							GlowBack0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowBack0Frame3( GlowBack0, event )
						return 
					else
						GlowBack0:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						GlowBack0:registerEventHandler( "transition_complete_keyframe", GlowBack0Frame3 )
					end
				end
				
				GlowBack0:completeAnimation()
				self.GlowBack0:setAlpha( 0 )
				GlowBack0Frame2( GlowBack0, {} )
				local GlowBackFrame2 = function ( GlowBack, event )
					local GlowBackFrame3 = function ( GlowBack, event )
						if not event.interrupted then
							GlowBack:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						end
						GlowBack:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( GlowBack, event )
						else
							GlowBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowBackFrame3( GlowBack, event )
						return 
					else
						GlowBack:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						GlowBack:registerEventHandler( "transition_complete_keyframe", GlowBackFrame3 )
					end
				end
				
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0 )
				GlowBackFrame2( GlowBack, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						local BarTopFrame4 = function ( BarTop, event )
							local BarTopFrame5 = function ( BarTop, event )
								local BarTopFrame6 = function ( BarTop, event )
									local BarTopFrame7 = function ( BarTop, event )
										local BarTopFrame8 = function ( BarTop, event )
											if not event.interrupted then
												BarTop:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarTop:setLeftRight( true, false, 16, 268 )
											BarTop:setTopBottom( true, false, 19, 27 )
											BarTop:setAlpha( 0.4 )
											if event.interrupted then
												self.clipFinished( BarTop, event )
											else
												BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarTopFrame8( BarTop, event )
											return 
										else
											BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarTop:setTopBottom( true, false, 69.28, 77.28 )
											BarTop:setAlpha( 1 )
											BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame8 )
										end
									end
									
									if event.interrupted then
										BarTopFrame7( BarTop, event )
										return 
									else
										BarTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarTop:setTopBottom( true, false, 75.32, 83.32 )
										BarTop:setAlpha( 0 )
										BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame7 )
									end
								end
								
								if event.interrupted then
									BarTopFrame6( BarTop, event )
									return 
								else
									BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarTop:setTopBottom( true, false, 83.27, 91.27 )
									BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame6 )
								end
							end
							
							if event.interrupted then
								BarTopFrame5( BarTop, event )
								return 
							else
								BarTop:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarTop:setTopBottom( true, false, 87.68, 95.68 )
								BarTop:setAlpha( 1 )
								BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame5 )
							end
						end
						
						if event.interrupted then
							BarTopFrame4( BarTop, event )
							return 
						else
							BarTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarTop:setTopBottom( true, false, 94.07, 102.07 )
							BarTop:setAlpha( 0 )
							BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame4 )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarTop:setTopBottom( true, false, 95.94, 103.94 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 105 )
				self.BarTop:setAlpha( 0 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						local BarBaseFrame4 = function ( BarBase, event )
							local BarBaseFrame5 = function ( BarBase, event )
								local BarBaseFrame6 = function ( BarBase, event )
									local BarBaseFrame7 = function ( BarBase, event )
										local BarBaseFrame8 = function ( BarBase, event )
											if not event.interrupted then
												BarBase:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarBase:setLeftRight( true, false, 16, 268 )
											BarBase:setTopBottom( true, false, 158, 166 )
											BarBase:setAlpha( 0.4 )
											if event.interrupted then
												self.clipFinished( BarBase, event )
											else
												BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarBaseFrame8( BarBase, event )
											return 
										else
											BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarBase:setTopBottom( true, false, 118.68, 126.68 )
											BarBase:setAlpha( 1 )
											BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame8 )
										end
									end
									
									if event.interrupted then
										BarBaseFrame7( BarBase, event )
										return 
									else
										BarBase:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarBase:setTopBottom( true, false, 113.95, 121.95 )
										BarBase:setAlpha( 0 )
										BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame7 )
									end
								end
								
								if event.interrupted then
									BarBaseFrame6( BarBase, event )
									return 
								else
									BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarBase:setTopBottom( true, false, 107.74, 115.74 )
									BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame6 )
								end
							end
							
							if event.interrupted then
								BarBaseFrame5( BarBase, event )
								return 
							else
								BarBase:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarBase:setTopBottom( true, false, 104.29, 112.29 )
								BarBase:setAlpha( 1 )
								BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame5 )
							end
						end
						
						if event.interrupted then
							BarBaseFrame4( BarBase, event )
							return 
						else
							BarBase:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarBase:setTopBottom( true, false, 99.29, 107.29 )
							BarBase:setAlpha( 0 )
							BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame4 )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarBase:setTopBottom( true, false, 97.83, 105.83 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 105 )
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							local BaseElementFrame5 = function ( BaseElement, event )
								local BaseElementFrame6 = function ( BaseElement, event )
									local BaseElementFrame7 = function ( BaseElement, event )
										local BaseElementFrame8 = function ( BaseElement, event )
											local BaseElementFrame9 = function ( BaseElement, event )
												local BaseElementFrame10 = function ( BaseElement, event )
													local BaseElementFrame11 = function ( BaseElement, event )
														if not event.interrupted then
															BaseElement:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
														end
														BaseElement:setLeftRight( true, false, 131.34, 152.66 )
														BaseElement:setTopBottom( true, false, 180, 192.33 )
														BaseElement:setAlpha( 0.7 )
														BaseElement:setZRot( 0 )
														if event.interrupted then
															self.clipFinished( BaseElement, event )
														else
															BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BaseElementFrame11( BaseElement, event )
														return 
													else
														BaseElement:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Back )
														BaseElement:setAlpha( 0.56 )
														BaseElement:setZRot( 0 )
														BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame11 )
													end
												end
												
												if event.interrupted then
													BaseElementFrame10( BaseElement, event )
													return 
												else
													BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													BaseElement:setAlpha( 0.51 )
													BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame10 )
												end
											end
											
											if event.interrupted then
												BaseElementFrame9( BaseElement, event )
												return 
											else
												BaseElement:beginAnimation( "keyframe", 430, false, true, CoD.TweenType.Back )
												BaseElement:setTopBottom( true, false, 180, 192.33 )
												BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame9 )
											end
										end
										
										if event.interrupted then
											BaseElementFrame8( BaseElement, event )
											return 
										else
											BaseElement:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BaseElement:setTopBottom( true, false, 181.31, 193.64 )
											BaseElement:setAlpha( 0.5 )
											BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame8 )
										end
									end
									
									if event.interrupted then
										BaseElementFrame7( BaseElement, event )
										return 
									else
										BaseElement:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										BaseElement:setTopBottom( true, false, 171.89, 184.22 )
										BaseElement:setAlpha( 0 )
										BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame7 )
									end
								end
								
								if event.interrupted then
									BaseElementFrame6( BaseElement, event )
									return 
								else
									BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BaseElement:setTopBottom( true, false, 160.98, 173.31 )
									BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame6 )
								end
							end
							
							if event.interrupted then
								BaseElementFrame5( BaseElement, event )
								return 
							else
								BaseElement:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								BaseElement:setTopBottom( true, false, 154.98, 167.31 )
								BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame5 )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BaseElement:setTopBottom( true, false, 134.78, 147.11 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BaseElement:setTopBottom( true, false, 127.34, 139.67 )
						BaseElement:setAlpha( 0.5 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.66 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.BaseElement:setZRot( 180 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							if not event.interrupted then
								Dot1:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setTopBottom( true, false, 19, 23 )
							Dot1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot1, event )
							else
								Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setAlpha( -0.27 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot1:setLeftRight( true, false, 120.05, 124.05 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							if not event.interrupted then
								Dot2:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setTopBottom( true, false, 19, 23 )
							Dot2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot2, event )
							else
								Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setAlpha( -0.27 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot2:setLeftRight( true, false, 159.8, 163.8 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							if not event.interrupted then
								Dot3:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setTopBottom( true, false, 160, 164 )
							Dot3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot3, event )
							else
								Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setAlpha( -0.27 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot3:setLeftRight( true, false, 120.05, 124.05 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							if not event.interrupted then
								Dot4:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setTopBottom( true, false, 160, 164 )
							Dot4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Dot4, event )
							else
								Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setAlpha( -0.27 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot4:setLeftRight( true, false, 159.8, 163.8 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														if not event.interrupted then
															BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														end
														BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
														BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
														BackCircleOutter:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( BackCircleOutter, event )
														else
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
												BackCircleOutter:setAlpha( 1 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
											BackCircleOutter:setAlpha( 0.5 )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 1 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
				self.BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
				self.BackCircleOutter:setAlpha( 0 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local ArrowFullFrame2 = function ( ArrowFull, event )
					local ArrowFullFrame3 = function ( ArrowFull, event )
						local ArrowFullFrame4 = function ( ArrowFull, event )
							local ArrowFullFrame5 = function ( ArrowFull, event )
								local ArrowFullFrame6 = function ( ArrowFull, event )
									local ArrowFullFrame7 = function ( ArrowFull, event )
										local ArrowFullFrame8 = function ( ArrowFull, event )
											local ArrowFullFrame9 = function ( ArrowFull, event )
												if not event.interrupted then
													ArrowFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
												ArrowFull:setTopBottom( true, false, 142.57, 152.57 )
												ArrowFull:setAlpha( 0 )
												ArrowFull:setZRot( 180 )
												if event.interrupted then
													self.clipFinished( ArrowFull, event )
												else
													ArrowFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ArrowFullFrame9( ArrowFull, event )
												return 
											else
												ArrowFull:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame9 )
											end
										end
										
										if event.interrupted then
											ArrowFullFrame8( ArrowFull, event )
											return 
										else
											ArrowFull:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ArrowFull:setTopBottom( true, false, 142.57, 152.57 )
											ArrowFull:setAlpha( 1 )
											ArrowFull:setZRot( 180 )
											ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame8 )
										end
									end
									
									if event.interrupted then
										ArrowFullFrame7( ArrowFull, event )
										return 
									else
										ArrowFull:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
										ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame7 )
									end
								end
								
								if event.interrupted then
									ArrowFullFrame6( ArrowFull, event )
									return 
								else
									ArrowFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ArrowFull:setAlpha( 0 )
									ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowFullFrame5( ArrowFull, event )
								return 
							else
								ArrowFull:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowFullFrame4( ArrowFull, event )
							return 
						else
							ArrowFull:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ArrowFull:setAlpha( 1 )
							ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFullFrame3( ArrowFull, event )
						return 
					else
						ArrowFull:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame3 )
					end
				end
				
				ArrowFull:completeAnimation()
				self.ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
				self.ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
				self.ArrowFull:setAlpha( 0 )
				self.ArrowFull:setZRot( 0 )
				ArrowFullFrame2( ArrowFull, {} )
				local CompassMinimapFrame2 = function ( CompassMinimap, event )
					local CompassMinimapFrame3 = function ( CompassMinimap, event )
						local CompassMinimapFrame4 = function ( CompassMinimap, event )
							if not event.interrupted then
								CompassMinimap:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
								CompassMinimap.CompassMinimapMap:beginAnimation( "subkeyframe", 129, false, true, CoD.TweenType.Linear )
							end
							CompassMinimap:setZoom( 0 )
							CompassMinimap.CompassMinimapMap:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( CompassMinimap, event )
							else
								CompassMinimap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CompassMinimapFrame4( CompassMinimap, event )
							return 
						else
							CompassMinimap:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							CompassMinimap:setZoom( 13 )
							CompassMinimap:registerEventHandler( "transition_complete_keyframe", CompassMinimapFrame4 )
						end
					end
					
					if event.interrupted then
						CompassMinimapFrame3( CompassMinimap, event )
						return 
					else
						CompassMinimap:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						CompassMinimap:registerEventHandler( "transition_complete_keyframe", CompassMinimapFrame3 )
					end
				end
				
				CompassMinimap:completeAnimation()
				CompassMinimap.CompassMinimapMap:completeAnimation()
				self.CompassMinimap:setZoom( 20 )
				self.CompassMinimap.CompassMinimapMap:setAlpha( 0 )
				CompassMinimapFrame2( CompassMinimap, {} )
				local CompassItems0Frame2 = function ( CompassItems0, event )
					local CompassItems0Frame3 = function ( CompassItems0, event )
						if not event.interrupted then
							CompassItems0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						CompassItems0:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( CompassItems0, event )
						else
							CompassItems0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompassItems0Frame3( CompassItems0, event )
						return 
					else
						CompassItems0:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						CompassItems0:registerEventHandler( "transition_complete_keyframe", CompassItems0Frame3 )
					end
				end
				
				CompassItems0:completeAnimation()
				self.CompassItems0:setAlpha( 0 )
				CompassItems0Frame2( CompassItems0, {} )
				local CompassItemsFrame2 = function ( CompassItems, event )
					local CompassItemsFrame3 = function ( CompassItems, event )
						if not event.interrupted then
							CompassItems:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						CompassItems:setAlpha( 0.75 )
						CompassItems:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( CompassItems, event )
						else
							CompassItems:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompassItemsFrame3( CompassItems, event )
						return 
					else
						CompassItems:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						CompassItems:registerEventHandler( "transition_complete_keyframe", CompassItemsFrame3 )
					end
				end
				
				CompassItems:completeAnimation()
				self.CompassItems:setAlpha( 0 )
				self.CompassItems:setZoom( 20 )
				CompassItemsFrame2( CompassItems, {} )
				local CompassOverlayFrame2 = function ( CompassOverlay, event )
					local CompassOverlayFrame3 = function ( CompassOverlay, event )
						local CompassOverlayFrame4 = function ( CompassOverlay, event )
							local CompassOverlayFrame5 = function ( CompassOverlay, event )
								local CompassOverlayFrame6 = function ( CompassOverlay, event )
									local CompassOverlayFrame7 = function ( CompassOverlay, event )
										local CompassOverlayFrame8 = function ( CompassOverlay, event )
											local CompassOverlayFrame9 = function ( CompassOverlay, event )
												local CompassOverlayFrame10 = function ( CompassOverlay, event )
													local CompassOverlayFrame11 = function ( CompassOverlay, event )
														if not event.interrupted then
															CompassOverlay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														CompassOverlay:setAlpha( 1 )
														CompassOverlay:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( CompassOverlay, event )
														else
															CompassOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														CompassOverlayFrame11( CompassOverlay, event )
														return 
													else
														CompassOverlay:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														CompassOverlay:setZoom( 1.54 )
														CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame11 )
													end
												end
												
												if event.interrupted then
													CompassOverlayFrame10( CompassOverlay, event )
													return 
												else
													CompassOverlay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													CompassOverlay:setAlpha( 0.5 )
													CompassOverlay:setZoom( 4.62 )
													CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame10 )
												end
											end
											
											if event.interrupted then
												CompassOverlayFrame9( CompassOverlay, event )
												return 
											else
												CompassOverlay:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												CompassOverlay:setZoom( 6.15 )
												CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame9 )
											end
										end
										
										if event.interrupted then
											CompassOverlayFrame8( CompassOverlay, event )
											return 
										else
											CompassOverlay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											CompassOverlay:setAlpha( 1 )
											CompassOverlay:setZoom( 9.23 )
											CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame8 )
										end
									end
									
									if event.interrupted then
										CompassOverlayFrame7( CompassOverlay, event )
										return 
									else
										CompassOverlay:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CompassOverlay:setZoom( 10.77 )
										CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame7 )
									end
								end
								
								if event.interrupted then
									CompassOverlayFrame6( CompassOverlay, event )
									return 
								else
									CompassOverlay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CompassOverlay:setAlpha( 0 )
									CompassOverlay:setZoom( 13.85 )
									CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame6 )
								end
							end
							
							if event.interrupted then
								CompassOverlayFrame5( CompassOverlay, event )
								return 
							else
								CompassOverlay:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								CompassOverlay:setZoom( 15.38 )
								CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame5 )
							end
						end
						
						if event.interrupted then
							CompassOverlayFrame4( CompassOverlay, event )
							return 
						else
							CompassOverlay:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CompassOverlay:setAlpha( 0.5 )
							CompassOverlay:setZoom( 18.46 )
							CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame4 )
						end
					end
					
					if event.interrupted then
						CompassOverlayFrame3( CompassOverlay, event )
						return 
					else
						CompassOverlay:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						CompassOverlay:registerEventHandler( "transition_complete_keyframe", CompassOverlayFrame3 )
					end
				end
				
				CompassOverlay:completeAnimation()
				self.CompassOverlay:setAlpha( 0 )
				self.CompassOverlay:setZoom( 20 )
				CompassOverlayFrame2( CompassOverlay, {} )
				local HorizontalCompassFrame2 = function ( HorizontalCompass, event )
					local HorizontalCompassFrame3 = function ( HorizontalCompass, event )
						local HorizontalCompassFrame4 = function ( HorizontalCompass, event )
							local HorizontalCompassFrame5 = function ( HorizontalCompass, event )
								local HorizontalCompassFrame6 = function ( HorizontalCompass, event )
									local HorizontalCompassFrame7 = function ( HorizontalCompass, event )
										if not event.interrupted then
											HorizontalCompass:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HorizontalCompass.HorizontalCompass:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										end
										HorizontalCompass.HorizontalCompass:setAlpha( 0.7 )
										if event.interrupted then
											self.clipFinished( HorizontalCompass, event )
										else
											HorizontalCompass:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										HorizontalCompassFrame7( HorizontalCompass, event )
										return 
									else
										HorizontalCompass:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HorizontalCompass:registerEventHandler( "transition_complete_keyframe", HorizontalCompassFrame7 )
									end
								end
								
								if event.interrupted then
									HorizontalCompassFrame6( HorizontalCompass, event )
									return 
								else
									HorizontalCompass:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HorizontalCompass.HorizontalCompass:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									HorizontalCompass.HorizontalCompass:setAlpha( 0 )
									HorizontalCompass:registerEventHandler( "transition_complete_keyframe", HorizontalCompassFrame6 )
								end
							end
							
							if event.interrupted then
								HorizontalCompassFrame5( HorizontalCompass, event )
								return 
							else
								HorizontalCompass:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								HorizontalCompass:registerEventHandler( "transition_complete_keyframe", HorizontalCompassFrame5 )
							end
						end
						
						if event.interrupted then
							HorizontalCompassFrame4( HorizontalCompass, event )
							return 
						else
							HorizontalCompass:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HorizontalCompass.HorizontalCompass:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							HorizontalCompass.HorizontalCompass:setAlpha( 0.3 )
							HorizontalCompass:registerEventHandler( "transition_complete_keyframe", HorizontalCompassFrame4 )
						end
					end
					
					if event.interrupted then
						HorizontalCompassFrame3( HorizontalCompass, event )
						return 
					else
						HorizontalCompass:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						HorizontalCompass:registerEventHandler( "transition_complete_keyframe", HorizontalCompassFrame3 )
					end
				end
				
				HorizontalCompass:completeAnimation()
				HorizontalCompass.HorizontalCompass:completeAnimation()
				self.HorizontalCompass.HorizontalCompass:setAlpha( 0 )
				HorizontalCompassFrame2( HorizontalCompass, {} )
				local NotificationSixthSenseFrame2 = function ( NotificationSixthSense, event )
					local NotificationSixthSenseFrame3 = function ( NotificationSixthSense, event )
						local NotificationSixthSenseFrame4 = function ( NotificationSixthSense, event )
							local NotificationSixthSenseFrame5 = function ( NotificationSixthSense, event )
								local NotificationSixthSenseFrame6 = function ( NotificationSixthSense, event )
									local NotificationSixthSenseFrame7 = function ( NotificationSixthSense, event )
										if not event.interrupted then
											NotificationSixthSense:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										NotificationSixthSense:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( NotificationSixthSense, event )
										else
											NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										NotificationSixthSenseFrame7( NotificationSixthSense, event )
										return 
									else
										NotificationSixthSense:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", NotificationSixthSenseFrame7 )
									end
								end
								
								if event.interrupted then
									NotificationSixthSenseFrame6( NotificationSixthSense, event )
									return 
								else
									NotificationSixthSense:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									NotificationSixthSense:setAlpha( 0 )
									NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", NotificationSixthSenseFrame6 )
								end
							end
							
							if event.interrupted then
								NotificationSixthSenseFrame5( NotificationSixthSense, event )
								return 
							else
								NotificationSixthSense:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", NotificationSixthSenseFrame5 )
							end
						end
						
						if event.interrupted then
							NotificationSixthSenseFrame4( NotificationSixthSense, event )
							return 
						else
							NotificationSixthSense:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							NotificationSixthSense:setAlpha( 0.5 )
							NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", NotificationSixthSenseFrame4 )
						end
					end
					
					if event.interrupted then
						NotificationSixthSenseFrame3( NotificationSixthSense, event )
						return 
					else
						NotificationSixthSense:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", NotificationSixthSenseFrame3 )
					end
				end
				
				NotificationSixthSense:completeAnimation()
				self.NotificationSixthSense:setAlpha( 0 )
				NotificationSixthSenseFrame2( NotificationSixthSense, {} )
				local smokeGrenadeEffectFrame2 = function ( smokeGrenadeEffect, event )
					local smokeGrenadeEffectFrame3 = function ( smokeGrenadeEffect, event )
						if not event.interrupted then
							smokeGrenadeEffect:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						smokeGrenadeEffect:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( smokeGrenadeEffect, event )
						else
							smokeGrenadeEffect:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						smokeGrenadeEffectFrame3( smokeGrenadeEffect, event )
						return 
					else
						smokeGrenadeEffect:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						smokeGrenadeEffect:registerEventHandler( "transition_complete_keyframe", smokeGrenadeEffectFrame3 )
					end
				end
				
				smokeGrenadeEffect:completeAnimation()
				self.smokeGrenadeEffect:setAlpha( 0 )
				smokeGrenadeEffectFrame2( smokeGrenadeEffect, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				PanelMap:completeAnimation()
				self.PanelMap:setAlpha( 1 )
				self.clipFinished( PanelMap, {} )
				GlowBack0:completeAnimation()
				self.GlowBack0:setAlpha( 0.4 )
				self.clipFinished( GlowBack0, {} )
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0.6 )
				self.clipFinished( GlowBack, {} )
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 19, 27 )
				self.BarTop:setAlpha( 0.4 )
				self.clipFinished( BarTop, {} )
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 158, 166 )
				self.BarBase:setAlpha( 0.4 )
				self.clipFinished( BarBase, {} )
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.66 )
				self.BaseElement:setTopBottom( true, false, 180, 192.33 )
				self.BaseElement:setAlpha( 0.7 )
				self.clipFinished( BaseElement, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 7, 11 )
				self.Dot1:setTopBottom( true, false, 19, 23 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 272, 276 )
				self.Dot2:setTopBottom( true, false, 19, 23 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 7, 11 )
				self.Dot3:setTopBottom( true, false, 160, 164 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 272, 276 )
				self.Dot4:setTopBottom( true, false, 160, 164 )
				self.Dot4:setRGB( 1, 1, 1 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				self.clipFinished( ArrowFull, {} )
				CompassMinimap:completeAnimation()
				CompassMinimap.CompassMinimapMap:completeAnimation()
				self.CompassMinimap:setAlpha( 1 )
				self.CompassMinimap:setZoom( 0 )
				self.CompassMinimap.CompassMinimapMap:setAlpha( 1 )
				self.clipFinished( CompassMinimap, {} )
				CompassItems0:completeAnimation()
				self.CompassItems0:setAlpha( 0.6 )
				self.clipFinished( CompassItems0, {} )
				CompassItems:completeAnimation()
				self.CompassItems:setAlpha( 0.75 )
				self.CompassItems:setZoom( 0 )
				self.clipFinished( CompassItems, {} )
				CompassOverlay:completeAnimation()
				self.CompassOverlay:setAlpha( 1 )
				self.CompassOverlay:setZoom( 0 )
				self.clipFinished( CompassOverlay, {} )
				HorizontalCompass:completeAnimation()
				HorizontalCompass.HorizontalCompass:completeAnimation()
				self.HorizontalCompass.HorizontalCompass:setAlpha( 0.7 )
				self.clipFinished( HorizontalCompass, {} )
				NotificationSixthSense:completeAnimation()
				self.NotificationSixthSense:setAlpha( 1 )
				self.clipFinished( NotificationSixthSense, {} )
				smokeGrenadeEffect:completeAnimation()
				self.smokeGrenadeEffect:setAlpha( 1 )
				self.clipFinished( smokeGrenadeEffect, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 18 )
				local PanelMapFrame2 = function ( PanelMap, event )
					if not event.interrupted then
						PanelMap:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					PanelMap:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelMap, event )
					else
						PanelMap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelMap:completeAnimation()
				self.PanelMap:setAlpha( 1 )
				PanelMapFrame2( PanelMap, {} )
				local GlowBack0Frame2 = function ( GlowBack0, event )
					if not event.interrupted then
						GlowBack0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					GlowBack0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowBack0, event )
					else
						GlowBack0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowBack0:completeAnimation()
				self.GlowBack0:setAlpha( 0.4 )
				GlowBack0Frame2( GlowBack0, {} )
				local GlowBackFrame2 = function ( GlowBack, event )
					if not event.interrupted then
						GlowBack:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					GlowBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowBack, event )
					else
						GlowBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowBack:completeAnimation()
				self.GlowBack:setAlpha( 0.6 )
				GlowBackFrame2( GlowBack, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						if not event.interrupted then
							BarTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarTop:setLeftRight( true, false, 16, 268 )
						BarTop:setTopBottom( true, false, 100, 108 )
						BarTop:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarTop, event )
						else
							BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarTop:setTopBottom( true, false, 100, 108 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 19, 27 )
				self.BarTop:setAlpha( 0.4 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						if not event.interrupted then
							BarBase:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarBase:setLeftRight( true, false, 16, 268 )
						BarBase:setTopBottom( true, false, 100, 108 )
						BarBase:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarBase, event )
						else
							BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarBase:setTopBottom( true, false, 100, 108 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 158, 166 )
				self.BarBase:setAlpha( 0.4 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							if not event.interrupted then
								BaseElement:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							end
							BaseElement:setLeftRight( true, false, 131.34, 152.66 )
							BaseElement:setTopBottom( true, false, 106, 118.33 )
							BaseElement:setAlpha( 0 )
							BaseElement:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( BaseElement, event )
							else
								BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							BaseElement:setAlpha( 0.5 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BaseElement:setTopBottom( true, false, 106, 118.33 )
						BaseElement:setAlpha( 0.53 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.66 )
				self.BaseElement:setTopBottom( true, false, 180, 192.33 )
				self.BaseElement:setAlpha( 0.7 )
				self.BaseElement:setZRot( 0 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							local Dot1Frame5 = function ( Dot1, event )
								if not event.interrupted then
									Dot1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setTopBottom( true, false, 99, 103 )
								Dot1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot1, event )
								else
									Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot1Frame5( Dot1, event )
								return 
							else
								Dot1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setAlpha( 0.08 )
								Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame5 )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot1:setLeftRight( true, false, 64, 68 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot1:setTopBottom( true, false, 99, 103 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 7, 11 )
				self.Dot1:setTopBottom( true, false, 19, 23 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							local Dot2Frame5 = function ( Dot2, event )
								if not event.interrupted then
									Dot2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setTopBottom( true, false, 99, 103 )
								Dot2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot2, event )
								else
									Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot2Frame5( Dot2, event )
								return 
							else
								Dot2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setAlpha( 0.08 )
								Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame5 )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot2:setLeftRight( true, false, 215.43, 219.43 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot2:setTopBottom( true, false, 99, 103 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 272, 276 )
				self.Dot2:setTopBottom( true, false, 19, 23 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							local Dot3Frame5 = function ( Dot3, event )
								if not event.interrupted then
									Dot3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setTopBottom( true, false, 100, 104 )
								Dot3:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot3, event )
								else
									Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot3Frame5( Dot3, event )
								return 
							else
								Dot3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setAlpha( 0.08 )
								Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame5 )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot3:setLeftRight( true, false, 64, 68 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot3:setTopBottom( true, false, 100, 104 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 7, 11 )
				self.Dot3:setTopBottom( true, false, 160, 164 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							local Dot4Frame5 = function ( Dot4, event )
								if not event.interrupted then
									Dot4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setTopBottom( true, false, 100, 104 )
								Dot4:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot4, event )
								else
									Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot4Frame5( Dot4, event )
								return 
							else
								Dot4:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setAlpha( 0.08 )
								Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame5 )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot4:setLeftRight( true, false, 215.43, 219.43 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot4:setTopBottom( true, false, 100, 104 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 272, 276 )
				self.Dot4:setTopBottom( true, false, 160, 164 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local ArrowFullFrame2 = function ( ArrowFull, event )
					local ArrowFullFrame3 = function ( ArrowFull, event )
						local ArrowFullFrame4 = function ( ArrowFull, event )
							local ArrowFullFrame5 = function ( ArrowFull, event )
								if not event.interrupted then
									ArrowFull:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								ArrowFull:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ArrowFull, event )
								else
									ArrowFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ArrowFullFrame5( ArrowFull, event )
								return 
							else
								ArrowFull:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowFullFrame4( ArrowFull, event )
							return 
						else
							ArrowFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ArrowFull:setAlpha( 1 )
							ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFullFrame3( ArrowFull, event )
						return 
					else
						ArrowFull:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						ArrowFull:registerEventHandler( "transition_complete_keyframe", ArrowFullFrame3 )
					end
				end
				
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				ArrowFullFrame2( ArrowFull, {} )
				local CompassMinimapFrame2 = function ( CompassMinimap, event )
					if not event.interrupted then
						CompassMinimap:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
						CompassMinimap.CompassMinimapMap:beginAnimation( "subkeyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					CompassMinimap.CompassMinimapMap:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassMinimap, event )
					else
						CompassMinimap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassMinimap:completeAnimation()
				CompassMinimap.CompassMinimapMap:completeAnimation()
				self.CompassMinimap.CompassMinimapMap:setAlpha( 1 )
				CompassMinimapFrame2( CompassMinimap, {} )
				local CompassItems0Frame2 = function ( CompassItems0, event )
					if not event.interrupted then
						CompassItems0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					CompassItems0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassItems0, event )
					else
						CompassItems0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassItems0:completeAnimation()
				self.CompassItems0:setAlpha( 0.6 )
				CompassItems0Frame2( CompassItems0, {} )
				local CompassItemsFrame2 = function ( CompassItems, event )
					if not event.interrupted then
						CompassItems:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					CompassItems:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassItems, event )
					else
						CompassItems:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassItems:completeAnimation()
				self.CompassItems:setAlpha( 0.75 )
				CompassItemsFrame2( CompassItems, {} )
				local CompassOverlayFrame2 = function ( CompassOverlay, event )
					if not event.interrupted then
						CompassOverlay:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					CompassOverlay:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassOverlay, event )
					else
						CompassOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassOverlay:completeAnimation()
				self.CompassOverlay:setAlpha( 1 )
				CompassOverlayFrame2( CompassOverlay, {} )
				local HorizontalCompassFrame2 = function ( HorizontalCompass, event )
					if not event.interrupted then
						HorizontalCompass:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
						HorizontalCompass.HorizontalCompass:beginAnimation( "subkeyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					HorizontalCompass.HorizontalCompass:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HorizontalCompass, event )
					else
						HorizontalCompass:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HorizontalCompass:completeAnimation()
				HorizontalCompass.HorizontalCompass:completeAnimation()
				self.HorizontalCompass.HorizontalCompass:setAlpha( 0.7 )
				HorizontalCompassFrame2( HorizontalCompass, {} )
				local NotificationSixthSenseFrame2 = function ( NotificationSixthSense, event )
					if not event.interrupted then
						NotificationSixthSense:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					NotificationSixthSense:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NotificationSixthSense, event )
					else
						NotificationSixthSense:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationSixthSense:completeAnimation()
				self.NotificationSixthSense:setAlpha( 1 )
				NotificationSixthSenseFrame2( NotificationSixthSense, {} )
				local smokeGrenadeEffectFrame2 = function ( smokeGrenadeEffect, event )
					if not event.interrupted then
						smokeGrenadeEffect:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					smokeGrenadeEffect:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( smokeGrenadeEffect, event )
					else
						smokeGrenadeEffect:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				smokeGrenadeEffect:completeAnimation()
				self.smokeGrenadeEffect:setAlpha( 1 )
				smokeGrenadeEffectFrame2( smokeGrenadeEffect, {} )
			end
		},
		HudPause = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.PanelMap:close()
		self.BarTop:close()
		self.BarBase:close()
		self.BaseElement:close()
		self.Dot1:close()
		self.Dot2:close()
		self.Dot3:close()
		self.Dot4:close()
		self.BackCircleOutter:close()
		self.ArrowFull:close()
		self.CompassMinimap:close()
		self.CompassItems0:close()
		self.CompassItems:close()
		self.CompassOverlay:close()
		self.HorizontalCompass:close()
		self.NotificationSixthSense:close()
		self.NotificationSixthSense0:close()
		self.HorizontalCompass0:close()
		self.smokeGrenadeEffect:close()
		CoD.CompassGroupMP.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

