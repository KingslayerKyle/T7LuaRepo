require( "ui.uieditor.widgets.Lobby.Common.FE_Featured" )

CoD.FE_FeaturedContainer = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedContainer )
	self.id = "FE_FeaturedContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 138 )
	self.anyChildUsesUpdateState = true
	
	local FEFeatured0 = CoD.FE_Featured.new( menu, controller )
	FEFeatured0:setLeftRight( true, false, 0, 442 )
	FEFeatured0:setTopBottom( true, false, 0, 138 )
	FEFeatured0:setRGB( 1, 1, 1 )
	FEFeatured0.FEListHeader0:setAlpha( 0.05 )
	FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
	self:addElement( FEFeatured0 )
	self.FEFeatured0 = FEFeatured0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEFeatured0:completeAnimation()
				FEFeatured0.FEListHeader0:completeAnimation()
				FEFeatured0.FEFeaturedSubHeader0:completeAnimation()
				self.FEFeatured0:setAlpha( 0 )
				self.FEFeatured0.FEListHeader0:setAlpha( 0 )
				self.FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
				self.clipFinished( FEFeatured0, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 1 )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					local FEFeatured0Frame3 = function ( FEFeatured0, event )
						local FEFeatured0Frame4 = function ( FEFeatured0, event )
							local FEFeatured0Frame5 = function ( FEFeatured0, event )
								local FEFeatured0Frame6 = function ( FEFeatured0, event )
									if not event.interrupted then
										FEFeatured0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
										FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 240, false, false, CoD.TweenType.Bounce )
										FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 240, false, false, CoD.TweenType.Bounce )
									end
									FEFeatured0:setAlpha( 1 )
									FEFeatured0.FEListHeader0:setAlpha( 1 )
									FEFeatured0.FEFeaturedSubHeader0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FEFeatured0, event )
									else
										FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FEFeatured0Frame6( FEFeatured0, event )
									return 
								else
									FEFeatured0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
									FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 189, false, false, CoD.TweenType.Bounce )
									FEFeatured0.FEListHeader0:setAlpha( 1 )
									FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame6 )
								end
							end
							
							if event.interrupted then
								FEFeatured0Frame5( FEFeatured0, event )
								return 
							else
								FEFeatured0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Bounce )
								FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Bounce )
								FEFeatured0:setAlpha( 1 )
								FEFeatured0.FEListHeader0:setAlpha( 0.02 )
								FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame5 )
							end
						end
						
						if event.interrupted then
							FEFeatured0Frame4( FEFeatured0, event )
							return 
						else
							FEFeatured0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							FEFeatured0:setAlpha( 0.97 )
							FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame4 )
						end
					end
					
					if event.interrupted then
						FEFeatured0Frame3( FEFeatured0, event )
						return 
					else
						FEFeatured0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame3 )
					end
				end
				
				FEFeatured0:completeAnimation()
				FEFeatured0.FEListHeader0:completeAnimation()
				FEFeatured0.FEFeaturedSubHeader0:completeAnimation()
				self.FEFeatured0:setAlpha( 0 )
				self.FEFeatured0.FEListHeader0:setAlpha( 0 )
				self.FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
				FEFeatured0Frame2( FEFeatured0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEFeatured0:completeAnimation()
				FEFeatured0.FEListHeader0:completeAnimation()
				FEFeatured0.FEFeaturedSubHeader0:completeAnimation()
				self.FEFeatured0:setAlpha( 1 )
				self.FEFeatured0.FEListHeader0:setAlpha( 1 )
				self.FEFeatured0.FEFeaturedSubHeader0:setAlpha( 1 )
				self.clipFinished( FEFeatured0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					local FEFeatured0Frame3 = function ( FEFeatured0, event )
						local FEFeatured0Frame4 = function ( FEFeatured0, event )
							local FEFeatured0Frame5 = function ( FEFeatured0, event )
								local FEFeatured0Frame6 = function ( FEFeatured0, event )
									if not event.interrupted then
										FEFeatured0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
										FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
									end
									FEFeatured0:setAlpha( 0 )
									FEFeatured0.FEListHeader0:setAlpha( 0 )
									FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FEFeatured0, event )
									else
										FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FEFeatured0Frame6( FEFeatured0, event )
									return 
								else
									FEFeatured0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
									FEFeatured0:setAlpha( 0.37 )
									FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
									FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame6 )
								end
							end
							
							if event.interrupted then
								FEFeatured0Frame5( FEFeatured0, event )
								return 
							else
								FEFeatured0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
								FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Bounce )
								FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Bounce )
								FEFeatured0:setAlpha( 0.74 )
								FEFeatured0.FEListHeader0:setAlpha( 0 )
								FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0.41 )
								FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame5 )
							end
						end
						
						if event.interrupted then
							FEFeatured0Frame4( FEFeatured0, event )
							return 
						else
							FEFeatured0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
							FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
							FEFeatured0.FEListHeader0:setAlpha( 0.12 )
							FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0.71 )
							FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame4 )
						end
					end
					
					if event.interrupted then
						FEFeatured0Frame3( FEFeatured0, event )
						return 
					else
						FEFeatured0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
						FEFeatured0.FEListHeader0:setAlpha( 0.04 )
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame3 )
					end
				end
				
				FEFeatured0:completeAnimation()
				FEFeatured0.FEListHeader0:completeAnimation()
				FEFeatured0.FEFeaturedSubHeader0:completeAnimation()
				self.FEFeatured0:setAlpha( 1 )
				self.FEFeatured0.FEListHeader0:setAlpha( 1 )
				self.FEFeatured0.FEFeaturedSubHeader0:setAlpha( 1 )
				FEFeatured0Frame2( FEFeatured0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 1 )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					local FEFeatured0Frame3 = function ( FEFeatured0, event )
						local FEFeatured0Frame4 = function ( FEFeatured0, event )
							local FEFeatured0Frame5 = function ( FEFeatured0, event )
								local FEFeatured0Frame6 = function ( FEFeatured0, event )
									local FEFeatured0Frame7 = function ( FEFeatured0, event )
										if not event.interrupted then
											FEFeatured0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
											FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 410, false, false, CoD.TweenType.Linear )
											FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 410, false, false, CoD.TweenType.Linear )
										end
										FEFeatured0:setAlpha( 1 )
										FEFeatured0.FEListHeader0:setAlpha( 1 )
										FEFeatured0.FEFeaturedSubHeader0:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FEFeatured0, event )
										else
											FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FEFeatured0Frame7( FEFeatured0, event )
										return 
									else
										FEFeatured0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										FEFeatured0.FEListHeader0:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
										FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
										FEFeatured0.FEListHeader0:setAlpha( 0.21 )
										FEFeatured0.FEFeaturedSubHeader0:setAlpha( 1 )
										FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame7 )
									end
								end
								
								if event.interrupted then
									FEFeatured0Frame6( FEFeatured0, event )
									return 
								else
									FEFeatured0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 199, false, false, CoD.TweenType.Linear )
									FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0.72 )
									FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame6 )
								end
							end
							
							if event.interrupted then
								FEFeatured0Frame5( FEFeatured0, event )
								return 
							else
								FEFeatured0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								FEFeatured0.FEFeaturedSubHeader0:beginAnimation( "subkeyframe", 80, false, false, CoD.TweenType.Linear )
								FEFeatured0:setAlpha( 1 )
								FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0.21 )
								FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame5 )
							end
						end
						
						if event.interrupted then
							FEFeatured0Frame4( FEFeatured0, event )
							return 
						else
							FEFeatured0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
							FEFeatured0:setAlpha( 0.8 )
							FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame4 )
						end
					end
					
					if event.interrupted then
						FEFeatured0Frame3( FEFeatured0, event )
						return 
					else
						FEFeatured0:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame3 )
					end
				end
				
				FEFeatured0:completeAnimation()
				FEFeatured0.FEListHeader0:completeAnimation()
				FEFeatured0.FEFeaturedSubHeader0:completeAnimation()
				self.FEFeatured0:setAlpha( 0 )
				self.FEFeatured0.FEListHeader0:setAlpha( 0 )
				self.FEFeatured0.FEFeaturedSubHeader0:setAlpha( 0 )
				FEFeatured0Frame2( FEFeatured0, {} )
			end
		}
	}
	self.close = function ( self )
		self.FEFeatured0:close()
		CoD.FE_FeaturedContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

