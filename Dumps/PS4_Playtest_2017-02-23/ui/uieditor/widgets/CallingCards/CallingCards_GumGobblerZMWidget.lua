CoD.CallingCards_GumGobblerZMWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_GumGobblerZMWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_GumGobblerZMWidget )
	self.id = "CallingCards_GumGobblerZMWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 720 )
	BG:setTopBottom( 0, 0, 0, 180 )
	BG:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local BGInvert = LUI.UIImage.new()
	BGInvert:setLeftRight( 0, 0, 0, 720 )
	BGInvert:setTopBottom( 0, 0, 0, 180 )
	BGInvert:setAlpha( 0 )
	BGInvert:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_bg2" ) )
	self:addElement( BGInvert )
	self.BGInvert = BGInvert
	
	local wind = LUI.UIImage.new()
	wind:setLeftRight( 0, 0, 0, 720 )
	wind:setTopBottom( 0, 0, 0, 180 )
	wind:setAlpha( 0.57 )
	wind:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_wind" ) )
	wind:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	wind:setShaderVector( 0, 1, 1, 0, 0 )
	wind:setShaderVector( 1, 0.41, 0, 0, 0 )
	self:addElement( wind )
	self.wind = wind
	
	local skull1 = LUI.UIImage.new()
	skull1:setLeftRight( 0, 0, 76, 172 )
	skull1:setTopBottom( 0, 0, 48, 144 )
	skull1:setZRot( 17 )
	skull1:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_skull1" ) )
	self:addElement( skull1 )
	self.skull1 = skull1
	
	local skull2 = LUI.UIImage.new()
	skull2:setLeftRight( 0, 0, 156, 252 )
	skull2:setTopBottom( 0, 0, -18, 78 )
	skull2:setZRot( -34 )
	skull2:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_skull3" ) )
	self:addElement( skull2 )
	self.skull2 = skull2
	
	local skull3 = LUI.UIImage.new()
	skull3:setLeftRight( 0, 0, 192, 288 )
	skull3:setTopBottom( 0, 0, 56, 152 )
	skull3:setZRot( -99 )
	skull3:setImage( RegisterImage( "uie_t7_callingcards_gungobblerzm_skull2" ) )
	self:addElement( skull3 )
	self.skull3 = skull3
	
	self.resetProperties = function ()
		BGInvert:completeAnimation()
		skull1:completeAnimation()
		skull3:completeAnimation()
		skull2:completeAnimation()
		BGInvert:setAlpha( 0 )
		skull1:setLeftRight( 0, 0, 76, 172 )
		skull1:setTopBottom( 0, 0, 48, 144 )
		skull3:setLeftRight( 0, 0, 192, 288 )
		skull3:setTopBottom( 0, 0, 56, 152 )
		skull2:setLeftRight( 0, 0, 156, 252 )
		skull2:setTopBottom( 0, 0, -18, 78 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BGInvertFrame2 = function ( BGInvert, event )
					local BGInvertFrame3 = function ( BGInvert, event )
						local BGInvertFrame4 = function ( BGInvert, event )
							local BGInvertFrame5 = function ( BGInvert, event )
								local BGInvertFrame6 = function ( BGInvert, event )
									local BGInvertFrame7 = function ( BGInvert, event )
										local BGInvertFrame8 = function ( BGInvert, event )
											local BGInvertFrame9 = function ( BGInvert, event )
												local BGInvertFrame10 = function ( BGInvert, event )
													if not event.interrupted then
														BGInvert:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
													end
													BGInvert:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( BGInvert, event )
													else
														BGInvert:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BGInvertFrame10( BGInvert, event )
													return 
												else
													BGInvert:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													BGInvert:setAlpha( 0 )
													BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame10 )
												end
											end
											
											if event.interrupted then
												BGInvertFrame9( BGInvert, event )
												return 
											else
												BGInvert:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												BGInvert:setAlpha( 1 )
												BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame9 )
											end
										end
										
										if event.interrupted then
											BGInvertFrame8( BGInvert, event )
											return 
										else
											BGInvert:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											BGInvert:setAlpha( 0 )
											BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame8 )
										end
									end
									
									if event.interrupted then
										BGInvertFrame7( BGInvert, event )
										return 
									else
										BGInvert:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										BGInvert:setAlpha( 1 )
										BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame7 )
									end
								end
								
								if event.interrupted then
									BGInvertFrame6( BGInvert, event )
									return 
								else
									BGInvert:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
									BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame6 )
								end
							end
							
							if event.interrupted then
								BGInvertFrame5( BGInvert, event )
								return 
							else
								BGInvert:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								BGInvert:setAlpha( 0 )
								BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame5 )
							end
						end
						
						if event.interrupted then
							BGInvertFrame4( BGInvert, event )
							return 
						else
							BGInvert:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							BGInvert:setAlpha( 1 )
							BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame4 )
						end
					end
					
					if event.interrupted then
						BGInvertFrame3( BGInvert, event )
						return 
					else
						BGInvert:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						BGInvert:registerEventHandler( "transition_complete_keyframe", BGInvertFrame3 )
					end
				end
				
				BGInvert:completeAnimation()
				self.BGInvert:setAlpha( 0 )
				BGInvertFrame2( BGInvert, {} )
				local skull1Frame2 = function ( skull1, event )
					local skull1Frame3 = function ( skull1, event )
						if not event.interrupted then
							skull1:beginAnimation( "keyframe", 1390, false, false, CoD.TweenType.Linear )
						end
						skull1:setLeftRight( 0, 0, 96, 192 )
						skull1:setTopBottom( 0, 0, 30, 126 )
						if event.interrupted then
							self.clipFinished( skull1, event )
						else
							skull1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skull1Frame3( skull1, event )
						return 
					else
						skull1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						skull1:setLeftRight( 0, 0, 30, 126 )
						skull1:setTopBottom( 0, 0, 84, 180 )
						skull1:registerEventHandler( "transition_complete_keyframe", skull1Frame3 )
					end
				end
				
				skull1:completeAnimation()
				self.skull1:setLeftRight( 0, 0, 96, 192 )
				self.skull1:setTopBottom( 0, 0, 30, 126 )
				skull1Frame2( skull1, {} )
				local skull2Frame2 = function ( skull2, event )
					local skull2Frame3 = function ( skull2, event )
						if not event.interrupted then
							skull2:beginAnimation( "keyframe", 1390, false, false, CoD.TweenType.Linear )
						end
						skull2:setLeftRight( 0, 0, 156, 252 )
						skull2:setTopBottom( 0, 0, -18, 78 )
						if event.interrupted then
							self.clipFinished( skull2, event )
						else
							skull2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skull2Frame3( skull2, event )
						return 
					else
						skull2:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						skull2:setLeftRight( 0, 0, 162, 258 )
						skull2:setTopBottom( 0, 0, 9, 105 )
						skull2:registerEventHandler( "transition_complete_keyframe", skull2Frame3 )
					end
				end
				
				skull2:completeAnimation()
				self.skull2:setLeftRight( 0, 0, 156, 252 )
				self.skull2:setTopBottom( 0, 0, -18, 78 )
				skull2Frame2( skull2, {} )
				local skull3Frame2 = function ( skull3, event )
					local skull3Frame3 = function ( skull3, event )
						if not event.interrupted then
							skull3:beginAnimation( "keyframe", 1390, false, false, CoD.TweenType.Linear )
						end
						skull3:setLeftRight( 0, 0, 200, 296 )
						skull3:setTopBottom( 0, 0, 46, 142 )
						if event.interrupted then
							self.clipFinished( skull3, event )
						else
							skull3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						skull3Frame3( skull3, event )
						return 
					else
						skull3:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						skull3:setLeftRight( 0, 0, 236, 332 )
						skull3:setTopBottom( 0, 0, 74, 170 )
						skull3:registerEventHandler( "transition_complete_keyframe", skull3Frame3 )
					end
				end
				
				skull3:completeAnimation()
				self.skull3:setLeftRight( 0, 0, 200, 296 )
				self.skull3:setTopBottom( 0, 0, 46, 142 )
				skull3Frame2( skull3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

