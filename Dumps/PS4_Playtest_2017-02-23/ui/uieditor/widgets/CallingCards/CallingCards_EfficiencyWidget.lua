CoD.CallingCards_EfficiencyWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_EfficiencyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_EfficiencyWidget )
	self.id = "CallingCards_EfficiencyWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local BGDark = LUI.UIImage.new()
	BGDark:setLeftRight( 0, 0, 0, 720 )
	BGDark:setTopBottom( 0, 0, 0, 180 )
	BGDark:setImage( RegisterImage( "uie_t7_callingcard_efficiency_bgdark" ) )
	self:addElement( BGDark )
	self.BGDark = BGDark
	
	local BGLight = LUI.UIImage.new()
	BGLight:setLeftRight( 0, 0, 0, 720 )
	BGLight:setTopBottom( 0, 0, 0, 180 )
	BGLight:setImage( RegisterImage( "uie_t7_callingcard_efficiency_bglight" ) )
	self:addElement( BGLight )
	self.BGLight = BGLight
	
	local Smoke1 = LUI.UIImage.new()
	Smoke1:setLeftRight( 0, 0, 134, 404 )
	Smoke1:setTopBottom( 0, 0, -66, 114 )
	Smoke1:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke1" ) )
	Smoke1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Smoke1 )
	self.Smoke1 = Smoke1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 282, 426 )
	Image0:setTopBottom( 0, 0, -45, 135 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, -122, 58 )
	Image1:setTopBottom( 0, 0, -192, -66 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke3" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( 0, 0, 385, 410 )
	GlowOrangeOver0:setTopBottom( 0, 0, 63, 125 )
	GlowOrangeOver0:setRGB( 1, 0.08, 0 )
	GlowOrangeOver0:setAlpha( 0.6 )
	GlowOrangeOver0:setZRot( 90 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	self.resetProperties = function ()
		BGLight:completeAnimation()
		GlowOrangeOver0:completeAnimation()
		Smoke1:completeAnimation()
		Image0:completeAnimation()
		Image1:completeAnimation()
		BGLight:setAlpha( 1 )
		GlowOrangeOver0:setAlpha( 0.6 )
		Smoke1:setLeftRight( 0, 0, 134, 404 )
		Smoke1:setTopBottom( 0, 0, -66, 114 )
		Smoke1:setAlpha( 1 )
		Smoke1:setZRot( 0 )
		Smoke1:setScale( 1 )
		Image0:setLeftRight( 0, 0, 282, 426 )
		Image0:setTopBottom( 0, 0, -45, 135 )
		Image0:setAlpha( 1 )
		Image0:setScale( 1 )
		Image1:setLeftRight( 0, 0, -122, 58 )
		Image1:setTopBottom( 0, 0, -192, -66 )
		Image1:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BGLightFrame2 = function ( BGLight, event )
					local BGLightFrame3 = function ( BGLight, event )
						local BGLightFrame4 = function ( BGLight, event )
							local BGLightFrame5 = function ( BGLight, event )
								if not event.interrupted then
									BGLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								BGLight:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( BGLight, event )
								else
									BGLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BGLightFrame5( BGLight, event )
								return 
							else
								BGLight:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								BGLight:setAlpha( 0 )
								BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame5 )
							end
						end
						
						if event.interrupted then
							BGLightFrame4( BGLight, event )
							return 
						else
							BGLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							BGLight:setAlpha( 1 )
							BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame4 )
						end
					end
					
					if event.interrupted then
						BGLightFrame3( BGLight, event )
						return 
					else
						BGLight:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						BGLight:setAlpha( 0 )
						BGLight:registerEventHandler( "transition_complete_keyframe", BGLightFrame3 )
					end
				end
				
				BGLight:completeAnimation()
				self.BGLight:setAlpha( 1 )
				BGLightFrame2( BGLight, {} )
				local Smoke1Frame2 = function ( Smoke1, event )
					local Smoke1Frame3 = function ( Smoke1, event )
						local Smoke1Frame4 = function ( Smoke1, event )
							local Smoke1Frame5 = function ( Smoke1, event )
								local Smoke1Frame6 = function ( Smoke1, event )
									if not event.interrupted then
										Smoke1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
									end
									Smoke1:setLeftRight( 0, 0, 140, 410 )
									Smoke1:setTopBottom( 0, 0, -66, 114 )
									Smoke1:setAlpha( 0 )
									Smoke1:setZRot( 0 )
									Smoke1:setScale( 1 )
									if event.interrupted then
										self.clipFinished( Smoke1, event )
									else
										Smoke1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Smoke1Frame6( Smoke1, event )
									return 
								else
									Smoke1:beginAnimation( "keyframe", 1420, false, false, CoD.TweenType.Linear )
									Smoke1:setLeftRight( 0, 0, 134, 404 )
									Smoke1:setTopBottom( 0, 0, -66, 114 )
									Smoke1:setZRot( 0 )
									Smoke1:setScale( 1 )
									Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame6 )
								end
							end
							
							if event.interrupted then
								Smoke1Frame5( Smoke1, event )
								return 
							else
								Smoke1:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								Smoke1:setLeftRight( 0, 0, -33.11, 236.89 )
								Smoke1:setTopBottom( 0, 0, -206.27, -26.27 )
								Smoke1:setAlpha( 0 )
								Smoke1:setZRot( -28 )
								Smoke1:setScale( 1.43 )
								Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame5 )
							end
						end
						
						if event.interrupted then
							Smoke1Frame4( Smoke1, event )
							return 
						else
							Smoke1:beginAnimation( "keyframe", 1379, false, false, CoD.TweenType.Linear )
							Smoke1:setLeftRight( 0, 0, -59, 211 )
							Smoke1:setTopBottom( 0, 0, -228, -48 )
							Smoke1:setAlpha( 0.8 )
							Smoke1:setZRot( -32 )
							Smoke1:setScale( 1.5 )
							Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame4 )
						end
					end
					
					if event.interrupted then
						Smoke1Frame3( Smoke1, event )
						return 
					else
						Smoke1:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						Smoke1:setLeftRight( 0, 0, 134, 404 )
						Smoke1:setAlpha( 0.41 )
						Smoke1:setZRot( -10 )
						Smoke1:setScale( 1.16 )
						Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame3 )
					end
				end
				
				Smoke1:completeAnimation()
				self.Smoke1:setLeftRight( 0, 0, 140, 410 )
				self.Smoke1:setTopBottom( 0, 0, -66, 114 )
				self.Smoke1:setAlpha( 0 )
				self.Smoke1:setZRot( 0 )
				self.Smoke1:setScale( 1 )
				Smoke1Frame2( Smoke1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( 0, 0, 13, 157 )
								Image0:setTopBottom( 0, 0, -180, 0 )
								Image0:setAlpha( 0 )
								Image0:setScale( 1.9 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 1930, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( 0, 0, 13, 157 )
								Image0:setTopBottom( 0, 0, -180, 0 )
								Image0:setScale( 1.9 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( 0, 0, 250.06, 394.06 )
							Image0:setTopBottom( 0, 0, -61.03, 118.97 )
							Image0:setAlpha( 0.45 )
							Image0:setScale( 1.11 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 282, 426 )
				self.Image0:setTopBottom( 0, 0, -45, 135 )
				self.Image0:setAlpha( 0 )
				self.Image0:setScale( 1 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							if not event.interrupted then
								Image1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							end
							Image1:setLeftRight( 0, 0, 165, 345 )
							Image1:setTopBottom( 0, 0, -116, 10 )
							Image1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image1, event )
							else
								Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 1150, false, false, CoD.TweenType.Linear )
							Image1:setLeftRight( 0, 0, 197.26, 377.26 )
							Image1:setTopBottom( 0, 0, -80.98, 45.02 )
							Image1:setAlpha( 0.67 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:beginAnimation( "keyframe", 2309, false, false, CoD.TweenType.Linear )
				Image1:setLeftRight( 0, 0, 270, 450 )
				Image1:setTopBottom( 0, 0, -2, 124 )
				Image1:setAlpha( 0 )
				Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame2 )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							local GlowOrangeOver0Frame5 = function ( GlowOrangeOver0, event )
								local GlowOrangeOver0Frame6 = function ( GlowOrangeOver0, event )
									if not event.interrupted then
										GlowOrangeOver0:beginAnimation( "keyframe", 2349, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver0, event )
									else
										GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOver0Frame6( GlowOrangeOver0, event )
									return 
								else
									GlowOrangeOver0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									GlowOrangeOver0:setAlpha( 0.55 )
									GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver0Frame5( GlowOrangeOver0, event )
								return 
							else
								GlowOrangeOver0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								GlowOrangeOver0:setAlpha( 0.18 )
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 0.41 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 1419, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

