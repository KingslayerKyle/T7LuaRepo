require( "ui.T6.SideBrackets" )

CoD.MFTabManager = {}
CoD.MFTabManager.LeftShoulderActionSFX = "cac_safearea"
CoD.MFTabManager.RightShoulderActionSFX = "cac_safearea"
CoD.MFTabManager.TabTitleFontName = "Default"
CoD.MFTabManager.TabHeight = CoD.textSize[CoD.MFTabManager.TabTitleFontName]
local AttachTab = function ( self, title, ignoreTabBg )
	local textFont = CoD.fonts[CoD.MFTabManager.TabTitleFontName]
	local textHeight = CoD.MFTabManager.TabHeight
	local tabBgPad = 30
	local f1_local0 = {}
	local titleDimensions = GetTextDimensions( Engine.Localize( title ), textFont, textHeight )
	local titleWidth = titleDimensions[3]
	local tabContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = titleWidth + tabBgPad,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = textHeight
	} )
	self.tabHeaderPane:addElement( tabContainer )
	local leftRightPadding = 5
	local tabBGWidth = leftRightPadding * 2 + titleWidth
	tabContainer.tabBg = LUI.UIImage.new()
	tabContainer.tabBg:setLeftRight( false, false, -tabBGWidth / 2, tabBGWidth / 2 )
	tabContainer.tabBg:setTopBottom( true, true, 0, 2 )
	tabContainer.tabBg:setImage( RegisterMaterial( "white" ) )
	tabContainer.tabBg:setRGB( 0, 0, 0 )
	tabContainer.tabBg:setAlpha( 0 )
	if CoD.isMultiplayer and not ignoreTabBg then
		tabContainer:addElement( tabContainer.tabBg )
	end
	local titleBox = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -1,
		right = 1,
		topAnchor = false,
		bottomAnchor = false,
		top = -textHeight / 2,
		bottom = textHeight / 2,
		font = textFont,
		alpha = 0.25,
		red = 1,
		green = 1,
		blue = 1
	} )
	if self.selectionColor ~= nil then
		titleBox:registerAnimationState( "selected", {
			alpha = 1,
			red = self.selectionColor.r,
			green = self.selectionColor.g,
			blue = self.selectionColor.b
		} )
	else
		titleBox:registerAnimationState( "selected", {
			alpha = 1
		} )
	end
	titleBox:setText( Engine.Localize( title ) )
	titleBox.titleWidth = titleWidth + tabBgPad
	tabContainer:addElement( titleBox )
	tabContainer.titleBox = titleBox
	
	return tabContainer
end

CoD.MFTabManager.buttonLeftShoulder = function ( self, event )
	if self.m_enabled == false then
		return 
	elseif self ~= nil then
		if self.tabSelected == 1 then
			self.tabSelected = #self.tabsList
		else
			self.tabSelected = self.tabSelected - 1
		end
		Engine.PlaySound( CoD.MFTabManager.LeftShoulderActionSFX )
		CoD.MFTabManager.LoadTab( self, event.controller, self.tabSelected )
	end
end

CoD.MFTabManager.buttonRightShoulder = function ( self, event )
	if self.m_enabled == false then
		return 
	elseif self ~= nil then
		self.tabSelected = self.tabSelected % #self.tabsList + 1
		Engine.PlaySound( CoD.MFTabManager.RightShoulderActionSFX )
		CoD.MFTabManager.LoadTab( self, event.controller, self.tabSelected )
	end
end

CoD.MFTabManager.TabClicked = function ( self, event )
	if self.m_enabled == false then
		return 
	else
		self.tabSelected = event.tabIndex
		CoD.MFTabManager.LoadTab( self, event.controller, self.tabSelected )
	end
end

CoD.MFTabManager.Enable = function ( tabManager )
	tabManager.m_enabled = true
end

CoD.MFTabManager.Disable = function ( tabManager )
	tabManager.m_enabled = false
end

