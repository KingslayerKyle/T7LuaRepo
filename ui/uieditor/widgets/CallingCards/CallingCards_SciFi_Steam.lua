-- f61d41a515e39ad5895748ef1ca6f71f
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_SciFi_Steam = InheritFrom( LUI.UIElement )
CoD.CallingCards_SciFi_Steam.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SciFi_Steam )
	self.id = "CallingCards_SciFi_Steam"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 134 )
	
	local Steam = LUI.UIImage.new()
	Steam:setLeftRight( true, false, 0, 353.81 )
	Steam:setTopBottom( true, false, 0, 133.76 )
	Steam:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_steam" ) )
	self:addElement( Steam )
	self.Steam = Steam
	
	local Steam0 = LUI.UIImage.new()
	Steam0:setLeftRight( true, false, 0, 353.81 )
	Steam0:setTopBottom( true, false, 0, 133.76 )
	Steam0:setScale( 0.9 )
	Steam0:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_steam" ) )
	self:addElement( Steam0 )
	self.Steam0 = Steam0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local SteamFrame2 = function ( Steam, event )
					local SteamFrame3 = function ( Steam, event )
						local SteamFrame4 = function ( Steam, event )
							local SteamFrame5 = function ( Steam, event )
								if not event.interrupted then
									Steam:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
								end
								Steam:setAlpha( 1 )
								Steam:setScale( 0.9 )
								if event.interrupted then
									self.clipFinished( Steam, event )
								else
									Steam:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SteamFrame5( Steam, event )
								return 
							else
								Steam:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Steam:setScale( 0.8 )
								Steam:registerEventHandler( "transition_complete_keyframe", SteamFrame5 )
							end
						end
						
						if event.interrupted then
							SteamFrame4( Steam, event )
							return 
						else
							Steam:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Steam:setAlpha( 0 )
							Steam:setScale( 1.13 )
							Steam:registerEventHandler( "transition_complete_keyframe", SteamFrame4 )
						end
					end
					
					if event.interrupted then
						SteamFrame3( Steam, event )
						return 
					else
						Steam:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
						Steam:setAlpha( 0.01 )
						Steam:setScale( 1.3 )
						Steam:registerEventHandler( "transition_complete_keyframe", SteamFrame3 )
					end
				end
				
				Steam:completeAnimation()
				self.Steam:setAlpha( 1 )
				self.Steam:setScale( 0.9 )
				SteamFrame2( Steam, {} )
				local Steam0Frame2 = function ( Steam0, event )
					local Steam0Frame3 = function ( Steam0, event )
						local Steam0Frame4 = function ( Steam0, event )
							local Steam0Frame5 = function ( Steam0, event )
								if not event.interrupted then
									Steam0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
								end
								Steam0:setAlpha( 0 )
								Steam0:setScale( 1.2 )
								if event.interrupted then
									self.clipFinished( Steam0, event )
								else
									Steam0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Steam0Frame5( Steam0, event )
								return 
							else
								Steam0:beginAnimation( "keyframe", 1380, false, false, CoD.TweenType.Linear )
								Steam0:setAlpha( 1 )
								Steam0:setScale( 1.06 )
								Steam0:registerEventHandler( "transition_complete_keyframe", Steam0Frame5 )
							end
						end
						
						if event.interrupted then
							Steam0Frame4( Steam0, event )
							return 
						else
							Steam0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							Steam0:setAlpha( 0.13 )
							Steam0:registerEventHandler( "transition_complete_keyframe", Steam0Frame4 )
						end
					end
					
					if event.interrupted then
						Steam0Frame3( Steam0, event )
						return 
					else
						Steam0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						Steam0:registerEventHandler( "transition_complete_keyframe", Steam0Frame3 )
					end
				end
				
				Steam0:completeAnimation()
				self.Steam0:setAlpha( 0 )
				self.Steam0:setScale( 0.9 )
				Steam0Frame2( Steam0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

