-- a75423ca1ff2f0d01191f98f9d960986
-- This hash is used for caching, delete to decompile the file again

CoD.MFTabManager = {}
CoD.MFTabManager.LeftShoulderActionSFX = "cac_safearea"
CoD.MFTabManager.RightShoulderActionSFX = "cac_safearea"
CoD.MFTabManager.TabTitleFontName = "Default"
CoD.MFTabManager.TabHeight = CoD.textSize[CoD.MFTabManager.TabTitleFontName]
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CoD.fonts[CoD.MFTabManager.TabTitleFontName]
	local f1_local1 = CoD.MFTabManager.TabHeight
	local f1_local2 = 30
	local f1_local3 = {}
	f1_local3 = GetTextDimensions( Engine.Localize( f1_arg1 ), f1_local0, f1_local1 )
	local f1_local4 = f1_local3[3]
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f1_local4 + f1_local2,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = f1_local1
	} )
	f1_arg0.tabHeaderPane:addElement( self )
	local f1_local6 = 5 * 2 + f1_local4
	self.tabBg = LUI.UIImage.new()
	self.tabBg:setLeftRight( false, false, -f1_local6 / 2, f1_local6 / 2 )
	self.tabBg:setTopBottom( true, true, 0, 2 )
	self.tabBg:setImage( RegisterMaterial( "white" ) )
	self.tabBg:setRGB( 0, 0, 0 )
	self.tabBg:setAlpha( 0 )
	if CoD.isMultiplayer and not f1_arg2 then
		self:addElement( self.tabBg )
	end
	local titleBox = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -1,
		right = 1,
		topAnchor = false,
		bottomAnchor = false,
		top = -f1_local1 / 2,
		bottom = f1_local1 / 2,
		font = f1_local0,
		alpha = 0.25,
		red = 1,
		green = 1,
		blue = 1
	} )
	if f1_arg0.selectionColor ~= nil then
		titleBox:registerAnimationState( "selected", {
			alpha = 1,
			red = f1_arg0.selectionColor.r,
			green = f1_arg0.selectionColor.g,
			blue = f1_arg0.selectionColor.b
		} )
	else
		titleBox:registerAnimationState( "selected", {
			alpha = 1
		} )
	end
	titleBox:setText( Engine.Localize( f1_arg1 ) )
	titleBox.titleWidth = f1_local4 + f1_local2
	self:addElement( titleBox )
	self.titleBox = titleBox
	
	return self
end

CoD.MFTabManager.buttonLeftShoulder = function ( f2_arg0, f2_arg1 )
	if f2_arg0.m_enabled == false then
		return 
	elseif f2_arg0 ~= nil then
		if f2_arg0.tabSelected == 1 then
			f2_arg0.tabSelected = #f2_arg0.tabsList
		else
			f2_arg0.tabSelected = f2_arg0.tabSelected - 1
		end
		Engine.PlaySound( CoD.MFTabManager.LeftShoulderActionSFX )
		CoD.MFTabManager.LoadTab( f2_arg0, f2_arg1.controller, f2_arg0.tabSelected )
	end
end

CoD.MFTabManager.buttonRightShoulder = function ( f3_arg0, f3_arg1 )
	if f3_arg0.m_enabled == false then
		return 
	elseif f3_arg0 ~= nil then
		f3_arg0.tabSelected = f3_arg0.tabSelected % #f3_arg0.tabsList + 1
		Engine.PlaySound( CoD.MFTabManager.RightShoulderActionSFX )
		CoD.MFTabManager.LoadTab( f3_arg0, f3_arg1.controller, f3_arg0.tabSelected )
	end
end

CoD.MFTabManager.TabClicked = function ( f4_arg0, f4_arg1 )
	if f4_arg0.m_enabled == false then
		return 
	else
		f4_arg0.tabSelected = f4_arg1.tabIndex
		CoD.MFTabManager.LoadTab( f4_arg0, f4_arg1.controller, f4_arg0.tabSelected )
	end
end

CoD.MFTabManager.Enable = function ( f5_arg0 )
	f5_arg0.m_enabled = true
end

CoD.MFTabManager.Disable = function ( f6_arg0 )
	f6_arg0.m_enabled = false
end

