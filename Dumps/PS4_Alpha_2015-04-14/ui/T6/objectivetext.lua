CoD.ObjectiveText = {}
CoD.ObjectiveText.DefaultWidth = 30
CoD.ObjectiveText.DefaultHeight = CoD.ObjectiveText.DefaultWidth
CoD.ObjectiveText.HalfSquareSize = 15
CoD.ObjectiveText.DefaultAlpha = 1
CoD.ObjectiveText.ObjectiveTextAlpha = 1
CoD.ObjectiveText.ColorValue = {}
CoD.ObjectiveText.ColorValue.r = 0.75
CoD.ObjectiveText.ColorValue.b = 0.75
CoD.ObjectiveText.ColorValue.g = 0.75
CoD.ObjectiveText.ColorValue.alpha = 0.75
CoD.ObjectiveText.Blue = CoD.visorBlue3
CoD.ObjectiveText.FadeInDuration = 1000
CoD.ObjectiveText.MoveToLowerLeftDuration = 500
CoD.ObjectiveText.SpinRotataionTime = 350
CoD.ObjectiveText.FontName = "Default"
CoD.ObjectiveText.MaxLines = 1
CoD.ObjectiveText.ScrollDuration = 200
CoD.ObjectiveText.CollapseDuration = 200
CoD.ObjectiveText.ObjectiveLifetime = 10000
CoD.ObjectiveText.DefaultStyle = "twenties"
CoD.ObjectiveText.new = function ()
	local objectiveText = LUI.UIElement.new()
	objectiveText:setLeftRight( false, false, -CoD.ObjectiveText.DefaultWidth / 2, CoD.ObjectiveText.DefaultWidth / 2 )
	objectiveText:setTopBottom( false, false, -CoD.ObjectiveText.DefaultHeight / 2 + 130, CoD.ObjectiveText.DefaultHeight / 2 + 130 )
	objectiveText:setAlpha( 0 )
	objectiveText.id = objectiveText.id .. ".ObjectiveText"
	objectiveText:registerEventHandler( "transition_complete_new_location", CoD.ObjectiveText.CloseSpinner )
	objectiveText:registerEventHandler( "remove_objective_text", CoD.ObjectiveText.RemoveObjectiveText )
	objectiveText:registerEventHandler( "bootup_start", CoD.ObjectiveText.BootupStart )
	objectiveText:registerEventHandler( "bootup_lower_left", CoD.ObjectiveText.BootupLowerLeft )
	objectiveText:registerEventHandler( "bootup_welcome", CoD.ObjectiveText.BootupWelcome )
	objectiveText:registerEventHandler( "bootup_switch_to_hud", CoD.ObjectiveText.BootupSwitchToHUD )
	objectiveText:registerEventHandler( "clear_objective", CoD.ObjectiveText.ClearObjective )
	objectiveText:registerEventHandler( "setup_war_message", CoD.ObjectiveText.SetupWarMessage )
	objectiveText:registerEventHandler( "display_war_message", CoD.ObjectiveText.DisplayWarMessage )
	objectiveText:registerEventHandler( "remove_war_message", CoD.ObjectiveText.RemoveWarMessage )
	objectiveText.textElements = {}
	local objHorizontalList = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alignment = LUI.Alignment.Center
	} )
	objHorizontalList.id = objHorizontalList.id .. ".ObjHorizontalList"
	objectiveText:addElement( objHorizontalList )
	objHorizontalList:registerEventHandler( "transition_complete_spin_0", CoD.ObjectiveText.Spin0 )
	objHorizontalList:registerEventHandler( "transition_complete_spin_360", CoD.ObjectiveText.Spin360 )
	CoD.ObjectiveText.HalfSquareMaterial = RegisterMaterial( "menu_vis_half_square" )
	local objLeftHalfSquare = CoD.ObjectiveText.HalfSquare( CoD.ObjectiveText.HalfSquareSize, 90, 180 )
	objLeftHalfSquare.id = objLeftHalfSquare.id .. ".ObjLeftHalfSquare"
	objHorizontalList:addElement( objLeftHalfSquare )
	local objTextHolder = LUI.UIElement.new( {
		left = 0,
		top = -CoD.textSize[CoD.ObjectiveText.FontName],
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	objTextHolder.id = objTextHolder.id .. ".ObjTextHolder"
	objTextHolder:setUseStencil( true )
	objHorizontalList:addElement( objTextHolder )
	objTextHolder:registerEventHandler( "transition_complete_default", CoD.ObjectiveText.NewTextLength )
	local textHeight = CoD.textSize[CoD.ObjectiveText.FontName]
	local textFont = CoD.fonts[CoD.ObjectiveText.FontName]
	
	local objTextElement = LUI.UIText.new()
	objTextElement:setLeftRight( true, true, 0, 0 )
	objTextElement:setTopBottom( false, true, -textHeight - 3, -3 )
	objTextElement:setFont( textFont )
	objTextElement:setRGB( CoD.ObjectiveText.Blue.r, CoD.ObjectiveText.Blue.g, CoD.ObjectiveText.Blue.b )
	objTextElement.id = objTextElement.id .. "ObjTextElement"
	objTextElement.textFont = textFont
	objTextElement.textHeight = textHeight
	objTextHolder:addElement( objTextElement )
	objTextHolder.objTextElement = objTextElement
	
	local objRightHalfSquare = CoD.ObjectiveText.HalfSquare( CoD.ObjectiveText.HalfSquareSize, 0, -90 )
	objRightHalfSquare.id = objRightHalfSquare.id .. ".ObjRightHalfSquare"
	objHorizontalList:addElement( objRightHalfSquare )
	objectiveText.setNewTextObj = CoD.ObjectiveText.SetNewTextObjective
	objectiveText.spinSquare = CoD.ObjectiveText.SpinSquare
	objectiveText.objHorizontalList = objHorizontalList
	objectiveText.objLeftHalfSquare = objLeftHalfSquare
	objectiveText.objTextHolder = objTextHolder
	objectiveText.objTextElement = objTextElement
	objectiveText.objRightHalfSquare = objRightHalfSquare
	objectiveText:registerEventHandler( "update_style", CoD.ObjectiveText.UpdateStyle )
	return objectiveText
end

CoD.ObjectiveText.UpdateStyle = function ( self, event )
	local style = event.style
	if style == nil then
		style = CoD.ObjectiveText.DefaultStyle
	end
	if style == "eighties" then
		self.objLeftHalfSquare:setAlpha( 0 )
		self.objRightHalfSquare:setAlpha( 0 )
	else
		self.objLeftHalfSquare:setAlpha( CoD.ObjectiveText.DefaultAlpha )
		self.objRightHalfSquare:setAlpha( CoD.ObjectiveText.DefaultAlpha )
	end
end

CoD.ObjectiveText.BootupStart = function ( self, event )
	self:beginAnimation( "show", CoD.ObjectiveText.FadeInDuration )
	self:setAlpha( CoD.ObjectiveText.ObjectiveTextAlpha )
end

CoD.ObjectiveText.BootupLowerLeft = function ( self, event )
	self:setNewTextObj( "", LUI.Alignment.Center )
	local leftOffset = -10
	local topOffset = -3
	local lowerLeftAnimationState = nil
	if not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
		lowerLeftAnimationState = {
			leftAnchor = true,
			rightAnchor = false,
			left = CoD.VisorLeftBracket.BracketWidth + CoD.ObjectiveText.DefaultWidth + leftOffset - 22,
			right = CoD.VisorLeftBracket.BracketWidth + CoD.ObjectiveText.DefaultWidth * 2 + leftOffset - 22,
			topAnchor = false,
			bottomAnchor = false,
			top = -CoD.VisorLeftBracket.BracketHeight / 2,
			bottom = -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.ObjectiveText.DefaultHeight
		}
	else
		local minimapLeftOffset = -18
		local minimapTopOffset = 160
		lowerLeftAnimationState = {
			leftAnchor = true,
			rightAnchor = false,
			left = CoD.VisorLeftBracket.BracketWidth + CoD.ObjectiveText.DefaultWidth + leftOffset - 22 + minimapLeftOffset,
			right = CoD.VisorLeftBracket.BracketWidth + CoD.ObjectiveText.DefaultWidth * 2 + leftOffset - 22 + minimapLeftOffset,
			topAnchor = false,
			bottomAnchor = false,
			top = -CoD.VisorLeftBracket.BracketHeight / 2 + minimapTopOffset,
			bottom = -CoD.VisorLeftBracket.BracketHeight / 2 + CoD.ObjectiveText.DefaultHeight + minimapTopOffset
		}
	end
	local duration = nil
	if event.name == "bootup_switch_to_hud" then
		duration = 0
	else
		duration = CoD.ObjectiveText.MoveToLowerLeftDuration
	end
	self:spinSquare( lowerLeftAnimationState, duration )
	if duration == 0 then
		self:beginAnimation( "show" )
		self:setAlpha( CoD.ObjectiveText.ObjectiveTextAlpha )
	end
end

CoD.ObjectiveText.BootupSwitchToHUD = function ( self, event )
	CoD.ObjectiveText.BootupLowerLeft( self, event )
	self:registerEventHandler( "objective_text", CoD.ObjectiveText.ObjectiveText )
end

CoD.ObjectiveText.BootupWelcome = function ( self, event )
	local newText = event.text
	if not newText then
		newText = Engine.Localize( "MENU_VISOR_WELCOME_CAPS" )
	end
	self:setNewTextObj( newText, LUI.Alignment.Center )
end

CoD.ObjectiveText.ClearObjective = function ( self, event )
	self:setNewTextObj( "", LUI.Alignment.Center )
end

CoD.ObjectiveText.HalfSquare = function ( halfSquareSize, topZRot, bottomZRot )
	local halfSquare = LUI.UIElement.new()
	halfSquare:setLeftRight( true, false, 0, halfSquareSize )
	halfSquare:setTopBottom( true, true, 0, 0 )
	halfSquare:setAlpha( CoD.ObjectiveText.DefaultAlpha )
	local halfSquareMaterial = CoD.ObjectiveText.HalfSquareMaterial
	local topHalf = LUI.UIImage.new()
	topHalf:setLeftRight( false, false, -halfSquareSize / 2, halfSquareSize / 2 )
	topHalf:setTopBottom( true, false, 0, halfSquareSize )
	topHalf:setImage( halfSquareMaterial )
	topHalf:setRGB( CoD.VisorImage.ColorValue.r, CoD.VisorImage.ColorValue.g, CoD.VisorImage.ColorValue.b )
	topHalf:setAlpha( CoD.ObjectiveText.DefaultAlpha )
	topHalf:setZRot( topZRot )
	halfSquare:addElement( topHalf )
	local bottomHalf = LUI.UIImage.new()
	bottomHalf:setLeftRight( false, false, -halfSquareSize / 2, halfSquareSize / 2 )
	bottomHalf:setTopBottom( false, true, -halfSquareSize, 0 )
	bottomHalf:setImage( halfSquareMaterial )
	bottomHalf:setRGB( CoD.VisorImage.ColorValue.r, CoD.VisorImage.ColorValue.g, CoD.VisorImage.ColorValue.b )
	bottomHalf:setAlpha( CoD.ObjectiveText.DefaultAlpha )
	bottomHalf:setZRot( bottomZRot )
	halfSquare:addElement( bottomHalf )
	halfSquare:registerEventHandler( "active_squares", CoD.ObjectiveText.ActiveSquares )
	halfSquare:registerEventHandler( "inactive_squares", CoD.ObjectiveText.InActiveSquares )
	halfSquare.topHalf = topHalf
	halfSquare.bottomHalf = bottomHalf
	return halfSquare
end

CoD.ObjectiveText.SetNewTextObjective = function ( self, text, horizontalListAlignment )
	if self.objTextHolder.objTextElement.text == text then
		return 
	end
	self.objTextHolder.objTextElement.text = text
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, self.objTextElement.textFont, self.objTextElement.textHeight )
	local textWidthLength = textRight + textLeft
	local textSpacingOffset = 20
	if text == "" then
		textSpacingOffset = 0
	end
	self.objTextHolder:registerAnimationState( "next_state_length", {
		left = 0,
		top = 0,
		right = textWidthLength + textSpacingOffset,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	if horizontalListAlignment == LUI.Alignment.Center then
		self.objHorizontalList:setAlignment( LUI.Alignment.Center )
	else
		self.objHorizontalList:setAlignment( LUI.Alignment.Left )
	end
	self.objTextHolder:animateToState( "default", CoD.ObjectiveText.CollapseDuration )
end

CoD.ObjectiveText.ActiveSquares = function ( self, event )
	self.topHalf:beginAnimation( "active" )
	self.topHalf:setRGB( CoD.ObjectiveText.ColorValue.r, CoD.ObjectiveText.ColorValue.g, CoD.ObjectiveText.ColorValue.b )
	self.bottomHalf:beginAnimation( "active" )
	self.bottomHalf:setRGB( CoD.ObjectiveText.ColorValue.r, CoD.ObjectiveText.ColorValue.g, CoD.ObjectiveText.ColorValue.b )
end

CoD.ObjectiveText.InActiveSquares = function ( self, event )
	self.topHalf:beginAnimation( "inactive" )
	self.topHalf:setRGB( CoD.VisorImage.ColorValue.r, CoD.VisorImage.ColorValue.g, CoD.VisorImage.ColorValue.b )
	self.bottomHalf:beginAnimation( "inactive" )
	self.bottomHalf:setRGB( CoD.VisorImage.ColorValue.r, CoD.VisorImage.ColorValue.g, CoD.VisorImage.ColorValue.b )
end

CoD.ObjectiveText.NewTextLength = function ( self, event )
	if self.objTextElement.text ~= nil then
		self:animateToState( "next_state_length", 500 )
		self.objTextElement:setText( self.objTextElement.text )
	end
end

CoD.ObjectiveText.SpinSquare = function ( self, nextAnimationState, duration )
	self:registerAnimationState( "new_location", nextAnimationState )
	if duration == nil then
		duration = 2000
	end
	self:animateToState( "new_location", duration )
	self.objHorizontalList:beginAnimation( "spin_0" )
	self.objHorizontalList:setZRot( 0 )
end

CoD.ObjectiveText.Spin0 = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "spin_360", CoD.ObjectiveText.SpinRotataionTime )
		self:setZRot( 360 )
	end
end

CoD.ObjectiveText.Spin360 = function ( self, event )
	if event.interrupted ~= true then
		self:beginAnimation( "spin_0" )
		self:setZRot( 0 )
	end
end

CoD.ObjectiveText.CloseSpinner = function ( self, event )
	self.objHorizontalList:animateToState( "default" )
end

CoD.ObjectiveText.ObjectiveText = function ( self, event )
	if event.string == "" then
		return 
	end
	local string = Engine.Localize( event.string )
	local textHeight = CoD.textSize[CoD.ObjectiveText.FontName]
	local textFont = CoD.fonts[CoD.ObjectiveText.FontName]
	local newTextElement = LUI.UIText.new()
	newTextElement:setLeftRight( true, false, 2, 0 )
	newTextElement:setTopBottom( false, true, -textHeight - 3, -3 )
	newTextElement:setFont( textFont )
	newTextElement:setRGB( CoD.ObjectiveText.Blue.r, CoD.ObjectiveText.Blue.g, CoD.ObjectiveText.Blue.b )
	newTextElement:setAlpha( 0 )
	self.objTextHolder:addElement( newTextElement )
	newTextElement.lifeTimer = LUI.UITimer.new( CoD.ObjectiveText.ObjectiveLifetime, {
		name = "animate",
		animationStateName = "remove",
		duration = CoD.ObjectiveText.ScrollDuration
	}, true, newTextElement )
	self:addElement( newTextElement.lifeTimer )
	newTextElement.currentPosition = 0
	newTextElement:registerAnimationState( "position_1", {
		alpha = 1
	} )
	for i = 2, CoD.ObjectiveText.MaxLines + 1, 1 do
		local alpha = nil
		if i == CoD.ObjectiveText.MaxLines + 1 then
			alpha = 0
		end
		newTextElement:registerAnimationState( "position_" .. i, {
			topAnchor = false,
			bottomAnchor = true,
			top = -textHeight * i - 3,
			bottom = -textHeight * (i - 1) - 3,
			alpha = alpha
		} )
	end
	newTextElement:registerAnimationState( "remove", {
		alpha = 0
	} )
	newTextElement:registerEventHandler( "objective_text", CoD.ObjectiveText.TextElement_ObjectiveText )
	newTextElement:registerEventHandler( "transition_complete_position_" .. CoD.ObjectiveText.MaxLines + 1, CoD.ObjectiveText.TextElement_Remove )
	newTextElement:registerEventHandler( "transition_complete_remove", CoD.ObjectiveText.TextElement_Remove )
	newTextElement:registerEventHandler( "time_up", CoD.ObjectiveText.TextElement_Remove )
	table.insert( self.textElements, newTextElement )
	newTextElement:setText( string )
	local textLeft, f17_local0, f17_local1, textBottom = GetTextDimensions( string, textFont, textHeight )
	newTextElement.textWidth = f17_local1 + textLeft
	CoD.ObjectiveText.UpdateSize( self )
	self:dispatchEventToChildren( event )
end

CoD.ObjectiveText.UpdateSize = function ( self )
	local largestWidth = 0
	for index, textElement in ipairs( self.textElements ) do
		largestWidth = math.max( largestWidth, textElement.textWidth )
	end
	if 0 < largestWidth then
		largestWidth = largestWidth + 4
		self:dispatchEventToChildren( {
			name = "active_squares"
		} )
	else
		self:addElement( LUI.UITimer.new( CoD.ObjectiveText.ScrollDuration, "inactive_squares", true, self ) )
	end
	self.objTextHolder:registerAnimationState( "next_state_length", {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = largestWidth
	} )
	self.objTextHolder:animateToState( "next_state_length", CoD.ObjectiveText.ScrollDuration, true, true )
	local height = (math.min( #self.textElements, CoD.ObjectiveText.MaxLines ) - 1) * CoD.textSize[CoD.ObjectiveText.FontName]
	if height < 0 then
		height = 0
	end
	self.objHorizontalList:registerAnimationState( "resize", {
		topAnchor = true,
		bottomAnchor = true,
		top = -height,
		bottom = 0,
		alignment = LUI.Alignment.Left
	} )
	self.objHorizontalList:animateToState( "resize", CoD.ObjectiveText.ScrollDuration, true, true )
end

CoD.ObjectiveText.RemoveObjectiveText = function ( self, event )
	self.textElements[1]:close()
	table.remove( self.textElements, 1 )
	CoD.ObjectiveText.UpdateSize( self )
end

CoD.ObjectiveText.TextElement_ObjectiveText = function ( self, event )
	self.currentPosition = self.currentPosition + 1
	if self.currentPosition > CoD.ObjectiveText.MaxLines then
		self.lifeTimer:close()
	end
	if self.currentPosition == 1 then
		self:animateToState( "position_" .. self.currentPosition, CoD.ObjectiveText.ScrollDuration * 2, true, false )
	else
		self:animateToState( "position_" .. self.currentPosition, CoD.ObjectiveText.ScrollDuration )
	end
end

CoD.ObjectiveText.TextElement_Remove = function ( self, event )
	self:dispatchEventToParent( {
		name = "remove_objective_text"
	} )
end

CoD.ObjectiveText.SetupWarMessage = function ( self, event )
	local istring = event.data[1]
	if not istring then
		return 
	else
		local newText = Engine.GetIString( istring, "CS_LOCALIZED_STRINGS" )
		local duration = 500
		local topOffset = 100
		local moveToCenterAnimationState = {
			leftAnchor = false,
			rightAnchor = false,
			left = -CoD.ObjectiveText.DefaultWidth / 2,
			right = CoD.ObjectiveText.DefaultWidth / 2,
			topAnchor = false,
			bottomAnchor = false,
			top = -CoD.ObjectiveText.DefaultHeight / 2 - topOffset,
			bottom = CoD.ObjectiveText.DefaultHeight / 2 - topOffset
		}
		self:spinSquare( moveToCenterAnimationState, duration )
		self:addElement( LUI.UITimer.new( duration, {
			name = "display_war_message",
			text = newText
		}, true, self ) )
	end
end

CoD.ObjectiveText.DisplayWarMessage = function ( self, event )
	self:setNewTextObj( Engine.Localize( event.text ), LUI.Alignment.Center )
	self.objTextElement:flicker( 0, nil, 0.5, 1, 750, 750 )
end

CoD.ObjectiveText.RemoveWarMessage = function ( self, event )
	local delay = 250
	self:processEvent( {
		name = "clear_objective"
	} )
	self:addElement( LUI.UITimer.new( delay, "bootup_lower_left", true, self ) )
end

