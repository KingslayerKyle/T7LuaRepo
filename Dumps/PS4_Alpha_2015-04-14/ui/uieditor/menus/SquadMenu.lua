LUI.createMenu.SquadMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SquadOne = LUI.UIText.new()
	SquadOne:setLeftRight( true, true, 1022, -64 )
	SquadOne:setTopBottom( true, true, 328, -376 )
	SquadOne:setRGB( 1, 1, 1 )
	SquadOne:setAlpha( 0.5 )
	SquadOne:setZRot( -2 )
	SquadOne:setTTF( "fonts/default.ttf" )
	SquadOne:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadOne:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadOne )
	self.SquadOne = SquadOne
	
	local SquadTwo = LUI.UIText.new()
	SquadTwo:setLeftRight( true, true, 1022, -64 )
	SquadTwo:setTopBottom( true, true, 344, -360 )
	SquadTwo:setRGB( 1, 1, 1 )
	SquadTwo:setAlpha( 0.5 )
	SquadTwo:setZRot( -2 )
	SquadTwo:setTTF( "fonts/default.ttf" )
	SquadTwo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadTwo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadTwo )
	self.SquadTwo = SquadTwo
	
	local RobotCamoText = LUI.UIText.new()
	RobotCamoText:setLeftRight( true, true, 1022, -64 )
	RobotCamoText:setTopBottom( true, true, 405, -295 )
	RobotCamoText:setRGB( 1, 1, 1 )
	RobotCamoText:setAlpha( 0.5 )
	RobotCamoText:setZRot( -3 )
	RobotCamoText:setTTF( "fonts/default.ttf" )
	RobotCamoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RobotCamoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RobotCamoText )
	self.RobotCamoText = RobotCamoText
	
	local SquadControlHint = LUI.UIText.new()
	SquadControlHint:setLeftRight( true, true, 1022, -64 )
	SquadControlHint:setTopBottom( true, true, 244.5, -450.5 )
	SquadControlHint:setRGB( 1, 1, 1 )
	SquadControlHint:setAlpha( 0.5 )
	SquadControlHint:setZRot( -2 )
	SquadControlHint:setText( Engine.Localize( "CP_MI_SING_BIODOMES_SQUAD_CONTROLS" ) )
	SquadControlHint:setTTF( "fonts/default.ttf" )
	SquadControlHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadControlHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadControlHint )
	self.SquadControlHint = SquadControlHint
	
	self.SquadOne:linkToElementModel( self, "robot_one_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadOne:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.SquadTwo:linkToElementModel( self, "robot_two_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadTwo:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.RobotCamoText:linkToElementModel( self, "squad_camo_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RobotCamoText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local SquadOneFrame2 = function ( SquadOne, event )
					if not event.interrupted then
						SquadOne:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadOne:setLeftRight( true, true, 1022, -64 )
					SquadOne:setTopBottom( true, true, 328, -376 )
					if event.interrupted then
						self.clipFinished( SquadOne, event )
					else
						SquadOne:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadOne:completeAnimation()
				self.SquadOne:setLeftRight( true, true, 1216, 130 )
				self.SquadOne:setTopBottom( true, true, 328, -376 )
				SquadOneFrame2( SquadOne, {} )
				local SquadTwoFrame2 = function ( SquadTwo, event )
					if not event.interrupted then
						SquadTwo:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadTwo:setLeftRight( true, true, 1022, -64 )
					SquadTwo:setTopBottom( true, true, 344, -360 )
					if event.interrupted then
						self.clipFinished( SquadTwo, event )
					else
						SquadTwo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadTwo:completeAnimation()
				self.SquadTwo:setLeftRight( true, true, 1216, 130 )
				self.SquadTwo:setTopBottom( true, true, 344, -360 )
				SquadTwoFrame2( SquadTwo, {} )
				local RobotCamoTextFrame2 = function ( RobotCamoText, event )
					if not event.interrupted then
						RobotCamoText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					RobotCamoText:setLeftRight( true, true, 1022, -64 )
					RobotCamoText:setTopBottom( true, true, 405, -295 )
					if event.interrupted then
						self.clipFinished( RobotCamoText, event )
					else
						RobotCamoText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RobotCamoText:completeAnimation()
				self.RobotCamoText:setLeftRight( true, true, 1216, 130 )
				self.RobotCamoText:setTopBottom( true, true, 405, -295 )
				RobotCamoTextFrame2( RobotCamoText, {} )
				local SquadControlHintFrame2 = function ( SquadControlHint, event )
					if not event.interrupted then
						SquadControlHint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadControlHint:setLeftRight( true, true, 1006, -64 )
					SquadControlHint:setTopBottom( true, true, 244, -450 )
					if event.interrupted then
						self.clipFinished( SquadControlHint, event )
					else
						SquadControlHint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadControlHint:completeAnimation()
				self.SquadControlHint:setLeftRight( true, true, 1216, 165 )
				self.SquadControlHint:setTopBottom( true, true, 244, -450 )
				SquadControlHintFrame2( SquadControlHint, {} )
			end,
			RobotOneDead = function ()
				self:setupElementClipCounter( 1 )
				local SquadOneFrame2 = function ( SquadOne, event )
					if not event.interrupted then
						SquadOne:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadOne:setRGB( 0.39, 0.39, 0.39 )
					SquadOne:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SquadOne, event )
					else
						SquadOne:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadOne:completeAnimation()
				self.SquadOne:setRGB( 1, 1, 1 )
				self.SquadOne:setAlpha( 0.75 )
				SquadOneFrame2( SquadOne, {} )
			end,
			RobotTwoDead = function ()
				self:setupElementClipCounter( 1 )
				local SquadTwoFrame2 = function ( SquadTwo, event )
					if not event.interrupted then
						SquadTwo:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadTwo:setRGB( 0.39, 0.39, 0.39 )
					SquadTwo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SquadTwo, event )
					else
						SquadTwo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadTwo:completeAnimation()
				self.SquadTwo:setRGB( 1, 1, 1 )
				self.SquadTwo:setAlpha( 0.75 )
				SquadTwoFrame2( SquadTwo, {} )
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
		self.SquadOne:close()
		self.SquadTwo:close()
		self.RobotCamoText:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

