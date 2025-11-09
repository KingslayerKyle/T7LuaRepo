CoD.CallingCards_Lethals_Glow = InheritFrom( LUI.UIElement )
CoD.CallingCards_Lethals_Glow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Lethals_Glow )
	self.id = "CallingCards_Lethals_Glow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 457 )
	self:setTopBottom( true, false, 0, 491 )
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 0, 456.54 )
	GlowOrangeOver:setTopBottom( true, false, 0, 490.54 )
	GlowOrangeOver:setRGB( 1, 0.63, 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setAlpha( 1 )
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
						GlowOrangeOver:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.57 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 1 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

