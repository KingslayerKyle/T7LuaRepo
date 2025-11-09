LUI.createMenu.ZodRitualSucceeded = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZodRitualSucceeded" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 271.5, 1008.5 )
	TextBox0:setTopBottom( true, false, 332.5, 366.5 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "ZM_ZOD_DEFEND_AREA_SUCCEEDED" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Ascent = function ()
				self:setupElementClipCounter( 1 )
				local TextBox0Frame2 = function ( TextBox0, event )
					if not event.interrupted then
						TextBox0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					TextBox0:setLeftRight( false, false, -368.5, 368.5 )
					TextBox0:setTopBottom( false, false, -306, -272 )
					TextBox0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TextBox0, event )
					else
						TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.TextBox0:setLeftRight( false, false, -368.5, 368.5 )
				self.TextBox0:setTopBottom( false, false, -27.5, 6.5 )
				self.TextBox0:setAlpha( 1 )
				TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame2 )
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

