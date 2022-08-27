-- 3bc5eee1ea9c3d31100c61bc9f79ea2b
-- This hash is used for caching, delete to decompile the file again

CoD.SearchingForPlayer = InheritFrom( LUI.UIElement )
CoD.SearchingForPlayer.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SearchingForPlayer )
	self.id = "SearchingForPlayer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 25 )
	
	local SearchingForPlayer = LUI.UITightText.new()
	SearchingForPlayer:setLeftRight( true, false, 0, 200 )
	SearchingForPlayer:setTopBottom( true, false, 0, 25 )
	SearchingForPlayer:setText( Engine.Localize( "MENU_SEARCHING_FOR_PLAYER" ) )
	SearchingForPlayer:setTTF( "fonts/default.ttf" )
	self:addElement( SearchingForPlayer )
	self.SearchingForPlayer = SearchingForPlayer
	
	local Dot0 = LUI.UITightText.new()
	Dot0:setLeftRight( true, false, 200, 204 )
	Dot0:setTopBottom( true, false, 0, 25 )
	Dot0:setText( Engine.Localize( "." ) )
	Dot0:setTTF( "fonts/default.ttf" )
	self:addElement( Dot0 )
	self.Dot0 = Dot0
	
	local Dot1 = LUI.UITightText.new()
	Dot1:setLeftRight( true, false, 204, 208 )
	Dot1:setTopBottom( true, false, 0, 25 )
	Dot1:setText( Engine.Localize( "." ) )
	Dot1:setTTF( "fonts/default.ttf" )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = LUI.UITightText.new()
	Dot2:setLeftRight( true, false, 208, 212 )
	Dot2:setTopBottom( true, false, 0, 25 )
	Dot2:setText( Engine.Localize( "." ) )
	Dot2:setTTF( "fonts/default.ttf" )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = LUI.UITightText.new()
	Dot3:setLeftRight( true, false, 212, 216 )
	Dot3:setTopBottom( true, false, 0, 25 )
	Dot3:setText( Engine.Localize( "." ) )
	Dot3:setTTF( "fonts/default.ttf" )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = LUI.UITightText.new()
	Dot4:setLeftRight( true, false, 216, 220 )
	Dot4:setTopBottom( true, false, 0, 25 )
	Dot4:setText( Engine.Localize( "." ) )
	Dot4:setTTF( "fonts/default.ttf" )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local Dot0Frame2 = function ( Dot0, event )
					if not event.interrupted then
						Dot0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					Dot0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Dot0, event )
					else
						Dot0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot0:completeAnimation()
				self.Dot0:setAlpha( 1 )
				Dot0Frame2( Dot0, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							local Dot1Frame5 = function ( Dot1, event )
								local Dot1Frame6 = function ( Dot1, event )
									if not event.interrupted then
										Dot1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									end
									Dot1:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Dot1, event )
									else
										Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Dot1Frame6( Dot1, event )
									return 
								else
									Dot1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									Dot1:setAlpha( 0 )
									Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame6 )
								end
							end
							
							if event.interrupted then
								Dot1Frame5( Dot1, event )
								return 
							else
								Dot1:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
								Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame5 )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							Dot1:setAlpha( 1 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							local Dot2Frame5 = function ( Dot2, event )
								local Dot2Frame6 = function ( Dot2, event )
									if not event.interrupted then
										Dot2:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
									end
									Dot2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Dot2, event )
									else
										Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Dot2Frame6( Dot2, event )
									return 
								else
									Dot2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									Dot2:setAlpha( 0 )
									Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame6 )
								end
							end
							
							if event.interrupted then
								Dot2Frame5( Dot2, event )
								return 
							else
								Dot2:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
								Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame5 )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							Dot2:setAlpha( 1 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							local Dot3Frame5 = function ( Dot3, event )
								local Dot3Frame6 = function ( Dot3, event )
									if not event.interrupted then
										Dot3:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
									end
									Dot3:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Dot3, event )
									else
										Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Dot3Frame6( Dot3, event )
									return 
								else
									Dot3:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									Dot3:setAlpha( 0 )
									Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame6 )
								end
							end
							
							if event.interrupted then
								Dot3Frame5( Dot3, event )
								return 
							else
								Dot3:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
								Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame5 )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							Dot3:setAlpha( 1 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							local Dot4Frame5 = function ( Dot4, event )
								if not event.interrupted then
									Dot4:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
								end
								Dot4:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot4, event )
								else
									Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot4Frame5( Dot4, event )
								return 
							else
								Dot4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame5 )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

