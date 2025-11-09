require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Panel" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Multiply" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Vignette" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Texture" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_CenterHex" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_ElementsSide" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DNIContainer" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_CenterElements" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_BracketBlur" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityButtonNew" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_TabC" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Description" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_AbilityContextual2" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_CenterCore" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_ButtonBumperWidget" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomRequestedType" ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ) ) )
	self.restoreState = function ( f2_arg0 )
		return true
	end
	
	Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel.Selected1" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel.Selected2" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel.Selected3" )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f3_arg0.currentFocusWidget = nil
	f3_arg0.previousFocusWidget = nil
	f3_arg0.currentAbilitySelected = nil
	f3_arg0.degrees = 0
	f3_arg0.length = 0
	Engine.SetUIActive( f3_arg1, true )
	local f3_local0 = function ()
		local f4_local0 = 0
		if f3_arg0.length > 0.6 then
			local f4_local1 = 60
			f3_arg0.updateButtonStates( 1 + math.floor( (360 - f4_local1 + f3_arg0.degrees) % 360 / f4_local1 ) )
		end
	end
	
	f3_arg0.updateButtonStates = function ( f5_arg0, f5_arg1, f5_arg2 )
		if f5_arg1 == nil then
			f5_arg1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "hudItems.cybercomRequestedType" ) ) + 1
		end
		local f5_local0 = false
		local f5_local1 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "AbilityWheel.Selected" .. f5_arg1 )
		local f5_local2 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "AbilityWheel" )
		if f5_arg0 == nil then
			if Engine.GetModelValue( f5_local1 ) == nil then
				local f5_local3 = 1
				for f5_local4 = 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
					if CoD.SafeGetModelValue( f5_local2, "AbilityWheelWeapon" .. f5_local4 .. ".enabled" ) then
						f5_local3 = f5_local4
						break
					end
				end
				Engine.SetModelValue( f5_local1, f5_local3 )
			end
			f5_arg0 = Engine.GetModelValue( f5_local1 )
			f3_local0()
			f5_local0 = true
		end
		f3_arg0.previousFocusWidget = f3_arg0.currentFocusWidget
		local f5_local3 = Engine.GetModel( f5_local2, "AbilityWheelWeapon" .. f5_arg0 )
		if CoD.SafeGetModelValue( f5_local3, "enabled" ) == true then
			f3_arg0.currentFocusWidget = f3_arg0["AbilityButton" .. f5_arg0]
			if f5_arg2 == nil then
				f3_arg0.currentAbilitySelected = f3_arg0.currentFocusWidget
				Engine.SetModelValue( f5_local1, f5_arg0 )
			end
		end
		if f3_arg0.currentFocusWidget ~= f3_arg0.previousFocusWidget or f5_local0 then
			if f5_local3 ~= nil then
				local f5_local4 = Engine.GetModel( f5_local3, "displayName" )
				local f5_local5 = Engine.GetModel( f5_local3, "description" )
				local f5_local6 = Engine.GetModel( f5_local3, "enemyTypeIcon" )
				local f5_local7 = Engine.SetModelValue
				local f5_local8 = Engine.GetModel( f5_local2, "selectedAbilityDisplayName" )
				local f5_local9
				if f5_local4 then
					f5_local9 = Engine.GetModelValue( f5_local4 )
					if not f5_local9 then
					
					else
						f5_local7( f5_local8, f5_local9 )
						f5_local7 = Engine.SetModelValue
						f5_local8 = Engine.GetModel( f5_local2, "selectedAbilityDisplayDesc" )
						if f5_local5 then
							f5_local9 = Engine.GetModelValue( f5_local5 )
							if not f5_local9 then
							
							else
								f5_local7( f5_local8, f5_local9 )
								f5_local7 = Engine.SetModelValue
								f5_local8 = Engine.GetModel( f5_local2, "selectedAbilityDisplayIcon" )
								if f5_local6 then
									f5_local9 = Engine.GetModelValue( f5_local6 )
									if not f5_local9 then
									
									else
										f5_local7( f5_local8, f5_local9 )
									end
								end
								f5_local9 = " "
							end
						end
						f5_local9 = " "
					end
				end
				f5_local9 = " "
			end
			if f3_arg0.currentFocusWidget ~= f3_arg0.previousFocusWidget then
				if f3_arg0.currentFocusWidget ~= nil then
					if f3_arg0.currentFocusWidget.gainFocus then
						f3_arg0.currentFocusWidget:gainFocus( f3_arg0.currentFocusWidget, {
							name = "gain_focus",
							controller = f3_arg1
						} )
						f3_arg0.currentFocusWidget.buttonNum = f5_arg0
					end
					if not f5_local0 then
						f3_arg0:playSound( "gain_focus" )
					end
				end
				if f3_arg0.previousFocusWidget ~= nil and f3_arg0.previousFocusWidget.loseFocus then
					f3_arg0.previousFocusWidget:loseFocus( f3_arg0.previousFocusWidget, {
						name = "lose_focus",
						controller = f3_arg1
					} )
				end
			end
		end
	end
	
	f3_arg0.updateButtonStates()
	f3_arg0:subscribeToGlobalModel( f3_arg1, "PerController", "RightStick.Length", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f3_arg0.length = modelValue
			f3_local0()
		end
	end )
	f3_arg0:subscribeToGlobalModel( f3_arg1, "PerController", "RightStick.Degrees", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f3_arg0.degrees = modelValue
			f3_local0()
		end
	end )
	local f3_local1 = f3_arg0.close
	f3_arg0.close = function ( f8_arg0 )
		local f8_local0 = f8_arg0.currentAbilitySelected
		if f8_local0 then
			f8_local0 = f8_arg0.currentAbilitySelected:getModel( f3_arg1, "name" )
		end
		if f8_local0 ~= nil then
			Engine.SendMenuResponse( f3_arg1, "AbilityWheel", Engine.GetModelValue( f8_local0 ) .. "," .. f8_arg0.currentAbilitySelected.buttonNum )
		else
			Engine.SendMenuResponse( f3_arg1, "AbilityWheel", "noAbilitySelected" )
		end
		if CoD.isPC then
			Engine.SendClientScriptEntityNotify( f3_arg1, "tactical_menu_close" )
		end
		f8_arg0.m_inputDisabled = true
		LockInput( f8_arg0, f3_arg1, false )
		Engine.SetUIActive( f3_arg1, false )
		f8_arg0:unsubscribeFromAllModels()
		f8_arg0:playSound( "menu_start_close" )
		f8_arg0:playClip( "Close" )
		f8_arg0:registerEventHandler( "clip_over", f3_local1 )
	end
	
	if CoD.useMouse then
		f3_arg0.onMouseFocus = function ( f9_arg0, f9_arg1 )
			if f9_arg1.isMouse then
				f3_arg0.updateButtonStates( f9_arg0.buttonNum, nil, true )
			end
		end
		
		f3_arg0.onMouseAction = function ( f10_arg0, f10_arg1 )
			if f10_arg1.isMouse and f10_arg0.buttonNum and Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "AbilityWheel" ), "AbilityWheelWeapon" .. f10_arg0.buttonNum ), "enabled" ) ) == true then
				f3_arg0.currentAbilitySelected = f10_arg0
				local f10_local0 = Engine.GetModelForController( f3_arg1 )
				Engine.SetModelValue( Engine.GetModel( f10_local0, "AbilityWheel.Selected" .. Engine.GetModelValue( Engine.GetModel( f10_local0, "hudItems.cybercomActiveType" ) ) + 1 ), f10_arg0.buttonNum )
				f3_arg0:close()
			end
		end
		
	end
	for f3_local2 = 1, 6, 1 do
		local f3_local5 = f3_arg0["AbilityButton" .. f3_local2]
		f3_local5.navigation = {}
		if CoD.useMouse then
			f3_local5.buttonNum = f3_local2
			f3_local5:registerEventHandler( "gain_focus", f3_arg0.onMouseFocus )
			f3_local5:registerEventHandler( "button_action", f3_arg0.onMouseAction )
		end
	end
end