CoD.MFTabManager.new = function ( tabContentPane, defaultAnimationState, hidden, selectColor )
	local tabManager = LUI.UIElement.new( defaultAnimationState )
	tabManager.tabContentPane = tabContentPane
	tabManager.m_isHidden = hidden
	tabManager.m_enabled = true
	
	local leftTopButtonBar = LUI.UIElement.new()
	leftTopButtonBar:setLeftRight( true, false, 0, CoD.ButtonPrompt.Height )
	leftTopButtonBar:setTopBottom( true, false, 0, CoD.ButtonPrompt.Height )
	tabManager:addElement( leftTopButtonBar )
	tabManager.leftTopButtonBar = leftTopButtonBar
	
	local leftBumperButton = CoD.ButtonPrompt.new( "shoulderl", "", tabManager, "aar_button_prompt_shoulderl" )
	leftTopButtonBar:addElement( leftBumperButton )
	tabManager:registerEventHandler( "aar_button_prompt_shoulderl", CoD.MFTabManager.buttonLeftShoulder )
	
	local rightTopButtonBar = LUI.UIElement.new()
	rightTopButtonBar:setLeftRight( false, true, -CoD.ButtonPrompt.Height, 0 )
	rightTopButtonBar:setTopBottom( true, false, 0, CoD.ButtonPrompt.Height )
	tabManager:addElement( rightTopButtonBar )
	tabManager.rightTopButtonBar = rightTopButtonBar
	
	local rightBumperButton = CoD.ButtonPrompt.new( "shoulderr", "", tabManager, "aar_button_prompt_shoulderr" )
	rightTopButtonBar:addElement( rightBumperButton )
	tabManager:registerEventHandler( "aar_button_prompt_shoulderr", CoD.MFTabManager.buttonRightShoulder )
	if CoD.isPC then
		tabManager:registerEventHandler( "tab_clicked", CoD.MFTabManager.TabClicked )
	end
	if tabManager.m_isHidden == true then
		rightBumperButton:setAlpha( 0 )
		leftBumperButton:setAlpha( 0 )
	end
	local tabHeaderPane = LUI.UIHorizontalList.new()
	tabHeaderPane:setLeftRight( true, true, CoD.ButtonPrompt.Height + 5, -(CoD.ButtonPrompt.Height + 5) )
	tabHeaderPane:setTopBottom( true, true, 0, 0 )
	tabHeaderPane:setAlignment( LUI.Alignment.Left )
	tabManager:addElement( tabHeaderPane )
	tabManager.tabHeaderPane = tabHeaderPane
	
	tabManager.addTab = CoD.MFTabManager.AddTab
	tabManager.refreshTab = CoD.MFTabManager.Refresh
	tabManager.loadTab = CoD.MFTabManager.LoadTab
	tabManager.setTabSpacing = CoD.MFTabManager.SetTabSpacing
	tabManager.setTabAlignment = CoD.MFTabManager.SetTabAlignment
	tabManager.keepRightBumperAlignedToHeader = CoD.MFTabManager.KeepRightBumperAlignedToHeader
	tabManager.enable = CoD.MFTabManager.Enable
	tabManager.disable = CoD.MFTabManager.Disable
	tabManager.selectionColor = selectColor
	tabManager.tabSelected = 1
	return tabManager
end

CoD.MFTabManager.SetTabSpacing = function ( self, spacing )
	self.tabHeaderPane:registerAnimationState( "default", {
		spacing = spacing
	} )
	self.tabHeaderPane:animateToState( "default" )
end

CoD.MFTabManager.SetTabAlignment = function ( self, alignment )
	self.tabHeaderPane:registerAnimationState( "default", {
		alignment = alignment
	} )
	self.tabHeaderPane:animateToState( "default" )
end

CoD.MFTabManager.KeepRightBumperAlignedToHeader = function ( self, value )
	self.tabHeaderPane.rightBumperAlignedToHeader = value
end

CoD.MFTabManager.RefeshRightBumperAlignment = function ( self )
	if self.tabHeaderPane.rightBumperAlignedToHeader ~= nil and self.tabHeaderPane.rightBumperAlignedToHeader == true then
		local rightBumperWidthShift = 0
		for i = 1, #self.tabsList, 1 do
			local tab = self.tabsList[i]
			rightBumperWidthShift = rightBumperWidthShift + tab.tabHeader.titleBox.titleWidth
		end
		local rightTopButtonBarLeft = CoD.ButtonPrompt.Height + 5 + rightBumperWidthShift + 5
		local rightTopButtonBarRight = rightTopButtonBarLeft + CoD.ButtonPrompt.Height
		self.rightTopButtonBar:setLeftRight( true, false, rightTopButtonBarLeft, rightTopButtonBarRight )
	end
