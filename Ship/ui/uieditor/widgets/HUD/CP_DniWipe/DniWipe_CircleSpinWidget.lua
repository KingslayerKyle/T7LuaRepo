-- 6c0be6473a93f2baa822d1457c95a81f
-- This hash is used for caching, delete to decompile the file again

CoD.DniWipe_CircleSpinWidget = InheritFrom( LUI.UIElement )
CoD.DniWipe_CircleSpinWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_CircleSpinWidget )
	self.id = "DniWipe_CircleSpinWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local CenterCircleRGB = LUI.UIImage.new()
	CenterCircleRGB:setLeftRight( false, false, -168.31, 168.31 )
	CenterCircleRGB:setTopBottom( false, false, -168.31, 168.31 )
	CenterCircleRGB:setAlpha( 0.6 )
	CenterCircleRGB:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircle" ) )
	CenterCircleRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleRGB )
	self.CenterCircleRGB = CenterCircleRGB
	
	local CenterCircleRGB0 = LUI.UIImage.new()
	CenterCircleRGB0:setLeftRight( false, false, -345.12, 345.12 )
	CenterCircleRGB0:setTopBottom( false, false, -345.12, 345.12 )
	CenterCircleRGB0:setAlpha( 0.4 )
	CenterCircleRGB0:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircleblur" ) )
	CenterCircleRGB0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleRGB0 )
	self.CenterCircleRGB0 = CenterCircleRGB0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local CenterCircleRGBFrame2 = function ( CenterCircleRGB, event )
					if not event.interrupted then
						CenterCircleRGB:beginAnimation( "keyframe", 2579, false, false, CoD.TweenType.Linear )
					end
					CenterCircleRGB:setLeftRight( false, false, -168.31, 168.31 )
					CenterCircleRGB:setTopBottom( false, false, -182.62, 154 )
					CenterCircleRGB:setAlpha( 0 )
					CenterCircleRGB:setXRot( 0 )
					CenterCircleRGB:setYRot( 0 )
					CenterCircleRGB:setZRot( 360 )
					CenterCircleRGB:setZoom( 0 )
					CenterCircleRGB:setScale( 1.7 )
					if event.interrupted then
						self.clipFinished( CenterCircleRGB, event )
					else
						CenterCircleRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterCircleRGB:completeAnimation()
				self.CenterCircleRGB:setLeftRight( false, false, -168.31, 168.31 )
				self.CenterCircleRGB:setTopBottom( false, false, -168.31, 168.31 )
				self.CenterCircleRGB:setAlpha( 0.4 )
				self.CenterCircleRGB:setXRot( 0 )
				self.CenterCircleRGB:setYRot( 0 )
				self.CenterCircleRGB:setZRot( 0 )
				self.CenterCircleRGB:setZoom( 0 )
				self.CenterCircleRGB:setScale( 1 )
				CenterCircleRGBFrame2( CenterCircleRGB, {} )
				local CenterCircleRGB0Frame2 = function ( CenterCircleRGB0, event )
					if not event.interrupted then
						CenterCircleRGB0:beginAnimation( "keyframe", 2579, false, false, CoD.TweenType.Linear )
					end
					CenterCircleRGB0:setAlpha( 0 )
					CenterCircleRGB0:setZRot( 360 )
					CenterCircleRGB0:setZoom( 0 )
					CenterCircleRGB0:setScale( 1.6 )
					if event.interrupted then
						self.clipFinished( CenterCircleRGB0, event )
					else
						CenterCircleRGB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterCircleRGB0:completeAnimation()
				self.CenterCircleRGB0:setAlpha( 0.5 )
				self.CenterCircleRGB0:setZRot( 0 )
				self.CenterCircleRGB0:setZoom( 0 )
				self.CenterCircleRGB0:setScale( 1 )
				CenterCircleRGB0Frame2( CenterCircleRGB0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
