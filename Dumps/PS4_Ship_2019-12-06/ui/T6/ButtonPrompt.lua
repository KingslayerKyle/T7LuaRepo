require( "ui.T6.CoD9Button" )

CoD.ButtonPrompt = {}
CoD.ButtonPrompt.FontName = "ExtraSmall"
CoD.ButtonPrompt.Height = 25
CoD.ButtonPrompt.TextHeight = CoD.textSize[CoD.ButtonPrompt.FontName]
CoD.ButtonPrompt.ButtonToTextSpacing = 3
CoD.ButtonPrompt.TextColor = {
	r = 0.43,
	g = 0.49,
	b = 0.53
}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.disabled = nil
	f1_arg0:animateToState( "enabled" )
	f1_arg0:dispatchEventToChildren( f1_arg1 )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.disabled = true
	f2_arg0:animateToState( "disabled" )
	f2_arg0:dispatchEventToChildren( f2_arg1 )
end

CoD.ButtonPrompt.Enable = function ( f3_arg0 )
	if f3_arg0.disabled == true then
		f3_arg0:processEvent( {
			name = "enable"
		} )
		f3_arg0.disabled = nil
	end
end

CoD.ButtonPrompt.Disable = function ( f4_arg0 )
	if f4_arg0.disabled == nil then
		f4_arg0:processEvent( {
			name = "disable"
		} )
		f4_arg0.disabled = true
	end
end

CoD.ButtonPrompt.SetupElement = function ( f5_arg0 )
	f5_arg0:registerEventHandler( "enable", f0_local0 )
	f5_arg0:registerEventHandler( "disable", f0_local1 )
end

CoD.ButtonPrompt.new = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4, f6_arg5, f6_arg6, f6_arg7, f6_arg8 )
	local f6_local0 = CoD.ButtonPrompt.Height
	local f6_local1 = CoD.ButtonPrompt.TextHeight
	local f6_local2 = CoD.fonts[CoD.ButtonPrompt.FontName]
	if LUI.DEVHideButtonPrompts then
		f6_arg1 = ""
	end
	local self = LUI.UIElement.new()
	self:setTopBottom( false, false, -f6_local0 / 2, f6_local0 / 2 )
	self.button = f6_arg0
	self.enable = CoD.ButtonPrompt.Enable
	self.disable = CoD.ButtonPrompt.Disable
	self.setNew = CoD.ButtonPrompt.SetNew
	self.setText = CoD.ButtonPrompt.SetText
	CoD.ButtonPrompt.SetupElement( self )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 1
	} )
	if f6_arg2 ~= nil and f6_arg3 ~= nil then
		self:registerEventHandler( "gamepad_button", function ( self, event )
			if not self.disabled and event.down == true then
				if event.button == f6_arg0 and (f6_arg5 == nil or event.qualifier == f6_arg5) then
					f6_arg2:processEvent( {
						name = f6_arg3,
						controller = event.controller
					} )
					return true
				elseif CoD.isPC and event.button == "key_shortcut" and event.key == f6_arg8 then
					f6_arg2:processEvent( {
						name = f6_arg3,
						controller = event.controller
					} )
					return true
				end
			end
		end )
	end
	local f6_local4 = LUI.UIText.new()
	f6_local4:setTopBottom( false, false, -f6_local1 / 2, f6_local1 / 2 )
	f6_local4:setFont( f6_local2 )
	f6_local4:setAlpha( 1 )
	f6_local4:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f6_local4:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	f6_local4:setRGB( CoD.ButtonPrompt.TextColor.r, CoD.ButtonPrompt.TextColor.g, CoD.ButtonPrompt.TextColor.b )
	CoD.ButtonPrompt.SetupElement( f6_local4 )
	self:addElement( f6_local4 )
	f6_local4:setText( f6_arg1 )
	self.label = f6_local4
	self.labelText = f6_arg1
	local f6_local5 = nil
	if not f6_arg4 then
		f6_local5 = LUI.UIText.new()
		f6_local5:setTopBottom( false, false, -f6_local0 / 2, f6_local0 / 2 )
		f6_local5:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		f6_local5:setFont( f6_local2 )
		f6_local5:setAlpha( 1 )
		if f6_local5 ~= nil then
			local f6_local6 = CoD.buttonStrings[f6_arg0]
			if CoD.isPC then
				if f6_arg8 ~= nil and f6_arg8 ~= "" then
					f6_local5.shortcutKey = f6_arg8
				end
				if f6_arg7 ~= nil then
					f6_local5.buttonStringShortCut = f6_arg7
				else
					f6_local5.buttonStringShortCut = f6_arg0
				end
				if not Engine.LastInput_Gamepad() then
					if f6_local5.shortcutKey then
						f6_local6 = f6_arg8
					elseif string.sub( CoD.buttonStringsShortCut[f6_local5.buttonStringShortCut], 1, 1 ) == "+" then
						f6_local6 = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[f6_local5.buttonStringShortCut], 0 )
					elseif string.sub( CoD.buttonStringsShortCut[f6_local5.buttonStringShortCut], 1, 1 ) == "@" then
						f6_local6 = Engine.Localize( string.sub( CoD.buttonStringsShortCut[f6_local5.buttonStringShortCut], 2 ) )
					else
						f6_local6 = CoD.buttonStringsShortCut[f6_local5.buttonStringShortCut]
					end
				end
			end
			f6_local5:setText( f6_local6 )
			self.prompt = f6_local6
			f6_local5:registerAnimationState( "enabled", {
				alpha = 1
			} )
			f6_local5:registerAnimationState( "disabled", {
				alpha = 0.25
			} )
			CoD.ButtonPrompt.SetupElement( f6_local5 )
			self.buttonImage = f6_local5
			self:addElement( f6_local5 )
		end
	end
	if CoD.useMouse and (f6_local5 ~= nil or f6_arg1 ~= "") then
		local f6_local6 = LUI.UIButton.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		self:addElement( f6_local6 )
		if f6_arg2 ~= nil and f6_arg3 ~= nil then
			f6_local6:registerEventHandler( "button_action", function ( element, event )
				f6_arg2:processEvent( {
					name = f6_arg3,
					controller = event.controller
				} )
				return true
			end )
		end
		f6_local6:setHandleMouseMove( false )
		self:setHandleMouseMove( true )
		self:registerEventHandler( "mouseenter", CoD.ButtonPrompt.MouseEnter )
		self:registerEventHandler( "mouseleave", CoD.ButtonPrompt.MouseLeave )
		self:registerEventHandler( "input_source_changed", CoD.ButtonPrompt.InputSourceChanged )
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( self )
	return self
