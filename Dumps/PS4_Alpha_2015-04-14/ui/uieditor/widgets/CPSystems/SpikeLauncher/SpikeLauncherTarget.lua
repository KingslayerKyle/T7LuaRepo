CoD.SpikeLauncherTarget = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherTarget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherTarget )
	self.id = "SpikeLauncherTarget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 381 )
	self:setTopBottom( true, false, 0, 381 )
	
	local GlowRing1 = LUI.UIImage.new()
	GlowRing1:setLeftRight( true, true, 19, -19 )
	GlowRing1:setTopBottom( true, true, 19, -19 )
	GlowRing1:setRGB( 1, 1, 1 )
	GlowRing1:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_glowring1" ) )
	GlowRing1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowRing1 )
	self.GlowRing1 = GlowRing1
	
	local GlowRingOther = LUI.UIImage.new()
	GlowRingOther:setLeftRight( true, true, -70, 70 )
	GlowRingOther:setTopBottom( true, true, -70, 70 )
	GlowRingOther:setRGB( 1, 1, 1 )
	GlowRingOther:setAlpha( 0 )
	GlowRingOther:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_glowring2" ) )
	GlowRingOther:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowRingOther )
	self.GlowRingOther = GlowRingOther
	
	local GlowRing2 = LUI.UIImage.new()
	GlowRing2:setLeftRight( true, true, 0, 0 )
	GlowRing2:setTopBottom( true, true, 0, 0 )
	GlowRing2:setRGB( 1, 1, 1 )
	GlowRing2:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_glowring2" ) )
	GlowRing2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GlowRing2 )
	self.GlowRing2 = GlowRing2
	
	local InnerGlow = LUI.UIImage.new()
	InnerGlow:setLeftRight( false, false, -176, 205.33 )
	InnerGlow:setTopBottom( false, false, -201.5, 179.83 )
	InnerGlow:setRGB( 1, 1, 1 )
	InnerGlow:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_innerglow" ) )
	InnerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( InnerGlow )
	self.InnerGlow = InnerGlow
	
	local Target = LUI.UIImage.new()
	Target:setLeftRight( true, true, 70.5, -70.5 )
	Target:setTopBottom( true, true, 70.5, -70.5 )
	Target:setRGB( 1, 1, 1 )
	Target:setAlpha( 0.3 )
	Target:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_target" ) )
	Target:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Target )
	self.Target = Target
	
	local Arrows = LUI.UIImage.new()
	Arrows:setLeftRight( true, true, 174.5, -174.5 )
	Arrows:setTopBottom( true, true, 10.67, -10.34 )
	Arrows:setRGB( 1, 1, 1 )
	Arrows:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_groundtarget_arrows" ) )
	Arrows:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local GlowRingOtherFrame2 = function ( GlowRingOther, event )
					if not event.interrupted then
						GlowRingOther:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
					end
					GlowRingOther:setLeftRight( true, true, 0, 0 )
					GlowRingOther:setTopBottom( true, true, 0, 0 )
					GlowRingOther:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowRingOther, event )
					else
						GlowRingOther:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowRingOther:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
				GlowRingOther:setLeftRight( true, true, -70, 70 )
				GlowRingOther:setTopBottom( true, true, -70, 70 )
				GlowRingOther:setAlpha( 0 )
				GlowRingOther:registerEventHandler( "transition_complete_keyframe", GlowRingOtherFrame2 )
				local GlowRing2Frame2 = function ( GlowRing2, event )
					if not event.interrupted then
						GlowRing2:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
					GlowRing2:setLeftRight( true, true, 80, -80 )
					GlowRing2:setTopBottom( true, true, 80, -80 )
					GlowRing2:setAlpha( 0 )
					GlowRing2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( GlowRing2, event )
					else
						GlowRing2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowRing2:completeAnimation()
				self.GlowRing2:setLeftRight( true, true, 0, 0 )
				self.GlowRing2:setTopBottom( true, true, 0, 0 )
				self.GlowRing2:setAlpha( 1 )
				self.GlowRing2:setZRot( 0 )
				GlowRing2Frame2( GlowRing2, {} )
				local TargetFrame2 = function ( Target, event )
					local TargetFrame3 = function ( Target, event )
						local TargetFrame4 = function ( Target, event )
							if not event.interrupted then
								Target:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
							end
							Target:setAlpha( 0.75 )
							Target:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( Target, event )
							else
								Target:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TargetFrame4( Target, event )
							return 
						else
							Target:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Target:setAlpha( 0.3 )
							Target:setZRot( 90.6 )
							Target:registerEventHandler( "transition_complete_keyframe", TargetFrame4 )
						end
					end
					
					if event.interrupted then
						TargetFrame3( Target, event )
						return 
					else
						Target:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						Target:setAlpha( 0.75 )
						Target:setZRot( 90 )
						Target:registerEventHandler( "transition_complete_keyframe", TargetFrame3 )
					end
				end
				
				Target:completeAnimation()
				self.Target:setAlpha( 0.3 )
				self.Target:setZRot( 0 )
				TargetFrame2( Target, {} )
				local ArrowsFrame2 = function ( Arrows, event )
					if not event.interrupted then
						Arrows:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
					Arrows:setZRot( 360 )
					Arrows:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Arrows, event )
					else
						Arrows:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrows:completeAnimation()
				self.Arrows:setZRot( 0 )
				self.Arrows:setZoom( 0 )
				ArrowsFrame2( Arrows, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

