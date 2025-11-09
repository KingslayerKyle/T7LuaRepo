LUI.createMenu.DeadSystemAimFireTutorial = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DeadSystemAimFireTutorial" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Hint = LUI.UITightText.new()
	Hint:setLeftRight( false, false, -311.5, 339.5 )
	Hint:setTopBottom( true, false, 427, 451 )
	Hint:setRGB( 1, 1, 1 )
	Hint:setText( Engine.Localize( "CP_MI_CAIRO_RAMSES_AIM_FIRE_DEAD" ) )
	Hint:setTTF( "fonts/default.ttf" )
	self:addElement( Hint )
	self.Hint = Hint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local HintFrame2 = function ( Hint, event )
					local HintFrame3 = function ( Hint, event )
						if not event.interrupted then
							Hint:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						Hint:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Hint, event )
						else
							Hint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HintFrame3( Hint, event )
						return 
					else
						Hint:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						Hint:setAlpha( 0.25 )
						Hint:registerEventHandler( "transition_complete_keyframe", HintFrame3 )
					end
				end
				
				Hint:completeAnimation()
				self.Hint:setAlpha( 1 )
				HintFrame2( Hint, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

