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
	self:setLeftRight( 0, 0, 0, 426 )
	self:setTopBottom( 0, 0, 0, 142 )
	
	local Cape5 = LUI.UIImage.new()
	Cape5:setLeftRight( 0, 0, 0, 426 )
	Cape5:setTopBottom( 0, 0, 0, 142 )
	Cape5:setAlpha( 0 )
	Cape5:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape5" ) )
	self:addElement( Cape5 )
	self.Cape5 = Cape5
	
	local Cape4 = LUI.UIImage.new()
	Cape4:setLeftRight( 0, 0, 0, 426 )
	Cape4:setTopBottom( 0, 0, 0, 142 )
	Cape4:setAlpha( 0 )
	Cape4:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape4" ) )
	self:addElement( Cape4 )
	self.Cape4 = Cape4
	
	local Cape3 = LUI.UIImage.new()
	Cape3:setLeftRight( 0, 0, 0, 426 )
	Cape3:setTopBottom( 0, 0, 0, 142 )
	Cape3:setAlpha( 0 )
	Cape3:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape3" ) )
	self:addElement( Cape3 )
	self.Cape3 = Cape3
	
	local Cape2 = LUI.UIImage.new()
	Cape2:setLeftRight( 0, 0, 0, 426 )
	Cape2:setTopBottom( 0, 0, 0, 142 )
	Cape2:setAlpha( 0 )
	Cape2:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape2" ) )
	self:addElement( Cape2 )
	self.Cape2 = Cape2
	
	local Cape = LUI.UIImage.new()
	Cape:setLeftRight( 0, 0, 0, 426 )
	Cape:setTopBottom( 0, 0, 0, 142 )
	Cape:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_cape" ) )
	self:addElement( Cape )
	self.Cape = Cape
	
	self.resetProperties = function ()
		Cape:completeAnimation()
		Cape2:completeAnimation()
		Cape3:completeAnimation()
		Cape4:completeAnimation()
		Cape5:completeAnimation()
		Cape:setAlpha( 1 )
		Cape2:setAlpha( 0 )
		Cape3:setAlpha( 0 )
		Cape4:setAlpha( 0 )
		Cape5:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local Cape5Frame2 = function ( Cape5, event )
					local Cape5Frame3 = function ( Cape5, event )
						local Cape5Frame4 = function ( Cape5, event )
							if not event.interrupted then
								Cape5:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							end
							Cape5:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Cape5, event )
							else
								Cape5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Cape5Frame4( Cape5, event )
							return 
						else
							Cape5:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Cape5:registerEventHandler( "transition_complete_keyframe", Cape5Frame4 )
						end
					end
					
					if event.interrupted then
						Cape5Frame3( Cape5, event )
						return 
					else
						Cape5:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						Cape5:setAlpha( 1 )
						Cape5:registerEventHandler( "transition_complete_keyframe", Cape5Frame3 )
					end
				end
				
				Cape5:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				Cape5:setAlpha( 0 )
				Cape5:registerEventHandler( "transition_complete_keyframe", Cape5Frame2 )
				local Cape4Frame2 = function ( Cape4, event )
					local Cape4Frame3 = function ( Cape4, event )
						local Cape4Frame4 = function ( Cape4, event )
							if not event.interrupted then
								Cape4:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							Cape4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Cape4, event )
							else
								Cape4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Cape4Frame4( Cape4, event )
							return 
						else
							Cape4:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Cape4:registerEventHandler( "transition_complete_keyframe", Cape4Frame4 )
						end
					end
					
					if event.interrupted then
						Cape4Frame3( Cape4, event )
						return 
					else
						Cape4:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Cape4:setAlpha( 1 )
						Cape4:registerEventHandler( "transition_complete_keyframe", Cape4Frame3 )
					end
				end
				
				Cape4:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				Cape4:setAlpha( 0 )
				Cape4:registerEventHandler( "transition_complete_keyframe", Cape4Frame2 )
				local Cape3Frame2 = function ( Cape3, event )
					local Cape3Frame3 = function ( Cape3, event )
						local Cape3Frame4 = function ( Cape3, event )
							if not event.interrupted then
								Cape3:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							end
							Cape3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Cape3, event )
							else
								Cape3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Cape3Frame4( Cape3, event )
							return 
						else
							Cape3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							Cape3:registerEventHandler( "transition_complete_keyframe", Cape3Frame4 )
						end
					end
					
					if event.interrupted then
						Cape3Frame3( Cape3, event )
						return 
					else
						Cape3:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Cape3:setAlpha( 1 )
						Cape3:registerEventHandler( "transition_complete_keyframe", Cape3Frame3 )
					end
				end
				
				Cape3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				Cape3:setAlpha( 0 )
				Cape3:registerEventHandler( "transition_complete_keyframe", Cape3Frame2 )
				local Cape2Frame2 = function ( Cape2, event )
					local Cape2Frame3 = function ( Cape2, event )
						local Cape2Frame4 = function ( Cape2, event )
							if not event.interrupted then
								Cape2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							end
							Cape2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Cape2, event )
							else
								Cape2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Cape2Frame4( Cape2, event )
							return 
						else
							Cape2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							Cape2:registerEventHandler( "transition_complete_keyframe", Cape2Frame4 )
						end
					end
					
					if event.interrupted then
						Cape2Frame3( Cape2, event )
						return 
					else
						Cape2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Cape2:setAlpha( 1 )
						Cape2:registerEventHandler( "transition_complete_keyframe", Cape2Frame3 )
					end
				end
				
				Cape2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Cape2:setAlpha( 0 )
				Cape2:registerEventHandler( "transition_complete_keyframe", Cape2Frame2 )
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

