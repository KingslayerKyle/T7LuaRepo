-- e2434a1c3045ffcdb8b9dbf297e36d47
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScannerCircleDash = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerCircleDash.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerCircleDash )
	self.id = "CP_Prologue_FaceScannerCircleDash"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 127 )
	self:setTopBottom( true, false, 0, 127 )
	
	local CenterCircleRGB = LUI.UIImage.new()
	CenterCircleRGB:setLeftRight( false, false, -43.41, 41.41 )
	CenterCircleRGB:setTopBottom( false, false, -42.41, 42.41 )
	CenterCircleRGB:setAlpha( 0.6 )
	CenterCircleRGB:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircle" ) )
	CenterCircleRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleRGB )
	self.CenterCircleRGB = CenterCircleRGB
	
	local CenterCircleRGB0 = LUI.UIImage.new()
	CenterCircleRGB0:setLeftRight( false, false, -63.62, 63.62 )
	CenterCircleRGB0:setTopBottom( false, false, -63.62, 63.62 )
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
						CenterCircleRGB:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					CenterCircleRGB:setZRot( 360 )
					if event.interrupted then
						self.clipFinished( CenterCircleRGB, event )
					else
						CenterCircleRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterCircleRGB:completeAnimation()
				self.CenterCircleRGB:setZRot( 0 )
				CenterCircleRGBFrame2( CenterCircleRGB, {} )
				local CenterCircleRGB0Frame2 = function ( CenterCircleRGB0, event )
					if not event.interrupted then
						CenterCircleRGB0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					CenterCircleRGB0:setZRot( 360 )
					if event.interrupted then
						self.clipFinished( CenterCircleRGB0, event )
					else
						CenterCircleRGB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterCircleRGB0:completeAnimation()
				self.CenterCircleRGB0:setZRot( 0 )
				CenterCircleRGB0Frame2( CenterCircleRGB0, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PossibleMatch = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

