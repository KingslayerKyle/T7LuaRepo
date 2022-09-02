-- 007ddfe06933567a29bf83bde5cc4ea5
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_SoldierRaft_Flag = InheritFrom( LUI.UIElement )
CoD.CallingCard_SoldierRaft_Flag.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_SoldierRaft_Flag )
	self.id = "CallingCard_SoldierRaft_Flag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local Flag2 = LUI.UIImage.new()
	Flag2:setLeftRight( true, false, 0, 60 )
	Flag2:setTopBottom( true, false, 0, 60 )
	Flag2:setAlpha( 0 )
	Flag2:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_flag2" ) )
	self:addElement( Flag2 )
	self.Flag2 = Flag2
	
	local Flag1 = LUI.UIImage.new()
	Flag1:setLeftRight( true, false, 0, 60 )
	Flag1:setTopBottom( true, false, 0, 60 )
	Flag1:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_flag1" ) )
	self:addElement( Flag1 )
	self.Flag1 = Flag1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Flag2Frame2 = function ( Flag2, event )
					local Flag2Frame3 = function ( Flag2, event )
						local Flag2Frame4 = function ( Flag2, event )
							local Flag2Frame5 = function ( Flag2, event )
								local Flag2Frame6 = function ( Flag2, event )
									local Flag2Frame7 = function ( Flag2, event )
										if not event.interrupted then
											Flag2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										end
										Flag2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Flag2, event )
										else
											Flag2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Flag2Frame7( Flag2, event )
										return 
									else
										Flag2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
										Flag2:setAlpha( 1 )
										Flag2:registerEventHandler( "transition_complete_keyframe", Flag2Frame7 )
									end
								end
								
								if event.interrupted then
									Flag2Frame6( Flag2, event )
									return 
								else
									Flag2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
									Flag2:setAlpha( 0 )
									Flag2:registerEventHandler( "transition_complete_keyframe", Flag2Frame6 )
								end
							end
							
							if event.interrupted then
								Flag2Frame5( Flag2, event )
								return 
							else
								Flag2:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								Flag2:setAlpha( 1 )
								Flag2:registerEventHandler( "transition_complete_keyframe", Flag2Frame5 )
							end
						end
						
						if event.interrupted then
							Flag2Frame4( Flag2, event )
							return 
						else
							Flag2:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							Flag2:setAlpha( 0 )
							Flag2:registerEventHandler( "transition_complete_keyframe", Flag2Frame4 )
						end
					end
					
					if event.interrupted then
						Flag2Frame3( Flag2, event )
						return 
					else
						Flag2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Flag2:setAlpha( 1 )
						Flag2:registerEventHandler( "transition_complete_keyframe", Flag2Frame3 )
					end
				end
				
				Flag2:completeAnimation()
				self.Flag2:setAlpha( 0 )
				Flag2Frame2( Flag2, {} )
				local Flag1Frame2 = function ( Flag1, event )
					local Flag1Frame3 = function ( Flag1, event )
						local Flag1Frame4 = function ( Flag1, event )
							local Flag1Frame5 = function ( Flag1, event )
								local Flag1Frame6 = function ( Flag1, event )
									local Flag1Frame7 = function ( Flag1, event )
										if not event.interrupted then
											Flag1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										end
										Flag1:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Flag1, event )
										else
											Flag1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Flag1Frame7( Flag1, event )
										return 
									else
										Flag1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
										Flag1:setAlpha( 0 )
										Flag1:registerEventHandler( "transition_complete_keyframe", Flag1Frame7 )
									end
								end
								
								if event.interrupted then
									Flag1Frame6( Flag1, event )
									return 
								else
									Flag1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
									Flag1:setAlpha( 1 )
									Flag1:registerEventHandler( "transition_complete_keyframe", Flag1Frame6 )
								end
							end
							
							if event.interrupted then
								Flag1Frame5( Flag1, event )
								return 
							else
								Flag1:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								Flag1:setAlpha( 0 )
								Flag1:registerEventHandler( "transition_complete_keyframe", Flag1Frame5 )
							end
						end
						
						if event.interrupted then
							Flag1Frame4( Flag1, event )
							return 
						else
							Flag1:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							Flag1:setAlpha( 1 )
							Flag1:registerEventHandler( "transition_complete_keyframe", Flag1Frame4 )
						end
					end
					
					if event.interrupted then
						Flag1Frame3( Flag1, event )
						return 
					else
						Flag1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Flag1:setAlpha( 0 )
						Flag1:registerEventHandler( "transition_complete_keyframe", Flag1Frame3 )
					end
				end
				
				Flag1:completeAnimation()
				self.Flag1:setAlpha( 1 )
				Flag1Frame2( Flag1, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

