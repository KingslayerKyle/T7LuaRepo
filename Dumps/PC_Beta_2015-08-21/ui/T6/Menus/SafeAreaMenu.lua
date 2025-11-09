CoD.SafeArea = {}
CoD.SafeArea.Maximum = 1.01
CoD.SafeArea.Minimum = 0.85
CoD.SafeArea.AdjustAmount = 0
CoD.SafeArea.ArrowMaterial = RegisterMaterial( "menu_safearea_arrow" )
CoD.SafeArea.AdjustSFX = "cac_safearea"
CoD.SafeArea.HandleGamepadButton = function ( f1_arg0, f1_arg1 )
	if f1_arg1.down == true and (f1_arg1.button == "right" or f1_arg1.button == "left" or f1_arg1.button == "up" or f1_arg1.button == "down") then
		f1_arg0:dispatchEventToRoot( {
			name = "safearea_move_" .. f1_arg1.button,
			controller = f1_arg1.controller
		} )
		return true
	elseif f1_arg1.down == true then
		if f1_arg1.button == "primary" then
			f1_arg0:dispatchEventToRoot( {
				name = "accept_button",
				controller = f1_arg1.controller
			} )
		end
		if f1_arg1.button == "secondary" then
			f1_arg0:dispatchEventToRoot( {
				name = "safearea_back_button",
				controller = f1_arg1.controller
			} )
			return true
		end
	end
end

CoD.SafeArea.SafeArea_Move = function ( f2_arg0, f2_arg1 )
	local f2_local0 = tonumber( Engine.ProfileValueAsString( f2_arg1.controller, "safeAreaTweakable_vertical" ) )
	local f2_local1 = tonumber( Engine.ProfileValueAsString( f2_arg1.controller, "safeAreaTweakable_horizontal" ) )
	Engine.PlaySound( CoD.SafeArea.AdjustSFX )
	if f2_arg1.name == "safearea_move_up" then
		local f2_local2 = f2_local0 + CoD.SafeArea.AdjustAmount
		if f2_local2 > CoD.SafeArea.Maximum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( f2_arg1.controller, "safeAreaTweakable_vertical", f2_local2 )
		end
	elseif f2_arg1.name == "safearea_move_down" then
		local f2_local2 = f2_local0 - CoD.SafeArea.AdjustAmount
		if f2_local2 < CoD.SafeArea.Minimum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( f2_arg1.controller, "safeAreaTweakable_vertical", f2_local2 )
		end
	elseif f2_arg1.name == "safearea_move_left" then
		local f2_local2 = f2_local1 - CoD.SafeArea.AdjustAmount
		if f2_local2 < CoD.SafeArea.Minimum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( f2_arg1.controller, "safeAreaTweakable_horizontal", f2_local2 )
		end
	elseif f2_arg1.name == "safearea_move_right" then
		local f2_local2 = f2_local1 + CoD.SafeArea.AdjustAmount
		if f2_local2 > CoD.SafeArea.Maximum then
			Engine.PlaySound( CoD.CACUtility.denySFX )
		else
			Engine.SetProfileVar( f2_arg1.controller, "safeAreaTweakable_horizontal", f2_local2 )
		end
	end
	f2_arg0:dispatchEventToRoot( {
		name = "update_safe_area",
		controller = f2_arg1.controller
	} )
end

CoD.SafeArea.UpdateSafeArea = function ( f3_arg0, f3_arg1 )
	Engine.ExecNow( f3_arg1.controller, "setupviewport" )
	local f3_local0, f3_local1 = Engine.GetUserSafeArea()
	f3_arg0.backgroundContainer:setLeftRight( false, false, -f3_local0 / 2, f3_local0 / 2 )
	f3_arg0.backgroundContainer:setTopBottom( false, false, -f3_local1 / 2, f3_local1 / 2 )
end

CoD.SafeArea.BackButton = function ( f4_arg0, f4_arg1 )
	f4_arg0:processEvent( {
		name = "button_prompt_back",
		controller = f4_arg1.controller
	} )
end

