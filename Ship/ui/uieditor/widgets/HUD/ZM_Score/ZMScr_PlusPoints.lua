-- 0b51f85c4fa5e59f652454f66a34d978
-- This hash is used for caching, delete to decompile the file again

CoD.ZMScr_PlusPoints = InheritFrom( LUI.UIElement )
CoD.ZMScr_PlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZMScr_PlusPoints )
	self.id = "ZMScr_PlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	
	local Label2 = LUI.UITightText.new()
	Label2:setLeftRight( true, false, 18, 84 )
	Label2:setTopBottom( true, false, 14.38, 51.38 )
	Label2:setRGB( 1, 0.52, 0 )
	Label2:setAlpha( 0.01 )
	Label2:setZoom( -8 )
	Label2:setText( Engine.Localize( "+50" ) )
	Label2:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Label2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label2:setShaderVector( 0, 0.21, 0, 0, 0 )
	Label2:setShaderVector( 1, 0, 0, 0, 0 )
	Label2:setShaderVector( 2, 1, 0, 0, 0 )
	Label2:setLetterSpacing( 0.9 )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 17, 83 )
	Label1:setTopBottom( true, false, 14.38, 51.38 )
	Label1:setRGB( 0.99, 0.95, 0.62 )
	Label1:setAlpha( 0 )
	Label1:setText( Engine.Localize( "+50" ) )
	Label1:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 0, 85 )
	Glow:setTopBottom( true, false, 0, 65.75 )
	Glow:setRGB( 1, 0.26, 0 )
	Glow:setAlpha( 0.01 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local Label2Frame2 = function ( Label2, event )
					local Label2Frame3 = function ( Label2, event )
						local Label2Frame4 = function ( Label2, event )
							local Label2Frame5 = function ( Label2, event )
								if not event.interrupted then
									Label2:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
								end
								Label2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Label2, event )
								else
									Label2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Label2Frame5( Label2, event )
								return 
							else
								Label2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame5 )
							end
						end
						
						if event.interrupted then
							Label2Frame4( Label2, event )
							return 
						else
							Label2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
							Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame4 )
						end
					end
					
					if event.interrupted then
						Label2Frame3( Label2, event )
						return 
					else
						Label2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						Label2:setAlpha( 0.43 )
						Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame3 )
					end
				end
				
				Label2:completeAnimation()
				self.Label2:setAlpha( 0 )
				Label2Frame2( Label2, {} )
				local Label1Frame2 = function ( Label1, event )
					local Label1Frame3 = function ( Label1, event )
						local Label1Frame4 = function ( Label1, event )
							if not event.interrupted then
								Label1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
							end
							Label1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Label1, event )
							else
								Label1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Label1Frame4( Label1, event )
							return 
						else
							Label1:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
							Label1:registerEventHandler( "transition_complete_keyframe", Label1Frame4 )
						end
					end
					
					if event.interrupted then
						Label1Frame3( Label1, event )
						return 
					else
						Label1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Label1:setAlpha( 1 )
						Label1:registerEventHandler( "transition_complete_keyframe", Label1Frame3 )
					end
				end
				
				Label1:completeAnimation()
				self.Label1:setAlpha( 0 )
				Label1Frame2( Label1, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
								end
								Glow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.34 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							Glow:setAlpha( 0.42 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 3 )

				local Label2Frame2 = function ( Label2, event )
					local Label2Frame3 = function ( Label2, event )
						local Label2Frame4 = function ( Label2, event )
							local Label2Frame5 = function ( Label2, event )
								if not event.interrupted then
									Label2:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
								end
								Label2:setRGB( 0.59, 0.15, 0.11 )
								Label2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Label2, event )
								else
									Label2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Label2Frame5( Label2, event )
								return 
							else
								Label2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame5 )
							end
						end
						
						if event.interrupted then
							Label2Frame4( Label2, event )
							return 
						else
							Label2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
							Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame4 )
						end
					end
					
					if event.interrupted then
						Label2Frame3( Label2, event )
						return 
					else
						Label2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						Label2:setAlpha( 0.43 )
						Label2:registerEventHandler( "transition_complete_keyframe", Label2Frame3 )
					end
				end
				
				Label2:completeAnimation()
				self.Label2:setRGB( 0.59, 0.15, 0.11 )
				self.Label2:setAlpha( 0 )
				Label2Frame2( Label2, {} )
				local Label1Frame2 = function ( Label1, event )
					local Label1Frame3 = function ( Label1, event )
						local Label1Frame4 = function ( Label1, event )
							if not event.interrupted then
								Label1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
							end
							Label1:setRGB( 0.78, 0.14, 0.08 )
							Label1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Label1, event )
							else
								Label1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Label1Frame4( Label1, event )
							return 
						else
							Label1:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
							Label1:registerEventHandler( "transition_complete_keyframe", Label1Frame4 )
						end
					end
					
					if event.interrupted then
						Label1Frame3( Label1, event )
						return 
					else
						Label1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Label1:setAlpha( 1 )
						Label1:registerEventHandler( "transition_complete_keyframe", Label1Frame3 )
					end
				end
				
				Label1:completeAnimation()
				self.Label1:setRGB( 0.78, 0.14, 0.08 )
				self.Label1:setAlpha( 0 )
				Label1Frame2( Label1, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
								end
								Glow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.34 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Bounce )
							Glow:setAlpha( 0.42 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
