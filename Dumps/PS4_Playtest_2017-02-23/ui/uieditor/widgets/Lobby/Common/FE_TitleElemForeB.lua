CoD.FE_TitleElemForeB = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemForeB.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemForeB )
	self.id = "FE_TitleElemForeB"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 12 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local foreb = LUI.UIImage.new()
	foreb:setLeftRight( 0, 0, 0, 12 )
	foreb:setTopBottom( 0, 0, 0, 96 )
	foreb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickh" ) )
	foreb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( foreb )
	self.foreb = foreb
	
	self.resetProperties = function ()
		foreb:completeAnimation()
		foreb:setLeftRight( 0, 0, 0, 12 )
		foreb:setTopBottom( 0, 0, 0, 96 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local forebFrame2 = function ( foreb, event )
					local forebFrame3 = function ( foreb, event )
						local forebFrame4 = function ( foreb, event )
							if not event.interrupted then
								foreb:beginAnimation( "keyframe", 4400, true, true, CoD.TweenType.Linear )
							end
							foreb:setLeftRight( 0, 0, 0, 12 )
							foreb:setTopBottom( 0, 0, 0, 96 )
							if event.interrupted then
								self.clipFinished( foreb, event )
							else
								foreb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							forebFrame4( foreb, event )
							return 
						else
							foreb:beginAnimation( "keyframe", 2159, false, false, CoD.TweenType.Linear )
							foreb:registerEventHandler( "transition_complete_keyframe", forebFrame4 )
						end
					end
					
					if event.interrupted then
						forebFrame3( foreb, event )
						return 
					else
						foreb:beginAnimation( "keyframe", 5539, true, true, CoD.TweenType.Linear )
						foreb:setLeftRight( 0, 0, -4, 8 )
						foreb:registerEventHandler( "transition_complete_keyframe", forebFrame3 )
					end
				end
				
				foreb:completeAnimation()
				self.foreb:setLeftRight( 0, 0, 0, 12 )
				self.foreb:setTopBottom( 0, 0, 0, 96 )
				forebFrame2( foreb, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

