CoD.FE_TitleElemForeA = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemForeA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemForeA )
	self.id = "FE_TitleElemForeA"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 42 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local forea = LUI.UIImage.new()
	forea:setLeftRight( 0, 0, 0, 42 )
	forea:setTopBottom( 0, 0, 0, 96 )
	forea:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicki" ) )
	forea:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( forea )
	self.forea = forea
	
	self.resetProperties = function ()
		forea:completeAnimation()
		forea:setLeftRight( 0, 0, 0, 42 )
		forea:setTopBottom( 0, 0, 0, 96 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local foreaFrame2 = function ( forea, event )
					local foreaFrame3 = function ( forea, event )
						local foreaFrame4 = function ( forea, event )
							local foreaFrame5 = function ( forea, event )
								local foreaFrame6 = function ( forea, event )
									if not event.interrupted then
										forea:beginAnimation( "keyframe", 1939, false, false, CoD.TweenType.Linear )
									end
									forea:setLeftRight( 0, 0, 0, 42 )
									forea:setTopBottom( 0, 0, 0, 96 )
									if event.interrupted then
										self.clipFinished( forea, event )
									else
										forea:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									foreaFrame6( forea, event )
									return 
								else
									forea:beginAnimation( "keyframe", 5120, true, true, CoD.TweenType.Linear )
									forea:setLeftRight( 0, 0, 0, 42 )
									forea:registerEventHandler( "transition_complete_keyframe", foreaFrame6 )
								end
							end
							
							if event.interrupted then
								foreaFrame5( forea, event )
								return 
							else
								forea:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
								forea:registerEventHandler( "transition_complete_keyframe", foreaFrame5 )
							end
						end
						
						if event.interrupted then
							foreaFrame4( forea, event )
							return 
						else
							forea:beginAnimation( "keyframe", 3360, true, true, CoD.TweenType.Linear )
							forea:setLeftRight( 0, 0, -3, 39 )
							forea:registerEventHandler( "transition_complete_keyframe", foreaFrame4 )
						end
					end
					
					if event.interrupted then
						foreaFrame3( forea, event )
						return 
					else
						forea:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
						forea:registerEventHandler( "transition_complete_keyframe", foreaFrame3 )
					end
				end
				
				forea:completeAnimation()
				self.forea:setLeftRight( 0, 0, 0, 42 )
				self.forea:setTopBottom( 0, 0, 0, 96 )
				foreaFrame2( forea, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

