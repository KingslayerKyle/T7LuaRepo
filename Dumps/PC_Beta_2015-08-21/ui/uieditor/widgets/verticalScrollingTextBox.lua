local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.textBox:beginAnimation( "move", f1_arg2 or 0 )
	f1_arg0.currentYOffset = f1_arg1
	f1_arg0.updatingScroll = true
	f1_arg0.textBox:setTopBottom( true, false, -f1_arg0.currentYOffset, f1_arg0.textLineHeight - f1_arg0.currentYOffset )
	f1_arg0.updatingScroll = false
end

local f0_local1 = function ( f2_arg0 )
	f0_local0( f2_arg0, 0 )
end

local PostLoadFunc = function ( self, controller, menu )
	self.autoScrollStartDelay = 5000
	self.autoScrollSpeed = 0.4
	self.autoScrollEndDelay = 3000
	self.rightStickScrollSpeed = 0.7
	self.allowAutoScrolling = true
	self.allowRightStickScrolling = true
	local f3_local0 = 100
	local f3_local1 = 0
	local f3_local2 = 0
	local f3_local3 = true
	self.currentYOffset = 0
	self.scrollDistance = 0
	local f3_local4 = function ()
		f3_local2 = 0
		f3_local1 = 0
		f3_local3 = true
	end
	
	f3_local4()
	local f3_local5 = function ()
		local f5_local0, f5_local1 = self:getLocalSize()
		self.totalAreaHeight = f5_local1
		if not self.textBox.getTextHeightForWidth then
			self.totalTextHeight = f5_local1
		else
			self.totalTextHeight = self.textBox:getTextHeightForWidth( f5_local0 )
		end
		local f5_local2, f5_local3 = self.textBox:getLocalSize()
		self.textLineHeight = f5_local3
		self.scrollDistance = self.totalTextHeight - f5_local1
		f0_local1( self )
		f3_local4()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( self.textBox, "setText", f3_local5 )
	self:registerEventHandler( "menu_loaded", function ()
		f3_local5()
		if not self.updateTimer then
			local f6_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
			local f6_local1 = nil
			if f6_local0 then
				f6_local1 = Engine.GetModel( f6_local0, "Y" )
			end
			self.updateTimer = LUI.UITimer.newElementTimer( f3_local0, false, function ( f7_arg0 )
				local f7_local0 = 0
				if self.allowRightStickScrolling and f6_local1 then
					f7_local0 = -Engine.GetModelValue( f6_local1 ) * self.rightStickScrollSpeed / f7_arg0.timeElapsed * 1000
				end
				if math.abs( f7_local0 ) > 0.05 then
					f3_local1 = 0
					f3_local3 = true
				elseif f3_local3 then
					f7_local0 = 0
					f3_local1 = f3_local1 + f7_arg0.timeElapsed
					if self.autoScrollStartDelay <= f3_local1 then
						f3_local3 = false
					end
				end
				if not f3_local3 and 0 < self.autoScrollSpeed and self.allowAutoScrolling then
					f7_local0 = self.autoScrollSpeed / f7_arg0.timeElapsed * 1000
				end
				local f7_local1 = math.max( math.min( self.currentYOffset + f7_local0, self.scrollDistance ), 0 )
				local f7_local2 = f3_local0
				if self.scrollDistance <= f7_local1 and not f3_local3 and self.allowAutoScrolling then
					f3_local2 = f3_local2 + f7_arg0.timeElapsed
					if self.autoScrollEndDelay <= f3_local2 then
						f3_local4()
						f7_local1 = 0
						f7_local2 = 0
					end
				end
				f0_local0( self, f7_local1, f7_local2 )
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

