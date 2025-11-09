CoD.TabManager = {}
CoD.TabManager.DefaultSpacing = 20
CoD.TabManager.SpaceBetweenTabsAndButtons = 10
CoD.TabManager.ButtonLeftShoulder = function ( self, event )
	if self.m_enabled == false then
		return 
	elseif self ~= nil then
		if self.currentTab == 1 then
			self.currentTab = #self.tabs
		else
			self.currentTab = self.currentTab - 1
		end
	end
	Engine.PlaySound( "cac_safearea" )
	CoD.TabManager.SetCurrentTabName( self )
	self:dispatchEventToParent( {
		name = "tab_changed",
		controller = event.controller,
		tabIndex = self.currentTab,
		currentTabName = self.currentTabName
	} )
	self:dispatchEventToChildren( {
		name = "highlight_current_tab",
		currentTab = self.currentTab
	} )
end

CoD.TabManager.ButtonRightShoulder = function ( self, event )
	if self.m_enabled == false then
		return 
	elseif self ~= nil then
		if self.currentTab == #self.tabs then
			self.currentTab = 1
		else
			self.currentTab = self.currentTab + 1
		end
	end
	Engine.PlaySound( "cac_safearea" )
	CoD.TabManager.SetCurrentTabName( self )
	self:dispatchEventToParent( {
		name = "tab_changed",
		controller = event.controller,
		tabIndex = self.currentTab,
		currentTabName = self.currentTabName
	} )
	self:dispatchEventToChildren( {
		name = "highlight_current_tab",
		currentTab = self.currentTab
	} )
end

CoD.TabManager.SetCurrentTabName = function ( self )
	if self.currentTab and self.currentTab <= #self.tabs then
		self.currentTabName = self.tabs[self.currentTab].tabName
	end
end

CoD.TabManager.Enable = function ( self )
	self.m_enabled = true
end

CoD.TabManager.Disable = function ( self )
	self.m_enabled = false
end

CoD.TabManager.HighlightCurrentTab = function ( self, event )
	if self.tabIndex == event.currentTab then
		self.textElem:setRGB( self.tabManager.selectionColor.r, self.tabManager.selectionColor.g, self.tabManager.selectionColor.b )
		self.tabBg:setAlpha( 1 )
		self.tabEnd:setAlpha( 1 )
	else
		self.textElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
		self.tabBg:setAlpha( 0 )
		self.tabEnd:setAlpha( 0 )
	end
end

CoD.TabManager.ResetLayout = function ( self )
	self.list:removeAllChildren()
	if self.alignment == LUI.Alignment.Right then
		self.list:addElement( self.rightBumperButton )
		self.list:addSpacer( CoD.TabManager.SpaceBetweenTabsAndButtons )
		for index = #self.tabs, 1, -1 do
			self.list:addElement( self.tabs[index] )
			if index > 1 then
				self.list:addSpacer( self.spacing )
			end
		end
		self.list:addSpacer( CoD.TabManager.SpaceBetweenTabsAndButtons )
		self.list:addElement( self.leftBumperButton )
	else
		self.list:addElement( self.leftBumperButton )
		self.list:addSpacer( CoD.TabManager.SpaceBetweenTabsAndButtons )
		for index = 1, #self.tabs, 1 do
			self.list:addElement( self.tabs[index] )
			if index < #self.tabs then
				self.list:addSpacer( self.spacing )
			end
		end
		self.list:addSpacer( CoD.TabManager.SpaceBetweenTabsAndButtons )
		self.list:addElement( self.rightBumperButton )
	end
end

CoD.TabManager.AddTab = function ( self, tabText, tabName )
	if self.tabs == nil then
		self.tabs = {}
	end
	local font = CoD.fonts[self.fontAndTextSize]
	local textHeight = CoD.textSize[self.fontAndTextSize]
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( tabText, font, textHeight )
	local textWidth = textRight - textLeft
	local leftRightPadding = 5
	local topBottomPadding = 2
	local tabWidth = leftRightPadding * 2 + textWidth
	local tabHeight = topBottomPadding * 2 + textHeight
	local newTab = LUI.UIElement.new()
	newTab:setLeftRight( true, false, 0, tabWidth )
	newTab:setTopBottom( false, true, -tabHeight, 0 )
	local tabBg = LUI.UIImage.new()
	tabBg:setLeftRight( true, true, 0, 0 )
	tabBg:setTopBottom( true, true, -1, 4 )
	tabBg:setImage( RegisterMaterial( "menu_mp_tab" ) )
	newTab:addElement( tabBg )
	local tabEnd = LUI.UIImage.new()
	tabEnd:setLeftRight( false, true, -4, 0 )
	tabEnd:setTopBottom( true, true, -1, 4 )
	tabEnd:setImage( RegisterMaterial( "menu_mp_tab_end" ) )
	newTab:addElement( tabEnd )
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( false, false, -textHeight / 2, textHeight / 2 )
	textElem:setText( tabText )
	textElem:setFont( font )
	textElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	newTab:addElement( textElem )
	newTab.tabBg = tabBg
	newTab.tabEnd = tabEnd
	newTab.textElem = textElem
	newTab.tabManager = self
	table.insert( self.tabs, newTab )
	newTab.tabIndex = table.getn( self.tabs )
	newTab.tabName = tabName
	CoD.TabManager.ResetLayout( self )
	newTab:registerEventHandler( "highlight_current_tab", CoD.TabManager.HighlightCurrentTab )
	if CoD.useMouse then
		newTab:setHandleMouse( true )
		newTab:registerEventHandler( "leftmousedown", CoD.NullFunction )
		newTab:registerEventHandler( "leftmouseup", CoD.TabManager.Tab_LeftMouseUp )
		newTab:registerEventHandler( "mouseenter", CoD.TabManager.Tab_MouseEnter )
		newTab:registerEventHandler( "mouseleave", CoD.TabManager.Tab_MouseLeave )
	end
