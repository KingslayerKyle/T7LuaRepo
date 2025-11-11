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
	self:setLeftRight( 0, 0, 0, 1063 )
	self:setTopBottom( 0, 0, 0, 298 )
	
	local Fog = LUI.UIImage.new()
	Fog:setLeftRight( 0, 0, -307, 757 )
	Fog:setTopBottom( 0, 0, 0, 298 )
	Fog:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_fog" ) )
	Fog:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Fog )
	self.Fog = Fog
	
	self.resetProperties = function ()
		Fog:completeAnimation()
		Fog:setLeftRight( 0, 0, -307, 757 )
		Fog:setTopBottom( 0, 0, 0, 298 )
		Fog:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local FogFrame2 = function ( Fog, event )
					local FogFrame3 = function ( Fog, event )
						if not event.interrupted then
							Fog:beginAnimation( "keyframe", 5029, false, false, CoD.TweenType.Linear )
						end
						Fog:setLeftRight( 0, 0, -1, 1063 )
						Fog:setTopBottom( 0, 0, 0, 298 )
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
						Fog:setLeftRight( 0, 0, -283.47, 780.53 )
						Fog:setAlpha( 1 )
						Fog:registerEventHandler( "transition_complete_keyframe", FogFrame3 )
					end
				end
				
				Fog:completeAnimation()
				self.Fog:setLeftRight( 0, 0, -562, 502 )
				self.Fog:setTopBottom( 0, 0, 0, 298 )
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

