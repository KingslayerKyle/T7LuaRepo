-- 5c8738bed06dd6f6d4dfb813fc5c32a1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_PanelVignetteGlow" )

CoD.MapWidget_PanelVignetteLeft = InheritFrom( LUI.UIElement )
CoD.MapWidget_PanelVignetteLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MapWidget_PanelVignetteLeft )
	self.id = "MapWidget_PanelVignetteLeft"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 570 )
	self:setTopBottom( true, false, 0, 414 )
	
	local MapWidgetPanelVignetteGlow0 = CoD.MapWidget_PanelVignetteGlow.new( menu, controller )
	MapWidgetPanelVignetteGlow0:setLeftRight( true, false, 195.46, 672.46 )
	MapWidgetPanelVignetteGlow0:setTopBottom( true, false, 58.5, 399.5 )
	MapWidgetPanelVignetteGlow0:setAlpha( 0 )
	MapWidgetPanelVignetteGlow0:setZoom( 1000 )
	MapWidgetPanelVignetteGlow0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	MapWidgetPanelVignetteGlow0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( MapWidgetPanelVignetteGlow0 )
	self.MapWidgetPanelVignetteGlow0 = MapWidgetPanelVignetteGlow0
	
	local ImgPanelCPMap = LUI.UIImage.new()
	ImgPanelCPMap:setLeftRight( true, true, 571, -571 )
	ImgPanelCPMap:setTopBottom( true, true, -1, 1 )
	ImgPanelCPMap:setRGB( 0.82, 0.82, 0.82 )
	ImgPanelCPMap:setYRot( -180 )
	ImgPanelCPMap:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelvignette" ) )
	ImgPanelCPMap:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( ImgPanelCPMap )
	self.ImgPanelCPMap = ImgPanelCPMap
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				MapWidgetPanelVignetteGlow0:completeAnimation()
				self.MapWidgetPanelVignetteGlow0:setLeftRight( true, false, 195.46, 672.46 )
				self.MapWidgetPanelVignetteGlow0:setTopBottom( true, false, 58.5, 399.5 )
				self.MapWidgetPanelVignetteGlow0:setAlpha( 0 )
				self.MapWidgetPanelVignetteGlow0:setZoom( 1000 )
				self.clipFinished( MapWidgetPanelVignetteGlow0, {} )

				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0, 0, 0 )
				self.ImgPanelCPMap:setAlpha( 1 )
				self.clipFinished( ImgPanelCPMap, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 2 )

				local MapWidgetPanelVignetteGlow0Frame2 = function ( MapWidgetPanelVignetteGlow0, event )
					local MapWidgetPanelVignetteGlow0Frame3 = function ( MapWidgetPanelVignetteGlow0, event )
						if not event.interrupted then
							MapWidgetPanelVignetteGlow0:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
						end
						MapWidgetPanelVignetteGlow0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MapWidgetPanelVignetteGlow0, event )
						else
							MapWidgetPanelVignetteGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MapWidgetPanelVignetteGlow0Frame3( MapWidgetPanelVignetteGlow0, event )
						return 
					else
						MapWidgetPanelVignetteGlow0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						MapWidgetPanelVignetteGlow0:registerEventHandler( "transition_complete_keyframe", MapWidgetPanelVignetteGlow0Frame3 )
					end
				end
				
				MapWidgetPanelVignetteGlow0:completeAnimation()
				self.MapWidgetPanelVignetteGlow0:setAlpha( 0 )
				MapWidgetPanelVignetteGlow0Frame2( MapWidgetPanelVignetteGlow0, {} )
				local ImgPanelCPMapFrame2 = function ( ImgPanelCPMap, event )
					if not event.interrupted then
						ImgPanelCPMap:beginAnimation( "keyframe", 1750, false, false, CoD.TweenType.Linear )
					end
					ImgPanelCPMap:setRGB( 0.82, 0.82, 0.82 )
					if event.interrupted then
						self.clipFinished( ImgPanelCPMap, event )
					else
						ImgPanelCPMap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0, 0, 0 )
				ImgPanelCPMapFrame2( ImgPanelCPMap, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 2 )

				local MapWidgetPanelVignetteGlow0Frame2 = function ( MapWidgetPanelVignetteGlow0, event )
					if not event.interrupted then
						MapWidgetPanelVignetteGlow0:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
					end
					MapWidgetPanelVignetteGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MapWidgetPanelVignetteGlow0, event )
					else
						MapWidgetPanelVignetteGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapWidgetPanelVignetteGlow0:completeAnimation()
				self.MapWidgetPanelVignetteGlow0:setAlpha( 0 )
				MapWidgetPanelVignetteGlow0Frame2( MapWidgetPanelVignetteGlow0, {} )
				local ImgPanelCPMapFrame2 = function ( ImgPanelCPMap, event )
					if not event.interrupted then
						ImgPanelCPMap:beginAnimation( "keyframe", 1779, false, false, CoD.TweenType.Linear )
					end
					ImgPanelCPMap:setRGB( 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ImgPanelCPMap, event )
					else
						ImgPanelCPMap:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0.82, 0.82, 0.82 )
				ImgPanelCPMapFrame2( ImgPanelCPMap, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapWidgetPanelVignetteGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