end

CoD.TabManager.SetCurrentTab = function ( self, tabNum )
	if tabNum then
		self.currentTab = tabNum
	end
	CoD.TabManager.SetCurrentTabName( self )
	self:dispatchEventToChildren( {
		name = "highlight_current_tab",
		currentTab = self.currentTab
	} )
	self:dispatchEventToParent( {
		name = "tab_changed",
		tabIndex = self.currentTab,
		currentTabName = self.currentTabName
	} )
end

CoD.TabManager.new = function ( defaultAnimationState, selectColor, alignment, spacing, fontAndTextSize, currentTab )
	local tabManager = LUI.UIElement.new( defaultAnimationState )
	tabManager.m_enabled = true
	tabManager.currentTab = 1
	tabManager.fontAndTextSize = "Default"
	if fontAndTextSize then
		tabmanager.fontAndTextSize = fontAndTextSize
	end
	tabManager.selectionColor = CoD.offWhite
	if selectColor then
		tabManager.selectionColor = selectColor
	end
	tabManager.list = LUI.UIHorizontalList.new()
	tabManager.list:setLeftRight( true, true, 0, 0 )
	tabManager.list:setTopBottom( true, true, 0, 0 )
	tabManager.alignment = LUI.Alignment.Center
	tabManager.spacing = CoD.TabManager.DefaultSpacing
	if alignment then
		tabManager.alignment = alignment
	end
	tabManager.list:setAlignment( tabManager.alignment )
	if spacing then
		tabManager.spacing = spacing
	end
	tabManager.leftBumperButton = CoD.ButtonPrompt.new( "shoulderl", "", tabManager, "button_prompt_shoulder_left" )
	tabManager:registerEventHandler( "button_prompt_shoulder_left", CoD.TabManager.ButtonLeftShoulder )
	tabManager.rightBumperButton = CoD.ButtonPrompt.new( "shoulderr", "", tabManager, "button_prompt_shoulder_right" )
	tabManager:registerEventHandler( "button_prompt_shoulder_right", CoD.TabManager.ButtonRightShoulder )
	if CoD.useMouse then
		tabManager:registerEventHandler( "tab_clicked", CoD.TabManager.TabClicked )
	end
	tabManager.addTab = CoD.TabManager.AddTab
	tabManager.setCurrentTab = CoD.TabManager.SetCurrentTab
	tabManager.enable = CoD.TabManager.Enable
	tabManager.disable = CoD.TabManager.Disable
	if currentTab then
		tabManager.currentTab = currentTab
	end
	tabManager:addElement( tabManager.list )
	return tabManager
end

CoD.TabManager.TabClicked = function ( tabManager, event )
	if tabManager.m_enabled == false then
		return 
	else
		tabManager.currentTab = event.tabIndex
		CoD.TabManager.SetCurrentTab( tabManager, event.tabIndex )
	end
end

CoD.TabManager.Tab_LeftMouseUp = function ( tab, event )
	if tab.tabManager.currentTab ~= tab.tabIndex then
		tab:dispatchEventToParent( {
			name = "tab_clicked",
			controller = event.controller,
			tabIndex = tab.tabIndex
		} )
	end
end

CoD.TabManager.Tab_MouseEnter = function ( tab, event )
	if tab.tabManager.currentTab ~= tab.tabIndex then
		tab.textElem:setRGB( tab.tabManager.selectionColor.r, tab.tabManager.selectionColor.g, tab.tabManager.selectionColor.b )
	end
end

CoD.TabManager.Tab_MouseLeave = function ( tab, event )
	if tab.tabManager.currentTab ~= tab.tabIndex then
		tab.textElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	end
end

