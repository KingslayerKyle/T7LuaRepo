-- 9d1952b5197812636c9a29eab0d3deb2
-- This hash is used for caching, delete to decompile the file again

CoD.FE_TitleElemMid = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemMid.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemMid )
	self.id = "FE_TitleElemMid"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 64 )
	
	local mid = LUI.UIImage.new()
	mid:setLeftRight( true, false, 0, 120 )
	mid:setTopBottom( true, false, 0, 64 )
	mid:setZoom( -20 )
	mid:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickg" ) )
	mid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( mid )
	self.mid = mid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local midFrame2 = function ( mid, event )
					local midFrame3 = function ( mid, event )
						local midFrame4 = function ( mid, event )
							local midFrame5 = function ( mid, event )
								if not event.interrupted then
									mid:beginAnimation( "keyframe", 5460, true, true, CoD.TweenType.Linear )
								end
								mid:setLeftRight( true, false, 0, 120 )
								mid:setTopBottom( true, false, 0, 64 )
								if event.interrupted then
									self.clipFinished( mid, event )
								else
									mid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								midFrame5( mid, event )
								return 
							else
								mid:beginAnimation( "keyframe", 1079, false, false, CoD.TweenType.Linear )
								mid:registerEventHandler( "transition_complete_keyframe", midFrame5 )
							end
						end
						
						if event.interrupted then
							midFrame4( mid, event )
							return 
						else
							mid:beginAnimation( "keyframe", 3900, true, true, CoD.TweenType.Linear )
							mid:setLeftRight( true, false, 20, 140 )
							mid:registerEventHandler( "transition_complete_keyframe", midFrame4 )
						end
					end
					
					if event.interrupted then
						midFrame3( mid, event )
						return 
					else
						mid:beginAnimation( "keyframe", 2859, false, false, CoD.TweenType.Linear )
						mid:registerEventHandler( "transition_complete_keyframe", midFrame3 )
					end
				end
				
				mid:completeAnimation()
				self.mid:setLeftRight( true, false, 0, 120 )
				self.mid:setTopBottom( true, false, 0, 64 )
				midFrame2( mid, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
