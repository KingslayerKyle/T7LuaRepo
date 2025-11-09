CoD.FE_TitleElemBackB = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemBackB.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemBackB )
	self.id = "FE_TitleElemBackB"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 120 )
	
	local backb = LUI.UIImage.new()
	backb:setLeftRight( true, false, 0, 28 )
	backb:setTopBottom( true, false, 0, 120 )
	backb:setZoom( -30 )
	backb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicke" ) )
	backb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( backb )
	self.backb = backb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local backbFrame2 = function ( backb, event )
					local backbFrame3 = function ( backb, event )
						local backbFrame4 = function ( backb, event )
							local backbFrame5 = function ( backb, event )
								if not event.interrupted then
									backb:beginAnimation( "keyframe", 2329, false, false, CoD.TweenType.Linear )
								end
								backb:setLeftRight( true, false, 0, 28 )
								backb:setTopBottom( true, false, 0, 120 )
								if event.interrupted then
									self.clipFinished( backb, event )
								else
									backb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								backbFrame5( backb, event )
								return 
							else
								backb:beginAnimation( "keyframe", 3369, true, true, CoD.TweenType.Linear )
								backb:setLeftRight( true, false, 0, 28 )
								backb:registerEventHandler( "transition_complete_keyframe", backbFrame5 )
							end
						end
						
						if event.interrupted then
							backbFrame4( backb, event )
							return 
						else
							backb:beginAnimation( "keyframe", 1909, false, false, CoD.TweenType.Linear )
							backb:registerEventHandler( "transition_complete_keyframe", backbFrame4 )
						end
					end
					
					if event.interrupted then
						backbFrame3( backb, event )
						return 
					else
						backb:beginAnimation( "keyframe", 3960, true, true, CoD.TweenType.Linear )
						backb:setLeftRight( true, false, 13, 41 )
						backb:registerEventHandler( "transition_complete_keyframe", backbFrame3 )
					end
				end
				
				backb:completeAnimation()
				self.backb:setLeftRight( true, false, 0, 28 )
				self.backb:setTopBottom( true, false, 0, 120 )
				backbFrame2( backb, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