end

CoD.ButtonPrompt.addUIEditorButtonPrompt = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = CoD.ButtonPrompt.Height
	local f9_local1 = CoD.ButtonPrompt.TextHeight
	local f9_local2 = CoD.fonts[CoD.ButtonPrompt.FontName]
	if LUI.DEVHideButtonPrompts then
		f9_arg2 = ""
	end
	if CoD.isPC then
		f9_local1 = 18
	end
	local self = LUI.UIElement.new()
	self:setTopBottom( false, false, -f9_local0 / 2, f9_local0 / 2 )
	self.button = f9_arg1
	self.enable = CoD.ButtonPrompt.Enable
	self.disable = CoD.ButtonPrompt.Disable
	self.setNew = CoD.ButtonPrompt.SetNew
	self.setText = CoD.ButtonPrompt.SetText
	CoD.ButtonPrompt.SetupElement( self )
	self:registerAnimationState( "enabled", {
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 1
	} )
	local f9_local4 = LUI.UIText.new()
	f9_local4:setTopBottom( false, false, -f9_local1 / 2, f9_local1 / 2 )
	f9_local4:setFont( f9_local2 )
	f9_local4:setAlpha( 1 )
	f9_local4:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f9_local4:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	f9_local4:setAlignment( LUI.Alignment.Left )
	CoD.ButtonPrompt.SetupElement( f9_local4 )
	self:addElement( f9_local4 )
	f9_local4:setText( f9_arg2 )
	self.label = f9_local4
	self.labelText = f9_arg2
	local f9_local5 = nil
	f9_local5 = LUI.UIText.new()
	f9_local5:setTopBottom( false, false, -f9_local0 / 2, f9_local0 / 2 )
	f9_local5:setFont( f9_local2 )
	f9_local5:setAlpha( 1 )
	local f9_local6 = CoD.buttonStrings[f9_arg1]
	if CoD.isPC then
		if f9_arg3 ~= nil and f9_arg3 ~= "" then
			f9_local5.shortcutKey = f9_arg3
		end
		f9_local5.buttonStringShortCut = f9_arg1
		if not Engine.LastInput_Gamepad() then
			if f9_local5.shortcutKey then
				f9_local6 = f9_arg3
			elseif string.sub( CoD.buttonStringsShortCut[f9_local5.buttonStringShortCut], 1, 1 ) == "+" then
				f9_local6 = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[f9_local5.buttonStringShortCut], 0 )
			elseif string.sub( CoD.buttonStringsShortCut[f9_local5.buttonStringShortCut], 1, 1 ) == "@" then
				f9_local6 = Engine.Localize( string.sub( CoD.buttonStringsShortCut[f9_local5.buttonStringShortCut], 2 ) )
			else
				f9_local6 = CoD.buttonStringsShortCut[f9_local5.buttonStringShortCut]
			end
		end
	end
	f9_local5:setText( f9_local6 )
	self.prompt = f9_local6
	f9_local5:registerAnimationState( "enabled", {
		alpha = 1
	} )
	f9_local5:registerAnimationState( "disabled", {
		alpha = 0.25
	} )
	CoD.ButtonPrompt.SetupElement( f9_local5 )
	self.buttonImage = f9_local5
	self:addElement( f9_local5 )
	if CoD.useMouse and (f9_local5 ~= nil or f9_arg2 ~= "") then
		local f9_local7 = LUI.UIButton.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		self:addElement( f9_local7 )
		if f9_arg0 ~= nil then
			f9_local7:registerEventHandler( "button_action", function ( element, event )
				f9_arg0:processEvent( {
					name = "gamepad_button",
					controller = event.controller,
					button = f9_arg1,
					down = true
				} )
				return true
			end )
		end
		f9_local7:setHandleMouseMove( false )
		self:setHandleMouseMove( true )
		self:registerEventHandler( "input_source_changed", CoD.ButtonPrompt.InputSourceChanged )
		self.clipsPerState = {
			DefaultState = {
				DefaultClip = function ()
					self:setupElementClipCounter( 1 )
					f9_local4:completeAnimation()
					f9_local4:setRGB( 1, 1, 1 )
					self.clipFinished( f9_local4, {} )
				end,
				Over = function ()
					self:setupElementClipCounter( 1 )
					f9_local4:completeAnimation()
					f9_local4:setRGB( 0.87, 0.37, 0 )
					self.clipFinished( f9_local4, {} )
				end
			}
		}
		self:setState( "DefaultState" )
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( self )
	self.SetText = CoD.ButtonPrompt.SetText
	return self
