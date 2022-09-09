-- f7a38a042b082678ab60fcc961ca2e55
-- This hash is used for caching, delete to decompile the file again

CoD.DniWipe_TopLineBlink = InheritFrom( LUI.UIElement )
CoD.DniWipe_TopLineBlink.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_TopLineBlink )
	self.id = "DniWipe_TopLineBlink"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 25 )
	self:setTopBottom( true, false, 0, 3 )
	
	local CenterlineTop = LUI.UIImage.new()
	CenterlineTop:setLeftRight( false, false, -12.5, 12.5 )
	CenterlineTop:setTopBottom( false, false, -1.5, 1.5 )
	CenterlineTop:setZRot( 90 )
	CenterlineTop:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	CenterlineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterlineTop )
	self.CenterlineTop = CenterlineTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local CenterlineTopFrame2 = function ( CenterlineTop, event )
					local CenterlineTopFrame3 = function ( CenterlineTop, event )
						local CenterlineTopFrame4 = function ( CenterlineTop, event )
							local CenterlineTopFrame5 = function ( CenterlineTop, event )
								local CenterlineTopFrame6 = function ( CenterlineTop, event )
									local CenterlineTopFrame7 = function ( CenterlineTop, event )
										local CenterlineTopFrame8 = function ( CenterlineTop, event )
											local CenterlineTopFrame9 = function ( CenterlineTop, event )
												if not event.interrupted then
													CenterlineTop:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
												end
												CenterlineTop:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( CenterlineTop, event )
												else
													CenterlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												CenterlineTopFrame9( CenterlineTop, event )
												return 
											else
												CenterlineTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												CenterlineTop:setAlpha( 0 )
												CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame9 )
											end
										end
										
										if event.interrupted then
											CenterlineTopFrame8( CenterlineTop, event )
											return 
										else
											CenterlineTop:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
											CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame8 )
										end
									end
									
									if event.interrupted then
										CenterlineTopFrame7( CenterlineTop, event )
										return 
									else
										CenterlineTop:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
										CenterlineTop:setAlpha( 1 )
										CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame7 )
									end
								end
								
								if event.interrupted then
									CenterlineTopFrame6( CenterlineTop, event )
									return 
								else
									CenterlineTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CenterlineTop:setAlpha( 0.1 )
									CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame6 )
								end
							end
							
							if event.interrupted then
								CenterlineTopFrame5( CenterlineTop, event )
								return 
							else
								CenterlineTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								CenterlineTop:setAlpha( 0.24 )
								CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame5 )
							end
						end
						
						if event.interrupted then
							CenterlineTopFrame4( CenterlineTop, event )
							return 
						else
							CenterlineTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							CenterlineTop:setAlpha( 0.04 )
							CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame4 )
						end
					end
					
					if event.interrupted then
						CenterlineTopFrame3( CenterlineTop, event )
						return 
					else
						CenterlineTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						CenterlineTop:setAlpha( 0.31 )
						CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame3 )
					end
				end
				
				CenterlineTop:completeAnimation()
				self.CenterlineTop:setAlpha( 0 )
				CenterlineTopFrame2( CenterlineTop, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
