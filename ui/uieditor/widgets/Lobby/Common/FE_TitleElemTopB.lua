-- ca6be3773cac013859626c13adc88266
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 4 )
	
	local topb = LUI.UIImage.new()
	topb:setLeftRight( true, false, 10.4, 66.4 )
	topb:setTopBottom( true, false, 0, 4 )
	topb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicktopb" ) )
	topb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topb )
	self.topb = topb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local topbFrame2 = function ( topb, event )
					local topbFrame3 = function ( topb, event )
						local topbFrame4 = function ( topb, event )
							if not event.interrupted then
								topb:beginAnimation( "keyframe", 8139, true, true, CoD.TweenType.Linear )
							end
							topb:setLeftRight( true, false, 0, 56 )
							topb:setTopBottom( true, false, 0, 4 )
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
						topb:setLeftRight( true, false, 12, 68 )
						topb:registerEventHandler( "transition_complete_keyframe", topbFrame3 )
					end
				end
				
				topb:completeAnimation()
				self.topb:setLeftRight( true, false, 0, 56 )
				self.topb:setTopBottom( true, false, 0, 4 )
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

