CoD.SafeArea = {}
CoD.SafeArea.Maximum = 1.01
CoD.SafeArea.Minimum = 0.85
CoD.SafeArea.AdjustAmount = 0
CoD.SafeArea.ArrowMaterial = RegisterMaterial( "menu_safearea_arrow" )
CoD.SafeArea.AdjustSFX = "cac_safearea"
CoD.SafeArea.HandleGamepadButton = function ( self, event )
	if event.down == true and (event.button == "right" or event.button == "left" or event.button == "up" or event.button == "down") then
		self:dispatchEventToRoot( {
			name = "safearea_move_" .. event.button,
			controller = event.controller
		} )
		return true
	elseif event.down == true then
		if event.button == "primary" then
			self:dispatchEventToRoot( {
				name = "accept_button",
				controller = event.controller
			} )
		end
		if event.button == "secondary" then
			self:dispatchEventToRoot( {
				name = "safearea_back_button",
				controller = event.controller
			} )
			return true
		end
	end
end

CoD.SafeArea.SafeArea_Move = function ( self, event )
	local currVert = tonumber( Engine.ProfileValueAsString( event.controller, "safeAreaTweakable_vertical" ) )
	local currHoriz = tonumber( Engine.ProfileValueAsString( event.controller, "safeAreaTweakable_horizontal" ) )
	Engine.PlaySound( CoD.SafeArea.AdjustSFX )
	if event.name == "safearea_move_up" then
		local value = currVert + CoD.SafeArea.AdjustAmount
		if value > CoD.SafeArea.Maximum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( event.controller, "safeAreaTweakable_vertical", value )
		end
	elseif event.name == "safearea_move_down" then
		local value = currVert - CoD.SafeArea.AdjustAmount
		if value < CoD.SafeArea.Minimum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( event.controller, "safeAreaTweakable_vertical", value )
		end
	elseif event.name == "safearea_move_left" then
		local value = currHoriz - CoD.SafeArea.AdjustAmount
		if value < CoD.SafeArea.Minimum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( event.controller, "safeAreaTweakable_horizontal", value )
		end
	elseif event.name == "safearea_move_right" then
		local value = currHoriz + CoD.SafeArea.AdjustAmount
		if value > CoD.SafeArea.Maximum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( event.controller, "safeAreaTweakable_horizontal", value )
		end
	end
	self:dispatchEventToRoot( {
		name = "update_safe_area",
		controller = event.controller
	} )
end

CoD.SafeArea.UpdateSafeArea = function ( self, event )
	Engine.ExecNow( event.controller, "setupviewport" )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	self.backgroundContainer:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
	self.backgroundContainer:setTopBottom( false, false, -safeAreaHeight / 2, safeAreaHeight / 2 )
end

CoD.SafeArea.BackButton = function ( self, event )
	self:processEvent( {
		name = "button_prompt_back",
		controller = event.controller
	} )
end

CoD.SafeArea.CloseFirstTime = function ( self, event )
	if not CoD.Options.SupportsMatureContent() then
		Engine.ExecNow( event.controller, "setprofile com_first_time 0" )
		Engine.ExecNow( event.controller, "updategamerprofile" )
		self:dispatchEventToParent( {
			name = "open_main_menu",
			controller = event.controller
		} )
		CoD.perController[event.controller].firstTime = nil
	else
		self:openMenu( "MatureContentPopup", event.controller )
	end
	self:close()
end

CoD.SafeArea.LeftMouseDown = function ( self, event )
	self.m_curX = event.x
	self.m_curY = event.y
end

CoD.SafeArea.MouseDrag = function ( self, event )
	if self.m_curX == nil or self.m_curY == nil then
		return 
	end
	local dragDistance = 10
	if dragDistance < math.abs( self.m_curX - event.x ) then
		if self.m_curX < event.x then
			self:processEvent( {
				name = "safearea_move_right"
			} )
		else
			self:processEvent( {
				name = "safearea_move_left"
			} )
		end
		self.m_curX = event.x
	end
	if dragDistance < math.abs( self.m_curY - event.y ) then
		if self.m_curY < event.y then
			self:processEvent( {
				name = "safearea_move_down"
			} )
		else
			self:processEvent( {
				name = "safearea_move_up"
			} )
		end
		self.m_curY = event.y
	end
end

