CoD.FE_TitleElemTopB = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemTopB.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemTopB )
	self.id = "FE_TitleElemTopB"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 84 )
	self:setTopBottom( 0, 0, 0, 6 )
	
	local topb = LUI.UIImage.new()
	topb:setLeftRight( 0, 0, 16, 100 )
	topb:setTopBottom( 0, 0, 0, 6 )
	topb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicktopb" ) )
	topb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topb )
	self.topb = topb
	
	self.resetProperties = function ()
		topb:completeAnimation()
		topb:setLeftRight( 0, 0, 16, 100 )
		topb:setTopBottom( 0, 0, 0, 6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local topbFrame2 = function ( topb, event )
					local topbFrame3 = function ( topb, event )
						local topbFrame4 = function ( topb, event )
							if not event.interrupted then
								topb:beginAnimation( "keyframe", 8139, true, true, CoD.TweenType.Linear )
							end
							topb:setLeftRight( 0, 0, 0, 84 )
							topb:setTopBottom( 0, 0, 0, 6 )
							if event.interrupted then
								self.clipFinished( topb, event )
							else
								topb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							topbFrame4( topb, event )
							return 
						else
							topb:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
							topb:registerEventHandler( "transition_complete_keyframe", topbFrame4 )
						end
					end
					
					if event.interrupted then
						topbFrame3( topb, event )
						return 
					else
						topb:beginAnimation( "keyframe", 10500, true, true, CoD.TweenType.Linear )
						topb:setLeftRight( 0, 0, 18, 102 )
						topb:registerEventHandler( "transition_complete_keyframe", topbFrame3 )
					end
				end
				
				topb:completeAnimation()
				self.topb:setLeftRight( 0, 0, 0, 84 )
				self.topb:setTopBottom( 0, 0, 0, 6 )
				topbFrame2( topb, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