LUI.createMenu.AbilityWheel = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AbilityWheel" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "AbilityWheel"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.AbilityWheel_Panel.new( self, controller )
	Panel:setLeftRight( false, false, -272, 272 )
	Panel:setTopBottom( false, false, -230, 314 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Multiply0 = CoD.AbilityWheel_Multiply.new( self, controller )
	Multiply0:setLeftRight( false, false, -336, 336 )
	Multiply0:setTopBottom( false, false, -314, 358 )
	self:addElement( Multiply0 )
	self.Multiply0 = Multiply0
	
	local Vignette = CoD.AbilityWheel_Vignette.new( self, controller )
	Vignette:setLeftRight( true, true, 0, 0 )
	Vignette:setTopBottom( true, false, 0, 720 )
	Vignette:setRGB( 0.47, 0.47, 0.47 )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( true, true, 240, -240 )
	Texture:setTopBottom( true, false, 81, 617 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local HexCenter = CoD.AbilityWheel_CenterHex.new( self, controller )
	HexCenter:setLeftRight( false, false, -144, 144 )
	HexCenter:setTopBottom( false, false, -119, 209 )
	HexCenter:setAlpha( 0 )
	self:addElement( HexCenter )
	self.HexCenter = HexCenter
	
	local ElementsSideL = CoD.AbilityWheel_ElementsSide.new( self, controller )
	ElementsSideL:setLeftRight( true, false, 16, 485 )
	ElementsSideL:setTopBottom( true, true, 47, -57 )
	self:addElement( ElementsSideL )
	self.ElementsSideL = ElementsSideL
	
	local ElementsSideR = CoD.AbilityWheel_ElementsSide.new( self, controller )
	ElementsSideR:setLeftRight( false, true, -485, -16 )
	ElementsSideR:setTopBottom( true, true, 47, -57 )
	ElementsSideR:setYRot( -180 )
	self:addElement( ElementsSideR )
	self.ElementsSideR = ElementsSideR
	
	local DNIContainer = CoD.AbilityWheel_DNIContainer.new( self, controller )
	DNIContainer:setLeftRight( true, true, 548, -548 )
	DNIContainer:setTopBottom( true, false, 5, 69 )
	self:addElement( DNIContainer )
	self.DNIContainer = DNIContainer
	
	local CenterElements = CoD.AbilityWheel_CenterElements.new( self, controller )
	CenterElements:setLeftRight( false, false, -108, 108 )
	CenterElements:setTopBottom( true, false, 300, 516 )
	self:addElement( CenterElements )
	self.CenterElements = CenterElements
	
	local BracketBlurBack = CoD.AbilityWheel_BracketBlur.new( self, controller )
	BracketBlurBack:setLeftRight( true, true, 236, -224.7 )
	BracketBlurBack:setTopBottom( true, false, 185.67, 798.33 )
	BracketBlurBack:setAlpha( 0.11 )
	BracketBlurBack:setZoom( -4000 )
	self:addElement( BracketBlurBack )
	self.BracketBlurBack = BracketBlurBack
	
	local AbilityButton6 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton6:setLeftRight( false, false, 104, 254 )
	AbilityButton6:setTopBottom( false, false, -135, 15 )
	AbilityButton6:setZRot( -60 )
	AbilityButton6.GrabBrakcetL:setAlpha( 0 )
	AbilityButton6.AbilitylIcon:setZRot( 60 )
	AbilityButton6:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon6", function ( model )
		AbilityButton6:setModel( model, controller )
	end )
	self:addElement( AbilityButton6 )
	self.AbilityButton6 = AbilityButton6
	
	local AbilityButton5 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton5:setLeftRight( false, false, 104, 254 )
	AbilityButton5:setTopBottom( false, false, 72, 222 )
	AbilityButton5:setZRot( -120 )
	AbilityButton5.GradBracketR:setAlpha( 0 )
	AbilityButton5.AbilitylIcon:setZRot( 120 )
	AbilityButton5:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon5", function ( model )
		AbilityButton5:setModel( model, controller )
	end )
	self:addElement( AbilityButton5 )
	self.AbilityButton5 = AbilityButton5
	
	local AbilityButton4 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton4:setLeftRight( false, false, -75, 75 )
	AbilityButton4:setTopBottom( false, false, 174, 324 )
	AbilityButton4:setZRot( 180 )
	AbilityButton4.GradBracketR:setAlpha( 0 )
	AbilityButton4.GrabBrakcetL:setAlpha( 0 )
	AbilityButton4.AbilitylIcon:setZRot( 180 )
	AbilityButton4:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon4", function ( model )
		AbilityButton4:setModel( model, controller )
	end )
	self:addElement( AbilityButton4 )
	self.AbilityButton4 = AbilityButton4
	
	local AbilityButton3 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton3:setLeftRight( false, false, -253, -103 )
	AbilityButton3:setTopBottom( false, false, 72, 222 )
	AbilityButton3:setZRot( -240 )
	AbilityButton3.GrabBrakcetL:setAlpha( 0 )
	AbilityButton3.AbilitylIcon:setZRot( 240 )
	AbilityButton3:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon3", function ( model )
		AbilityButton3:setModel( model, controller )
	end )
	self:addElement( AbilityButton3 )
	self.AbilityButton3 = AbilityButton3
	
	local AbilityButton2 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton2:setLeftRight( false, false, -253, -103 )
	AbilityButton2:setTopBottom( false, false, -135, 15 )
	AbilityButton2:setZRot( 60 )
	AbilityButton2.GradBracketR:setAlpha( 0 )
	AbilityButton2.AbilitylIcon:setZRot( -60 )
	AbilityButton2:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon2", function ( model )
		AbilityButton2:setModel( model, controller )
	end )
	self:addElement( AbilityButton2 )
	self.AbilityButton2 = AbilityButton2
	
	local AbilityButton1 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton1:setLeftRight( false, false, -75, 75 )
	AbilityButton1:setTopBottom( false, false, -241, -91 )
	AbilityButton1:setAlpha( RandomAddPercent( 20, 0.7 ) )
	AbilityButton1.GradBracketR:setAlpha( 0.3 )
	AbilityButton1.GrabBrakcetL:setAlpha( 0.3 )
	AbilityButton1:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon1", function ( model )
		AbilityButton1:setModel( model, controller )
	end )
	self:addElement( AbilityButton1 )
	self.AbilityButton1 = AbilityButton1
	
	local BracketBlur = CoD.AbilityWheel_BracketBlur.new( self, controller )
	BracketBlur:setLeftRight( true, true, 236, -224.7 )
	BracketBlur:setTopBottom( true, false, 90.67, 703.33 )
	BracketBlur:setAlpha( 0.15 )
	BracketBlur:setZoom( 200 )
	self:addElement( BracketBlur )
	self.BracketBlur = BracketBlur
	
	local TabC = CoD.AbilityWheel_TabC.new( self, controller )
	TabC:setLeftRight( false, false, -118, 115 )
	TabC:setTopBottom( true, false, 71, 125 )
	TabC:subscribeToGlobalModel( controller, "AbilityWheel", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			TabC.TextTab:setText( Engine.Localize( LocalizeToUpperString( name ) ) )
		end
	end )
	self:addElement( TabC )
	self.TabC = TabC
	
	local Description = CoD.AbilityWheel_Description.new( self, controller )
	Description:setLeftRight( false, false, -116.5, 116.5 )
	Description:setTopBottom( false, false, -171, 277 )
	Description:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Description:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayDesc", function ( model )
		local selectedAbilityDisplayDesc = Engine.GetModelValue( model )
		if selectedAbilityDisplayDesc then
			Description.AbilityWheelDescriptionBottom.TextDesc:setText( Engine.Localize( selectedAbilityDisplayDesc ) )
		end
	end )
	Description:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayName", function ( model )
		local selectedAbilityDisplayName = Engine.GetModelValue( model )
		if selectedAbilityDisplayName then
			Description.AbilityWheelDescriptionText.TextName:setText( Engine.Localize( selectedAbilityDisplayName ) )
		end
	end )
	Description:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayIcon", function ( model )
		local selectedAbilityDisplayIcon = Engine.GetModelValue( model )
		if selectedAbilityDisplayIcon then
			Description.AbilityWheelEnemyTypeIcon:setImage( RegisterImage( selectedAbilityDisplayIcon ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Contextual1 = CoD.AbilityWheel_AbilityContextual2.new( self, controller )
	Contextual1:setLeftRight( true, false, 17.5, 263.5 )
	Contextual1:setTopBottom( true, false, 219, 397 )
	Contextual1:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelContextualWeapon1", function ( model )
		Contextual1:setModel( model, controller )
	end )
	Contextual1:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "enabled" )
			end
		}
	} )
	Contextual1:linkToElementModel( Contextual1, "enabled", true, function ( model )
		self:updateElementState( Contextual1, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	self:addElement( Contextual1 )
	self.Contextual1 = Contextual1
	
	local Contextual2 = CoD.AbilityWheel_AbilityContextual2.new( self, controller )
	Contextual2:setLeftRight( true, false, 17.5, 263.5 )
	Contextual2:setTopBottom( true, false, 375, 553 )
	Contextual2:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelContextualWeapon2", function ( model )
		Contextual2:setModel( model, controller )
	end )
	Contextual2:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "enabled" )
			end
		}
	} )
	Contextual2:linkToElementModel( Contextual2, "enabled", true, function ( model )
		self:updateElementState( Contextual2, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	self:addElement( Contextual2 )
	self.Contextual2 = Contextual2
	
	local AbilityWheelCenterCore0 = CoD.AbilityWheel_CenterCore.new( self, controller )
	AbilityWheelCenterCore0:setLeftRight( true, true, 431, -434 )
	AbilityWheelCenterCore0:setTopBottom( true, false, 194, 616 )
	AbilityWheelCenterCore0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	AbilityWheelCenterCore0:setShaderVector( 0, 0, 0, 0, 0 )
	AbilityWheelCenterCore0:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelCenterCore0:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelCenterCore0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( AbilityWheelCenterCore0 )
	self.AbilityWheelCenterCore0 = AbilityWheelCenterCore0
	
	local AbilityWheelButtonBumperWidget = CoD.AbilityWheel_ButtonBumperWidget.new( self, controller )
	AbilityWheelButtonBumperWidget:setLeftRight( true, true, 480.32, -482 )
	AbilityWheelButtonBumperWidget:setTopBottom( true, false, 69, 95 )
	AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 1 ) )
	AbilityWheelButtonBumperWidget:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			AbilityWheelButtonBumperWidget.BumperLeft:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	AbilityWheelButtonBumperWidget:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			AbilityWheelButtonBumperWidget.BumperRight:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( AbilityWheelButtonBumperWidget )
	self.AbilityWheelButtonBumperWidget = AbilityWheelButtonBumperWidget
	
	AbilityButton6.navigation = {
		left = AbilityButton1,
		down = AbilityButton5
	}
	AbilityButton5.navigation = {
		left = AbilityButton4,
		up = AbilityButton6
	}
	AbilityButton4.navigation = {
		left = AbilityButton3,
		up = AbilityButton1,
		right = AbilityButton5
	}
	AbilityButton3.navigation = {
		up = AbilityButton2,
		right = AbilityButton4
	}
	AbilityButton2.navigation = {
		right = AbilityButton1,
		down = AbilityButton3
	}
	AbilityButton1.navigation = {
		left = AbilityButton2,
		right = AbilityButton6,
		down = AbilityButton4
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 1 )
					Panel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local Multiply0Frame2 = function ( Multiply0, event )
					if not event.interrupted then
						Multiply0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Multiply0:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( Multiply0, event )
					else
						Multiply0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Multiply0:completeAnimation()
				self.Multiply0:setRGB( 0, 0, 0 )
				Multiply0Frame2( Multiply0, {} )
				local VignetteFrame2 = function ( Vignette, event )
					if not event.interrupted then
						Vignette:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Vignette:setRGB( 0.47, 0.47, 0.47 )
					if event.interrupted then
						self.clipFinished( Vignette, event )
					else
						Vignette:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Vignette:completeAnimation()
				self.Vignette:setRGB( 0, 0, 0 )
				VignetteFrame2( Vignette, {} )
				local TextureFrame2 = function ( Texture, event )
					if not event.interrupted then
						Texture:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Texture:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Texture, event )
					else
						Texture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture:completeAnimation()
				self.Texture:setAlpha( 0 )
				TextureFrame2( Texture, {} )
				local HexCenterFrame2 = function ( HexCenter, event )
					local HexCenterFrame3 = function ( HexCenter, event )
						local HexCenterFrame4 = function ( HexCenter, event )
							local HexCenterFrame5 = function ( HexCenter, event )
								local HexCenterFrame6 = function ( HexCenter, event )
									local HexCenterFrame7 = function ( HexCenter, event )
										local HexCenterFrame8 = function ( HexCenter, event )
											local HexCenterFrame9 = function ( HexCenter, event )
												local HexCenterFrame10 = function ( HexCenter, event )
													local HexCenterFrame11 = function ( HexCenter, event )
														if not event.interrupted then
															HexCenter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														HexCenter:setAlpha( 1 )
														HexCenter:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( HexCenter, event )
														else
															HexCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HexCenterFrame11( HexCenter, event )
														return 
													else
														HexCenter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame11 )
													end
												end
												
												if event.interrupted then
													HexCenterFrame10( HexCenter, event )
													return 
												else
													HexCenter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													HexCenter:setAlpha( 0.8 )
													HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame10 )
												end
											end
											
											if event.interrupted then
												HexCenterFrame9( HexCenter, event )
												return 
											else
												HexCenter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame9 )
											end
										end
										
										if event.interrupted then
											HexCenterFrame8( HexCenter, event )
											return 
										else
											HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HexCenter:setAlpha( 1 )
											HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame8 )
										end
									end
									
									if event.interrupted then
										HexCenterFrame7( HexCenter, event )
										return 
									else
										HexCenter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame7 )
									end
								end
								
								if event.interrupted then
									HexCenterFrame6( HexCenter, event )
									return 
								else
									HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HexCenter:setAlpha( 0.7 )
									HexCenter:setZoom( 0 )
									HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame6 )
								end
							end
							
							if event.interrupted then
								HexCenterFrame5( HexCenter, event )
								return 
							else
								HexCenter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HexCenter:setZoom( 78.75 )
								HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame5 )
							end
						end
						
						if event.interrupted then
							HexCenterFrame4( HexCenter, event )
							return 
						else
							HexCenter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							HexCenter:setAlpha( 1 )
							HexCenter:setZoom( 236.25 )
							HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame4 )
						end
					end
					
					if event.interrupted then
						HexCenterFrame3( HexCenter, event )
						return 
					else
						HexCenter:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame3 )
					end
				end
				
				HexCenter:completeAnimation()
				self.HexCenter:setAlpha( 0 )
				self.HexCenter:setZoom( 315 )
				HexCenterFrame2( HexCenter, {} )
				local ElementsSideLFrame2 = function ( ElementsSideL, event )
					local ElementsSideLFrame3 = function ( ElementsSideL, event )
						local ElementsSideLFrame4 = function ( ElementsSideL, event )
							local ElementsSideLFrame5 = function ( ElementsSideL, event )
								local ElementsSideLFrame6 = function ( ElementsSideL, event )
									local ElementsSideLFrame7 = function ( ElementsSideL, event )
										local ElementsSideLFrame8 = function ( ElementsSideL, event )
											if not event.interrupted then
												ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											ElementsSideL:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( ElementsSideL, event )
											else
												ElementsSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ElementsSideLFrame8( ElementsSideL, event )
											return 
										else
											ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ElementsSideL:setAlpha( 0.2 )
											ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame8 )
										end
									end
									
									if event.interrupted then
										ElementsSideLFrame7( ElementsSideL, event )
										return 
									else
										ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame7 )
									end
								end
								
								if event.interrupted then
									ElementsSideLFrame6( ElementsSideL, event )
									return 
								else
									ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ElementsSideL:setAlpha( 0.6 )
									ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame6 )
								end
							end
							
							if event.interrupted then
								ElementsSideLFrame5( ElementsSideL, event )
								return 
							else
								ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ElementsSideL:setAlpha( 0 )
								ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame5 )
							end
						end
						
						if event.interrupted then
							ElementsSideLFrame4( ElementsSideL, event )
							return 
						else
							ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ElementsSideL:setAlpha( 0.3 )
							ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame4 )
						end
					end
					
					if event.interrupted then
						ElementsSideLFrame3( ElementsSideL, event )
						return 
					else
						ElementsSideL:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame3 )
					end
				end
				
				ElementsSideL:completeAnimation()
				self.ElementsSideL:setAlpha( 0 )
				ElementsSideLFrame2( ElementsSideL, {} )
				local ElementsSideRFrame2 = function ( ElementsSideR, event )
					local ElementsSideRFrame3 = function ( ElementsSideR, event )
						local ElementsSideRFrame4 = function ( ElementsSideR, event )
							local ElementsSideRFrame5 = function ( ElementsSideR, event )
								local ElementsSideRFrame6 = function ( ElementsSideR, event )
									local ElementsSideRFrame7 = function ( ElementsSideR, event )
										local ElementsSideRFrame8 = function ( ElementsSideR, event )
											if not event.interrupted then
												ElementsSideR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											ElementsSideR:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( ElementsSideR, event )
											else
												ElementsSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ElementsSideRFrame8( ElementsSideR, event )
											return 
										else
											ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ElementsSideR:setAlpha( 0.2 )
											ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame8 )
										end
									end
									
									if event.interrupted then
										ElementsSideRFrame7( ElementsSideR, event )
										return 
									else
										ElementsSideR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame7 )
									end
								end
								
								if event.interrupted then
									ElementsSideRFrame6( ElementsSideR, event )
									return 
								else
									ElementsSideR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ElementsSideR:setAlpha( 0.6 )
									ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame6 )
								end
							end
							
							if event.interrupted then
								ElementsSideRFrame5( ElementsSideR, event )
								return 
							else
								ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ElementsSideR:setAlpha( 0 )
								ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame5 )
							end
						end
						
						if event.interrupted then
							ElementsSideRFrame4( ElementsSideR, event )
							return 
						else
							ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ElementsSideR:setAlpha( 0.3 )
							ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame4 )
						end
					end
					
					if event.interrupted then
						ElementsSideRFrame3( ElementsSideR, event )
						return 
					else
						ElementsSideR:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame3 )
					end
				end
				
				ElementsSideR:completeAnimation()
				self.ElementsSideR:setAlpha( 0 )
				ElementsSideRFrame2( ElementsSideR, {} )
				local DNIContainerFrame2 = function ( DNIContainer, event )
					local DNIContainerFrame3 = function ( DNIContainer, event )
						local DNIContainerFrame4 = function ( DNIContainer, event )
							local DNIContainerFrame5 = function ( DNIContainer, event )
								local DNIContainerFrame6 = function ( DNIContainer, event )
									local DNIContainerFrame7 = function ( DNIContainer, event )
										local DNIContainerFrame8 = function ( DNIContainer, event )
											local DNIContainerFrame9 = function ( DNIContainer, event )
												local DNIContainerFrame10 = function ( DNIContainer, event )
													local DNIContainerFrame11 = function ( DNIContainer, event )
														if not event.interrupted then
															DNIContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														DNIContainer:setAlpha( 1 )
														DNIContainer:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( DNIContainer, event )
														else
															DNIContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														DNIContainerFrame11( DNIContainer, event )
														return 
													else
														DNIContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame11 )
													end
												end
												
												if event.interrupted then
													DNIContainerFrame10( DNIContainer, event )
													return 
												else
													DNIContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													DNIContainer:setAlpha( 0.8 )
													DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame10 )
												end
											end
											
											if event.interrupted then
												DNIContainerFrame9( DNIContainer, event )
												return 
											else
												DNIContainer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame9 )
											end
										end
										
										if event.interrupted then
											DNIContainerFrame8( DNIContainer, event )
											return 
										else
											DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											DNIContainer:setAlpha( 1 )
											DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame8 )
										end
									end
									
									if event.interrupted then
										DNIContainerFrame7( DNIContainer, event )
										return 
									else
										DNIContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame7 )
									end
								end
								
								if event.interrupted then
									DNIContainerFrame6( DNIContainer, event )
									return 
								else
									DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									DNIContainer:setAlpha( 0.6 )
									DNIContainer:setZoom( 0 )
									DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame6 )
								end
							end
							
							if event.interrupted then
								DNIContainerFrame5( DNIContainer, event )
								return 
							else
								DNIContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								DNIContainer:setZoom( 12.75 )
								DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame5 )
							end
						end
						
						if event.interrupted then
							DNIContainerFrame4( DNIContainer, event )
							return 
						else
							DNIContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							DNIContainer:setAlpha( 1 )
							DNIContainer:setZoom( 38.25 )
							DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame4 )
						end
					end
					
					if event.interrupted then
						DNIContainerFrame3( DNIContainer, event )
						return 
					else
						DNIContainer:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame3 )
					end
				end
				
				DNIContainer:completeAnimation()
				self.DNIContainer:setAlpha( 0 )
				self.DNIContainer:setZoom( 51 )
				DNIContainerFrame2( DNIContainer, {} )
				local CenterElementsFrame2 = function ( CenterElements, event )
					local CenterElementsFrame3 = function ( CenterElements, event )
						local CenterElementsFrame4 = function ( CenterElements, event )
							local CenterElementsFrame5 = function ( CenterElements, event )
								local CenterElementsFrame6 = function ( CenterElements, event )
									local CenterElementsFrame7 = function ( CenterElements, event )
										local CenterElementsFrame8 = function ( CenterElements, event )
											local CenterElementsFrame9 = function ( CenterElements, event )
												local CenterElementsFrame10 = function ( CenterElements, event )
													local CenterElementsFrame11 = function ( CenterElements, event )
														local CenterElementsFrame12 = function ( CenterElements, event )
															if not event.interrupted then
																CenterElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															CenterElements:setAlpha( 1 )
															CenterElements:setZoom( -40 )
															CenterElements:setScale( 1.1 )
															if event.interrupted then
																self.clipFinished( CenterElements, event )
															else
																CenterElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															CenterElementsFrame12( CenterElements, event )
															return 
														else
															CenterElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame12 )
														end
													end
													
													if event.interrupted then
														CenterElementsFrame11( CenterElements, event )
														return 
													else
														CenterElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														CenterElements:setAlpha( 0.8 )
														CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame11 )
													end
												end
												
												if event.interrupted then
													CenterElementsFrame10( CenterElements, event )
													return 
												else
													CenterElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame10 )
												end
											end
											
											if event.interrupted then
												CenterElementsFrame9( CenterElements, event )
												return 
											else
												CenterElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame9 )
											end
										end
										
										if event.interrupted then
											CenterElementsFrame8( CenterElements, event )
											return 
										else
											CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											CenterElements:setAlpha( 1 )
											CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame8 )
										end
									end
									
									if event.interrupted then
										CenterElementsFrame7( CenterElements, event )
										return 
									else
										CenterElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CenterElements:setZoom( -40 )
										CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame7 )
									end
								end
								
								if event.interrupted then
									CenterElementsFrame6( CenterElements, event )
									return 
								else
									CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CenterElements:setAlpha( 0.7 )
									CenterElements:setZoom( 0 )
									CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame6 )
								end
							end
							
							if event.interrupted then
								CenterElementsFrame5( CenterElements, event )
								return 
							else
								CenterElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								CenterElements:setZoom( -10 )
								CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame5 )
							end
						end
						
						if event.interrupted then
							CenterElementsFrame4( CenterElements, event )
							return 
						else
							CenterElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							CenterElements:setAlpha( 1 )
							CenterElements:setZoom( -30 )
							CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame4 )
						end
					end
					
					if event.interrupted then
						CenterElementsFrame3( CenterElements, event )
						return 
					else
						CenterElements:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame3 )
					end
				end
				
				CenterElements:completeAnimation()
				self.CenterElements:setAlpha( 0 )
				self.CenterElements:setZoom( -40 )
				self.CenterElements:setScale( 1.1 )
				CenterElementsFrame2( CenterElements, {} )
				local BracketBlurBackFrame2 = function ( BracketBlurBack, event )
					local BracketBlurBackFrame3 = function ( BracketBlurBack, event )
						local BracketBlurBackFrame4 = function ( BracketBlurBack, event )
							local BracketBlurBackFrame5 = function ( BracketBlurBack, event )
								local BracketBlurBackFrame6 = function ( BracketBlurBack, event )
									local BracketBlurBackFrame7 = function ( BracketBlurBack, event )
										if not event.interrupted then
											BracketBlurBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										BracketBlurBack:setAlpha( 0.11 )
										BracketBlurBack:setZoom( -4000 )
										if event.interrupted then
											self.clipFinished( BracketBlurBack, event )
										else
											BracketBlurBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BracketBlurBackFrame7( BracketBlurBack, event )
										return 
									else
										BracketBlurBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame7 )
									end
								end
								
								if event.interrupted then
									BracketBlurBackFrame6( BracketBlurBack, event )
									return 
								else
									BracketBlurBack:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									BracketBlurBack:setAlpha( 0 )
									BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame6 )
								end
							end
							
							if event.interrupted then
								BracketBlurBackFrame5( BracketBlurBack, event )
								return 
							else
								BracketBlurBack:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								BracketBlurBack:setAlpha( 0.11 )
								BracketBlurBack:setZoom( -4000 )
								BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame5 )
							end
						end
						
						if event.interrupted then
							BracketBlurBackFrame4( BracketBlurBack, event )
							return 
						else
							BracketBlurBack:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							BracketBlurBack:setAlpha( 0 )
							BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame4 )
						end
					end
					
					if event.interrupted then
						BracketBlurBackFrame3( BracketBlurBack, event )
						return 
					else
						BracketBlurBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						BracketBlurBack:setAlpha( 0.11 )
						BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame3 )
					end
				end
				
				BracketBlurBack:completeAnimation()
				self.BracketBlurBack:setAlpha( 0 )
				self.BracketBlurBack:setZoom( -8000 )
				BracketBlurBackFrame2( BracketBlurBack, {} )
				local AbilityButton6Frame2 = function ( AbilityButton6, event )
					local AbilityButton6Frame3 = function ( AbilityButton6, event )
						if not event.interrupted then
							AbilityButton6:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						AbilityButton6:setAlpha( 1 )
						AbilityButton6:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton6, event )
						else
							AbilityButton6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton6Frame3( AbilityButton6, event )
						return 
					else
						AbilityButton6:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame3 )
					end
				end
				
				AbilityButton6:completeAnimation()
				self.AbilityButton6:setAlpha( 0 )
				self.AbilityButton6:setZoom( -6000 )
				AbilityButton6Frame2( AbilityButton6, {} )
				local AbilityButton5Frame2 = function ( AbilityButton5, event )
					local AbilityButton5Frame3 = function ( AbilityButton5, event )
						if not event.interrupted then
							AbilityButton5:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						AbilityButton5:setAlpha( 1 )
						AbilityButton5:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton5, event )
						else
							AbilityButton5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton5Frame3( AbilityButton5, event )
						return 
					else
						AbilityButton5:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame3 )
					end
				end
				
				AbilityButton5:completeAnimation()
				self.AbilityButton5:setAlpha( 0 )
				self.AbilityButton5:setZoom( -6000 )
				AbilityButton5Frame2( AbilityButton5, {} )
				local AbilityButton4Frame2 = function ( AbilityButton4, event )
					local AbilityButton4Frame3 = function ( AbilityButton4, event )
						if not event.interrupted then
							AbilityButton4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						AbilityButton4:setAlpha( 1 )
						AbilityButton4:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton4, event )
						else
							AbilityButton4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton4Frame3( AbilityButton4, event )
						return 
					else
						AbilityButton4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame3 )
					end
				end
				
				AbilityButton4:completeAnimation()
				self.AbilityButton4:setAlpha( 0 )
				self.AbilityButton4:setZoom( -6000 )
				AbilityButton4Frame2( AbilityButton4, {} )
				local AbilityButton3Frame2 = function ( AbilityButton3, event )
					local AbilityButton3Frame3 = function ( AbilityButton3, event )
						if not event.interrupted then
							AbilityButton3:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						AbilityButton3:setAlpha( 1 )
						AbilityButton3:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton3, event )
						else
							AbilityButton3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton3Frame3( AbilityButton3, event )
						return 
					else
						AbilityButton3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame3 )
					end
				end
				
				AbilityButton3:completeAnimation()
				self.AbilityButton3:setAlpha( 0 )
				self.AbilityButton3:setZoom( -6000 )
				AbilityButton3Frame2( AbilityButton3, {} )
				local AbilityButton2Frame2 = function ( AbilityButton2, event )
					local AbilityButton2Frame3 = function ( AbilityButton2, event )
						if not event.interrupted then
							AbilityButton2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						AbilityButton2:setAlpha( 1 )
						AbilityButton2:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton2, event )
						else
							AbilityButton2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton2Frame3( AbilityButton2, event )
						return 
					else
						AbilityButton2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame3 )
					end
				end
				
				AbilityButton2:completeAnimation()
				self.AbilityButton2:setAlpha( 0 )
				self.AbilityButton2:setZoom( -6000 )
				AbilityButton2Frame2( AbilityButton2, {} )
				local AbilityButton1Frame2 = function ( AbilityButton1, event )
					local AbilityButton1Frame3 = function ( AbilityButton1, event )
						if not event.interrupted then
							AbilityButton1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						end
						AbilityButton1:setAlpha( RandomAddPercent( 20, 1 ) )
						AbilityButton1:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( AbilityButton1, event )
						else
							AbilityButton1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton1Frame3( AbilityButton1, event )
						return 
					else
						AbilityButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame3 )
					end
				end
				
				AbilityButton1:completeAnimation()
				self.AbilityButton1:setAlpha( RandomAddPercent( 20, 0 ) )
				self.AbilityButton1:setZoom( -6000 )
				AbilityButton1Frame2( AbilityButton1, {} )
				local BracketBlurFrame2 = function ( BracketBlur, event )
					local BracketBlurFrame3 = function ( BracketBlur, event )
						local BracketBlurFrame4 = function ( BracketBlur, event )
							local BracketBlurFrame5 = function ( BracketBlur, event )
								local BracketBlurFrame6 = function ( BracketBlur, event )
									local BracketBlurFrame7 = function ( BracketBlur, event )
										local BracketBlurFrame8 = function ( BracketBlur, event )
											if not event.interrupted then
												BracketBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											BracketBlur:setAlpha( 0.15 )
											BracketBlur:setZoom( 200 )
											if event.interrupted then
												self.clipFinished( BracketBlur, event )
											else
												BracketBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BracketBlurFrame8( BracketBlur, event )
											return 
										else
											BracketBlur:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame8 )
										end
									end
									
									if event.interrupted then
										BracketBlurFrame7( BracketBlur, event )
										return 
									else
										BracketBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										BracketBlur:setAlpha( 0.1 )
										BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame7 )
									end
								end
								
								if event.interrupted then
									BracketBlurFrame6( BracketBlur, event )
									return 
								else
									BracketBlur:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									BracketBlur:setAlpha( 0.2 )
									BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame6 )
								end
							end
							
							if event.interrupted then
								BracketBlurFrame5( BracketBlur, event )
								return 
							else
								BracketBlur:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								BracketBlur:setAlpha( 0 )
								BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame5 )
							end
						end
						
						if event.interrupted then
							BracketBlurFrame4( BracketBlur, event )
							return 
						else
							BracketBlur:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							BracketBlur:setAlpha( 0.11 )
							BracketBlur:setZoom( 200 )
							BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame4 )
						end
					end
					
					if event.interrupted then
						BracketBlurFrame3( BracketBlur, event )
						return 
					else
						BracketBlur:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BracketBlur:setAlpha( 0.2 )
						BracketBlur:setZoom( -1375 )
						BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame3 )
					end
				end
				
				BracketBlur:completeAnimation()
				self.BracketBlur:setAlpha( 0 )
				self.BracketBlur:setZoom( -4000 )
				BracketBlurFrame2( BracketBlur, {} )
				local TabCFrame2 = function ( TabC, event )
					local TabCFrame3 = function ( TabC, event )
						local TabCFrame4 = function ( TabC, event )
							local TabCFrame5 = function ( TabC, event )
								local TabCFrame6 = function ( TabC, event )
									local TabCFrame7 = function ( TabC, event )
										local TabCFrame8 = function ( TabC, event )
											local TabCFrame9 = function ( TabC, event )
												local TabCFrame10 = function ( TabC, event )
													local TabCFrame11 = function ( TabC, event )
														if not event.interrupted then
															TabC:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														TabC:setLeftRight( false, false, -118, 115 )
														TabC:setTopBottom( true, false, 71, 125 )
														TabC:setAlpha( 1 )
														TabC:setZoom( 0 )
														TabC:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
														if event.interrupted then
															self.clipFinished( TabC, event )
														else
															TabC:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														TabCFrame11( TabC, event )
														return 
													else
														TabC:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame11 )
													end
												end
												
												if event.interrupted then
													TabCFrame10( TabC, event )
													return 
												else
													TabC:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													TabC:setAlpha( 0.7 )
													TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame10 )
												end
											end
											
											if event.interrupted then
												TabCFrame9( TabC, event )
												return 
											else
												TabC:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame9 )
											end
										end
										
										if event.interrupted then
											TabCFrame8( TabC, event )
											return 
										else
											TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											TabC:setAlpha( 1 )
											TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame8 )
										end
									end
									
									if event.interrupted then
										TabCFrame7( TabC, event )
										return 
									else
										TabC:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame7 )
									end
								end
								
								if event.interrupted then
									TabCFrame6( TabC, event )
									return 
								else
									TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									TabC:setAlpha( 0.6 )
									TabC:setZoom( 0 )
									TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame6 )
								end
							end
							
							if event.interrupted then
								TabCFrame5( TabC, event )
								return 
							else
								TabC:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								TabC:setZoom( -28.5 )
								TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame5 )
							end
						end
						
						if event.interrupted then
							TabCFrame4( TabC, event )
							return 
						else
							TabC:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							TabC:setAlpha( 1 )
							TabC:setZoom( -85.5 )
							TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame4 )
						end
					end
					
					if event.interrupted then
						TabCFrame3( TabC, event )
						return 
					else
						TabC:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame3 )
					end
				end
				
				TabC:completeAnimation()
				self.TabC:setLeftRight( false, false, -118, 115 )
				self.TabC:setTopBottom( true, false, 71, 125 )
				self.TabC:setAlpha( 0 )
				self.TabC:setZoom( -114 )
				self.TabC:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				TabCFrame2( TabC, {} )
				local DescriptionFrame2 = function ( Description, event )
					local DescriptionFrame3 = function ( Description, event )
						local DescriptionFrame4 = function ( Description, event )
							local DescriptionFrame5 = function ( Description, event )
								local DescriptionFrame6 = function ( Description, event )
									local DescriptionFrame7 = function ( Description, event )
										local DescriptionFrame8 = function ( Description, event )
											local DescriptionFrame9 = function ( Description, event )
												local DescriptionFrame10 = function ( Description, event )
													local DescriptionFrame11 = function ( Description, event )
														if not event.interrupted then
															Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														Description:setLeftRight( false, false, -116.5, 116.5 )
														Description:setTopBottom( false, false, -171, 277 )
														Description:setAlpha( 1 )
														Description:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( Description, event )
														else
															Description:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														DescriptionFrame11( Description, event )
														return 
													else
														Description:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame11 )
													end
												end
												
												if event.interrupted then
													DescriptionFrame10( Description, event )
													return 
												else
													Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Description:setAlpha( 0.8 )
													Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame10 )
												end
											end
											
											if event.interrupted then
												DescriptionFrame9( Description, event )
												return 
											else
												Description:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame9 )
											end
										end
										
										if event.interrupted then
											DescriptionFrame8( Description, event )
											return 
										else
											Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Description:setAlpha( 1 )
											Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame8 )
										end
									end
									
									if event.interrupted then
										DescriptionFrame7( Description, event )
										return 
									else
										Description:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame7 )
									end
								end
								
								if event.interrupted then
									DescriptionFrame6( Description, event )
									return 
								else
									Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Description:setAlpha( 0.7 )
									Description:setZoom( 0 )
									Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame6 )
								end
							end
							
							if event.interrupted then
								DescriptionFrame5( Description, event )
								return 
							else
								Description:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Description:setZoom( 2.5 )
								Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame5 )
							end
						end
						
						if event.interrupted then
							DescriptionFrame4( Description, event )
							return 
						else
							Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Description:setAlpha( 1 )
							Description:setZoom( 7.5 )
							Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame4 )
						end
					end
					
					if event.interrupted then
						DescriptionFrame3( Description, event )
						return 
					else
						Description:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Description:setZoom( 10 )
						Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame3 )
					end
				end
				
				Description:completeAnimation()
				self.Description:setLeftRight( false, false, -116.5, 116.5 )
				self.Description:setTopBottom( false, false, -171, 277 )
				self.Description:setAlpha( 0 )
				self.Description:setZoom( 5 )
				DescriptionFrame2( Description, {} )
				local Contextual1Frame2 = function ( Contextual1, event )
					local Contextual1Frame3 = function ( Contextual1, event )
						local Contextual1Frame4 = function ( Contextual1, event )
							local Contextual1Frame5 = function ( Contextual1, event )
								local Contextual1Frame6 = function ( Contextual1, event )
									local Contextual1Frame7 = function ( Contextual1, event )
										local Contextual1Frame8 = function ( Contextual1, event )
											local Contextual1Frame9 = function ( Contextual1, event )
												local Contextual1Frame10 = function ( Contextual1, event )
													local Contextual1Frame11 = function ( Contextual1, event )
														if not event.interrupted then
															Contextual1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														Contextual1:setLeftRight( true, false, 17.5, 263.5 )
														Contextual1:setTopBottom( true, false, 37, 215 )
														Contextual1:setAlpha( 1 )
														Contextual1:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( Contextual1, event )
														else
															Contextual1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Contextual1Frame11( Contextual1, event )
														return 
													else
														Contextual1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame11 )
													end
												end
												
												if event.interrupted then
													Contextual1Frame10( Contextual1, event )
													return 
												else
													Contextual1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Contextual1:setAlpha( 0.8 )
													Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame10 )
												end
											end
											
											if event.interrupted then
												Contextual1Frame9( Contextual1, event )
												return 
											else
												Contextual1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame9 )
											end
										end
										
										if event.interrupted then
											Contextual1Frame8( Contextual1, event )
											return 
										else
											Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Contextual1:setAlpha( 1 )
											Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame8 )
										end
									end
									
									if event.interrupted then
										Contextual1Frame7( Contextual1, event )
										return 
									else
										Contextual1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame7 )
									end
								end
								
								if event.interrupted then
									Contextual1Frame6( Contextual1, event )
									return 
								else
									Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Contextual1:setAlpha( 0.5 )
									Contextual1:setZoom( 0 )
									Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame6 )
								end
							end
							
							if event.interrupted then
								Contextual1Frame5( Contextual1, event )
								return 
							else
								Contextual1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Contextual1:setZoom( 11 )
								Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame5 )
							end
						end
						
						if event.interrupted then
							Contextual1Frame4( Contextual1, event )
							return 
						else
							Contextual1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Contextual1:setAlpha( 1 )
							Contextual1:setZoom( 33 )
							Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame4 )
						end
					end
					
					if event.interrupted then
						Contextual1Frame3( Contextual1, event )
						return 
					else
						Contextual1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame3 )
					end
				end
				
				Contextual1:completeAnimation()
				self.Contextual1:setLeftRight( true, false, 17.5, 263.5 )
				self.Contextual1:setTopBottom( true, false, 37, 215 )
				self.Contextual1:setAlpha( 0 )
				self.Contextual1:setZoom( 44 )
				Contextual1Frame2( Contextual1, {} )
				local Contextual2Frame2 = function ( Contextual2, event )
					local Contextual2Frame3 = function ( Contextual2, event )
						local Contextual2Frame4 = function ( Contextual2, event )
							local Contextual2Frame5 = function ( Contextual2, event )
								local Contextual2Frame6 = function ( Contextual2, event )
									local Contextual2Frame7 = function ( Contextual2, event )
										local Contextual2Frame8 = function ( Contextual2, event )
											local Contextual2Frame9 = function ( Contextual2, event )
												local Contextual2Frame10 = function ( Contextual2, event )
													local Contextual2Frame11 = function ( Contextual2, event )
														if not event.interrupted then
															Contextual2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														end
														Contextual2:setLeftRight( true, false, 17.5, 263.5 )
														Contextual2:setTopBottom( true, false, 37, 215 )
														Contextual2:setAlpha( 1 )
														Contextual2:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( Contextual2, event )
														else
															Contextual2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Contextual2Frame11( Contextual2, event )
														return 
													else
														Contextual2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame11 )
													end
												end
												
												if event.interrupted then
													Contextual2Frame10( Contextual2, event )
													return 
												else
													Contextual2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Contextual2:setAlpha( 0.8 )
													Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame10 )
												end
											end
											
											if event.interrupted then
												Contextual2Frame9( Contextual2, event )
												return 
											else
												Contextual2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame9 )
											end
										end
										
										if event.interrupted then
											Contextual2Frame8( Contextual2, event )
											return 
										else
											Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Contextual2:setAlpha( 1 )
											Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame8 )
										end
									end
									
									if event.interrupted then
										Contextual2Frame7( Contextual2, event )
										return 
									else
										Contextual2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame7 )
									end
								end
								
								if event.interrupted then
									Contextual2Frame6( Contextual2, event )
									return 
								else
									Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Contextual2:setAlpha( 0.5 )
									Contextual2:setZoom( 0 )
									Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame6 )
								end
							end
							
							if event.interrupted then
								Contextual2Frame5( Contextual2, event )
								return 
							else
								Contextual2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Contextual2:setZoom( 9.75 )
								Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame5 )
							end
						end
						
						if event.interrupted then
							Contextual2Frame4( Contextual2, event )
							return 
						else
							Contextual2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Contextual2:setAlpha( 1 )
							Contextual2:setZoom( 29.25 )
							Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame4 )
						end
					end
					
					if event.interrupted then
						Contextual2Frame3( Contextual2, event )
						return 
					else
						Contextual2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame3 )
					end
				end
				
				Contextual2:completeAnimation()
				self.Contextual2:setLeftRight( true, false, 17.5, 263.5 )
				self.Contextual2:setTopBottom( true, false, 37, 215 )
				self.Contextual2:setAlpha( 0 )
				self.Contextual2:setZoom( 39 )
				Contextual2Frame2( Contextual2, {} )
				local AbilityWheelCenterCore0Frame2 = function ( AbilityWheelCenterCore0, event )
					local AbilityWheelCenterCore0Frame3 = function ( AbilityWheelCenterCore0, event )
						local AbilityWheelCenterCore0Frame4 = function ( AbilityWheelCenterCore0, event )
							local AbilityWheelCenterCore0Frame5 = function ( AbilityWheelCenterCore0, event )
								if not event.interrupted then
									AbilityWheelCenterCore0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								end
								AbilityWheelCenterCore0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( AbilityWheelCenterCore0, event )
								else
									AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								AbilityWheelCenterCore0Frame5( AbilityWheelCenterCore0, event )
								return 
							else
								AbilityWheelCenterCore0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								AbilityWheelCenterCore0:setAlpha( 0.26 )
								AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", AbilityWheelCenterCore0Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelCenterCore0Frame4( AbilityWheelCenterCore0, event )
							return 
						else
							AbilityWheelCenterCore0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							AbilityWheelCenterCore0:setAlpha( 0.47 )
							AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", AbilityWheelCenterCore0Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelCenterCore0Frame3( AbilityWheelCenterCore0, event )
						return 
					else
						AbilityWheelCenterCore0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						AbilityWheelCenterCore0:setAlpha( 0.26 )
						AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", AbilityWheelCenterCore0Frame3 )
					end
				end
				
				AbilityWheelCenterCore0:completeAnimation()
				self.AbilityWheelCenterCore0:setAlpha( 0 )
				AbilityWheelCenterCore0Frame2( AbilityWheelCenterCore0, {} )
				local AbilityWheelButtonBumperWidgetFrame2 = function ( AbilityWheelButtonBumperWidget, event )
					local AbilityWheelButtonBumperWidgetFrame3 = function ( AbilityWheelButtonBumperWidget, event )
						if not event.interrupted then
							AbilityWheelButtonBumperWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 1 ) )
						if event.interrupted then
							self.clipFinished( AbilityWheelButtonBumperWidget, event )
						else
							AbilityWheelButtonBumperWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelButtonBumperWidgetFrame3( AbilityWheelButtonBumperWidget, event )
						return 
					else
						AbilityWheelButtonBumperWidget:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						AbilityWheelButtonBumperWidget:registerEventHandler( "transition_complete_keyframe", AbilityWheelButtonBumperWidgetFrame3 )
					end
				end
				
				AbilityWheelButtonBumperWidget:completeAnimation()
				self.AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 0 ) )
				AbilityWheelButtonBumperWidgetFrame2( AbilityWheelButtonBumperWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 23 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
					end
					Panel:setAlpha( 0 )
					Panel:setZoom( -455 )
					if event.interrupted then
						self.clipFinished( Panel, event )
					else
						Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.Panel:setZoom( 0 )
				PanelFrame2( Panel, {} )
				local Multiply0Frame2 = function ( Multiply0, event )
					if not event.interrupted then
						Multiply0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Multiply0:setRGB( 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Multiply0, event )
					else
						Multiply0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Multiply0:completeAnimation()
				self.Multiply0:setRGB( 1, 1, 1 )
				Multiply0Frame2( Multiply0, {} )
				local VignetteFrame2 = function ( Vignette, event )
					if not event.interrupted then
						Vignette:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Vignette:setRGB( 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Vignette, event )
					else
						Vignette:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Vignette:completeAnimation()
				self.Vignette:setRGB( 0.47, 0.47, 0.47 )
				VignetteFrame2( Vignette, {} )
				local TextureFrame2 = function ( Texture, event )
					if not event.interrupted then
						Texture:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Texture:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Texture, event )
					else
						Texture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture:completeAnimation()
				self.Texture:setAlpha( 1 )
				TextureFrame2( Texture, {} )
				local HexCenterFrame2 = function ( HexCenter, event )
					local HexCenterFrame3 = function ( HexCenter, event )
						local HexCenterFrame4 = function ( HexCenter, event )
							local HexCenterFrame5 = function ( HexCenter, event )
								local HexCenterFrame6 = function ( HexCenter, event )
									local HexCenterFrame7 = function ( HexCenter, event )
										local HexCenterFrame8 = function ( HexCenter, event )
											if not event.interrupted then
												HexCenter:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											end
											HexCenter:setAlpha( 0 )
											HexCenter:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( HexCenter, event )
											else
												HexCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											HexCenterFrame8( HexCenter, event )
											return 
										else
											HexCenter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											HexCenter:setAlpha( 0.6 )
											HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame8 )
										end
									end
									
									if event.interrupted then
										HexCenterFrame7( HexCenter, event )
										return 
									else
										HexCenter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame7 )
									end
								end
								
								if event.interrupted then
									HexCenterFrame6( HexCenter, event )
									return 
								else
									HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HexCenter:setAlpha( 0 )
									HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame6 )
								end
							end
							
							if event.interrupted then
								HexCenterFrame5( HexCenter, event )
								return 
							else
								HexCenter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame5 )
							end
						end
						
						if event.interrupted then
							HexCenterFrame4( HexCenter, event )
							return 
						else
							HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HexCenter:setAlpha( 1 )
							HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame4 )
						end
					end
					
					if event.interrupted then
						HexCenterFrame3( HexCenter, event )
						return 
					else
						HexCenter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame3 )
					end
				end
				
				HexCenter:completeAnimation()
				self.HexCenter:setAlpha( 0 )
				self.HexCenter:setZoom( 0 )
				HexCenterFrame2( HexCenter, {} )
				local ElementsSideLFrame2 = function ( ElementsSideL, event )
					local ElementsSideLFrame3 = function ( ElementsSideL, event )
						local ElementsSideLFrame4 = function ( ElementsSideL, event )
							local ElementsSideLFrame5 = function ( ElementsSideL, event )
								local ElementsSideLFrame6 = function ( ElementsSideL, event )
									local ElementsSideLFrame7 = function ( ElementsSideL, event )
										local ElementsSideLFrame8 = function ( ElementsSideL, event )
											local ElementsSideLFrame9 = function ( ElementsSideL, event )
												if not event.interrupted then
													ElementsSideL:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
												end
												ElementsSideL:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( ElementsSideL, event )
												else
													ElementsSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ElementsSideLFrame9( ElementsSideL, event )
												return 
											else
												ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ElementsSideL:setAlpha( 0.6 )
												ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame9 )
											end
										end
										
										if event.interrupted then
											ElementsSideLFrame8( ElementsSideL, event )
											return 
										else
											ElementsSideL:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame8 )
										end
									end
									
									if event.interrupted then
										ElementsSideLFrame7( ElementsSideL, event )
										return 
									else
										ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ElementsSideL:setAlpha( 0 )
										ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame7 )
									end
								end
								
								if event.interrupted then
									ElementsSideLFrame6( ElementsSideL, event )
									return 
								else
									ElementsSideL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame6 )
								end
							end
							
							if event.interrupted then
								ElementsSideLFrame5( ElementsSideL, event )
								return 
							else
								ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ElementsSideL:setAlpha( 1 )
								ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame5 )
							end
						end
						
						if event.interrupted then
							ElementsSideLFrame4( ElementsSideL, event )
							return 
						else
							ElementsSideL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame4 )
						end
					end
					
					if event.interrupted then
						ElementsSideLFrame3( ElementsSideL, event )
						return 
					else
						ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame3 )
					end
				end
				
				ElementsSideL:completeAnimation()
				self.ElementsSideL:setAlpha( 0 )
				ElementsSideLFrame2( ElementsSideL, {} )
				local ElementsSideRFrame2 = function ( ElementsSideR, event )
					local ElementsSideRFrame3 = function ( ElementsSideR, event )
						local ElementsSideRFrame4 = function ( ElementsSideR, event )
							local ElementsSideRFrame5 = function ( ElementsSideR, event )
								local ElementsSideRFrame6 = function ( ElementsSideR, event )
									local ElementsSideRFrame7 = function ( ElementsSideR, event )
										local ElementsSideRFrame8 = function ( ElementsSideR, event )
											if not event.interrupted then
												ElementsSideR:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											end
											ElementsSideR:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( ElementsSideR, event )
											else
												ElementsSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ElementsSideRFrame8( ElementsSideR, event )
											return 
										else
											ElementsSideR:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ElementsSideR:setAlpha( 0.6 )
											ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame8 )
										end
									end
									
									if event.interrupted then
										ElementsSideRFrame7( ElementsSideR, event )
										return 
									else
										ElementsSideR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame7 )
									end
								end
								
								if event.interrupted then
									ElementsSideRFrame6( ElementsSideR, event )
									return 
								else
									ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ElementsSideR:setAlpha( 0 )
									ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame6 )
								end
							end
							
							if event.interrupted then
								ElementsSideRFrame5( ElementsSideR, event )
								return 
							else
								ElementsSideR:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame5 )
							end
						end
						
						if event.interrupted then
							ElementsSideRFrame4( ElementsSideR, event )
							return 
						else
							ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ElementsSideR:setAlpha( 1 )
							ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame4 )
						end
					end
					
					if event.interrupted then
						ElementsSideRFrame3( ElementsSideR, event )
						return 
					else
						ElementsSideR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ElementsSideR:registerEventHandler( "transition_complete_keyframe", ElementsSideRFrame3 )
					end
				end
				
				ElementsSideR:completeAnimation()
				self.ElementsSideR:setAlpha( 0 )
				ElementsSideRFrame2( ElementsSideR, {} )
				local DNIContainerFrame2 = function ( DNIContainer, event )
					local DNIContainerFrame3 = function ( DNIContainer, event )
						local DNIContainerFrame4 = function ( DNIContainer, event )
							local DNIContainerFrame5 = function ( DNIContainer, event )
								local DNIContainerFrame6 = function ( DNIContainer, event )
									local DNIContainerFrame7 = function ( DNIContainer, event )
										local DNIContainerFrame8 = function ( DNIContainer, event )
											local DNIContainerFrame9 = function ( DNIContainer, event )
												if not event.interrupted then
													DNIContainer:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
												end
												DNIContainer:setAlpha( 0 )
												DNIContainer:setZoom( 0 )
												if event.interrupted then
													self.clipFinished( DNIContainer, event )
												else
													DNIContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												DNIContainerFrame9( DNIContainer, event )
												return 
											else
												DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DNIContainer:setAlpha( 0.6 )
												DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame9 )
											end
										end
										
										if event.interrupted then
											DNIContainerFrame8( DNIContainer, event )
											return 
										else
											DNIContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame8 )
										end
									end
									
									if event.interrupted then
										DNIContainerFrame7( DNIContainer, event )
										return 
									else
										DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										DNIContainer:setAlpha( 0 )
										DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame7 )
									end
								end
								
								if event.interrupted then
									DNIContainerFrame6( DNIContainer, event )
									return 
								else
									DNIContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame6 )
								end
							end
							
							if event.interrupted then
								DNIContainerFrame5( DNIContainer, event )
								return 
							else
								DNIContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								DNIContainer:setAlpha( 1 )
								DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame5 )
							end
						end
						
						if event.interrupted then
							DNIContainerFrame4( DNIContainer, event )
							return 
						else
							DNIContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame4 )
						end
					end
					
					if event.interrupted then
						DNIContainerFrame3( DNIContainer, event )
						return 
					else
						DNIContainer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame3 )
					end
				end
				
				DNIContainer:completeAnimation()
				self.DNIContainer:setAlpha( 0 )
				self.DNIContainer:setZoom( 0 )
				DNIContainerFrame2( DNIContainer, {} )
				local CenterElementsFrame2 = function ( CenterElements, event )
					local CenterElementsFrame3 = function ( CenterElements, event )
						local CenterElementsFrame4 = function ( CenterElements, event )
							local CenterElementsFrame5 = function ( CenterElements, event )
								local CenterElementsFrame6 = function ( CenterElements, event )
									local CenterElementsFrame7 = function ( CenterElements, event )
										local CenterElementsFrame8 = function ( CenterElements, event )
											if not event.interrupted then
												CenterElements:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											end
											CenterElements:setAlpha( 0 )
											CenterElements:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( CenterElements, event )
											else
												CenterElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											CenterElementsFrame8( CenterElements, event )
											return 
										else
											CenterElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											CenterElements:setAlpha( 1 )
											CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame8 )
										end
									end
									
									if event.interrupted then
										CenterElementsFrame7( CenterElements, event )
										return 
									else
										CenterElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame7 )
									end
								end
								
								if event.interrupted then
									CenterElementsFrame6( CenterElements, event )
									return 
								else
									CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CenterElements:setAlpha( 0 )
									CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame6 )
								end
							end
							
							if event.interrupted then
								CenterElementsFrame5( CenterElements, event )
								return 
							else
								CenterElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame5 )
							end
						end
						
						if event.interrupted then
							CenterElementsFrame4( CenterElements, event )
							return 
						else
							CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CenterElements:setAlpha( 1 )
							CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame4 )
						end
					end
					
					if event.interrupted then
						CenterElementsFrame3( CenterElements, event )
						return 
					else
						CenterElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame3 )
					end
				end
				
				CenterElements:completeAnimation()
				self.CenterElements:setAlpha( 0 )
				self.CenterElements:setZoom( 0 )
				CenterElementsFrame2( CenterElements, {} )
				local BracketBlurBackFrame2 = function ( BracketBlurBack, event )
					if not event.interrupted then
						BracketBlurBack:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BracketBlurBack:setAlpha( 0 )
					BracketBlurBack:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( BracketBlurBack, event )
					else
						BracketBlurBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketBlurBack:completeAnimation()
				self.BracketBlurBack:setAlpha( 0.11 )
				self.BracketBlurBack:setZoom( -4000 )
				BracketBlurBackFrame2( BracketBlurBack, {} )
				local AbilityButton6Frame2 = function ( AbilityButton6, event )
					local AbilityButton6Frame3 = function ( AbilityButton6, event )
						if not event.interrupted then
							AbilityButton6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton6:setAlpha( 0 )
						AbilityButton6:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton6, event )
						else
							AbilityButton6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton6Frame3( AbilityButton6, event )
						return 
					else
						AbilityButton6:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton6:setAlpha( 0 )
						AbilityButton6:setZoom( 700 )
						AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame3 )
					end
				end
				
				AbilityButton6:completeAnimation()
				self.AbilityButton6:setAlpha( 1 )
				self.AbilityButton6:setZoom( 0 )
				AbilityButton6Frame2( AbilityButton6, {} )
				local AbilityButton5Frame2 = function ( AbilityButton5, event )
					local AbilityButton5Frame3 = function ( AbilityButton5, event )
						if not event.interrupted then
							AbilityButton5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton5:setAlpha( 0 )
						AbilityButton5:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton5, event )
						else
							AbilityButton5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton5Frame3( AbilityButton5, event )
						return 
					else
						AbilityButton5:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton5:setAlpha( 0 )
						AbilityButton5:setZoom( 700 )
						AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame3 )
					end
				end
				
				AbilityButton5:completeAnimation()
				self.AbilityButton5:setAlpha( 1 )
				self.AbilityButton5:setZoom( 0 )
				AbilityButton5Frame2( AbilityButton5, {} )
				local AbilityButton4Frame2 = function ( AbilityButton4, event )
					local AbilityButton4Frame3 = function ( AbilityButton4, event )
						if not event.interrupted then
							AbilityButton4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton4:setAlpha( 0 )
						AbilityButton4:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton4, event )
						else
							AbilityButton4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton4Frame3( AbilityButton4, event )
						return 
					else
						AbilityButton4:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton4:setAlpha( 0 )
						AbilityButton4:setZoom( 700 )
						AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame3 )
					end
				end
				
				AbilityButton4:completeAnimation()
				self.AbilityButton4:setAlpha( 1 )
				self.AbilityButton4:setZoom( 0 )
				AbilityButton4Frame2( AbilityButton4, {} )
				local AbilityButton3Frame2 = function ( AbilityButton3, event )
					local AbilityButton3Frame3 = function ( AbilityButton3, event )
						if not event.interrupted then
							AbilityButton3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton3:setAlpha( 0 )
						AbilityButton3:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton3, event )
						else
							AbilityButton3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton3Frame3( AbilityButton3, event )
						return 
					else
						AbilityButton3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton3:setAlpha( 0 )
						AbilityButton3:setZoom( 700 )
						AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame3 )
					end
				end
				
				AbilityButton3:completeAnimation()
				self.AbilityButton3:setAlpha( 1 )
				self.AbilityButton3:setZoom( 0 )
				AbilityButton3Frame2( AbilityButton3, {} )
				local AbilityButton2Frame2 = function ( AbilityButton2, event )
					local AbilityButton2Frame3 = function ( AbilityButton2, event )
						if not event.interrupted then
							AbilityButton2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton2:setAlpha( 0 )
						AbilityButton2:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton2, event )
						else
							AbilityButton2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton2Frame3( AbilityButton2, event )
						return 
					else
						AbilityButton2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton2:setAlpha( 0 )
						AbilityButton2:setZoom( 700 )
						AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame3 )
					end
				end
				
				AbilityButton2:completeAnimation()
				self.AbilityButton2:setAlpha( 1 )
				self.AbilityButton2:setZoom( 0 )
				AbilityButton2Frame2( AbilityButton2, {} )
				local AbilityButton1Frame2 = function ( AbilityButton1, event )
					local AbilityButton1Frame3 = function ( AbilityButton1, event )
						if not event.interrupted then
							AbilityButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						AbilityButton1:setAlpha( RandomAddPercent( 20, 0 ) )
						AbilityButton1:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( AbilityButton1, event )
						else
							AbilityButton1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityButton1Frame3( AbilityButton1, event )
						return 
					else
						AbilityButton1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						AbilityButton1:setAlpha( RandomAddPercent( 20, 0 ) )
						AbilityButton1:setZoom( 700 )
						AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame3 )
					end
				end
				
				AbilityButton1:completeAnimation()
				self.AbilityButton1:setAlpha( RandomAddPercent( 20, 0.7 ) )
				self.AbilityButton1:setZoom( 0 )
				AbilityButton1Frame2( AbilityButton1, {} )
				local BracketBlurFrame2 = function ( BracketBlur, event )
					if not event.interrupted then
						BracketBlur:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					BracketBlur:setAlpha( 0 )
					BracketBlur:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( BracketBlur, event )
					else
						BracketBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketBlur:completeAnimation()
				self.BracketBlur:setAlpha( 0.15 )
				self.BracketBlur:setZoom( 200 )
				BracketBlurFrame2( BracketBlur, {} )
				local TabCFrame2 = function ( TabC, event )
					local TabCFrame3 = function ( TabC, event )
						local TabCFrame4 = function ( TabC, event )
							local TabCFrame5 = function ( TabC, event )
								local TabCFrame6 = function ( TabC, event )
									local TabCFrame7 = function ( TabC, event )
										local TabCFrame8 = function ( TabC, event )
											local TabCFrame9 = function ( TabC, event )
												if not event.interrupted then
													TabC:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												end
												TabC:setLeftRight( false, false, -118, 115 )
												TabC:setTopBottom( true, false, 71, 125 )
												TabC:setAlpha( 0 )
												TabC:setZoom( 0 )
												if event.interrupted then
													self.clipFinished( TabC, event )
												else
													TabC:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												TabCFrame9( TabC, event )
												return 
											else
												TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												TabC:setAlpha( 0.4 )
												TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame9 )
											end
										end
										
										if event.interrupted then
											TabCFrame8( TabC, event )
											return 
										else
											TabC:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame8 )
										end
									end
									
									if event.interrupted then
										TabCFrame7( TabC, event )
										return 
									else
										TabC:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										TabC:setAlpha( 0 )
										TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame7 )
									end
								end
								
								if event.interrupted then
									TabCFrame6( TabC, event )
									return 
								else
									TabC:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame6 )
								end
							end
							
							if event.interrupted then
								TabCFrame5( TabC, event )
								return 
							else
								TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								TabC:setAlpha( 1 )
								TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame5 )
							end
						end
						
						if event.interrupted then
							TabCFrame4( TabC, event )
							return 
						else
							TabC:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame4 )
						end
					end
					
					if event.interrupted then
						TabCFrame3( TabC, event )
						return 
					else
						TabC:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame3 )
					end
				end
				
				TabC:completeAnimation()
				self.TabC:setLeftRight( false, false, -118, 115 )
				self.TabC:setTopBottom( true, false, 71, 125 )
				self.TabC:setAlpha( 0 )
				self.TabC:setZoom( 0 )
				TabCFrame2( TabC, {} )
				local DescriptionFrame2 = function ( Description, event )
					local DescriptionFrame3 = function ( Description, event )
						local DescriptionFrame4 = function ( Description, event )
							local DescriptionFrame5 = function ( Description, event )
								local DescriptionFrame6 = function ( Description, event )
									local DescriptionFrame7 = function ( Description, event )
										local DescriptionFrame8 = function ( Description, event )
											if not event.interrupted then
												Description:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											end
											Description:setAlpha( 0 )
											Description:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( Description, event )
											else
												Description:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											DescriptionFrame8( Description, event )
											return 
										else
											Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Description:setAlpha( 0.4 )
											Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame8 )
										end
									end
									
									if event.interrupted then
										DescriptionFrame7( Description, event )
										return 
									else
										Description:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame7 )
									end
								end
								
								if event.interrupted then
									DescriptionFrame6( Description, event )
									return 
								else
									Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Description:setAlpha( 0 )
									Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame6 )
								end
							end
							
							if event.interrupted then
								DescriptionFrame5( Description, event )
								return 
							else
								Description:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame5 )
							end
						end
						
						if event.interrupted then
							DescriptionFrame4( Description, event )
							return 
						else
							Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Description:setAlpha( 1 )
							Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame4 )
						end
					end
					
					if event.interrupted then
						DescriptionFrame3( Description, event )
						return 
					else
						Description:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame3 )
					end
				end
				
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.Description:setZoom( 0 )
				DescriptionFrame2( Description, {} )
				local Contextual1Frame2 = function ( Contextual1, event )
					local Contextual1Frame3 = function ( Contextual1, event )
						local Contextual1Frame4 = function ( Contextual1, event )
							local Contextual1Frame5 = function ( Contextual1, event )
								local Contextual1Frame6 = function ( Contextual1, event )
									local Contextual1Frame7 = function ( Contextual1, event )
										local Contextual1Frame8 = function ( Contextual1, event )
											if not event.interrupted then
												Contextual1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											end
											Contextual1:setAlpha( 0 )
											Contextual1:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( Contextual1, event )
											else
												Contextual1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Contextual1Frame8( Contextual1, event )
											return 
										else
											Contextual1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Contextual1:setAlpha( 0.4 )
											Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame8 )
										end
									end
									
									if event.interrupted then
										Contextual1Frame7( Contextual1, event )
										return 
									else
										Contextual1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame7 )
									end
								end
								
								if event.interrupted then
									Contextual1Frame6( Contextual1, event )
									return 
								else
									Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Contextual1:setAlpha( 0 )
									Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame6 )
								end
							end
							
							if event.interrupted then
								Contextual1Frame5( Contextual1, event )
								return 
							else
								Contextual1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame5 )
							end
						end
						
						if event.interrupted then
							Contextual1Frame4( Contextual1, event )
							return 
						else
							Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Contextual1:setAlpha( 1 )
							Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame4 )
						end
					end
					
					if event.interrupted then
						Contextual1Frame3( Contextual1, event )
						return 
					else
						Contextual1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame3 )
					end
				end
				
				Contextual1:completeAnimation()
				self.Contextual1:setAlpha( 0 )
				self.Contextual1:setZoom( 0 )
				Contextual1Frame2( Contextual1, {} )
				local Contextual2Frame2 = function ( Contextual2, event )
					local Contextual2Frame3 = function ( Contextual2, event )
						local Contextual2Frame4 = function ( Contextual2, event )
							local Contextual2Frame5 = function ( Contextual2, event )
								local Contextual2Frame6 = function ( Contextual2, event )
									local Contextual2Frame7 = function ( Contextual2, event )
										if not event.interrupted then
											Contextual2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										Contextual2:setAlpha( 0 )
										Contextual2:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( Contextual2, event )
										else
											Contextual2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Contextual2Frame7( Contextual2, event )
										return 
									else
										Contextual2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Contextual2:setAlpha( 0.4 )
										Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame7 )
									end
								end
								
								if event.interrupted then
									Contextual2Frame6( Contextual2, event )
									return 
								else
									Contextual2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame6 )
								end
							end
							
							if event.interrupted then
								Contextual2Frame5( Contextual2, event )
								return 
							else
								Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Contextual2:setAlpha( 1 )
								Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame5 )
							end
						end
						
						if event.interrupted then
							Contextual2Frame4( Contextual2, event )
							return 
						else
							Contextual2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame4 )
						end
					end
					
					if event.interrupted then
						Contextual2Frame3( Contextual2, event )
						return 
					else
						Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame3 )
					end
				end
				
				Contextual2:completeAnimation()
				self.Contextual2:setAlpha( 0 )
				self.Contextual2:setZoom( 0 )
				Contextual2Frame2( Contextual2, {} )
				local AbilityWheelCenterCore0Frame2 = function ( AbilityWheelCenterCore0, event )
					local AbilityWheelCenterCore0Frame3 = function ( AbilityWheelCenterCore0, event )
						local AbilityWheelCenterCore0Frame4 = function ( AbilityWheelCenterCore0, event )
							if not event.interrupted then
								AbilityWheelCenterCore0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							end
							AbilityWheelCenterCore0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AbilityWheelCenterCore0, event )
							else
								AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AbilityWheelCenterCore0Frame4( AbilityWheelCenterCore0, event )
							return 
						else
							AbilityWheelCenterCore0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							AbilityWheelCenterCore0:setAlpha( 0.67 )
							AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", AbilityWheelCenterCore0Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelCenterCore0Frame3( AbilityWheelCenterCore0, event )
						return 
					else
						AbilityWheelCenterCore0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						AbilityWheelCenterCore0:setAlpha( 0.47 )
						AbilityWheelCenterCore0:registerEventHandler( "transition_complete_keyframe", AbilityWheelCenterCore0Frame3 )
					end
				end
				
				AbilityWheelCenterCore0:completeAnimation()
				self.AbilityWheelCenterCore0:setAlpha( 1 )
				AbilityWheelCenterCore0Frame2( AbilityWheelCenterCore0, {} )
				local AbilityWheelButtonBumperWidgetFrame2 = function ( AbilityWheelButtonBumperWidget, event )
					local AbilityWheelButtonBumperWidgetFrame3 = function ( AbilityWheelButtonBumperWidget, event )
						local AbilityWheelButtonBumperWidgetFrame4 = function ( AbilityWheelButtonBumperWidget, event )
							if not event.interrupted then
								AbilityWheelButtonBumperWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 0 ) )
							if event.interrupted then
								self.clipFinished( AbilityWheelButtonBumperWidget, event )
							else
								AbilityWheelButtonBumperWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AbilityWheelButtonBumperWidgetFrame4( AbilityWheelButtonBumperWidget, event )
							return 
						else
							AbilityWheelButtonBumperWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 1 ) )
							AbilityWheelButtonBumperWidget:registerEventHandler( "transition_complete_keyframe", AbilityWheelButtonBumperWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelButtonBumperWidgetFrame3( AbilityWheelButtonBumperWidget, event )
						return 
					else
						AbilityWheelButtonBumperWidget:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						AbilityWheelButtonBumperWidget:registerEventHandler( "transition_complete_keyframe", AbilityWheelButtonBumperWidgetFrame3 )
					end
				end
				
				AbilityWheelButtonBumperWidget:completeAnimation()
				self.AbilityWheelButtonBumperWidget:setAlpha( GetMulticoreActivatedAlpha( controller, 0 ) )
				AbilityWheelButtonBumperWidgetFrame2( AbilityWheelButtonBumperWidget, {} )
			end
		}
	}
	self:registerEventHandler( "input_source_changed", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		local f242_local0 = self
		local f242_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		}
		CoD.Menu.UpdateButtonShownState( f242_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f243_local0 = nil
		LockInput( self, controller, true )
		SendMenuResponse( self, "AbilityWheel", "opened", controller )
		if not f243_local0 then
			f243_local0 = self:dispatchEventToChildren( event )
		end
		return f243_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if IsMulticoreActivated( controller ) then
			ChangeAbilityWheelItems( controller, menu, -1 )
			PlaySoundSetSound( self, "left_bumper" )
			UpdateMenuState( menu, event )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsMulticoreActivated( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if IsMulticoreActivated( controller ) then
			ChangeAbilityWheelItems( controller, menu, 1 )
			PlaySoundSetSound( self, "right_bumper" )
			UpdateMenuState( menu, event )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		if IsMulticoreActivated( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsGamepad( controller ) then
			Close( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if not IsGamepad( controller ) then
			return true
		else
			return false
		end
	end, false )
	AbilityButton6.id = "AbilityButton6"
	AbilityButton5.id = "AbilityButton5"
	AbilityButton4.id = "AbilityButton4"
	AbilityButton3.id = "AbilityButton3"
	AbilityButton2.id = "AbilityButton2"
	AbilityButton1.id = "AbilityButton1"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.AbilityButton1:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.Multiply0:close()
		element.Vignette:close()
		element.Texture:close()
		element.HexCenter:close()
		element.ElementsSideL:close()
		element.ElementsSideR:close()
		element.DNIContainer:close()
		element.CenterElements:close()
		element.BracketBlurBack:close()
		element.AbilityButton6:close()
		element.AbilityButton5:close()
		element.AbilityButton4:close()
		element.AbilityButton3:close()
		element.AbilityButton2:close()
		element.AbilityButton1:close()
		element.BracketBlur:close()
		element.TabC:close()
		element.Description:close()
		element.Contextual1:close()
		element.Contextual2:close()
		element.AbilityWheelCenterCore0:close()
		element.AbilityWheelButtonBumperWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "AbilityWheel.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