end

CoD.ButtonPrompt.ResizeButtonPrompt = function ( f13_arg0 )
	local f13_local0 = CoD.ButtonPrompt.ButtonToTextSpacing
	local f13_local1 = CoD.ButtonPrompt.Height
	local f13_local2 = CoD.ButtonPrompt.TextHeight
	local f13_local3 = CoD.fonts[CoD.ButtonPrompt.FontName]
	if f13_arg0.prompt ~= nil then
		local f13_local4 = nil
		if string.sub( f13_arg0.prompt, 1, 2 ) == "^B" and not f13_arg0.forceMeasureButtonWidth then
			f13_local4 = CoD.ButtonPrompt.Height
		else
			local f13_local5 = {}
			f13_local5 = GetTextDimensions( f13_arg0.prompt, f13_local3, f13_local1 )
			f13_local4 = f13_local5[3] - f13_local5[1]
		end
		f13_arg0.buttonImage:setLeftRight( true, false, 0, f13_local4 )
		f13_local0 = f13_local0 + f13_local4
	end
	if CoD.isPC and not Engine.LastInput_Gamepad() then
		f13_local0 = f13_local0 + 4
		local f13_local4 = {}
		f13_local4 = GetTextDimensions( f13_arg0.labelText, f13_local3, f13_local2 )
		local f13_local5 = f13_local4[3] - f13_local4[1]
		f13_arg0.label:setLeftRight( true, false, f13_local0, f13_local0 + f13_local5 )
		f13_local0 = f13_local0 + f13_local5
	else
		local f13_local4 = {}
		f13_local4 = GetTextDimensions( f13_arg0.labelText, f13_local3, f13_local2 )
		local f13_local5 = f13_local4[3] - f13_local4[1]
		f13_arg0.label:setLeftRight( false, true, -f13_local5, 0 )
		f13_local0 = f13_local0 + f13_local5
	end
	if f13_arg0.newIcon then
		local f13_local4 = 5
		f13_local0 = f13_local0 + f13_local4
		f13_arg0.newIcon:setLeftRight( true, false, f13_local0, f13_local0 + CoD.CACUtility.ButtonGridNewImageWidth )
		f13_arg0.label:setLeftRight( false, true, -labelTextWidth - CoD.CACUtility.ButtonGridNewImageRightAlignWidth - f13_local4, -CoD.CACUtility.ButtonGridNewImageRightAlignWidth - f13_local4 )
		f13_local0 = f13_local0 + CoD.CACUtility.ButtonGridNewImageRightAlignWidth
	end
	if CoD.isPC and not Engine.LastInput_Gamepad() then
		f13_local0 = f13_local0 + 8
	end
	f13_arg0:setLeftRight( true, false, 0, f13_local0 )
