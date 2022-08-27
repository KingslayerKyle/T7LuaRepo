-- 4038f104fc8ac674a7d2d44e461abde2
-- This hash is used for caching, delete to decompile the file again

CoD.FE_TitleElemBackA = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemBackA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemBackA )
	self.id = "FE_TitleElemBackA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 120 )
	
	local backa = LUI.UIImage.new()
	backa:setLeftRight( true, false, 0, 36 )
	backa:setTopBottom( true, false, 0, 120 )
	backa:setZoom( -30 )
	backa:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickf" ) )
	backa:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( backa )
	self.backa = backa
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local backaFrame2 = function ( backa, event )
					local backaFrame3 = function ( backa, event )
						local backaFrame4 = function ( backa, event )
							local backaFrame5 = function ( backa, event )
								if not event.interrupted then
									backa:beginAnimation( "keyframe", 2760, true, true, CoD.TweenType.Linear )
								end
								backa:setLeftRight( true, false, 0, 36 )
								backa:setTopBottom( true, false, 0, 120 )
								if event.interrupted then
									self.clipFinished( backa, event )
								else
									backa:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								backaFrame5( backa, event )
								return 
							else
								backa:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								backa:registerEventHandler( "transition_complete_keyframe", backaFrame5 )
							end
						end
						
						if event.interrupted then
							backaFrame4( backa, event )
							return 
						else
							backa:beginAnimation( "keyframe", 2679, true, true, CoD.TweenType.Linear )
							backa:setLeftRight( true, false, -30, 6 )
							backa:registerEventHandler( "transition_complete_keyframe", backaFrame4 )
						end
					end
					
					if event.interrupted then
						backaFrame3( backa, event )
						return 
					else
						backa:beginAnimation( "keyframe", 1519, false, false, CoD.TweenType.Linear )
						backa:registerEventHandler( "transition_complete_keyframe", backaFrame3 )
					end
				end
				
				backa:completeAnimation()
				self.backa:setLeftRight( true, false, 0, 36 )
				self.backa:setTopBottom( true, false, 0, 120 )
				backaFrame2( backa, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

