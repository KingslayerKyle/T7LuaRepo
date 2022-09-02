-- 5b63a0bfbe959ed6bcefa1841b8b5bbf
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_CartoonZombies_Firefly = InheritFrom( LUI.UIElement )
CoD.CallingCards_CartoonZombies_Firefly.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_CartoonZombies_Firefly )
	self.id = "CallingCards_CartoonZombies_Firefly"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 119 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Fly1 = LUI.UIImage.new()
	Fly1:setLeftRight( true, false, 0, 118.85 )
	Fly1:setTopBottom( true, false, 0, 120 )
	Fly1:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_firefly_flipbook" ) )
	Fly1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Fly1:setShaderVector( 0, 2, 0, 0, 0 )
	Fly1:setShaderVector( 1, 22.59, 0, 0, 0 )
	self:addElement( Fly1 )
	self.Fly1 = Fly1
	
	local Light = LUI.UIImage.new()
	Light:setLeftRight( true, false, -12.44, 143.56 )
	Light:setTopBottom( true, false, -12, 144 )
	Light:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_fireflyglow" ) )
	self:addElement( Light )
	self.Light = Light
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local LightFrame2 = function ( Light, event )
					local LightFrame3 = function ( Light, event )
						local LightFrame4 = function ( Light, event )
							local LightFrame5 = function ( Light, event )
								local LightFrame6 = function ( Light, event )
									local LightFrame7 = function ( Light, event )
										local LightFrame8 = function ( Light, event )
											if not event.interrupted then
												Light:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
											end
											Light:setAlpha( 0.2 )
											if event.interrupted then
												self.clipFinished( Light, event )
											else
												Light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											LightFrame8( Light, event )
											return 
										else
											Light:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
											Light:setAlpha( 1 )
											Light:registerEventHandler( "transition_complete_keyframe", LightFrame8 )
										end
									end
									
									if event.interrupted then
										LightFrame7( Light, event )
										return 
									else
										Light:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
										Light:setAlpha( 0.8 )
										Light:registerEventHandler( "transition_complete_keyframe", LightFrame7 )
									end
								end
								
								if event.interrupted then
									LightFrame6( Light, event )
									return 
								else
									Light:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									Light:setAlpha( 0.2 )
									Light:registerEventHandler( "transition_complete_keyframe", LightFrame6 )
								end
							end
							
							if event.interrupted then
								LightFrame5( Light, event )
								return 
							else
								Light:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								Light:setAlpha( 1 )
								Light:registerEventHandler( "transition_complete_keyframe", LightFrame5 )
							end
						end
						
						if event.interrupted then
							LightFrame4( Light, event )
							return 
						else
							Light:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
							Light:setAlpha( 0.5 )
							Light:registerEventHandler( "transition_complete_keyframe", LightFrame4 )
						end
					end
					
					if event.interrupted then
						LightFrame3( Light, event )
						return 
					else
						Light:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Light:setAlpha( 1 )
						Light:registerEventHandler( "transition_complete_keyframe", LightFrame3 )
					end
				end
				
				Light:completeAnimation()
				self.Light:setAlpha( 0.2 )
				LightFrame2( Light, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

