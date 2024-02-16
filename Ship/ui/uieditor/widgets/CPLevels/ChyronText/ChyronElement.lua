-- 31995b30654896a0b753a1cf2efcc6f8
-- This hash is used for caching, delete to decompile the file again

CoD.ChyronElement = InheritFrom( LUI.UIElement )
CoD.ChyronElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChyronElement )
	self.id = "ChyronElement"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, -10, 11 )
	Image0:setTopBottom( true, true, -12, 9 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_cp_chyron_highlight" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 0, 214 )
	Text:setTopBottom( true, false, 6, 26 )
	Text:setText( Engine.Localize( "Transmitter" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Text2 = LUI.UITightText.new()
	Text2:setLeftRight( true, false, 0, 214 )
	Text2:setTopBottom( true, false, 6, 26 )
	Text2:setAlpha( 0 )
	Text2:setText( Engine.Localize( "Transmitter" ) )
	Text2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Text2:setShaderVector( 0, 0, 0, 0, 0 )
	Text2:setShaderVector( 1, 0, 0, 0, 0 )
	Text2:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Text2 )
	self.Text2 = Text2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GrowText = function ()
				self:setupElementClipCounter( 2 )

				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					Text:setLeftRight( true, false, 0, 214 )
					Text:setTopBottom( true, false, 0, 30 )
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 0, 214 )
				self.Text:setTopBottom( true, false, 6, 26 )
				self.Text:setAlpha( 0.6 )
				TextFrame2( Text, {} )
				Text2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Text2:setLeftRight( true, false, 0, 214 )
				Text2:setTopBottom( true, false, 6, 30 )
				Text2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Glow = function ()
				self:setupElementClipCounter( 3 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( true, true, -10, 11 )
						Image0:setTopBottom( true, true, -12, 9 )
						Image0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, true, -24.18, 27.28 )
						Image0:setTopBottom( true, true, -13.05, 10.05 )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, -37, 42 )
				self.Image0:setTopBottom( true, true, -14, 11 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local TextFrame2 = function ( Text, event )
					local TextFrame3 = function ( Text, event )
						local TextFrame4 = function ( Text, event )
							if not event.interrupted then
								Text:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Text:setLeftRight( true, false, 98, 312 )
							Text:setTopBottom( true, false, -18, 2 )
							Text:setAlpha( 0 )
							Text:setZoom( 0 )
							Text:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Text, event )
							else
								Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TextFrame4( Text, event )
							return 
						else
							Text:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Text:setAlpha( 0.75 )
							Text:registerEventHandler( "transition_complete_keyframe", TextFrame4 )
						end
					end
					
					if event.interrupted then
						TextFrame3( Text, event )
						return 
					else
						Text:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						Text:registerEventHandler( "transition_complete_keyframe", TextFrame3 )
					end
				end
				
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 0, 214 )
				self.Text:setTopBottom( true, false, 0, 32 )
				self.Text:setAlpha( 1 )
				self.Text:setZoom( 0 )
				self.Text:setScale( 1 )
				TextFrame2( Text, {} )
				local Text2Frame2 = function ( Text2, event )
					local Text2Frame3 = function ( Text2, event )
						local Text2Frame4 = function ( Text2, event )
							local Text2Frame5 = function ( Text2, event )
								local Text2Frame6 = function ( Text2, event )
									local Text2Frame7 = function ( Text2, event )
										if not event.interrupted then
											Text2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
										end
										Text2:setLeftRight( true, false, 0, 214 )
										Text2:setTopBottom( true, false, 0, 32 )
										Text2:setAlpha( 0 )
										Text2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
										Text2:setShaderVector( 0, 0, 0, 0, 0 )
										Text2:setShaderVector( 1, 0, 0, 0, 0 )
										Text2:setShaderVector( 2, 1, 0, 0, 0 )
										Text2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
										if event.interrupted then
											self.clipFinished( Text2, event )
										else
											Text2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Text2Frame7( Text2, event )
										return 
									else
										Text2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Text2:setAlpha( 0.5 )
										Text2:setShaderVector( 0, 0, 0, 0, 0 )
										Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame7 )
									end
								end
								
								if event.interrupted then
									Text2Frame6( Text2, event )
									return 
								else
									Text2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Text2:setShaderVector( 0, 0.03, 0, 0, 0 )
									Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame6 )
								end
							end
							
							if event.interrupted then
								Text2Frame5( Text2, event )
								return 
							else
								Text2:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
								Text2:setAlpha( 0 )
								Text2:setShaderVector( 0, 0.3, 0, 0, 0 )
								Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame5 )
							end
						end
						
						if event.interrupted then
							Text2Frame4( Text2, event )
							return 
						else
							Text2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							Text2:setAlpha( 1 )
							Text2:setShaderVector( 0, 1.18, 0, 0, 0 )
							Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame4 )
						end
					end
					
					if event.interrupted then
						Text2Frame3( Text2, event )
						return 
					else
						Text2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Text2:setAlpha( 0.89 )
						Text2:setShaderVector( 0, 1.26, 0, 0, 0 )
						Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame3 )
					end
				end
				
				Text2:completeAnimation()
				self.Text2:setLeftRight( true, false, 0, 214 )
				self.Text2:setTopBottom( true, false, 0, 32 )
				self.Text2:setAlpha( 0 )
				self.Text2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.Text2:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Text2:setShaderVector( 1, 0, 0, 0, 0 )
				self.Text2:setShaderVector( 2, 1, 0, 0, 0 )
				self.Text2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				Text2Frame2( Text2, {} )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )

				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
			end,
			FadeInBG = function ()
				self:setupElementClipCounter( 3 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							if not event.interrupted then
								Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							end
							Image0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image0, event )
							else
								Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 0.63 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0.62 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				local Text2Frame2 = function ( Text2, event )
					local Text2Frame3 = function ( Text2, event )
						local Text2Frame4 = function ( Text2, event )
							if not event.interrupted then
								Text2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							Text2:setAlpha( 0 )
							Text2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
							Text2:setShaderVector( 0, 1, 0, 0, 0 )
							Text2:setShaderVector( 1, 0, 0, 0, 0 )
							Text2:setShaderVector( 2, 1, 0, 0, 0 )
							Text2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
							if event.interrupted then
								self.clipFinished( Text2, event )
							else
								Text2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Text2Frame4( Text2, event )
							return 
						else
							Text2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame4 )
						end
					end
					
					if event.interrupted then
						Text2Frame3( Text2, event )
						return 
					else
						Text2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Text2:setAlpha( 0.5 )
						Text2:registerEventHandler( "transition_complete_keyframe", Text2Frame3 )
					end
				end
				
				Text2:completeAnimation()
				self.Text2:setAlpha( 0 )
				self.Text2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.Text2:setShaderVector( 0, 1, 0, 0, 0 )
				self.Text2:setShaderVector( 1, 0, 0, 0, 0 )
				self.Text2:setShaderVector( 2, 1, 0, 0, 0 )
				self.Text2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				Text2Frame2( Text2, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
