CoD.ConsoleUtility = {}
CoD.ConsoleUtility.UpdateConsole = function ( self )
	local activeCount = 0
	for i = 0, self.maxElementIndex, 1 do
		if self.lines[i].active then
			self.lines[i].position = self.lines[i].position + 1
			self.lines[i].element:moveConsoleEntry( self.lines[i].position )
			activeCount = activeCount + 1
		end
	end
	local perControllerModel = Engine.GetModelForController( self.controller )
	local consoleCountModel = Engine.GetModel( self.consoleModel, "currentIndex" )
	local currentIndex = Engine.GetModelValue( consoleCountModel )
	if self.maxElementIndex < activeCount then
		self.lines[currentIndex].element:forceHideConsoleEntry()
	end
	local controller = self.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
		if CoD.IsShoutcaster( controller ) and not CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_killfeed" ) then
			
		else
			self.lines[currentIndex].element:showConsoleEntry( currentIndex )
			self.lines[currentIndex].active = true
		end
	end
	Engine.SetModelValue( consoleCountModel, (currentIndex + 1) % (self.maxElementIndex + 1) )
	return true
end

CoD.ConsoleUtility.ConsoleNotificationComplete = function ( self, event )
	self.lines[event.id].active = false
	self.lines[event.id].position = 0
end

CoD.ConsoleUtility.Init = function ( self, controller, modelName, maxElements )
	self.controller = controller
	local consoleModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems." .. modelName )
	Engine.SetModelValue( Engine.CreateModel( consoleModel, "currentIndex" ), 0 )
	self.currentIndex = 0
	self.maxElementIndex = maxElements or 6
	self.consoleModel = consoleModel
	self.lines = {}
	for i = 0, self.maxElementIndex, 1 do
		self.lines[i] = {}
		self.lines[i].active = false
		self.lines[i].name = "ConsoleEntry" .. i
		self.lines[i].element = self[self.lines[i].name]
		self.lines[i].position = 0
	end
	self:registerEventHandler( "console_notification_complete", CoD.ConsoleUtility.ConsoleNotificationComplete )
	self:subscribeToModel( consoleModel, function ( model )
		CoD.ConsoleUtility.UpdateConsole( self )
	end, false )
end

CoD.ConsoleUtility.CompleteAllAnimations = function ( self )
	self.ConsoleEntry:completeAnimation()
	self.ConsoleEntry.Text0:completeAnimation()
	self.ConsoleEntry.Icon0:completeAnimation()
	self.ConsoleEntry.Text1:completeAnimation()
	self.ConsoleEntry.Icon1:completeAnimation()
end

CoD.ConsoleUtility.ShowConsoleEntry = function ( self, id )
	self.id = id
	local padding = 4
	self:completeAllAnimations()
	self:setAlpha( 1 )
	self.ConsoleEntry.Text0.Text:setAlpha( 0 )
	self.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
	self.ConsoleEntry.Text1.Text:setAlpha( 0 )
	self.ConsoleEntry.Icon1.Icon:setAlpha( 0 )
	local left, top, right, bottom = self:getLocalRect()
	local height = bottom - top
	self:setTopBottom( false, true, -height, 0 )
	local widgetWidth = 0
	left = left + padding / 2
	local IsValueNonEmptyString = function ( modelValue )
		local f7_local0
		if modelValue == nil or modelValue == "" then
			f7_local0 = false
		else
			f7_local0 = true
		end
		return f7_local0
	end
	
	local selfModel = self:getModel()
	self.icon0Visible = IsValueNonEmptyString( Engine.GetModelValue( Engine.GetModel( selfModel, "icon0" ) ) )
	self.text0Visible = IsValueNonEmptyString( Engine.GetModelValue( Engine.GetModel( selfModel, "text0" ) ) )
	self.icon1Visible = IsValueNonEmptyString( Engine.GetModelValue( Engine.GetModel( selfModel, "icon1" ) ) )
	self.text1Visible = IsValueNonEmptyString( Engine.GetModelValue( Engine.GetModel( selfModel, "text1" ) ) )
	if self.icon0Visible then
		local iconLeft, iconTop, iconRight, iconBottom = self.ConsoleEntry.Icon0:getLocalRect()
		local iconHeight = iconBottom - iconTop
		local aspect = Engine.GetModelValue( Engine.GetModel( selfModel, "iconWidth" ) )
		local adjustedIconWidth = iconHeight * aspect
		if adjustedIconWidth < 0 then
			self.ConsoleEntry.Icon0:setLeftRight( true, false, left, left - adjustedIconWidth )
		else
			self.ConsoleEntry.Icon0:setLeftRight( true, false, left + adjustedIconWidth, left )
		end
		left = left + math.abs( adjustedIconWidth ) + padding
		self.ConsoleEntry.Icon0:playClip( "FadeIn" )
	end
	if self.text0Visible then
		local textWidth = self.ConsoleEntry.Text0.Text:getTextWidth()
		self.ConsoleEntry.Text0:setLeftRight( true, false, left, left + textWidth )
		left = left + textWidth + padding
		self.ConsoleEntry.Text0:playClip( "FadeIn" )
	end
	if self.icon1Visible then
		local iconLeft, iconTop, iconRight, iconBottom = self.ConsoleEntry.Icon1:getLocalRect()
		local iconHeight = iconBottom - iconTop
		local aspect = Engine.GetModelValue( Engine.GetModel( selfModel, "iconWidth" ) )
		local adjustedIconWidth = iconHeight * aspect
		if adjustedIconWidth < 0 then
			self.ConsoleEntry.Icon1:setLeftRight( true, false, left - adjustedIconWidth, left )
		else
			self.ConsoleEntry.Icon1:setLeftRight( true, false, left, left + adjustedIconWidth )
		end
		left = left + math.abs( adjustedIconWidth ) + padding
		self.ConsoleEntry.Icon1:playClip( "FadeIn" )
	end
	if self.text1Visible then
		local textWidth = self.ConsoleEntry.Text1.Text:getTextWidth()
		self.ConsoleEntry.Text1:setLeftRight( true, false, left, left + textWidth )
		left = left + textWidth + padding
		self.ConsoleEntry.Text1:playClip( "FadeIn" )
	end
	left = left - padding / 2
	self.ConsoleEntry.Panel:setLeftRight( true, false, self.panelStartLeft, self.panelStartRight + left )
	if self.alignment == Enum.LUIAlignment.LUI_ALIGNMENT_CENTER then
		self.ConsoleEntry:setLeftRight( false, false, -left / 2, left / 2 )
	end
	self.ConsoleEntry:playClip( "FadeIn" )
	self.timer = LUI.UITimer.new( 5000, "hide_console_entry", true, self )
	self:addElement( self.timer )