CoD.SafeArea.CloseFirstTime = function ( f5_arg0, f5_arg1 )
	if not CoD.Options.SupportsMatureContent() then
		Engine.ExecNow( f5_arg1.controller, "setprofile com_first_time 0" )
		Engine.ExecNow( f5_arg1.controller, "updategamerprofile" )
		f5_arg0:dispatchEventToParent( {
			name = "open_main_menu",
			controller = f5_arg1.controller
		} )
		CoD.perController[f5_arg1.controller].firstTime = nil
	else
		f5_arg0:openMenu( "MatureContentPopup", f5_arg1.controller )
	end
	f5_arg0:close()
end

CoD.SafeArea.LeftMouseDown = function ( f6_arg0, f6_arg1 )
	f6_arg0.m_curX = f6_arg1.x
	f6_arg0.m_curY = f6_arg1.y
end

CoD.SafeArea.MouseDrag = function ( f7_arg0, f7_arg1 )
	if f7_arg0.m_curX == nil or f7_arg0.m_curY == nil then
		return 
	end
	local f7_local0 = 10
	if f7_local0 < math.abs( f7_arg0.m_curX - f7_arg1.x ) then
		if f7_arg0.m_curX < f7_arg1.x then
			f7_arg0:processEvent( {
				name = "safearea_move_right"
			} )
		else
			f7_arg0:processEvent( {
				name = "safearea_move_left"
			} )
		end
		f7_arg0.m_curX = f7_arg1.x
	end
	if f7_local0 < math.abs( f7_arg0.m_curY - f7_arg1.y ) then
		if f7_arg0.m_curY < f7_arg1.y then
			f7_arg0:processEvent( {
				name = "safearea_move_down"
			} )
		else
			f7_arg0:processEvent( {
				name = "safearea_move_up"
			} )
		end
		f7_arg0.m_curY = f7_arg1.y
	end
end

