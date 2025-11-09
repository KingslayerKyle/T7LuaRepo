require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.widgets.HUD.Console.Console" )

local PostLoadFunc = function ( self, controller, menu )
	self.cheatCode = ""
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if self.buttonA:isInFocus() then
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
			SendMenuResponse( self, "NumericKeypad", self.cheatCode, controller )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackGround = CoD.DialogBackground.new( self, controller )
	BackGround:setLeftRight( true, false, 540.5, 739.5 )
	BackGround:setTopBottom( true, false, 232, 519 )
	self:addElement( BackGround )
	self.BackGround = BackGround
	
	local BackButtonPrompt = CoD.buttonprompt.new( self, controller )
	BackButtonPrompt:setLeftRight( true, false, 540.5, 739.5 )
	BackButtonPrompt:setTopBottom( true, false, 519, 550 )
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
	buttonA:setLeftRight( true, false, 580, 600 )
	buttonA:setTopBottom( true, false, 300, 330 )
	buttonA.buttoninternal0.Text0:setText( Engine.Localize( "A" ) )
	self:addElement( buttonA )
	self.buttonA = buttonA
	
	local buttonB = CoD.button.new( self, controller )
	buttonB:setLeftRight( true, false, 605, 625 )
	buttonB:setTopBottom( true, false, 300, 330 )
	buttonB.buttoninternal0.Text0:setText( Engine.Localize( "B" ) )
	self:addElement( buttonB )
	self.buttonB = buttonB
	
	local buttonC = CoD.button.new( self, controller )
	buttonC:setLeftRight( true, false, 630, 650 )
	buttonC:setTopBottom( true, false, 300, 330 )
	buttonC.buttoninternal0.Text0:setText( Engine.Localize( "C" ) )
	self:addElement( buttonC )
	self.buttonC = buttonC
	
	local buttonD = CoD.button.new( self, controller )
	buttonD:setLeftRight( true, false, 655, 675 )
	buttonD:setTopBottom( true, false, 300, 330 )
	buttonD.buttoninternal0.Text0:setText( Engine.Localize( "D" ) )
	self:addElement( buttonD )
	self.buttonD = buttonD
	
	local buttonE = CoD.button.new( self, controller )
	buttonE:setLeftRight( true, false, 680, 700 )
	buttonE:setTopBottom( true, false, 300, 330 )
	buttonE.buttoninternal0.Text0:setText( Engine.Localize( "E" ) )
	self:addElement( buttonE )
	self.buttonE = buttonE
	
	local buttonF = CoD.button.new( self, controller )
	buttonF:setLeftRight( true, false, 579.5, 599.5 )
	buttonF:setTopBottom( true, false, 330, 360 )
	buttonF.buttoninternal0.Text0:setText( Engine.Localize( "F" ) )
	self:addElement( buttonF )
	self.buttonF = buttonF
	
	local buttonG = CoD.button.new( self, controller )
	buttonG:setLeftRight( true, false, 604.5, 624.5 )
	buttonG:setTopBottom( true, false, 330, 360 )
	buttonG.buttoninternal0.Text0:setText( Engine.Localize( "G" ) )
	self:addElement( buttonG )
	self.buttonG = buttonG
	
	local buttonH = CoD.button.new( self, controller )
	buttonH:setLeftRight( true, false, 629.5, 649.5 )
	buttonH:setTopBottom( true, false, 330, 360 )
	buttonH.buttoninternal0.Text0:setText( Engine.Localize( "H" ) )
	self:addElement( buttonH )
	self.buttonH = buttonH
	
	local buttonI = CoD.button.new( self, controller )
	buttonI:setLeftRight( true, false, 654.5, 674.5 )
	buttonI:setTopBottom( true, false, 330, 360 )
	buttonI.buttoninternal0.Text0:setText( Engine.Localize( "I" ) )
	self:addElement( buttonI )
	self.buttonI = buttonI
	
	local buttonP = CoD.button.new( self, controller )
	buttonP:setLeftRight( true, false, 580, 595 )
	buttonP:setTopBottom( true, false, 390, 420 )
	buttonP.buttoninternal0.Text0:setText( Engine.Localize( "P" ) )
	self:addElement( buttonP )
	self.buttonP = buttonP
	
	local Display = LUI.UIText.new()
	Display:setLeftRight( true, false, 557.5, 722.5 )
	Display:setTopBottom( true, false, 241.25, 265.25 )
	Display:setText( Engine.Localize( "" ) )
	Display:setTTF( "fonts/escom.ttf" )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Display:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Display )
	self.Display = Display
	
	local OkButton = CoD.button.new( self, controller )
	OkButton:setLeftRight( true, false, 557.5, 677 )
	OkButton:setTopBottom( true, false, 489, 519 )
	OkButton.buttoninternal0.Text0:setText( Engine.Localize( "MENU_OK_CAPS" ) )
	self:addElement( OkButton )
	self.OkButton = OkButton
	
	local Console0 = CoD.Console.new( self, controller )
	Console0:setLeftRight( true, false, 307.5, 987.5 )
	Console0:setTopBottom( true, false, 519, 617 )
	self:addElement( Console0 )
	self.Console0 = Console0
	
	local buttonJ = CoD.button.new( self, controller )
	buttonJ:setLeftRight( true, false, 679.5, 699.5 )
	buttonJ:setTopBottom( true, false, 330, 360 )
	buttonJ.buttoninternal0.Text0:setText( Engine.Localize( "J" ) )
	self:addElement( buttonJ )
	self.buttonJ = buttonJ
	
	local buttonK = CoD.button.new( self, controller )
	buttonK:setLeftRight( true, false, 580, 595 )
	buttonK:setTopBottom( true, false, 360, 390 )
	buttonK.buttoninternal0.Text0:setText( Engine.Localize( "K" ) )
	self:addElement( buttonK )
	self.buttonK = buttonK
	
	local buttonL = CoD.button.new( self, controller )
	buttonL:setLeftRight( true, false, 604.5, 619.5 )
	buttonL:setTopBottom( true, false, 360, 390 )
	buttonL.buttoninternal0.Text0:setText( Engine.Localize( "L" ) )
	self:addElement( buttonL )
	self.buttonL = buttonL
	
	local buttonM = CoD.button.new( self, controller )
	buttonM:setLeftRight( true, false, 629.5, 644.5 )
	buttonM:setTopBottom( true, false, 360, 390 )
	buttonM.buttoninternal0.Text0:setText( Engine.Localize( "M" ) )
	self:addElement( buttonM )
	self.buttonM = buttonM
	
	local buttonN = CoD.button.new( self, controller )
	buttonN:setLeftRight( true, false, 654.5, 669.5 )
	buttonN:setTopBottom( true, false, 360, 390 )
	buttonN.buttoninternal0.Text0:setText( Engine.Localize( "N" ) )
	self:addElement( buttonN )
	self.buttonN = buttonN
	
	local buttonO = CoD.button.new( self, controller )
	buttonO:setLeftRight( true, false, 679.5, 694.5 )
	buttonO:setTopBottom( true, false, 360, 390 )
	buttonO.buttoninternal0.Text0:setText( Engine.Localize( "O" ) )
	self:addElement( buttonO )
	self.buttonO = buttonO
	
	local buttonQ = CoD.button.new( self, controller )
	buttonQ:setLeftRight( true, false, 604.5, 619.5 )
	buttonQ:setTopBottom( true, false, 390, 420 )
	buttonQ.buttoninternal0.Text0:setText( Engine.Localize( "Q" ) )
	self:addElement( buttonQ )
	self.buttonQ = buttonQ
	
	local buttonR = CoD.button.new( self, controller )
	buttonR:setLeftRight( true, false, 629.5, 644.5 )
	buttonR:setTopBottom( true, false, 390, 420 )
	buttonR.buttoninternal0.Text0:setText( Engine.Localize( "R" ) )
	self:addElement( buttonR )
	self.buttonR = buttonR
	
	local buttonS = CoD.button.new( self, controller )
	buttonS:setLeftRight( true, false, 654.5, 669.5 )
	buttonS:setTopBottom( true, false, 390, 420 )
	buttonS.buttoninternal0.Text0:setText( Engine.Localize( "S" ) )
	self:addElement( buttonS )
	self.buttonS = buttonS
	
	local buttonT = CoD.button.new( self, controller )
	buttonT:setLeftRight( true, false, 679.5, 694.5 )
	buttonT:setTopBottom( true, false, 390, 420 )
	buttonT.buttoninternal0.Text0:setText( Engine.Localize( "T" ) )
	self:addElement( buttonT )
	self.buttonT = buttonT
	
	local buttonU = CoD.button.new( self, controller )
	buttonU:setLeftRight( true, false, 580, 595 )
	buttonU:setTopBottom( true, false, 420, 450 )
	buttonU.buttoninternal0.Text0:setText( Engine.Localize( "U" ) )
	self:addElement( buttonU )
	self.buttonU = buttonU
	
	local buttonV = CoD.button.new( self, controller )
	buttonV:setLeftRight( true, false, 604.5, 619.5 )
	buttonV:setTopBottom( true, false, 420, 450 )
	buttonV.buttoninternal0.Text0:setText( Engine.Localize( "V" ) )
	self:addElement( buttonV )
	self.buttonV = buttonV
	
	local buttonW = CoD.button.new( self, controller )
	buttonW:setLeftRight( true, false, 629.5, 644.5 )
	buttonW:setTopBottom( true, false, 420, 450 )
	buttonW.buttoninternal0.Text0:setText( Engine.Localize( "W" ) )
	self:addElement( buttonW )
	self.buttonW = buttonW
	
	local buttonX = CoD.button.new( self, controller )
	buttonX:setLeftRight( true, false, 654.5, 669.5 )
	buttonX:setTopBottom( true, false, 420, 450 )
	buttonX.buttoninternal0.Text0:setText( Engine.Localize( "X" ) )
	self:addElement( buttonX )
	self.buttonX = buttonX
	
	local buttonY = CoD.button.new( self, controller )
	buttonY:setLeftRight( true, false, 679.5, 694.5 )
	buttonY:setTopBottom( true, false, 420, 450 )
	buttonY.buttoninternal0.Text0:setText( Engine.Localize( "Y" ) )
	self:addElement( buttonY )
	self.buttonY = buttonY
	
	local buttonZ = CoD.button.new( self, controller )
	buttonZ:setLeftRight( true, false, 629.5, 644.5 )
	buttonZ:setTopBottom( true, false, 450, 480 )
	buttonZ.buttoninternal0.Text0:setText( Engine.Localize( "Z" ) )
	self:addElement( buttonZ )
	self.buttonZ = buttonZ
	
	buttonA.navigation = {
		right = buttonB,
		down = buttonF
	}
	buttonB.navigation = {
		left = buttonA,
		right = buttonC,
		down = buttonG
	}
	buttonC.navigation = {
		left = buttonB,
		right = buttonD,
		down = buttonH
	}
	buttonD.navigation = {
		left = buttonC,
		right = buttonE,
		down = buttonI
	}
	buttonE.navigation = {
		left = buttonD,
		down = buttonJ
	}
	buttonF.navigation = {
		up = buttonA,
		right = buttonG,
		down = buttonK
	}
	buttonG.navigation = {
		left = buttonF,
		up = buttonB,
		right = buttonH,
		down = buttonL
	}
	buttonH.navigation = {
		left = buttonG,
		up = buttonC,
		right = buttonI,
		down = buttonM
	}
	buttonI.navigation = {
		left = buttonH,
		up = buttonD,
		right = buttonJ,
		down = buttonN
	}
	buttonP.navigation = {
		up = buttonK,
		right = buttonQ,
		down = buttonU
	}
	OkButton.navigation = {
		up = buttonZ
	}
	buttonJ.navigation = {
		left = buttonI,
		up = buttonE,
		down = buttonO
	}
	buttonK.navigation = {
		up = buttonF,
		right = buttonL,
		down = buttonP
	}
	buttonL.navigation = {
		left = buttonK,
		up = buttonG,
		right = buttonM,
		down = buttonQ
	}
	buttonM.navigation = {
		left = buttonL,
		up = buttonH,
		right = buttonN,
		down = buttonR
	}
	buttonN.navigation = {
		left = buttonM,
		up = buttonI,
		right = buttonO,
		down = buttonS
	}
	buttonO.navigation = {
		left = buttonN,
		up = buttonJ,
		down = buttonT
	}
	buttonQ.navigation = {
		left = buttonP,
		up = buttonL,
		right = buttonR,
		down = buttonV
	}
	buttonR.navigation = {
		left = buttonQ,
		up = buttonM,
		right = buttonS,
		down = buttonW
	}
	buttonS.navigation = {
		left = buttonR,
		up = buttonN,
		right = buttonT,
		down = buttonX
	}
	buttonT.navigation = {
		left = buttonS,
		up = buttonO,
		down = buttonY
	}
	buttonU.navigation = {
		up = buttonP,
		right = buttonV,
		down = OkButton
	}
	buttonV.navigation = {
		left = buttonU,
		up = buttonQ,
		right = buttonW,
		down = OkButton
	}
	buttonW.navigation = {
		left = buttonV,
		up = buttonR,
		right = buttonX,
		down = buttonZ
	}
	buttonX.navigation = {
		left = buttonW,
		up = buttonS,
		right = buttonY,
		down = OkButton
	}
	buttonY.navigation = {
		left = buttonX,
		up = buttonT
	}
	buttonZ.navigation = {
		up = buttonW,
		down = OkButton
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
		}
	}
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
		self.Console0:close()
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "NumericKeypad.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, self )
	end
	return self
end

