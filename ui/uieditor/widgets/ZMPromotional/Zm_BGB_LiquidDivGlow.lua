-- 254c21107477516a6a477451fa917af1
-- This hash is used for caching, delete to decompile the file again

CoD.Zm_BGB_LiquidDivGlow = InheritFrom( LUI.UIElement )
CoD.Zm_BGB_LiquidDivGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Zm_BGB_LiquidDivGlow )
	self.id = "Zm_BGB_LiquidDivGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 113 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 0, 112.57 )
	Glow:setTopBottom( true, false, 0, 100.04 )
	Glow:setRGB( 0, 0.89, 1 )
	Glow:setAlpha( 0.75 )
	Glow:setZRot( -84 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.5 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				GlowFrame2( Glow, {} )
				self.nextClip = "Focus"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

