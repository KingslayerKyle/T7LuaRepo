require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.button" )

local PostLoadFunc = function ( self, controller, menu )
	self.cheatCode = ""
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if string.len( self.cheatCode ) >= 10 then
			return true
		elseif self.buttonA:isInFocus() then
			self.cheatCode = self.cheatCode .. "A"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonB:isInFocus() then
			self.cheatCode = self.cheatCode .. "B"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonC:isInFocus() then
			self.cheatCode = self.cheatCode .. "C"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonD:isInFocus() then
			self.cheatCode = self.cheatCode .. "D"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonE:isInFocus() then
			self.cheatCode = self.cheatCode .. "E"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonF:isInFocus() then
			self.cheatCode = self.cheatCode .. "F"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonG:isInFocus() then
			self.cheatCode = self.cheatCode .. "G"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonH:isInFocus() then
			self.cheatCode = self.cheatCode .. "H"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonI:isInFocus() then
			self.cheatCode = self.cheatCode .. "I"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonJ:isInFocus() then
			self.cheatCode = self.cheatCode .. "J"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonK:isInFocus() then
			self.cheatCode = self.cheatCode .. "K"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonL:isInFocus() then
			self.cheatCode = self.cheatCode .. "L"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonM:isInFocus() then
			self.cheatCode = self.cheatCode .. "M"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonN:isInFocus() then
			self.cheatCode = self.cheatCode .. "N"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonO:isInFocus() then
			self.cheatCode = self.cheatCode .. "O"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonP:isInFocus() then
			self.cheatCode = self.cheatCode .. "P"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonQ:isInFocus() then
			self.cheatCode = self.cheatCode .. "Q"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonR:isInFocus() then
			self.cheatCode = self.cheatCode .. "R"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonS:isInFocus() then
			self.cheatCode = self.cheatCode .. "S"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonT:isInFocus() then
			self.cheatCode = self.cheatCode .. "T"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonU:isInFocus() then
			self.cheatCode = self.cheatCode .. "U"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonV:isInFocus() then
			self.cheatCode = self.cheatCode .. "V"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonW:isInFocus() then
			self.cheatCode = self.cheatCode .. "W"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonX:isInFocus() then
			self.cheatCode = self.cheatCode .. "X"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonY:isInFocus() then
			self.cheatCode = self.cheatCode .. "Y"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.buttonZ:isInFocus() then
			self.cheatCode = self.cheatCode .. "Z"
			self.Display:setText( self.cheatCode )
			return true
		elseif self.OkButton:isInFocus() then
			Engine.UserData( self.cheatCode )
			self.cheatCode = ""
			self.Display:setText( self.cheatCode )
			return true
		else
			return true
		end
	end, function ( element, menu, controller )
		return false
	end, false )
end

