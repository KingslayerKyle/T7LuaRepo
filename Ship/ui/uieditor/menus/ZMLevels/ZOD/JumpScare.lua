-- 51e233192c483765ee44555eb1d78e0a
-- This hash is used for caching, delete to decompile the file again

LUI.createMenu.JumpScare = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "JumpScare" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "JumpScare.buttonPrompts" )
	local f1_local1 = self
	
	local JumpScare = LUI.UIImage.new()
	JumpScare:setLeftRight( true, true, 384, -384 )
	JumpScare:setTopBottom( true, true, 104, -104 )
	JumpScare:setImage( RegisterImage( "uie_t7_zm_zod_scare_image_01_c" ) )
	self:addElement( JumpScare )
	self.JumpScare = JumpScare
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local JumpScareFrame2 = function ( JumpScare, event )
					local JumpScareFrame3 = function ( JumpScare, event )
						local JumpScareFrame4 = function ( JumpScare, event )
							if not event.interrupted then
								JumpScare:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							JumpScare:setAlpha( 0 )
							JumpScare:setScale( 0 )
							if event.interrupted then
								self.clipFinished( JumpScare, event )
							else
								JumpScare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							JumpScareFrame4( JumpScare, event )
							return 
						else
							JumpScare:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							JumpScare:registerEventHandler( "transition_complete_keyframe", JumpScareFrame4 )
						end
					end
					
					if event.interrupted then
						JumpScareFrame3( JumpScare, event )
						return 
					else
						JumpScare:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						JumpScare:setAlpha( 1 )
						JumpScare:setScale( 1.3 )
						JumpScare:registerEventHandler( "transition_complete_keyframe", JumpScareFrame3 )
					end
				end
				
				JumpScare:completeAnimation()
				self.JumpScare:setAlpha( 0 )
				self.JumpScare:setScale( 0 )
				JumpScareFrame2( JumpScare, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "JumpScare.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

