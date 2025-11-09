CoD.CallingCards_Scifi_Fog = InheritFrom( LUI.UIElement )
CoD.CallingCards_Scifi_Fog.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Scifi_Fog )
	self.id = "CallingCards_Scifi_Fog"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 709 )
	self:setTopBottom( true, false, 0, 199 )
	
	local Fog = LUI.UIImage.new()
	Fog:setLeftRight( true, false, -205, 504.48 )
	Fog:setTopBottom( true, false, 0, 199 )
	Fog:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_fog" ) )
	Fog:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Fog )
	self.Fog = Fog
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local FogFrame2 = function ( Fog, event )
					local FogFrame3 = function ( Fog, event )
						if not event.interrupted then
							Fog:beginAnimation( "keyframe", 5029, false, false, CoD.TweenType.Linear )
						end
						Fog:setLeftRight( true, false, -0.48, 709 )
						Fog:setTopBottom( true, false, 0, 199 )
						Fog:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Fog, event )
						else
							Fog:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FogFrame3( Fog, event )
						return 
					else
						Fog:beginAnimation( "keyframe", 4960, false, false, CoD.TweenType.Linear )
						Fog:setLeftRight( true, false, -189.05, 520.43 )
						Fog:setAlpha( 1 )
						Fog:registerEventHandler( "transition_complete_keyframe", FogFrame3 )
					end
				end
				
				Fog:completeAnimation()
				self.Fog:setLeftRight( true, false, -375, 334.48 )
				self.Fog:setTopBottom( true, false, 0, 199 )
				self.Fog:setAlpha( 0 )
				FogFrame2( Fog, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

