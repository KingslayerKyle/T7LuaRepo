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
	self:setLeftRight( 0, 0, 0, 685 )
	self:setTopBottom( 0, 0, 0, 736 )
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( 0, 0, 0, 685 )
	GlowOrangeOver:setTopBottom( 0, 0, 0, 736 )
	GlowOrangeOver:setRGB( 1, 0.63, 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.resetProperties = function ()
		GlowOrangeOver:completeAnimation()
		GlowOrangeOver:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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

