require( "ui.uieditor.widgets.HUD.Console.ConsoleEntry" )

local CompleteAllAnimations = function ( self )
	self.ConsoleEntry:completeAnimation()
	self.ConsoleEntry.Text0:completeAnimation()
	self.ConsoleEntry.Icon0:completeAnimation()
	self.ConsoleEntry.Text1:completeAnimation()
	self.ConsoleEntry.Icon1:completeAnimation()
end

local ShowConsoleEntry = function ( self, event, id )
	self.id = id
	local padding = 4
	self:completeAllAnimations()
	self.ConsoleEntry.Text0.Text:setAlpha( 0 )
	self.ConsoleEntry.Icon0.Icon:setAlpha( 0 )
	self.ConsoleEntry.Text1.Text:setAlpha( 0 )
	self.ConsoleEntry.Icon1.Icon:setAlpha( 0 )
	local left, top, right, bottom = self:getLocalRect()
	local height = bottom - top
	self:setTopBottom( false, true, -height, 0 )
	local widgetWidth = 0
	if event.icon0 then
		local iconLeft, iconTop, iconRight, iconBottom = self.ConsoleEntry.Icon0:getLocalRect()
		local iconHeight = iconBottom - iconTop
		local aspect = event.iconWidth
		local adjustedIconWidth = iconHeight * aspect
		self.ConsoleEntry.Icon0.Icon:setImage( RegisterMaterial( event.icon0 ) )
		self.ConsoleEntry.Icon0:setLeftRight( true, false, left, left + adjustedIconWidth )
		left = left + adjustedIconWidth + padding
		self.ConsoleEntry.Icon0:playClip( "FadeIn" )
		self.icon0Visible = true
	end
	if event.text0 then
		self.ConsoleEntry.Text0.Text:setText( event.text0 )
		local textColor = CoD.ConsoleColors[CoD.DefaultConsoleColorIndex]
		if event.text0Color then
			textColor = CoD.ConsoleColors[event.text0Color + 1]
		end
		self.ConsoleEntry.Text0.Text:setRGB( textColor.r, textColor.g, textColor.b )
		local textWidth = self.ConsoleEntry.Text0.Text:getTextWidth()
		self.ConsoleEntry.Text0:setLeftRight( true, false, left, left + textWidth )
		left = left + textWidth + padding
		self.ConsoleEntry.Text0:playClip( "FadeIn" )
		self.text0Visible = true
	else
		self.ConsoleEntry.Text0.Text:setText( "" )
	end
	if event.icon or event.icon1 then
		local icon = event.icon
		if icon == nil then
			icon = event.icon1
		end
		local iconLeft, iconRight, iconBottom, iconBottom = self.ConsoleEntry.Icon1:getLocalRect()
		local iconHeight = iconBottom - iconRight
		local aspect = event.iconWidth
		local adjustedIconWidth = iconHeight * aspect
		self.ConsoleEntry.Icon1.Icon:setImage( RegisterMaterial( icon ) )
		self.ConsoleEntry.Icon1:setLeftRight( true, false, left, left + adjustedIconWidth )
		left = left + adjustedIconWidth + padding
		self.ConsoleEntry.Icon1:playClip( "FadeIn" )
		self.icon1Visible = true
	end
	if event.text1 then
		self.ConsoleEntry.Text1.Text:setText( event.text1 )
		local textWidth = self.ConsoleEntry.Text1.Text:getTextWidth()
		self.ConsoleEntry.Text1:setLeftRight( true, false, left, left + textWidth )
		left = left + textWidth + padding
		local textColor = CoD.ConsoleColors[CoD.DefaultConsoleColorIndex]
		if event.text1Color then
			textColor = CoD.ConsoleColors[event.text1Color + 1]
		end
		self.ConsoleEntry.Text1.Text:setRGB( textColor.r, textColor.g, textColor.b )
		self.ConsoleEntry.Text1:playClip( "FadeIn" )
		self.text1Visible = true
	else
		self.ConsoleEntry.Text1.Text:setText( "" )
	end
	self.ConsoleEntry.Panel:setLeftRight( true, false, 0, left )
	self.ConsoleEntry:playClip( "FadeIn" )
	self.timer = LUI.UITimer.new( 5000, "hide_console_entry", true, self )
	self:addElement( self.timer )
end

local MoveConsoleEntry = function ( self, moveScale )
	self:completeAllAnimations()
	local left, top, right, bottom = self.ConsoleEntry:getLocalRect()
	local moveAmount = top - bottom
	local totalMoveAmount = moveAmount * moveScale
	self:beginAnimation( "move_console_event", 100 )
	self:setTopBottom( false, true, top + totalMoveAmount, bottom + totalMoveAmount )
end

local HideConsoleEntry = function ( self )
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

local ForceHideConsoleEntry = function ( self )
	self.forcedToHide = true
	self.timer:processNow()
end

local PostLoadFunc = function ( self, event )
	self.id = -1
	self.forcedToHide = false
	self.text0Visible = false
	self.icon0Visible = false
	self.icon1Visible = false
	self.text1Visible = false
	self:registerEventHandler( "hide_console_entry", HideConsoleEntry )
	self.completeAllAnimations = CompleteAllAnimations
	self.showConsoleEntry = ShowConsoleEntry
	self.moveConsoleEntry = MoveConsoleEntry
	self.hideConsoleEntry = HideConsoleEntry
	self.forceHideConsoleEntry = ForceHideConsoleEntry
end

CoD.ConsoleEntryContainer = InheritFrom( LUI.UIElement )
CoD.ConsoleEntryContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ConsoleEntryContainer )
	self.id = "ConsoleEntryContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 680 )
	self:setTopBottom( true, false, 0, 16 )
	
	local ConsoleEntry = CoD.ConsoleEntry.new( menu, controller )
	ConsoleEntry:setLeftRight( true, false, 0, 680 )
	ConsoleEntry:setTopBottom( false, true, -14, 0 )
	ConsoleEntry:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry )
	self.ConsoleEntry = ConsoleEntry
	
	self.close = function ( self )
		self.ConsoleEntry:close()
		CoD.ConsoleEntryContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