end

CoD.ConsoleUtility.MoveConsoleEntry = function ( self, moveScale )
	self:completeAllAnimations()
	local left, top, right, bottom = self.ConsoleEntry:getLocalRect()
	local moveAmount = top - bottom
	local totalMoveAmount = moveAmount * moveScale
	self:beginAnimation( "move_console_event", 100 )
	if moveScale >= 5 then
		local f8_local0 = self
		local f8_local1 = self.setAlpha
		local f8_local2
		if moveScale == 5 then
			f8_local2 = 0.6
			if not f8_local2 then
			
			else
				f8_local1( f8_local0, f8_local2 )
			end
		end
		f8_local2 = 0.4
	end
	self:setTopBottom( false, true, top + totalMoveAmount, bottom + totalMoveAmount )
end

CoD.ConsoleUtility.HideConsoleEntry = function ( self )
	self:completeAllAnimations()
	if self.forcedToHide then
		self.ConsoleEntry.Text0.Text:setAlpha( 0 )
		self.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
		self.ConsoleEntry.Text1.Text:setAlpha( 0 )
		self.ConsoleEntry.Icon1.Icon:setAlpha( 0 )
		self.ConsoleEntry.Panel:setAlpha( 0 )
	else
		if self.text0Visible then
			self.ConsoleEntry.Text0:playClip( "FadeOut" )
		end
		if self.icon0Visible then
			self.ConsoleEntry.Icon0:playClip( "FadeOut" )
		end
		if self.icon1Visible then
			self.ConsoleEntry.Icon1:playClip( "FadeOut" )
		end
		if self.text1Visible then
			self.ConsoleEntry.Text1:playClip( "FadeOut" )
		end
		self.ConsoleEntry:playClip( "FadeOut" )
	end
	self.text0Visible = false
	self.icon0Visible = false
	self.icon1Visible = false
	self.text1Visible = false
	self:dispatchEventToParent( {
		name = "console_notification_complete",
		id = self.id
	} )
	self.forcedToHide = false
end

CoD.ConsoleUtility.ForceHideConsoleEntry = function ( self )
	self.forcedToHide = true
	self.timer:processNow()
end

CoD.ConsoleUtility.EntryInit = function ( self, controller, alignment )
	self.id = -1
	self.forcedToHide = false
	self.text0Visible = false
	self.icon0Visible = false
	self.icon1Visible = false
	self.text1Visible = false
	self.alignment = alignment
	self:registerEventHandler( "hide_console_entry", CoD.ConsoleUtility.HideConsoleEntry )
	self.completeAllAnimations = CoD.ConsoleUtility.CompleteAllAnimations
	local _, _, panelLeft, panelRight = self.ConsoleEntry.Panel:getLocalLeftRight()
	self.panelStartLeft = panelLeft
	self.panelStartRight = panelRight
	self.showConsoleEntry = CoD.ConsoleUtility.ShowConsoleEntry
	self.moveConsoleEntry = CoD.ConsoleUtility.MoveConsoleEntry
	self.hideConsoleEntry = CoD.ConsoleUtility.HideConsoleEntry
	self.forceHideConsoleEntry = CoD.ConsoleUtility.ForceHideConsoleEntry
end

