local setTextTop = function ( self, position, time )
	self.textBox:beginAnimation( "move", time or 0 )
	self.currentYOffset = position
	self.updatingScroll = true
	self.textBox:setTopBottom( true, false, -self.currentYOffset, self.textLineHeight - self.currentYOffset )
	self.updatingScroll = false
end

local resetTextPosition = function ( self )
	setTextTop( self, 0 )
end

local PostLoadFunc = function ( self, controller, menu )
	self.autoScrollStartDelay = 5000
	self.autoScrollSpeed = 0.4
	self.autoScrollEndDelay = 3000
	self.rightStickScrollSpeed = 0.7
	self.allowAutoScrolling = true
	self.allowRightStickScrolling = true
	local updateSpeed = 100
	local lastStickUpdate = 0
	local autoMoveAtEndTime = 0
	local usingStick = true
	self.currentYOffset = 0
	self.scrollDistance = 0
	local resetMovementData = function ()
		autoMoveAtEndTime = 0
		lastStickUpdate = 0
		usingStick = true
	end
	
	resetMovementData()
	local resetText = function ()
		local ourWidth, ourHeight = self:getLocalSize()
		self.totalAreaHeight = ourHeight
		if not self.textBox.getTextHeightForWidth then
			self.totalTextHeight = ourHeight
		else
			self.totalTextHeight = self.textBox:getTextHeightForWidth( ourWidth )
		end
		local textLineWidth, textLineHeight = self.textBox:getLocalSize()
		self.textLineHeight = textLineHeight
		self.scrollDistance = self.totalTextHeight - ourHeight
		resetTextPosition( self )
		resetMovementData()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( self.textBox, "setText", resetText )
	self:registerEventHandler( "menu_loaded", function ()
		resetText()
		if not self.updateTimer then
			local rightStickModel = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
			local rightStickYModel = nil
			if rightStickModel then
				rightStickYModel = Engine.GetModel( rightStickModel, "Y" )
			end
			self.updateTimer = LUI.UITimer.newElementTimer( updateSpeed, false, function ( event )
				local moveY = 0
				if self.allowRightStickScrolling and rightStickYModel then
					moveY = -Engine.GetModelValue( rightStickYModel ) * self.rightStickScrollSpeed / event.timeElapsed * 1000
				end
				if math.abs( moveY ) > 0.05 then
					lastStickUpdate = 0
					usingStick = true
				elseif usingStick then
					moveY = 0
					lastStickUpdate = lastStickUpdate + event.timeElapsed
					if self.autoScrollStartDelay <= lastStickUpdate then
						usingStick = false
					end
				end
				if not usingStick and 0 < self.autoScrollSpeed and self.allowAutoScrolling then
					moveY = self.autoScrollSpeed / event.timeElapsed * 1000
				end
				local offset = math.max( math.min( self.currentYOffset + moveY, self.scrollDistance ), 0 )
				local moveSpeed = updateSpeed
				if self.scrollDistance <= offset and not usingStick and self.allowAutoScrolling then
					autoMoveAtEndTime = autoMoveAtEndTime + event.timeElapsed
					if self.autoScrollEndDelay <= autoMoveAtEndTime then
						resetMovementData()
						offset = 0
						moveSpeed = 0
					end
				end
				setTextTop( self, offset, moveSpeed )
			end )
			self:addElement( self.updateTimer )
		end
	end )
end

CoD.verticalScrollingTextBox = InheritFrom( LUI.UIElement )
CoD.verticalScrollingTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.verticalScrollingTextBox )
	self.id = "verticalScrollingTextBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 200 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, true, 0, 0 )
	textBox:setTopBottom( true, false, 0, 20 )
	textBox:setText( Engine.Localize( "MENU_NEW" ) )
	textBox:setTTF( "fonts/default.ttf" )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textBox )
	self.textBox = textBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

