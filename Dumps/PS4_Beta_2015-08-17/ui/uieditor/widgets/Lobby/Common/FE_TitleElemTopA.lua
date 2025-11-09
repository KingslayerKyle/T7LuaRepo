CoD.FE_TitleElemTopA = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemTopA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemTopA )
	self.id = "FE_TitleElemTopA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 4 )
	
	local topa = LUI.UIImage.new()
	topa:setLeftRight( true, false, 0, 56 )
	topa:setTopBottom( true, false, 0, 4 )
	topa:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicktopa" ) )
	topa:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topa )
	self.topa = topa
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local topaFrame2 = function ( topa, event )
					local topaFrame3 = function ( topa, event )
						local topaFrame4 = function ( topa, event )
							local topaFrame5 = function ( topa, event )
								if not event.interrupted then
									topa:beginAnimation( "keyframe", 8779, true, true, CoD.TweenType.Linear )
								end
								topa:setLeftRight( true, false, 0, 56 )
								topa:setTopBottom( true, false, 0, 4 )
								if event.interrupted then
									self.clipFinished( topa, event )
								else
									topa:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								topaFrame5( topa, event )
								return 
							else
								topa:beginAnimation( "keyframe", 3859, false, false, CoD.TweenType.Linear )
								topa:registerEventHandler( "transition_complete_keyframe", topaFrame5 )
							end
						end
						
						if event.interrupted then
							topaFrame4( topa, event )
							return 
						else
							topa:beginAnimation( "keyframe", 7900, true, true, CoD.TweenType.Linear )
							topa:setLeftRight( true, false, -20, 36 )
							topa:registerEventHandler( "transition_complete_keyframe", topaFrame4 )
						end
					end
					
					if event.interrupted then
						topaFrame3( topa, event )
						return 
					else
						topa:beginAnimation( "keyframe", 3279, false, false, CoD.TweenType.Linear )
						topa:registerEventHandler( "transition_complete_keyframe", topaFrame3 )
					end
				end
				
				topa:completeAnimation()
				self.topa:setLeftRight( true, false, 0, 56 )
				self.topa:setTopBottom( true, false, 0, 4 )
				topaFrame2( topa, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