end

CoD.MFTabManager.AddTab = function ( self, controller, title, tabCreationFunction, ignoreTabBg )
	if self.tabsList == nil then
		self.tabsList = {}
	end
	if ignoreTabBg == nil then
		ignoreTabBg = false
	end
	local newTab = {
		tabCreatorFn = tabCreationFunction,
		tabHeader = AttachTab( self, title, ignoreTabBg )
	}
	table.insert( self.tabsList, newTab )
	newTab.tabIndex = table.getn( self.tabsList )
	if CoD.isPC then
		newTab.tabHeader:setHandleMouse( true )
		newTab.tabHeader:registerEventHandler( "mouseenter", CoD.MFTabManager.TabHeader_MouseEnter )
		newTab.tabHeader:registerEventHandler( "mouseleave", CoD.MFTabManager.TabHeader_MouseLeave )
		newTab.tabHeader:registerEventHandler( "leftmousedown", CoD.MFTabManager.TabHeader_LeftMouseDown )
		newTab.tabHeader.id = "MFTabHeader"
		newTab.tabHeader.index = #self.tabsList
	end
	CoD.MFTabManager.RefeshRightBumperAlignment( self )
	return newTab.tabIndex
end

CoD.MFTabManager.Refresh = function ( self, controller )
	CoD.MFTabManager.LoadTab( self, controller, self.tabSelected )
end

CoD.MFTabManager.LoadTab = function ( self, controller, tabSelected )
	self.tabSelected = tabSelected
	if self.tabCreated ~= nil then
		self.tabCreated:processEvent( {
			name = "close_tab"
		} )
		self.tabCreated:close()
	end
	collectgarbage( "collect" )
	collectgarbage( "collect" )
	self.tabCreated = self.tabsList[tabSelected]:tabCreatorFn( controller )
	if self.m_isHidden == nil or self.m_isHidden == false then
		self.tabContentPane:addElement( self.tabCreated )
	end
	if self.currentTabHeader ~= nil then
		self.currentTabHeader.isCurrentlySelected = false
		self.currentTabHeader.titleBox:animateToState( "default", 250 )
		self.currentTabHeader.tabBg:beginAnimation( "default", 250 )
		self.currentTabHeader.tabBg:setAlpha( 0 )
	end
	self.currentTabHeader = self.tabsList[tabSelected].tabHeader
	self.currentTabHeader.isCurrentlySelected = true
	self.currentTabHeader.titleBox:animateToState( "selected", 250 )
	self.currentTabHeader.tabBg:beginAnimation( "selected", 250 )
	self.currentTabHeader.tabBg:setAlpha( 1 )
	self:dispatchEventToParent( {
		name = "tab_changed",
		tabIndex = self.tabSelected
	} )
end

CoD.MFTabManager.TabHeader_MouseEnter = function ( tabHeader, event )
	tabHeader.titleBox:beginAnimation( "mouse_enter", 100 )
	tabHeader.titleBox:setAlpha( 1 )
	tabHeader.tabBg:beginAnimation( "mouse_enter", 250 )
	tabHeader.tabBg:setAlpha( 1 )
end

CoD.MFTabManager.TabHeader_MouseLeave = function ( tabHeader, event )
	if not tabHeader.isCurrentlySelected then
		tabHeader.titleBox:animateToState( "default", 100 )
		tabHeader.tabBg:beginAnimation( "default", 250 )
		tabHeader.tabBg:setAlpha( 0 )
	end
end

CoD.MFTabManager.TabHeader_LeftMouseDown = function ( tabHeader, event )
	if not tabHeader.isCurrentlySelected then
		tabHeader:dispatchEventToParent( {
			name = "tab_clicked",
			controller = event.controller,
			tabIndex = tabHeader.index
		} )
	end
end

