CoD.FE_TitleElemForeD = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemForeD.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemForeD )
	self.id = "FE_TitleElemForeD"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 64 )
	
	local fored = LUI.UIImage.new()
	fored:setLeftRight( true, false, 0, 28 )
	fored:setTopBottom( true, false, 0, 64 )
	fored:setZoom( 20 )
	fored:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickb" ) )
	fored:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fored )
	self.fored = fored
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							local f5_local0 = function ( f6_arg0, f6_arg1 )
								if not f6_arg1.interrupted then
									f6_arg0:beginAnimation( "keyframe", 6000, true, true, CoD.TweenType.Linear )
								end
								f6_arg0:setLeftRight( true, false, 0, 28 )
								f6_arg0:setTopBottom( true, false, 0, 64 )
								if f6_arg1.interrupted then
									self.clipFinished( f6_arg0, f6_arg1 )
								else
									f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f5_arg1.interrupted then
								f5_local0( f5_arg0, f5_arg1 )
								return 
							else
								f5_arg0:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
								f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 5860, true, true, CoD.TweenType.Linear )
							f4_arg0:setLeftRight( true, false, 6, 34 )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 2579, false, false, CoD.TweenType.Linear )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				fored:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				self.fored:setLeftRight( true, false, 0, 28 )
				self.fored:setTopBottom( true, false, 0, 64 )
				fored:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

