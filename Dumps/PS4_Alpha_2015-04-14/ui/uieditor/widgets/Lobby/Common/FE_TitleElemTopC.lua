CoD.FE_TitleElemTopC = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemTopC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemTopC )
	self.id = "FE_TitleElemTopC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 4 )
	
	local topc = LUI.UIImage.new()
	topc:setLeftRight( true, false, 0, 24 )
	topc:setTopBottom( true, false, 0, 4 )
	topc:setRGB( 1, 1, 1 )
	topc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicktopc" ) )
	topc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topc )
	self.topc = topc
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local topcFrame2 = function ( topc, event )
					local topcFrame3 = function ( topc, event )
						local topcFrame4 = function ( topc, event )
							if not event.interrupted then
								topc:beginAnimation( "keyframe", 8480, true, true, CoD.TweenType.Linear )
							end
							topc:setLeftRight( true, false, 0, 24 )
							topc:setTopBottom( true, false, 0, 4 )
							if event.interrupted then
								self.clipFinished( topc, event )
							else
								topc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							topcFrame4( topc, event )
							return 
						else
							topc:beginAnimation( "keyframe", 7060, true, true, CoD.TweenType.Linear )
							topc:setLeftRight( true, false, -8, 16 )
							topc:registerEventHandler( "transition_complete_keyframe", topcFrame4 )
						end
					end
					
					if event.interrupted then
						topcFrame3( topc, event )
						return 
					else
						topc:beginAnimation( "keyframe", 3579, false, false, CoD.TweenType.Linear )
						topc:registerEventHandler( "transition_complete_keyframe", topcFrame3 )
					end
				end
				
				topc:completeAnimation()
				self.topc:setLeftRight( true, false, 0, 24 )
				self.topc:setTopBottom( true, false, 0, 4 )
				topcFrame2( topc, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

