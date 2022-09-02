-- d5f67da927276c6af4ea8b8980601b5b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_air_plane" )

CoD.CallingCards_code_air = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_air.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_code_air )
	self.id = "CallingCards_code_air"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcards_air_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local mountain = LUI.UIImage.new()
	mountain:setLeftRight( true, false, 0, 480 )
	mountain:setTopBottom( true, false, 0, 120 )
	mountain:setImage( RegisterImage( "uie_t7_callingcards_air_bg2" ) )
	mountain:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	mountain:setShaderVector( 0, 1, 1, 0, 0 )
	mountain:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( mountain )
	self.mountain = mountain
	
	local CallingCardscodeairplane0 = CoD.CallingCards_code_air_plane.new( menu, controller )
	CallingCardscodeairplane0:setLeftRight( true, false, 0, 480 )
	CallingCardscodeairplane0:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardscodeairplane0 )
	self.CallingCardscodeairplane0 = CallingCardscodeairplane0
	
	local clouds = LUI.UIImage.new()
	clouds:setLeftRight( true, false, 0, 480 )
	clouds:setTopBottom( true, false, 0, 120 )
	clouds:setImage( RegisterImage( "uie_t7_callingcards_air_clouds" ) )
	clouds:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	clouds:setShaderVector( 0, 0, 1, 0, 0 )
	clouds:setShaderVector( 1, 1.5, 0, 0, 0 )
	self:addElement( clouds )
	self.clouds = clouds
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -55.68, 563.32 )
	Image0:setTopBottom( true, false, 120, 248 )
	Image0:setRGB( 0.28, 0.28, 0.28 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -55.68, 563.32 )
	Image1:setTopBottom( true, false, -128, 0 )
	Image1:setRGB( 0.28, 0.28, 0.28 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -619, 0 )
	Image2:setTopBottom( true, false, -4, 124 )
	Image2:setRGB( 0.28, 0.28, 0.28 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 480, 1099 )
	Image3:setTopBottom( true, false, -4, 124 )
	Image3:setRGB( 0.28, 0.28, 0.28 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local CallingCardscodeairplane0Frame2 = function ( CallingCardscodeairplane0, event )
					local CallingCardscodeairplane0Frame3 = function ( CallingCardscodeairplane0, event )
						local CallingCardscodeairplane0Frame4 = function ( CallingCardscodeairplane0, event )
							local CallingCardscodeairplane0Frame5 = function ( CallingCardscodeairplane0, event )
								local CallingCardscodeairplane0Frame6 = function ( CallingCardscodeairplane0, event )
									local CallingCardscodeairplane0Frame7 = function ( CallingCardscodeairplane0, event )
										if not event.interrupted then
											CallingCardscodeairplane0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
										end
										CallingCardscodeairplane0:setLeftRight( true, false, 0, 480 )
										CallingCardscodeairplane0:setTopBottom( true, false, 0, 120 )
										if event.interrupted then
											self.clipFinished( CallingCardscodeairplane0, event )
										else
											CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CallingCardscodeairplane0Frame7( CallingCardscodeairplane0, event )
										return 
									else
										CallingCardscodeairplane0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
										CallingCardscodeairplane0:setTopBottom( true, false, 5, 125 )
										CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", CallingCardscodeairplane0Frame7 )
									end
								end
								
								if event.interrupted then
									CallingCardscodeairplane0Frame6( CallingCardscodeairplane0, event )
									return 
								else
									CallingCardscodeairplane0:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Linear )
									CallingCardscodeairplane0:setTopBottom( true, false, 9, 129 )
									CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", CallingCardscodeairplane0Frame6 )
								end
							end
							
							if event.interrupted then
								CallingCardscodeairplane0Frame5( CallingCardscodeairplane0, event )
								return 
							else
								CallingCardscodeairplane0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
								CallingCardscodeairplane0:setTopBottom( true, false, -4, 116 )
								CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", CallingCardscodeairplane0Frame5 )
							end
						end
						
						if event.interrupted then
							CallingCardscodeairplane0Frame4( CallingCardscodeairplane0, event )
							return 
						else
							CallingCardscodeairplane0:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
							CallingCardscodeairplane0:setTopBottom( true, false, -12, 108 )
							CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", CallingCardscodeairplane0Frame4 )
						end
					end
					
					if event.interrupted then
						CallingCardscodeairplane0Frame3( CallingCardscodeairplane0, event )
						return 
					else
						CallingCardscodeairplane0:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						CallingCardscodeairplane0:setTopBottom( true, false, -14.12, 105.88 )
						CallingCardscodeairplane0:registerEventHandler( "transition_complete_keyframe", CallingCardscodeairplane0Frame3 )
					end
				end
				
				CallingCardscodeairplane0:completeAnimation()
				self.CallingCardscodeairplane0:setLeftRight( true, false, 0, 480 )
				self.CallingCardscodeairplane0:setTopBottom( true, false, 0, 120 )
				CallingCardscodeairplane0Frame2( CallingCardscodeairplane0, {} )

				clouds:completeAnimation()
				self.clouds:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
				self.clouds:setShaderVector( 0, 1, 1, 0, 0 )
				self.clouds:setShaderVector( 1, 1.5, 0, 0, 0 )
				self.clipFinished( clouds, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscodeairplane0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