LUI.createMenu.SafeArea = function ( controller )
	local safeAreaMenu = nil
	if Engine.IsInGame() then
		safeAreaMenu = CoD.InGameMenu.New( "SafeArea", controller, Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false then
			if Engine.IsInGame() and Engine.IsSplitscreen() then
				safeAreaMenu:sizeToSafeArea( controller )
			end
			safeAreaMenu:updateTitleForSplitscreen()
			safeAreaMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		safeAreaMenu = CoD.Menu.New( "SafeArea" )
		safeAreaMenu:addTitle( Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ) )
		safeAreaMenu:setOwner( controller )
		if CoD.isSinglePlayer == false then
			safeAreaMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	safeAreaMenu.controller = controller
	safeAreaMenu.close = CoD.Options.Close
	safeAreaMenu:registerEventHandler( "update_safe_area", CoD.SafeArea.UpdateSafeArea )
	Engine.ExecNow( controller, "setupviewport" )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	safeAreaMenu.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -safeAreaHeight / 2,
		bottom = safeAreaHeight / 2
	} )
	safeAreaMenu:addElement( safeAreaMenu.backgroundContainer )
	safeAreaMenu.backgroundImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = 0.3,
		green = 0.3,
		blue = 0.3,
		alpha = 0.5
	} )
	safeAreaMenu.backgroundContainer:addElement( safeAreaMenu.backgroundImage )
	safeAreaMenu.instructions = LUI.UIText.new()
	safeAreaMenu.instructions:setLeftRight( true, true, 0, 0 )
	safeAreaMenu.instructions:setTopBottom( false, false, -100, -100 + CoD.textSize.Default )
	safeAreaMenu.instructions:setFont( CoD.fonts.Default )
	safeAreaMenu.instructions:setText( Engine.Localize( "PLATFORM_SAFEAREA_INSTRUCTIONS" ) )
	safeAreaMenu:addElement( safeAreaMenu.instructions )
	local arrowSize = 64
	local leftArrow = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = arrowSize,
		topAnchor = false,
		bottomAnchor = false,
		top = -(arrowSize / 2),
		bottom = arrowSize / 2,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 0
	} )
	safeAreaMenu.backgroundContainer:addElement( leftArrow )
	local upArrow = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -(arrowSize / 2),
		right = arrowSize / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = arrowSize,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 270
	} )
	safeAreaMenu.backgroundContainer:addElement( upArrow )
	local rightArrow = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -arrowSize,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -(arrowSize / 2),
		bottom = arrowSize / 2,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 180
	} )
	safeAreaMenu.backgroundContainer:addElement( rightArrow )
	local downArrow = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -(arrowSize / 2),
		right = arrowSize / 2,
		topAnchor = false,
		bottomAnchor = true,
		top = -arrowSize,
		bottom = 0,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 90
	} )
	safeAreaMenu.backgroundContainer:addElement( downArrow )
	local textTop = -CoD.textSize.Default
	local horizontalLabel = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = textTop,
		bottom = textTop + CoD.textSize.Default,
		font = CoD.fonts.Default
	} )
	horizontalLabel:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_HORIZONTAL" ) )
	safeAreaMenu:addElement( horizontalLabel )
	textTop = textTop + CoD.textSize.Default
	local verticalLabel = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = textTop,
		bottom = textTop + CoD.textSize.Default,
		font = CoD.fonts.Default
	} )
	verticalLabel:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_VERTICAL" ) )
	safeAreaMenu:addElement( verticalLabel )
	safeAreaMenu.button = LUI.UIButton.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	safeAreaMenu.button.handleGamepadButton = CoD.SafeArea.HandleGamepadButton
	safeAreaMenu:addElement( safeAreaMenu.button )
	safeAreaMenu.button:processEvent( {
		name = "gain_focus"
	} )
	safeAreaMenu:registerEventHandler( "safearea_move_up", CoD.SafeArea.SafeArea_Move )
	safeAreaMenu:registerEventHandler( "safearea_move_down", CoD.SafeArea.SafeArea_Move )
	safeAreaMenu:registerEventHandler( "safearea_move_left", CoD.SafeArea.SafeArea_Move )
	safeAreaMenu:registerEventHandler( "safearea_move_right", CoD.SafeArea.SafeArea_Move )
	if CoD.perController[controller].firstTime then
		safeAreaMenu.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), safeAreaMenu, "accept_button" )
		safeAreaMenu:addLeftButtonPrompt( safeAreaMenu.acceptButton )
		safeAreaMenu:registerEventHandler( "accept_button", CoD.SafeArea.CloseFirstTime )
	else
		safeAreaMenu.backButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_BACK" ), safeAreaMenu, "safearea_back_button" )
		safeAreaMenu:addLeftButtonPrompt( safeAreaMenu.backButton )
		safeAreaMenu:registerEventHandler( "safearea_back_button", CoD.SafeArea.BackButton )
	end
	if CoD.useMouse then
		safeAreaMenu:setHandleMouse( true )
		safeAreaMenu:registerEventHandler( "leftmousedown", CoD.SafeArea.LeftMouseDown )
		safeAreaMenu:registerEventHandler( "mousedrag", CoD.SafeArea.MouseDrag )
		safeAreaMenu:setLeftRight( true, true, 0, 0 )
		safeAreaMenu:setTopBottom( true, true, 0, 0 )
		if safeAreaMenu.titleElement then
			safeAreaMenu.titleElement:close()
			local title = LUI.UIText.new()
			title:setLeftRight( true, true, 0, 0 )
			title:setTopBottom( false, false, -150, -150 + CoD.textSize.Condensed )
			title:setFont( CoD.fonts.Condensed )
			title:setText( Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ) )
			safeAreaMenu:addElement( title )
		end
		if safeAreaMenu.leftButtonPromptBar then
			safeAreaMenu.leftButtonPromptBar:close()
			safeAreaMenu.leftButtonPromptBar:setLeftRight( false, false, -safeAreaMenu.width / 2, safeAreaMenu.width / 2 )
			safeAreaMenu.leftButtonPromptBar:setTopBottom( false, false, safeAreaMenu.height / 2 - CoD.ButtonPrompt.Height, safeAreaMenu.height / 2 )
			safeAreaMenu:addElement( safeAreaMenu.leftButtonPromptBar )
		end
		if safeAreaMenu.rightButtonPromptBar then
			safeAreaMenu.rightButtonPromptBar:close()
			safeAreaMenu.rightButtonPromptBar:setLeftRight( false, false, -safeAreaMenu.width / 2, safeAreaMenu.width / 2 )
			safeAreaMenu.rightButtonPromptBar:setTopBottom( false, false, safeAreaMenu.height / 2 - CoD.ButtonPrompt.Height, safeAreaMenu.height / 2 )
			safeAreaMenu:addElement( safeAreaMenu.rightButtonPromptBar )
		end
	end
	Engine.PlaySound( "cac_grid_nav" )
	return safeAreaMenu
end