CoD.MFTabManager.new = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local self = LUI.UIElement.new( f7_arg1 )
	self.tabContentPane = f7_arg0
	self.m_isHidden = f7_arg2
	self.m_enabled = true
	
	local leftTopButtonBar = LUI.UIElement.new()
	leftTopButtonBar:setLeftRight( true, false, 0, CoD.ButtonPrompt.Height )
	leftTopButtonBar:setTopBottom( true, false, 0, CoD.ButtonPrompt.Height )
	self:addElement( leftTopButtonBar )
	self.leftTopButtonBar = leftTopButtonBar
	
	local f7_local2 = CoD.ButtonPrompt.new( "shoulderl", "", self, "aar_button_prompt_shoulderl" )
	leftTopButtonBar:addElement( f7_local2 )
	self:registerEventHandler( "aar_button_prompt_shoulderl", CoD.MFTabManager.buttonLeftShoulder )
	
	local rightTopButtonBar = LUI.UIElement.new()
	rightTopButtonBar:setLeftRight( false, true, -CoD.ButtonPrompt.Height, 0 )
	rightTopButtonBar:setTopBottom( true, false, 0, CoD.ButtonPrompt.Height )
	self:addElement( rightTopButtonBar )
	self.rightTopButtonBar = rightTopButtonBar
	
	local f7_local4 = CoD.ButtonPrompt.new( "shoulderr", "", self, "aar_button_prompt_shoulderr" )
	rightTopButtonBar:addElement( f7_local4 )
	self:registerEventHandler( "aar_button_prompt_shoulderr", CoD.MFTabManager.buttonRightShoulder )
	if CoD.isPC then
		self:registerEventHandler( "tab_clicked", CoD.MFTabManager.TabClicked )
	end
	if self.m_isHidden == true then
		f7_local4:setAlpha( 0 )
		f7_local2:setAlpha( 0 )
	end
	local tabHeaderPane = LUI.UIHorizontalList.new()
	tabHeaderPane:setLeftRight( true, true, CoD.ButtonPrompt.Height + 5, -(CoD.ButtonPrompt.Height + 5) )
	tabHeaderPane:setTopBottom( true, true, 0, 0 )
	tabHeaderPane:setAlignment( LUI.Alignment.Left )
	self:addElement( tabHeaderPane )
	self.tabHeaderPane = tabHeaderPane
	
	self.addTab = CoD.MFTabManager.AddTab
	self.refreshTab = CoD.MFTabManager.Refresh
	self.loadTab = CoD.MFTabManager.LoadTab
	self.setTabSpacing = CoD.MFTabManager.SetTabSpacing
	self.setTabAlignment = CoD.MFTabManager.SetTabAlignment
	self.keepRightBumperAlignedToHeader = CoD.MFTabManager.KeepRightBumperAlignedToHeader
	self.enable = CoD.MFTabManager.Enable
	self.disable = CoD.MFTabManager.Disable
	self.selectionColor = f7_arg3
	self.tabSelected = 1
	return self
end

CoD.MFTabManager.SetTabSpacing = function ( f8_arg0, f8_arg1 )
	f8_arg0.tabHeaderPane:registerAnimationState( "default", {
		spacing = f8_arg1
	} )
	f8_arg0.tabHeaderPane:animateToState( "default" )
end

CoD.MFTabManager.SetTabAlignment = function ( f9_arg0, f9_arg1 )
	f9_arg0.tabHeaderPane:registerAnimationState( "default", {
		alignment = f9_arg1
	} )
	f9_arg0.tabHeaderPane:animateToState( "default" )
end

CoD.MFTabManager.KeepRightBumperAlignedToHeader = function ( f10_arg0, f10_arg1 )
	f10_arg0.tabHeaderPane.rightBumperAlignedToHeader = f10_arg1
end

CoD.MFTabManager.RefeshRightBumperAlignment = function ( f11_arg0 )
	if f11_arg0.tabHeaderPane.rightBumperAlignedToHeader ~= nil and f11_arg0.tabHeaderPane.rightBumperAlignedToHeader == true then
		local f11_local0 = 0
		for f11_local1 = 1, #f11_arg0.tabsList, 1 do
			f11_local0 = f11_local0 + f11_arg0.tabsList[f11_local1].tabHeader.titleBox.titleWidth
		end
		local f11_local1 = CoD.ButtonPrompt.Height + 5 + f11_local0 + 5
		f11_arg0.rightTopButtonBar:setLeftRight( true, false, f11_local1, f11_local1 + CoD.ButtonPrompt.Height )
	end
