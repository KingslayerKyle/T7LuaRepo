LUI.createMenu.SquadMenu_2 = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadMenu_2" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SquadThree = LUI.UIText.new()
	SquadThree:setLeftRight( true, true, 1022, -64 )
	SquadThree:setTopBottom( true, true, 360, -344 )
	SquadThree:setRGB( 1, 1, 1 )
	SquadThree:setAlpha( 0.5 )
	SquadThree:setZRot( -2 )
	SquadThree:setTTF( "fonts/default.ttf" )
	SquadThree:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadThree:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadThree )
	self.SquadThree = SquadThree
	
	local SquadFour = LUI.UIText.new()
	SquadFour:setLeftRight( true, true, 1022, -64 )
	SquadFour:setTopBottom( true, true, 376, -328 )
	SquadFour:setRGB( 1, 1, 1 )
	SquadFour:setAlpha( 0.5 )
	SquadFour:setZRot( -2 )
	SquadFour:setTTF( "fonts/default.ttf" )
	SquadFour:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadFour:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadFour )
	self.SquadFour = SquadFour
	
	self.SquadThree:linkToElementModel( self, "robot_three_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadThree:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.SquadFour:linkToElementModel( self, "robot_four_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadFour:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local SquadThreeFrame2 = function ( SquadThree, event )
					if not event.interrupted then
						SquadThree:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadThree:setLeftRight( true, true, 1022, -64 )
					SquadThree:setTopBottom( true, true, 360, -344 )
					if event.interrupted then
						self.clipFinished( SquadThree, event )
					else
						SquadThree:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadThree:completeAnimation()
				self.SquadThree:setLeftRight( true, true, 1216, 130 )
				self.SquadThree:setTopBottom( true, true, 360, -344 )
				SquadThreeFrame2( SquadThree, {} )
				local SquadFourFrame2 = function ( SquadFour, event )
					if not event.interrupted then
						SquadFour:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadFour:setLeftRight( true, true, 1022, -64 )
					SquadFour:setTopBottom( true, true, 376, -328 )
					if event.interrupted then
						self.clipFinished( SquadFour, event )
					else
						SquadFour:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadFour:completeAnimation()
				self.SquadFour:setLeftRight( true, true, 1216, 130 )
				self.SquadFour:setTopBottom( true, true, 376, -328 )
				SquadFourFrame2( SquadFour, {} )
			end,
			RobotThreeDead = function ()
				self:setupElementClipCounter( 1 )
				local SquadThreeFrame2 = function ( SquadThree, event )
					if not event.interrupted then
						SquadThree:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadThree:setRGB( 0.39, 0.39, 0.39 )
					SquadThree:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SquadThree, event )
					else
						SquadThree:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadThree:completeAnimation()
				self.SquadThree:setRGB( 1, 1, 1 )
				self.SquadThree:setAlpha( 0.75 )
				SquadThreeFrame2( SquadThree, {} )
			end,
			RobotFourDead = function ()
				self:setupElementClipCounter( 1 )
				local SquadFourFrame2 = function ( SquadFour, event )
					if not event.interrupted then
						SquadFour:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadFour:setRGB( 0.39, 0.39, 0.39 )
					SquadFour:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SquadFour, event )
					else
						SquadFour:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadFour:completeAnimation()
				self.SquadFour:setRGB( 1, 1, 1 )
				self.SquadFour:setAlpha( 0.75 )
				SquadFourFrame2( SquadFour, {} )
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
	self.close = function ( self )
		self.SquadThree:close()
		self.SquadFour:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

