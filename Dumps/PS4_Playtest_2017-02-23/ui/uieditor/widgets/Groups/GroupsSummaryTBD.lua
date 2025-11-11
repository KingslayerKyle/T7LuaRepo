CoD.GroupsSummaryTBD = InheritFrom( LUI.UIElement )
CoD.GroupsSummaryTBD.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSummaryTBD )
	self.id = "GroupsSummaryTBD"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 219 )
	self:setTopBottom( 0, 0, 0, 192 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 219 )
	Image0:setTopBottom( 0, 0, -22, 222 )
	Image0:setZRot( 360 )
	Image0:setImage( RegisterImage( "uie_img_t7_hud_widget_ammo_5_hexagon" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 1, -63, 59 )
	TextBox0:setTopBottom( 0.5, 0.5, -15, 15 )
	TextBox0:setText( Engine.Localize( "GROUPS_UNDER_CONSTRUCTION" ) )
	TextBox0:setTTF( "fonts/UnitedSansRgMd.ttf" )
	TextBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox0:setShaderVector( 0, 0.1, 1, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		Image0:setLeftRight( 0, 0, 0, 219 )
		Image0:setTopBottom( 0, 0, -22, 222 )
		Image0:setZRot( 360 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												if not event.interrupted then
													Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
												end
												Image0:setLeftRight( 0, 0, 0, 219 )
												Image0:setTopBottom( 0, 0, -22, 222 )
												Image0:setZRot( 360 )
												if event.interrupted then
													self.clipFinished( Image0, event )
												else
													Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Image0Frame9( Image0, event )
												return 
											else
												Image0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
												Image0:setLeftRight( 0, 0, 0, 219 )
												Image0:setTopBottom( 0, 0, -22, 222 )
												Image0:setZRot( 360 )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 1010, false, false, CoD.TweenType.Linear )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 989, true, true, CoD.TweenType.Linear )
										Image0:setLeftRight( 0, 0, -3, 216 )
										Image0:setTopBottom( 0, 0, -22, 220 )
										Image0:setZRot( 270 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
								Image0:setLeftRight( 0, 0, -4, 215 )
								Image0:setTopBottom( 0, 0, -24, 218 )
								Image0:setZRot( 180 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
						Image0:setLeftRight( 0, 0, -2, 217 )
						Image0:setTopBottom( 0, 0, -22, 220 )
						Image0:setZRot( 90 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( 0, 0, 0, 219 )
				self.Image0:setTopBottom( 0, 0, -21, 221 )
				self.Image0:setZRot( 0 )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