LUI.createMenu.SafeArea = function ( f8_arg0 )
	local f8_local0 = nil
	if Engine.IsInGame() then
		f8_local0 = CoD.InGameMenu.New( "SafeArea", f8_arg0, Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false then
			if Engine.IsInGame() and Engine.IsSplitscreen() then
				f8_local0:sizeToSafeArea( f8_arg0 )
			end
			f8_local0:updateTitleForSplitscreen()
			f8_local0:updateButtonPromptBarsForSplitscreen()
		end
	else
		f8_local0 = CoD.Menu.New( "SafeArea" )
		f8_local0:addTitle( Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ) )
		f8_local0:setOwner( f8_arg0 )
		if CoD.isSinglePlayer == false then
			f8_local0:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	f8_local0.controller = f8_arg0
	f8_local0.close = function ( f9_arg0 )
		Engine.PlaySound( "uin_cmn_backout" )
		Engine.Exec( f9_arg0:getOwner(), "updategamerprofile" )
		if CoD.isCampaign == false then
			f9_arg0:saveState()
		end
		CoD.Menu.close( f9_arg0 )
	end
	
	f8_local0:registerEventHandler( "update_safe_area", CoD.SafeArea.UpdateSafeArea )
	Engine.ExecNow( f8_arg0, "setupviewport" )
	local f8_local1, f8_local2 = Engine.GetUserSafeArea()
	f8_local0.backgroundContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f8_local1 / 2,
		right = f8_local1 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f8_local2 / 2,
		bottom = f8_local2 / 2
	} )
	f8_local0:addElement( f8_local0.backgroundContainer )
	f8_local0.backgroundImage = LUI.UIImage.new( {
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
	f8_local0.backgroundContainer:addElement( f8_local0.backgroundImage )
	f8_local0.instructions = LUI.UIText.new()
	f8_local0.instructions:setLeftRight( true, true, 0, 0 )
	f8_local0.instructions:setTopBottom( false, false, -100, -100 + CoD.textSize.Default )
	f8_local0.instructions:setFont( CoD.fonts.Default )
	f8_local0.instructions:setText( Engine.Localize( "PLATFORM_SAFEAREA_INSTRUCTIONS" ) )
	f8_local0:addElement( f8_local0.instructions )
	local f8_local3 = 64
	f8_local0.backgroundContainer:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f8_local3,
		topAnchor = false,
		bottomAnchor = false,
		top = -(f8_local3 / 2),
		bottom = f8_local3 / 2,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 0
	} ) )
	f8_local0.backgroundContainer:addElement( LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -(f8_local3 / 2),
		right = f8_local3 / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f8_local3,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 270
	} ) )
	f8_local0.backgroundContainer:addElement( LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -f8_local3,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -(f8_local3 / 2),
		bottom = f8_local3 / 2,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 180
	} ) )
	f8_local0.backgroundContainer:addElement( LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -(f8_local3 / 2),
		right = f8_local3 / 2,
		topAnchor = false,
		bottomAnchor = true,
		top = -f8_local3,
		bottom = 0,
		material = CoD.SafeArea.ArrowMaterial,
		zRot = 90
	} ) )
	local f8_local4 = -CoD.textSize.Default
	local f8_local5 = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f8_local1 / 2,
		right = f8_local1 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = f8_local4,
		bottom = f8_local4 + CoD.textSize.Default,
		font = CoD.fonts.Default
	} )
	f8_local5:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_HORIZONTAL" ) )
	f8_local0:addElement( f8_local5 )
	f8_local4 = f8_local4 + CoD.textSize.Default
	local f8_local6 = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f8_local1 / 2,
		right = f8_local1 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = f8_local4,
		bottom = f8_local4 + CoD.textSize.Default,
		font = CoD.fonts.Default
	} )
	f8_local6:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_VERTICAL" ) )
	f8_local0:addElement( f8_local6 )
	f8_local0.button = LUI.UIButton.new( {
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
	f8_local0.button.handleGamepadButton = CoD.SafeArea.HandleGamepadButton
	f8_local0:addElement( f8_local0.button )
	f8_local0.button:processEvent( {
		name = "gain_focus"
	} )
	f8_local0:registerEventHandler( "safearea_move_up", CoD.SafeArea.SafeArea_Move )
	f8_local0:registerEventHandler( "safearea_move_down", CoD.SafeArea.SafeArea_Move )
	f8_local0:registerEventHandler( "safearea_move_left", CoD.SafeArea.SafeArea_Move )
	f8_local0:registerEventHandler( "safearea_move_right", CoD.SafeArea.SafeArea_Move )
	if CoD.perController[f8_arg0].firstTime then
		f8_local0.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), f8_local0, "accept_button" )
		f8_local0:addLeftButtonPrompt( f8_local0.acceptButton )
		f8_local0:registerEventHandler( "accept_button", CoD.SafeArea.CloseFirstTime )
	else
		f8_local0.backButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_BACK" ), f8_local0, "safearea_back_button" )
		f8_local0:addLeftButtonPrompt( f8_local0.backButton )
		f8_local0:registerEventHandler( "safearea_back_button", CoD.SafeArea.BackButton )
	end
	if CoD.useMouse then
		f8_local0:setHandleMouse( true )
		f8_local0:registerEventHandler( "leftmousedown", CoD.SafeArea.LeftMouseDown )
		f8_local0:registerEventHandler( "mousedrag", CoD.SafeArea.MouseDrag )
		f8_local0:setLeftRight( true, true, 0, 0 )
		f8_local0:setTopBottom( true, true, 0, 0 )
		if f8_local0.titleElement then
			f8_local0.titleElement:close()
			local f8_local7 = LUI.UIText.new()
			f8_local7:setLeftRight( true, true, 0, 0 )
			f8_local7:setTopBottom( false, false, -150, -150 + CoD.textSize.Condensed )
			f8_local7:setFont( CoD.fonts.Condensed )
			f8_local7:setText( Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT_CAPS" ) )
			f8_local0:addElement( f8_local7 )
		end
		if f8_local0.leftButtonPromptBar then
			f8_local0.leftButtonPromptBar:close()
			f8_local0.leftButtonPromptBar:setLeftRight( false, false, -f8_local0.width / 2, f8_local0.width / 2 )
			f8_local0.leftButtonPromptBar:setTopBottom( false, false, f8_local0.height / 2 - CoD.ButtonPrompt.Height, f8_local0.height / 2 )
			f8_local0:addElement( f8_local0.leftButtonPromptBar )
		end
		if f8_local0.rightButtonPromptBar then
			f8_local0.rightButtonPromptBar:close()
			f8_local0.rightButtonPromptBar:setLeftRight( false, false, -f8_local0.width / 2, f8_local0.width / 2 )
			f8_local0.rightButtonPromptBar:setTopBottom( false, false, f8_local0.height / 2 - CoD.ButtonPrompt.Height, f8_local0.height / 2 )
			f8_local0:addElement( f8_local0.rightButtonPromptBar )
		end
	end
	Engine.PlaySound( "cac_grid_nav" )
	return f8_local0
end

