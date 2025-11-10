CoD.CallingCards_MedievalCapeWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_MedievalCapeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_MedievalCapeWidget )
	self.id = "CallingCards_MedievalCapeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 95 )
	
	local Cape5 = LUI.UIImage.new()
	Cape5:setLeftRight( true, false, 0, 284 )
	Cape5:setTopBottom( true, false, 0, 94.67 )
	Cape5:setAlpha( 0 )
	Cape5:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape5" ) )
	self:addElement( Cape5 )
	self.Cape5 = Cape5
	
	local Cape4 = LUI.UIImage.new()
	Cape4:setLeftRight( true, false, 0, 284 )
	Cape4:setTopBottom( true, false, 0, 94.67 )
	Cape4:setAlpha( 0 )
	Cape4:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape4" ) )
	self:addElement( Cape4 )
	self.Cape4 = Cape4
	
	local Cape3 = LUI.UIImage.new()
	Cape3:setLeftRight( true, false, 0, 284 )
	Cape3:setTopBottom( true, false, 0, 94.67 )
	Cape3:setAlpha( 0 )
	Cape3:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape3" ) )
	self:addElement( Cape3 )
	self.Cape3 = Cape3
	
	local Cape2 = LUI.UIImage.new()
	Cape2:setLeftRight( true, false, 0, 284 )
	Cape2:setTopBottom( true, false, 0, 94.67 )
	Cape2:setAlpha( 0 )
	Cape2:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape2" ) )
	self:addElement( Cape2 )
	self.Cape2 = Cape2
	
	local Cape = LUI.UIImage.new()
	Cape:setLeftRight( true, false, 0, 284 )
	Cape:setTopBottom( true, false, 0, 94.67 )
	Cape:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape" ) )
	self:addElement( Cape )
	self.Cape = Cape
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							if not f5_arg1.interrupted then
								f5_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							f5_arg0:setAlpha( 1 )
							if f5_arg1.interrupted then
								self.clipFinished( f5_arg0, f5_arg1 )
							else
								f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 1 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				Cape5:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				Cape5:setAlpha( 0 )
				Cape5:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							if not f8_arg1.interrupted then
								f8_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							f8_arg0:setAlpha( 0 )
							if f8_arg1.interrupted then
								self.clipFinished( f8_arg0, f8_arg1 )
							else
								f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						f6_arg0:setAlpha( 1 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				Cape4:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				Cape4:setAlpha( 0 )
				Cape4:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							if not f11_arg1.interrupted then
								f11_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							f11_arg0:setAlpha( 0 )
							if f11_arg1.interrupted then
								self.clipFinished( f11_arg0, f11_arg1 )
							else
								f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f10_arg1.interrupted then
							f10_local0( f10_arg0, f10_arg1 )
							return 
						else
							f10_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						f9_arg0:setAlpha( 1 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				Cape3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				Cape3:setAlpha( 0 )
				Cape3:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 0 )
							if f14_arg1.interrupted then
								self.clipFinished( f14_arg0, f14_arg1 )
							else
								f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 1 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				Cape2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Cape2:setAlpha( 0 )
				Cape2:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local CapeFrame2 = function ( Cape, event )
					local CapeFrame3 = function ( Cape, event )
						local CapeFrame4 = function ( Cape, event )
							if not event.interrupted then
								Cape:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							Cape:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Cape, event )
							else
								Cape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CapeFrame4( Cape, event )
							return 
						else
							Cape:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							Cape:registerEventHandler( "transition_complete_keyframe", CapeFrame4 )
						end
					end
					
					if event.interrupted then
						CapeFrame3( Cape, event )
						return 
					else
						Cape:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Cape:registerEventHandler( "transition_complete_keyframe", CapeFrame3 )
					end
				end
				
				Cape:completeAnimation()
				self.Cape:setAlpha( 1 )
				CapeFrame2( Cape, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