LUI.createMenu.NumericKeypad = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "NumericKeypad" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( true, false, 540.5, 739.5 )
	BackGround:setTopBottom( true, false, 232, 449 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( self, controller )
	BackButtonPrompt:setLeftRight( true, false, 540.5, 739.5 )
	BackButtonPrompt:setTopBottom( true, false, 449, 480 )
	BackButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	BackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			BackButtonPrompt.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( BackButtonPrompt )
	self.BackButtonPrompt = BackButtonPrompt
	
	local buttonA = CoD.button.new( self, controller )
	buttonA:setLeftRight( true, false, 557.5, 577.5 )
	buttonA:setTopBottom( true, false, 277, 307 )
	buttonA.buttoninternal0.Text0:setText( Engine.Localize( "A" ) )
	self:addElement( buttonA )
	self.buttonA = buttonA
	
	local buttonB = CoD.button.new( self, controller )
	buttonB:setLeftRight( true, false, 580, 600 )
	buttonB:setTopBottom( true, false, 277, 307 )
	buttonB.buttoninternal0.Text0:setText( Engine.Localize( "B" ) )
	self:addElement( buttonB )
	self.buttonB = buttonB
	
	local buttonC = CoD.button.new( self, controller )
	buttonC:setLeftRight( true, false, 602.5, 622.5 )
	buttonC:setTopBottom( true, false, 277, 307 )
	buttonC.buttoninternal0.Text0:setText( Engine.Localize( "C" ) )
	self:addElement( buttonC )
	self.buttonC = buttonC
	
	local buttonD = CoD.button.new( self, controller )
	buttonD:setLeftRight( true, false, 625, 645 )
	buttonD:setTopBottom( true, false, 277, 307 )
	buttonD.buttoninternal0.Text0:setText( Engine.Localize( "D" ) )
	self:addElement( buttonD )
	self.buttonD = buttonD
	
	local buttonE = CoD.button.new( self, controller )
	buttonE:setLeftRight( true, false, 647.5, 667.5 )
	buttonE:setTopBottom( true, false, 277, 307 )
	buttonE.buttoninternal0.Text0:setText( Engine.Localize( "E" ) )
	self:addElement( buttonE )
	self.buttonE = buttonE
	
	local buttonF = CoD.button.new( self, controller )
	buttonF:setLeftRight( true, false, 669.5, 689.5 )
	buttonF:setTopBottom( true, false, 277, 307 )
	buttonF.buttoninternal0.Text0:setText( Engine.Localize( "F" ) )
	self:addElement( buttonF )
	self.buttonF = buttonF
	
	local buttonG = CoD.button.new( self, controller )
	buttonG:setLeftRight( true, false, 694, 714 )
	buttonG:setTopBottom( true, false, 277, 307 )
	buttonG.buttoninternal0.Text0:setText( Engine.Localize( "G" ) )
	self:addElement( buttonG )
	self.buttonG = buttonG
	
	local buttonH = CoD.button.new( self, controller )
	buttonH:setLeftRight( true, false, 557.5, 577.5 )
	buttonH:setTopBottom( true, false, 307, 337 )
	buttonH.buttoninternal0.Text0:setText( Engine.Localize( "H" ) )
	self:addElement( buttonH )
	self.buttonH = buttonH
	
	local buttonI = CoD.button.new( self, controller )
	buttonI:setLeftRight( true, false, 585, 605 )
	buttonI:setTopBottom( true, false, 307, 337 )
	buttonI.buttoninternal0.Text0:setText( Engine.Localize( "I" ) )
	self:addElement( buttonI )
	self.buttonI = buttonI
	
	local buttonP = CoD.button.new( self, controller )
	buttonP:setLeftRight( true, false, 580, 600 )
	buttonP:setTopBottom( true, false, 337, 367 )
	buttonP.buttoninternal0.Text0:setText( Engine.Localize( "P" ) )
	self:addElement( buttonP )
	self.buttonP = buttonP
	
	local Display = LUI.UIText.new()
	Display:setLeftRight( true, false, 557.5, 712.5 )
	Display:setTopBottom( true, false, 241.25, 265.25 )
	Display:setText( Engine.Localize( "" ) )
	Display:setTTF( "fonts/escom.ttf" )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Display )
	self.Display = Display
	
	local OkButton = CoD.button.new( self, controller )
	OkButton:setLeftRight( true, false, 557.5, 635 )
	OkButton:setTopBottom( true, false, 419, 449 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK_CAPS" ) )
	self:addElement( OkButton )
	self.OkButton = OkButton
	
	local buttonJ = CoD.button.new( self, controller )
	buttonJ:setLeftRight( true, false, 602.5, 622.5 )
	buttonJ:setTopBottom( true, false, 307, 337 )
	buttonJ.buttoninternal0.Text0:setText( Engine.Localize( "J" ) )
	self:addElement( buttonJ )
	self.buttonJ = buttonJ
	
	local buttonK = CoD.button.new( self, controller )
	buttonK:setLeftRight( true, false, 625, 640 )
	buttonK:setTopBottom( true, false, 307, 337 )
	buttonK.buttoninternal0.Text0:setText( Engine.Localize( "K" ) )
	self:addElement( buttonK )
	self.buttonK = buttonK
	
	local buttonL = CoD.button.new( self, controller )
	buttonL:setLeftRight( true, false, 646.5, 661.5 )
	buttonL:setTopBottom( true, false, 307, 337 )
	buttonL.buttoninternal0.Text0:setText( Engine.Localize( "L" ) )
	self:addElement( buttonL )
	self.buttonL = buttonL
	
	local buttonM = CoD.button.new( self, controller )
	buttonM:setLeftRight( true, false, 669.5, 684.5 )
	buttonM:setTopBottom( true, false, 307, 337 )
	buttonM.buttoninternal0.Text0:setText( Engine.Localize( "M" ) )
	self:addElement( buttonM )
	self.buttonM = buttonM
	
	local buttonN = CoD.button.new( self, controller )
	buttonN:setLeftRight( true, false, 694, 709 )
	buttonN:setTopBottom( true, false, 307, 337 )
	buttonN.buttoninternal0.Text0:setText( Engine.Localize( "N" ) )
	self:addElement( buttonN )
	self.buttonN = buttonN
	
	local buttonO = CoD.button.new( self, controller )
	buttonO:setLeftRight( true, false, 557.5, 572.5 )
	buttonO:setTopBottom( true, false, 337, 367 )
	buttonO.buttoninternal0.Text0:setText( Engine.Localize( "O" ) )
	self:addElement( buttonO )
	self.buttonO = buttonO
	
	local buttonQ = CoD.button.new( self, controller )
	buttonQ:setLeftRight( true, false, 602.25, 617.25 )
	buttonQ:setTopBottom( true, false, 337, 367 )
	buttonQ.buttoninternal0.Text0:setText( Engine.Localize( "Q" ) )
	self:addElement( buttonQ )
	self.buttonQ = buttonQ
	
	local buttonR = CoD.button.new( self, controller )
	buttonR:setLeftRight( true, false, 625, 640 )
	buttonR:setTopBottom( true, false, 337, 367 )
	buttonR.buttoninternal0.Text0:setText( Engine.Localize( "R" ) )
	self:addElement( buttonR )
	self.buttonR = buttonR
	
	local buttonS = CoD.button.new( self, controller )
	buttonS:setLeftRight( true, false, 646.5, 661.5 )
	buttonS:setTopBottom( true, false, 337, 367 )
	buttonS.buttoninternal0.Text0:setText( Engine.Localize( "S" ) )
	self:addElement( buttonS )
	self.buttonS = buttonS
	
	local buttonT = CoD.button.new( self, controller )
	buttonT:setLeftRight( true, false, 672, 687 )
	buttonT:setTopBottom( true, false, 337, 367 )
	buttonT.buttoninternal0.Text0:setText( Engine.Localize( "T" ) )
	self:addElement( buttonT )
	self.buttonT = buttonT
	
	local buttonU = CoD.button.new( self, controller )
	buttonU:setLeftRight( true, false, 694, 709 )
	buttonU:setTopBottom( true, false, 337, 367 )
	buttonU.buttoninternal0.Text0:setText( Engine.Localize( "U" ) )
	self:addElement( buttonU )
	self.buttonU = buttonU
	
	local buttonV = CoD.button.new( self, controller )
	buttonV:setLeftRight( true, false, 580, 595 )
	buttonV:setTopBottom( true, false, 367, 397 )
	buttonV.buttoninternal0.Text0:setText( Engine.Localize( "V" ) )
	self:addElement( buttonV )
	self.buttonV = buttonV
	
	local buttonW = CoD.button.new( self, controller )
	buttonW:setLeftRight( true, false, 600, 615 )
	buttonW:setTopBottom( true, false, 367, 397 )
	buttonW.buttoninternal0.Text0:setText( Engine.Localize( "W" ) )
	self:addElement( buttonW )
	self.buttonW = buttonW
	
	local buttonX = CoD.button.new( self, controller )
	buttonX:setLeftRight( true, false, 625, 640 )
	buttonX:setTopBottom( true, false, 367, 397 )
	buttonX.buttoninternal0.Text0:setText( Engine.Localize( "X" ) )
	self:addElement( buttonX )
	self.buttonX = buttonX
	
	local buttonY = CoD.button.new( self, controller )
	buttonY:setLeftRight( true, false, 647.5, 662.5 )
	buttonY:setTopBottom( true, false, 367, 397 )
	buttonY.buttoninternal0.Text0:setText( Engine.Localize( "Y" ) )
	self:addElement( buttonY )
	self.buttonY = buttonY
	
	local buttonZ = CoD.button.new( self, controller )
	buttonZ:setLeftRight( true, false, 669.5, 684.5 )
	buttonZ:setTopBottom( true, false, 367, 397 )
	buttonZ.buttoninternal0.Text0:setText( Engine.Localize( "Z" ) )
	self:addElement( buttonZ )
	self.buttonZ = buttonZ
	
	buttonA.navigation = {
		right = buttonB,
		down = buttonH
	}
	buttonB.navigation = {
		left = buttonA,
		right = buttonC,
		down = buttonI
	}
	buttonC.navigation = {
		left = buttonB,
		right = buttonD,
		down = {
			buttonI,
			buttonJ
		}
	}
	buttonD.navigation = {
		left = buttonC,
		right = buttonE,
		down = buttonK
	}
	buttonE.navigation = {
		left = buttonD,
		right = buttonF,
		down = buttonL
	}
	buttonF.navigation = {
		left = buttonE,
		right = buttonG,
		down = buttonM
	}
	buttonG.navigation = {
		left = buttonF,
		down = buttonN
	}
	buttonH.navigation = {
		up = buttonA,
		right = buttonI,
		down = buttonO
	}
	buttonI.navigation = {
		left = buttonH,
		up = {
			buttonB,
			buttonC
		},
		right = buttonJ,
		down = {
			buttonP,
			buttonQ
		}
	}
	buttonP.navigation = {
		left = buttonO,
		up = buttonI,
		right = buttonQ,
		down = buttonV
	}
	OkButton.navigation = {
		up = {
			buttonV,
			buttonW,
			buttonX
		}
	}
	buttonJ.navigation = {
		left = buttonI,
		up = buttonC,
		right = buttonK,
		down = buttonQ
	}
	buttonK.navigation = {
		left = buttonJ,
		up = buttonD,
		right = buttonL,
		down = buttonR
	}
	buttonL.navigation = {
		left = buttonK,
		up = buttonE,
		right = buttonM,
		down = buttonS
	}
	buttonM.navigation = {
		left = buttonL,
		up = buttonF,
		right = buttonN,
		down = buttonT
	}
	buttonN.navigation = {
		left = buttonM,
		up = buttonG,
		down = buttonU
	}
	buttonO.navigation = {
		up = buttonH,
		right = buttonP,
		down = OkButton
	}
	buttonQ.navigation = {
		left = buttonP,
		up = {
			buttonI,
			buttonJ
		},
		right = buttonR,
		down = buttonW
	}
	buttonR.navigation = {
		left = buttonQ,
		up = buttonK,
		right = buttonS,
		down = buttonX
	}
	buttonS.navigation = {
		left = buttonR,
		up = buttonL,
		right = buttonT,
		down = buttonY
	}
	buttonT.navigation = {
		left = buttonS,
		up = buttonM,
		right = buttonU,
		down = buttonZ
	}
	buttonU.navigation = {
		left = buttonT,
		up = buttonN
	}
	buttonV.navigation = {
		up = buttonP,
		right = buttonW,
		down = OkButton
	}
	buttonW.navigation = {
		left = buttonV,
		up = buttonQ,
		right = buttonX,
		down = OkButton
	}
	buttonX.navigation = {
		left = buttonW,
		up = buttonR,
		right = buttonY,
		down = OkButton
	}
	buttonY.navigation = {
		left = buttonX,
		up = buttonS,
		right = buttonZ
	}
	buttonZ.navigation = {
		left = buttonY,
		up = buttonT
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BackButtonPrompt:completeAnimation()
				self.BackButtonPrompt:setAlpha( 1 )
				self.clipFinished( BackButtonPrompt, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				BackGround:completeAnimation()
				self.BackGround:setAlpha( 0.42 )
				self.clipFinished( BackGround, {} )
				BackButtonPrompt:completeAnimation()
				self.BackButtonPrompt:setAlpha( 0 )
				self.clipFinished( BackButtonPrompt, {} )
				OkButton:completeAnimation()
				self.OkButton:setAlpha( 0 )
				self.clipFinished( OkButton, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BackButtonPrompt:completeAnimation()
				self.BackButtonPrompt:setAlpha( 0 )
				self.clipFinished( BackButtonPrompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Processing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f4_local32 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f4_local32( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GenericSmallPopupGoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	buttonA.id = "buttonA"
	buttonB.id = "buttonB"
	buttonC.id = "buttonC"
	buttonD.id = "buttonD"
	buttonE.id = "buttonE"
	buttonF.id = "buttonF"
	buttonG.id = "buttonG"
	buttonH.id = "buttonH"
	buttonI.id = "buttonI"
	buttonP.id = "buttonP"
	OkButton.id = "OkButton"
	buttonJ.id = "buttonJ"
	buttonK.id = "buttonK"
	buttonL.id = "buttonL"
	buttonM.id = "buttonM"
	buttonN.id = "buttonN"
	buttonO.id = "buttonO"
	buttonQ.id = "buttonQ"
	buttonR.id = "buttonR"
	buttonS.id = "buttonS"
	buttonT.id = "buttonT"
	buttonU.id = "buttonU"
	buttonV.id = "buttonV"
	buttonW.id = "buttonW"
	buttonX.id = "buttonX"
	buttonY.id = "buttonY"
	buttonZ.id = "buttonZ"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.OkButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackGround:close()
		element.BackButtonPrompt:close()
		element.buttonA:close()
		element.buttonB:close()
		element.buttonC:close()
		element.buttonD:close()
		element.buttonE:close()
		element.buttonF:close()
		element.buttonG:close()
		element.buttonH:close()
		element.buttonI:close()
		element.buttonP:close()
		element.OkButton:close()
		element.buttonJ:close()
		element.buttonK:close()
		element.buttonL:close()
		element.buttonM:close()
		element.buttonN:close()
		element.buttonO:close()
		element.buttonQ:close()
		element.buttonR:close()
		element.buttonS:close()
		element.buttonT:close()
		element.buttonU:close()
		element.buttonV:close()
		element.buttonW:close()
		element.buttonX:close()
		element.buttonY:close()
		element.buttonZ:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

