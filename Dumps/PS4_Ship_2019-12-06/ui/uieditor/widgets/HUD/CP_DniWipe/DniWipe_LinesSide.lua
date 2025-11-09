CoD.DniWipe_LinesSide = InheritFrom( LUI.UIElement )
CoD.DniWipe_LinesSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_LinesSide )
	self.id = "DniWipe_LinesSide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 605 )
	self:setTopBottom( true, false, 0, 29 )
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( false, false, -99.5, -46.5 )
	Image34:setTopBottom( false, false, -14.5, -10.5 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -99.5, 7.5 )
	Image0:setTopBottom( false, false, 10.5, 14.5 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image340 = LUI.UIImage.new()
	Image340:setLeftRight( false, false, 53.5, 63.5 )
	Image340:setTopBottom( false, false, -4, 0 )
	Image340:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	Image340:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image340 )
	self.Image340 = Image340
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local Image34Frame2 = function ( Image34, event )
					if not event.interrupted then
						Image34:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
					end
					Image34:setLeftRight( false, false, 169.5, 222.5 )
					Image34:setTopBottom( false, false, -14.5, -10.5 )
					Image34:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image34, event )
					else
						Image34:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image34:completeAnimation()
				self.Image34:setLeftRight( false, false, -99.5, -46.5 )
				self.Image34:setTopBottom( false, false, -14.5, -10.5 )
				self.Image34:setAlpha( 1 )
				Image34Frame2( Image34, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( false, false, -99.5, 7.5 )
								Image0:setTopBottom( false, false, 10.5, 14.5 )
								Image0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( false, false, -7.5, 99.5 )
								Image0:setAlpha( 0 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 1 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -99.5, 7.5 )
				self.Image0:setTopBottom( false, false, 10.5, 14.5 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image340Frame2 = function ( Image340, event )
					local Image340Frame3 = function ( Image340, event )
						local Image340Frame4 = function ( Image340, event )
							if not event.interrupted then
								Image340:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							end
							Image340:setLeftRight( false, false, 258.5, 268.5 )
							Image340:setTopBottom( false, false, -4, 0 )
							Image340:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image340, event )
							else
								Image340:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image340Frame4( Image340, event )
							return 
						else
							Image340:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							Image340:setLeftRight( false, false, 201.59, 211.59 )
							Image340:setAlpha( 1 )
							Image340:registerEventHandler( "transition_complete_keyframe", Image340Frame4 )
						end
					end
					
					if event.interrupted then
						Image340Frame3( Image340, event )
						return 
					else
						Image340:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						Image340:setLeftRight( false, false, 192.84, 202.84 )
						Image340:registerEventHandler( "transition_complete_keyframe", Image340Frame3 )
					end
				end
				
				Image340:completeAnimation()
				self.Image340:setLeftRight( false, false, 26.5, 36.5 )
				self.Image340:setTopBottom( false, false, -4, 0 )
				self.Image340:setAlpha( 0 )
				Image340Frame2( Image340, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

