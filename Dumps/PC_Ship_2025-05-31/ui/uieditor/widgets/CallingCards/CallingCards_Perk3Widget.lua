CoD.CallingCards_Perk3Widget = InheritFrom( LUI.UIElement )
CoD.CallingCards_Perk3Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Perk3Widget )
	self.id = "CallingCards_Perk3Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_perk3_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local boltFlipbook0 = LUI.UIImage.new()
	boltFlipbook0:setLeftRight( true, false, 0, 480 )
	boltFlipbook0:setTopBottom( true, false, 0, 120 )
	boltFlipbook0:setImage( RegisterImage( "uie_t7_callingcard_perk3_bolt_flipbook" ) )
	boltFlipbook0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	boltFlipbook0:setShaderVector( 0, 3, 0, 0, 0 )
	boltFlipbook0:setShaderVector( 1, 5, 0, 0, 0 )
	self:addElement( boltFlipbook0 )
	self.boltFlipbook0 = boltFlipbook0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 120.78, 385.22 )
	Glow:setTopBottom( true, false, 11.85, 108.15 )
	Glow:setRGB( 0, 1, 0.96 )
	Glow:setAlpha( 0 )
	Glow:setZRot( -63 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0 )
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
						Glow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.47 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

