-- 931365feffb32b03692cd3e14e1e6091
-- This hash is used for caching, delete to decompile the file again

CoD.MapWidget_PanelVignetteRight = InheritFrom( LUI.UIElement )
CoD.MapWidget_PanelVignetteRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MapWidget_PanelVignetteRight )
	self.id = "MapWidget_PanelVignetteRight"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 570 )
	self:setTopBottom( true, false, 0, 414 )
	
	local ImgPanelCPMap = LUI.UIImage.new()
	ImgPanelCPMap:setLeftRight( true, true, 571, -571 )
	ImgPanelCPMap:setTopBottom( true, true, -1, 1 )
	ImgPanelCPMap:setRGB( 0.82, 0.82, 0.82 )
	ImgPanelCPMap:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelvignette" ) )
	ImgPanelCPMap:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( ImgPanelCPMap )
	self.ImgPanelCPMap = ImgPanelCPMap
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0, 0, 0 )
				self.clipFinished( ImgPanelCPMap, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )

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
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0.82, 0.82, 0.82 )
				self.clipFinished( ImgPanelCPMap, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 1 )

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
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ImgPanelCPMap:completeAnimation()
				self.ImgPanelCPMap:setRGB( 0, 0, 0 )
				self.clipFinished( ImgPanelCPMap, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )

				local ImgPanelCPMapFrame2 = function ( ImgPanelCPMap, event )
					if not event.interrupted then
						ImgPanelCPMap:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
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
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

