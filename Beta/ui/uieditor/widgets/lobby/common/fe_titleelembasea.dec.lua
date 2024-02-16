CoD.FE_TitleElemBaseA = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemBaseA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemBaseA )
	self.id = "FE_TitleElemBaseA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 16 )
	
	local basea = LUI.UIImage.new()
	basea:setLeftRight( true, false, 0, 56 )
	basea:setTopBottom( true, false, 0, 16 )
	basea:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickbasea" ) )
	basea:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( basea )
	self.basea = basea
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local baseaFrame2 = function ( basea, event )
					local baseaFrame3 = function ( basea, event )
						local baseaFrame4 = function ( basea, event )
							local baseaFrame5 = function ( basea, event )
								local baseaFrame6 = function ( basea, event )
									if not event.interrupted then
										basea:beginAnimation( "keyframe", 1879, false, false, CoD.TweenType.Linear )
									end
									basea:setLeftRight( true, false, 0, 56 )
									basea:setTopBottom( true, false, 0, 16 )
									if event.interrupted then
										self.clipFinished( basea, event )
									else
										basea:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									baseaFrame6( basea, event )
									return 
								else
									basea:beginAnimation( "keyframe", 10340, true, true, CoD.TweenType.Linear )
									basea:setLeftRight( true, false, 0, 56 )
									basea:registerEventHandler( "transition_complete_keyframe", baseaFrame6 )
								end
							end
							
							if event.interrupted then
								baseaFrame5( basea, event )
								return 
							else
								basea:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
								basea:registerEventHandler( "transition_complete_keyframe", baseaFrame5 )
							end
						end
						
						if event.interrupted then
							baseaFrame4( basea, event )
							return 
						else
							basea:beginAnimation( "keyframe", 8439, true, true, CoD.TweenType.Linear )
							basea:setLeftRight( true, false, 12, 68 )
							basea:registerEventHandler( "transition_complete_keyframe", baseaFrame4 )
						end
					end
					
					if event.interrupted then
						baseaFrame3( basea, event )
						return 
					else
						basea:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						basea:registerEventHandler( "transition_complete_keyframe", baseaFrame3 )
					end
				end
				
				basea:completeAnimation()
				self.basea:setLeftRight( true, false, 0, 56 )
				self.basea:setTopBottom( true, false, 0, 16 )
				baseaFrame2( basea, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