end

CoD.ButtonPrompt.InputSourceChanged = function ( f14_arg0, f14_arg1 )
	if f14_arg0.buttonImage == nil then
		return 
	elseif CoD.useMouse then
		if CoD.useController and f14_arg1.source == 0 then
			f14_arg0.prompt = CoD.buttonStrings[f14_arg0.button]
			f14_arg0.buttonImage:setText( f14_arg0.prompt )
		else
			if f14_arg0.buttonImage.shortcutKey then
				f14_arg0.prompt = f14_arg0.buttonImage.shortcutKey
			elseif string.sub( CoD.buttonStringsShortCut[f14_arg0.buttonImage.buttonStringShortCut], 1, 1 ) == "+" then
				f14_arg0.prompt = Engine.GetKeyBindingLocalizedString( 0, CoD.buttonStringsShortCut[f14_arg0.buttonImage.buttonStringShortCut], 0 )
			elseif string.sub( CoD.buttonStringsShortCut[f14_arg0.buttonImage.buttonStringShortCut], 1, 1 ) == "@" then
				f14_arg0.prompt = Engine.Localize( string.sub( CoD.buttonStringsShortCut[f14_arg0.buttonImage.buttonStringShortCut], 2 ) )
			else
				f14_arg0.prompt = CoD.buttonStringsShortCut[f14_arg0.buttonImage.buttonStringShortCut]
			end
			f14_arg0.buttonImage:setText( f14_arg0.prompt )
		end
		CoD.ButtonPrompt.ResizeButtonPrompt( f14_arg0 )
		if f14_arg0.button == "primary" then
			if f14_arg1.source == 0 then
				f14_arg0:setAlpha( 1 )
				f14_arg0:setPriority( -100 )
			else
				f14_arg0:setAlpha( 0 )
				f14_arg0:setPriority( 1000 )
			end
		end
	end
end

CoD.ButtonPrompt.SetNew = function ( f15_arg0, f15_arg1 )
	if f15_arg1 then
		if not f15_arg0.newIcon then
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, 0, CoD.CACUtility.ButtonGridNewImageWidth )
			newIcon:setTopBottom( false, false, -CoD.CACUtility.ButtonGridNewImageHeight / 2, CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			f15_arg0:addElement( newIcon )
			f15_arg0.newIcon = newIcon
			
		end
	elseif f15_arg0.newIcon then
		f15_arg0.newIcon:close()
		f15_arg0.newIcon = nil
	end
	CoD.ButtonPrompt.ResizeButtonPrompt( f15_arg0 )
end

CoD.ButtonPrompt.SetText = function ( f16_arg0, f16_arg1 )
	if LUI.DEVHideButtonPrompts then
		return 
	else
		f16_arg0.label:setText( f16_arg1 )
		f16_arg0.labelText = f16_arg1
		CoD.ButtonPrompt.ResizeButtonPrompt( f16_arg0 )
	end
end

