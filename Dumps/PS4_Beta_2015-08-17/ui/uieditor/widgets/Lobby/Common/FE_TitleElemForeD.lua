CoD.FE_TitleElemForeD = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemForeD.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemForeD )
	self.id = "FE_TitleElemForeD"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 64 )
	
	local fored = LUI.UIImage.new()
	fored:setLeftRight( true, false, 0, 28 )
	fored:setTopBottom( true, false, 0, 64 )
	fored:setZoom( 20 )
	fored:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickb" ) )
	fored:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fored )
	self.fored = fored
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local foredFrame2 = function ( fored, event )
					local foredFrame3 = function ( fored, event )
						local foredFrame4 = function ( fored, event )
							local foredFrame5 = function ( fored, event )
								if not event.interrupted then
									fored:beginAnimation( "keyframe", 6000, true, true, CoD.TweenType.Linear )
								end
								fored:setLeftRight( true, false, 0, 28 )
								fored:setTopBottom( true, false, 0, 64 )
								if event.interrupted then
									self.clipFinished( fored, event )
								else
									fored:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								foredFrame5( fored, event )
								return 
							else
								fored:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
								fored:registerEventHandler( "transition_complete_keyframe", foredFrame5 )
							end
						end
						
						if event.interrupted then
							foredFrame4( fored, event )
							return 
						else
							fored:beginAnimation( "keyframe", 5860, true, true, CoD.TweenType.Linear )
							fored:setLeftRight( true, false, 6, 34 )
							fored:registerEventHandler( "transition_complete_keyframe", foredFrame4 )
						end
					end
					
					if event.interrupted then
						foredFrame3( fored, event )
						return 
					else
						fored:beginAnimation( "keyframe", 2579, false, false, CoD.TweenType.Linear )
						fored:registerEventHandler( "transition_complete_keyframe", foredFrame3 )
					end
				end
				
				fored:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				self.fored:setLeftRight( true, false, 0, 28 )
				self.fored:setTopBottom( true, false, 0, 64 )
				fored:registerEventHandler( "transition_complete_keyframe", foredFrame2 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

