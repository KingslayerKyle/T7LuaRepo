CoD.SearchingForPlayer_Flipped = InheritFrom( LUI.UIElement )
CoD.SearchingForPlayer_Flipped.new = function ( menu, controller )
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
	self:setClass( CoD.SearchingForPlayer_Flipped )
	self.id = "SearchingForPlayer_Flipped"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 528 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Dot3 = LUI.UITightText.new()
	Dot3:setLeftRight( 0, 0, 0, 6 )
	Dot3:setTopBottom( 0, 0, 0, 38 )
	Dot3:setText( Engine.Localize( "." ) )
	Dot3:setTTF( "fonts/default.ttf" )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot2 = LUI.UITightText.new()
	Dot2:setLeftRight( 0, 0, 6, 12 )
	Dot2:setTopBottom( 0, 0, 0, 38 )
	Dot2:setText( Engine.Localize( "." ) )
	Dot2:setTTF( "fonts/default.ttf" )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot1 = LUI.UITightText.new()
	Dot1:setLeftRight( 0, 0, 12, 18 )
	Dot1:setTopBottom( 0, 0, 0, 38 )
	Dot1:setText( Engine.Localize( "." ) )
	Dot1:setTTF( "fonts/default.ttf" )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot0 = LUI.UITightText.new()
	Dot0:setLeftRight( 0, 0, 18, 24 )
	Dot0:setTopBottom( 0, 0, 0, 38 )
	Dot0:setText( Engine.Localize( "." ) )
	Dot0:setTTF( "fonts/default.ttf" )
	self:addElement( Dot0 )
	self.Dot0 = Dot0
	
	local SearchingForPlayer = LUI.UITightText.new()
	SearchingForPlayer:setLeftRight( 0, 0, 24, 528 )
	SearchingForPlayer:setTopBottom( 0, 0, 0, 38 )
	SearchingForPlayer:setText( Engine.Localize( "MENU_SEARCHING_FOR_PLAYER" ) )
	SearchingForPlayer:setTTF( "fonts/default.ttf" )
	self:addElement( SearchingForPlayer )
	self.SearchingForPlayer = SearchingForPlayer
	
	self.resetProperties = function ()
		Dot0:completeAnimation()
		Dot1:completeAnimation()
		Dot2:completeAnimation()
		Dot3:completeAnimation()
		Dot0:setAlpha( 1 )
		Dot1:setAlpha( 1 )
		Dot2:setAlpha( 1 )
		Dot3:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