end

CoD.MFTabManager.AddTab = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	if f12_arg0.tabsList == nil then
		f12_arg0.tabsList = {}
	end
	if f12_arg4 == nil then
		f12_arg4 = false
	end
	local f12_local0 = {
		tabCreatorFn = f12_arg3,
		tabHeader = f0_local0( f12_arg0, f12_arg2, f12_arg4 )
	}
	table.insert( f12_arg0.tabsList, f12_local0 )
	f12_local0.tabIndex = table.getn( f12_arg0.tabsList )
	if CoD.isPC then
		f12_local0.tabHeader:setHandleMouse( true )
		f12_local0.tabHeader:registerEventHandler( "mouseenter", CoD.MFTabManager.TabHeader_MouseEnter )
		f12_local0.tabHeader:registerEventHandler( "mouseleave", CoD.MFTabManager.TabHeader_MouseLeave )
		f12_local0.tabHeader:registerEventHandler( "leftmousedown", CoD.MFTabManager.TabHeader_LeftMouseDown )
		f12_local0.tabHeader.id = "MFTabHeader"
		f12_local0.tabHeader.index = #f12_arg0.tabsList
	end
	CoD.MFTabManager.RefeshRightBumperAlignment( f12_arg0 )
	return f12_local0.tabIndex
end

CoD.MFTabManager.Refresh = function ( f13_arg0, f13_arg1 )
	CoD.MFTabManager.LoadTab( f13_arg0, f13_arg1, f13_arg0.tabSelected )
end

CoD.MFTabManager.LoadTab = function ( f14_arg0, f14_arg1, f14_arg2 )
	f14_arg0.tabSelected = f14_arg2
	if f14_arg0.tabCreated ~= nil then
		f14_arg0.tabCreated:processEvent( {
			name = "close_tab"
		} )
		f14_arg0.tabCreated:close()
	end
	collectgarbage( "collect" )
	collectgarbage( "collect" )
	f14_arg0.tabCreated = f14_arg0.tabsList[f14_arg2]:tabCreatorFn( f14_arg1 )
	if f14_arg0.m_isHidden == nil or f14_arg0.m_isHidden == false then
		f14_arg0.tabContentPane:addElement( f14_arg0.tabCreated )
	end
	if f14_arg0.currentTabHeader ~= nil then
		f14_arg0.currentTabHeader.isCurrentlySelected = false
		f14_arg0.currentTabHeader.titleBox:animateToState( "default", 250 )
		f14_arg0.currentTabHeader.tabBg:beginAnimation( "default", 250 )
		f14_arg0.currentTabHeader.tabBg:setAlpha( 0 )
	end
	f14_arg0.currentTabHeader = f14_arg0.tabsList[f14_arg2].tabHeader
	f14_arg0.currentTabHeader.isCurrentlySelected = true
	f14_arg0.currentTabHeader.titleBox:animateToState( "selected", 250 )
	f14_arg0.currentTabHeader.tabBg:beginAnimation( "selected", 250 )
	f14_arg0.currentTabHeader.tabBg:setAlpha( 1 )
	f14_arg0:dispatchEventToParent( {
		name = "tab_changed",
		tabIndex = f14_arg0.tabSelected
	} )
end

CoD.MFTabManager.TabHeader_MouseEnter = function ( f15_arg0, f15_arg1 )
	f15_arg0.titleBox:beginAnimation( "mouse_enter", 100 )
	f15_arg0.titleBox:setAlpha( 1 )
	f15_arg0.tabBg:beginAnimation( "mouse_enter", 250 )
	f15_arg0.tabBg:setAlpha( 1 )
end

CoD.MFTabManager.TabHeader_MouseLeave = function ( f16_arg0, f16_arg1 )
	if not f16_arg0.isCurrentlySelected then
		f16_arg0.titleBox:animateToState( "default", 100 )
		f16_arg0.tabBg:beginAnimation( "default", 250 )
		f16_arg0.tabBg:setAlpha( 0 )
	end
end

CoD.MFTabManager.TabHeader_LeftMouseDown = function ( f17_arg0, f17_arg1 )
	if not f17_arg0.isCurrentlySelected then
		f17_arg0:dispatchEventToParent( {
			name = "tab_clicked",
			controller = f17_arg1.controller,
			tabIndex = f17_arg0.index
		} )
	end
end

