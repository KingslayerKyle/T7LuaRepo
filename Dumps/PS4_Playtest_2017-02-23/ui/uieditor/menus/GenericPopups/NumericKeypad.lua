require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )

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
		elseif self.CancelButton:isInFocus() then
			self.cheatCode = ""
			self.Display:setText( self.cheatCode )
			GenericSmallPopupGoBack( self, controller )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( 0, 0, 811, 1109 )
	BackGround:setTopBottom( 0, 0, 348, 674 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( self, controller )
	BackButtonPrompt:setLeftRight( 0, 0, 811, 1109 )
	BackButtonPrompt:setTopBottom( 0, 0, 674, 720 )
	BackButtonPrompt.label:setText( Engine.Localize( "MENU_BACK" ) )
	BackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BackButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( BackButtonPrompt )
	self.BackButtonPrompt = BackButtonPrompt
	
	local buttonA = CoD.button.new( self, controller )
	buttonA:setLeftRight( 0, 0, 836, 866 )
	buttonA:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonA.buttoninternal0.Text0:setText( Engine.Localize( "A" ) )
	self:addElement( buttonA )
	self.buttonA = buttonA
	
	local buttonB = CoD.button.new( self, controller )
	buttonB:setLeftRight( 0, 0, 870, 900 )
	buttonB:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonB.buttoninternal0.Text0:setText( Engine.Localize( "B" ) )
	self:addElement( buttonB )
	self.buttonB = buttonB
	
	local buttonC = CoD.button.new( self, controller )
	buttonC:setLeftRight( 0, 0, 904, 934 )
	buttonC:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonC.buttoninternal0.Text0:setText( Engine.Localize( "C" ) )
	self:addElement( buttonC )
	self.buttonC = buttonC
	
	local buttonD = CoD.button.new( self, controller )
	buttonD:setLeftRight( 0, 0, 937, 967 )
	buttonD:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonD.buttoninternal0.Text0:setText( Engine.Localize( "D" ) )
	self:addElement( buttonD )
	self.buttonD = buttonD
	
	local buttonE = CoD.button.new( self, controller )
	buttonE:setLeftRight( 0, 0, 971, 1001 )
	buttonE:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonE.buttoninternal0.Text0:setText( Engine.Localize( "E" ) )
	self:addElement( buttonE )
	self.buttonE = buttonE
	
	local buttonF = CoD.button.new( self, controller )
	buttonF:setLeftRight( 0, 0, 1004, 1034 )
	buttonF:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonF.buttoninternal0.Text0:setText( Engine.Localize( "F" ) )
	self:addElement( buttonF )
	self.buttonF = buttonF
	
	local buttonG = CoD.button.new( self, controller )
	buttonG:setLeftRight( 0, 0, 1041, 1071 )
	buttonG:setTopBottom( 0, 0, 415.5, 460.5 )
	buttonG.buttoninternal0.Text0:setText( Engine.Localize( "G" ) )
	self:addElement( buttonG )
	self.buttonG = buttonG
	
	local buttonH = CoD.button.new( self, controller )
	buttonH:setLeftRight( 0, 0, 836, 866 )
	buttonH:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonH.buttoninternal0.Text0:setText( Engine.Localize( "H" ) )
	self:addElement( buttonH )
	self.buttonH = buttonH
	
	local buttonI = CoD.button.new( self, controller )
	buttonI:setLeftRight( 0, 0, 877, 907 )
	buttonI:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonI.buttoninternal0.Text0:setText( Engine.Localize( "I" ) )
	self:addElement( buttonI )
	self.buttonI = buttonI
	
	local buttonP = CoD.button.new( self, controller )
	buttonP:setLeftRight( 0, 0, 870, 900 )
	buttonP:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonP.buttoninternal0.Text0:setText( Engine.Localize( "P" ) )
	self:addElement( buttonP )
	self.buttonP = buttonP
	
	local Display = LUI.UIText.new()
	Display:setLeftRight( 0, 0, 836, 1068 )
	Display:setTopBottom( 0, 0, 362, 398 )
	Display:setText( Engine.Localize( "" ) )
	Display:setTTF( "fonts/escom.ttf" )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Display )
	self.Display = Display
	
	local OkButton = CoD.button.new( self, controller )
	OkButton:setLeftRight( 0, 0, 836, 952 )
	OkButton:setTopBottom( 0, 0, 628.5, 673.5 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK_CAPS" ) )
	self:addElement( OkButton )
	self.OkButton = OkButton
	
	local buttonJ = CoD.button.new( self, controller )
	buttonJ:setLeftRight( 0, 0, 904, 934 )
	buttonJ:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonJ.buttoninternal0.Text0:setText( Engine.Localize( "J" ) )
	self:addElement( buttonJ )
	self.buttonJ = buttonJ
	
	local buttonK = CoD.button.new( self, controller )
	buttonK:setLeftRight( 0, 0, 938, 960 )
	buttonK:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonK.buttoninternal0.Text0:setText( Engine.Localize( "K" ) )
	self:addElement( buttonK )
	self.buttonK = buttonK
	
	local buttonL = CoD.button.new( self, controller )
	buttonL:setLeftRight( 0, 0, 970, 992 )
	buttonL:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonL.buttoninternal0.Text0:setText( Engine.Localize( "L" ) )
	self:addElement( buttonL )
	self.buttonL = buttonL
	
	local buttonM = CoD.button.new( self, controller )
	buttonM:setLeftRight( 0, 0, 1005, 1027 )
	buttonM:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonM.buttoninternal0.Text0:setText( Engine.Localize( "M" ) )
	self:addElement( buttonM )
	self.buttonM = buttonM
	
	local buttonN = CoD.button.new( self, controller )
	buttonN:setLeftRight( 0, 0, 1041, 1063 )
	buttonN:setTopBottom( 0, 0, 460.5, 505.5 )
	buttonN.buttoninternal0.Text0:setText( Engine.Localize( "N" ) )
	self:addElement( buttonN )
	self.buttonN = buttonN
	
	local buttonO = CoD.button.new( self, controller )
	buttonO:setLeftRight( 0, 0, 837, 859 )
	buttonO:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonO.buttoninternal0.Text0:setText( Engine.Localize( "O" ) )
	self:addElement( buttonO )
	self.buttonO = buttonO
	
	local buttonQ = CoD.button.new( self, controller )
	buttonQ:setLeftRight( 0, 0, 904, 926 )
	buttonQ:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonQ.buttoninternal0.Text0:setText( Engine.Localize( "Q" ) )
	self:addElement( buttonQ )
	self.buttonQ = buttonQ
	
	local buttonR = CoD.button.new( self, controller )
	buttonR:setLeftRight( 0, 0, 938, 960 )
	buttonR:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonR.buttoninternal0.Text0:setText( Engine.Localize( "R" ) )
	self:addElement( buttonR )
	self.buttonR = buttonR
	
	local buttonS = CoD.button.new( self, controller )
	buttonS:setLeftRight( 0, 0, 970, 992 )
	buttonS:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonS.buttoninternal0.Text0:setText( Engine.Localize( "S" ) )
	self:addElement( buttonS )
	self.buttonS = buttonS
	
	local buttonT = CoD.button.new( self, controller )
	buttonT:setLeftRight( 0, 0, 1008, 1030 )
	buttonT:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonT.buttoninternal0.Text0:setText( Engine.Localize( "T" ) )
	self:addElement( buttonT )
	self.buttonT = buttonT
	
	local buttonU = CoD.button.new( self, controller )
	buttonU:setLeftRight( 0, 0, 1041, 1063 )
	buttonU:setTopBottom( 0, 0, 505.5, 550.5 )
	buttonU.buttoninternal0.Text0:setText( Engine.Localize( "U" ) )
	self:addElement( buttonU )
	self.buttonU = buttonU
	
	local buttonV = CoD.button.new( self, controller )
	buttonV:setLeftRight( 0, 0, 870, 892 )
	buttonV:setTopBottom( 0, 0, 550.5, 595.5 )
	buttonV.buttoninternal0.Text0:setText( Engine.Localize( "V" ) )
	self:addElement( buttonV )
	self.buttonV = buttonV
	
	local buttonW = CoD.button.new( self, controller )
	buttonW:setLeftRight( 0, 0, 900, 922 )
	buttonW:setTopBottom( 0, 0, 550.5, 595.5 )
	buttonW.buttoninternal0.Text0:setText( Engine.Localize( "W" ) )
	self:addElement( buttonW )
	self.buttonW = buttonW
	
	local buttonX = CoD.button.new( self, controller )
	buttonX:setLeftRight( 0, 0, 938, 960 )
	buttonX:setTopBottom( 0, 0, 550.5, 595.5 )
	buttonX.buttoninternal0.Text0:setText( Engine.Localize( "X" ) )
	self:addElement( buttonX )
	self.buttonX = buttonX
	
	local buttonY = CoD.button.new( self, controller )
	buttonY:setLeftRight( 0, 0, 971, 993 )
	buttonY:setTopBottom( 0, 0, 550.5, 595.5 )
	buttonY.buttoninternal0.Text0:setText( Engine.Localize( "Y" ) )
	self:addElement( buttonY )
	self.buttonY = buttonY
	
	local buttonZ = CoD.button.new( self, controller )
	buttonZ:setLeftRight( 0, 0, 1005, 1027 )
	buttonZ:setTopBottom( 0, 0, 550.5, 595.5 )
	buttonZ.buttoninternal0.Text0:setText( Engine.Localize( "Z" ) )
	self:addElement( buttonZ )
	self.buttonZ = buttonZ
	
	local CancelButton = CoD.button.new( self, controller )
	CancelButton:setLeftRight( 0, 0, 952, 1109 )
	CancelButton:setTopBottom( 0, 0, 628.5, 673.5 )
	CancelButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_CANCEL_CAPS" ) )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
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
		},
		right = CancelButton
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
		up = buttonN,
		down = CancelButton
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
		down = {
			OkButton,
			CancelButton
		}
	}
	buttonY.navigation = {
		left = buttonX,
		up = buttonS,
		right = buttonZ,
		down = CancelButton
	}
	buttonZ.navigation = {
		left = buttonY,
		up = buttonT,
		down = CancelButton
	}
	CancelButton.navigation = {
		left = OkButton,
		up = {
			buttonX,
			buttonY,
			buttonZ
		}
	}
	self.resetProperties = function ()
		BackButtonPrompt:completeAnimation()
		BackGround:completeAnimation()
		OkButton:completeAnimation()
		BackButtonPrompt:setAlpha( 1 )
		BackGround:setAlpha( 1 )
		OkButton:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Processing = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
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
				local f11_local0
				if not IsGamepad( controller ) then
					f11_local0 = IsPC()
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
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
	CancelButton.id = "CancelButton"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackGround:close()
		self.BackButtonPrompt:close()
		self.buttonA:close()
		self.buttonB:close()
		self.buttonC:close()
		self.buttonD:close()
		self.buttonE:close()
		self.buttonF:close()
		self.buttonG:close()
		self.buttonH:close()
		self.buttonI:close()
		self.buttonP:close()
		self.OkButton:close()
		self.buttonJ:close()
		self.buttonK:close()
		self.buttonL:close()
		self.buttonM:close()
		self.buttonN:close()
		self.buttonO:close()
		self.buttonQ:close()
		self.buttonR:close()
		self.buttonS:close()
		self.buttonT:close()
		self.buttonU:close()
		self.buttonV:close()
		self.buttonW:close()
		self.buttonX:close()
		self.buttonY:close()
		self.buttonZ:close()
		self.CancelButton:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

