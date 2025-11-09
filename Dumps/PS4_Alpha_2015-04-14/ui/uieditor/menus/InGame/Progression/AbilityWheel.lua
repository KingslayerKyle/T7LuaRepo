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

CoD.AbilityWheelLastSelection = {}
local PreLoadFunc = function ( self )
	self.restoreState = function ( self )
		return true
	end
	
end

local PostLoadFunc = function ( self, controller )
	self.currentFocusWidget = nil
	self.previousFocusWidget = nil
	self.currentAbilitySelected = nil
	self.degrees = 0
	self.length = 0
	Engine.SetUIActive( controller, true )
	local rightStickMovedFunc = function ()
		local buttonNum = 0
		if self.length > 0.6 then
			local DEGREES_PER_BUTTON = 60
			self.updateButtonStates( 1 + math.floor( (360 - DEGREES_PER_BUTTON + self.degrees) % 360 / DEGREES_PER_BUTTON ) )
		end
	end
	
	self.updateButtonStates = function ( buttonNum, categoryType, isMouse )
		if categoryType == nil then
			local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
			categoryType = Engine.GetModelValue( typeModel ) + 1
		end
		local isFirstFocusOrTabChange = false
		if buttonNum == nil then
			if CoD.AbilityWheelLastSelection[categoryType] == nil then
				CoD.AbilityWheelLastSelection[categoryType] = 1
			end
			buttonNum = CoD.AbilityWheelLastSelection[categoryType]
			rightStickMovedFunc()
			isFirstFocusOrTabChange = true
		end
		self.previousFocusWidget = self.currentFocusWidget
		local abilityWheelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "AbilityWheel" )
		local selectedAbility = Engine.GetModel( abilityWheelRoot, "AbilityWheelWeapon" .. buttonNum )
		local abilityEnabled = Engine.GetModel( selectedAbility, "enabled" )
		if Engine.GetModelValue( abilityEnabled ) == true then
			self.currentFocusWidget = self["AbilityButton" .. buttonNum]
			if isMouse == nil then
				self.currentAbilitySelected = self.currentFocusWidget
				CoD.AbilityWheelLastSelection[categoryType] = buttonNum
			end
		end
		if self.currentFocusWidget ~= self.previousFocusWidget or isFirstFocusOrTabChange then
			if selectedAbility ~= nil then
				local displayNameModel = Engine.GetModel( selectedAbility, "displayName" )
				local displayDescModel = Engine.GetModel( selectedAbility, "description" )
				local f5_local0 = Engine.SetModelValue
				local f5_local1 = Engine.GetModel( abilityWheelRoot, "selectedAbilityDisplayName" )
				local f5_local2
				if displayNameModel then
					f5_local2 = Engine.GetModelValue( displayNameModel )
					if not f5_local2 then
					
					else
						f5_local0( f5_local1, f5_local2 )
						f5_local0 = Engine.SetModelValue
						f5_local1 = Engine.GetModel( abilityWheelRoot, "selectedAbilityDisplayDesc" )
						if displayDescModel then
							f5_local2 = Engine.GetModelValue( displayDescModel )
							if not f5_local2 then
							
							else
								f5_local0( f5_local1, f5_local2 )
							end
						end
						f5_local2 = " "
					end
				end
				f5_local2 = " "
			end
			if self.currentFocusWidget ~= self.previousFocusWidget then
				if self.currentFocusWidget ~= nil then
					if self.currentFocusWidget.gainFocus then
						self.currentFocusWidget:gainFocus( self.currentFocusWidget, {
							name = "gain_focus",
							controller = controller
						} )
					end
					if not isFirstFocusOrTabChange then
						self:playSound( "gain_focus" )
					end
				end
				if self.previousFocusWidget ~= nil and self.previousFocusWidget.loseFocus then
					self.previousFocusWidget:loseFocus( self.previousFocusWidget, {
						name = "lose_focus",
						controller = controller
					} )
				end
			end
		end
	end
	
	self.updateButtonStates()
	self:subscribeToGlobalModel( controller, "PerController", "RightStick.Length", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.length = modelValue
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "RightStick.Degrees", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.degrees = modelValue
			rightStickMovedFunc()
		end
	end )
	local oldClose = self.close
	self.close = function ( self )
		local f8_local0 = self.currentAbilitySelected
		if f8_local0 then
			local nameModel = self.currentAbilitySelected:getModel( controller, "name" )
		end
		if f8_local0 ~= nil then
			Engine.SendMenuResponse( controller, "AbilityWheel", Engine.GetModelValue( f8_local0 ) )
		end
		if CoD.isPC then
			Engine.SendClientScriptEntityNotify( controller, "tactical_menu_close" )
		end
		self.m_inputDisabled = true
		LockInput( self, controller, false )
		Engine.SetUIActive( controller, false )
		self:unsubscribeFromAllModels()
		self:playSound( "menu_start_close" )
		self:playClip( "Close" )
		self:registerEventHandler( "clip_over", oldClose )
	end
	
	if CoD.useMouse then
		self.onMouseFocus = function ( abilityButton, event )
			if event.isMouse then
				self.updateButtonStates( abilityButton.buttonNum, nil, true )
			end
		end
		
		self.onMouseAction = function ( abilityButton, event )
			if event.isMouse and abilityButton.buttonNum ~= nil then
				local abilityWheelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "AbilityWheel" )
				local selectedAbility = Engine.GetModel( abilityWheelRoot, "AbilityWheelWeapon" .. abilityButton.buttonNum )
				local abilityEnabled = Engine.GetModel( selectedAbility, "enabled" )
				if Engine.GetModelValue( abilityEnabled ) == true then
					self.currentAbilitySelected = abilityButton
					local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
					local categoryType = Engine.GetModelValue( typeModel ) + 1
					CoD.AbilityWheelLastSelection[categoryType] = abilityButton.buttonNum
					self:close()
				end
			end
		end
		
	end
	for i = 1, 6, 1 do
		local widget = self["AbilityButton" .. i]
		widget.navigation = {}
		if CoD.useMouse then
			widget.buttonNum = i
			widget:registerEventHandler( "gain_focus", self.onMouseFocus )
			widget:registerEventHandler( "button_action", self.onMouseAction )
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
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.AbilityWheel_Panel.new( self, controller )
	Panel:setLeftRight( false, false, -272, 272 )
	Panel:setTopBottom( false, false, -224, 320 )
	Panel:setRGB( 1, 1, 1 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Multiply0 = CoD.AbilityWheel_Multiply.new( self, controller )
	Multiply0:setLeftRight( false, false, -336, 336 )
	Multiply0:setTopBottom( false, false, -314, 358 )
	Multiply0:setRGB( 1, 1, 1 )
	self:addElement( Multiply0 )
	self.Multiply0 = Multiply0
	
	local Vignette = CoD.AbilityWheel_Vignette.new( self, controller )
	Vignette:setLeftRight( true, false, 0, 1280 )
	Vignette:setTopBottom( true, false, 0, 720 )
	Vignette:setRGB( 0.47, 0.47, 0.47 )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local Texture = CoD.AbilityWheel_Texture.new( self, controller )
	Texture:setLeftRight( true, false, 240, 1040 )
	Texture:setTopBottom( true, false, 81, 617 )
	Texture:setRGB( 1, 1, 1 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local HexCenter = CoD.AbilityWheel_CenterHex.new( self, controller )
	HexCenter:setLeftRight( false, false, -144, 144 )
	HexCenter:setTopBottom( false, false, -119, 209 )
	HexCenter:setRGB( 1, 1, 1 )
	HexCenter:setAlpha( 0 )
	self:addElement( HexCenter )
	self.HexCenter = HexCenter
	
	local OutterGrid = LUI.UIImage.new()
	OutterGrid:setLeftRight( false, false, -68, 68 )
	OutterGrid:setTopBottom( false, false, 296, 312 )
	OutterGrid:setRGB( 1, 1, 1 )
	OutterGrid:setAlpha( 0 )
	OutterGrid:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtergrid" ) )
	OutterGrid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutterGrid )
	self.OutterGrid = OutterGrid
	
	local ElementsSideL = CoD.AbilityWheel_ElementsSide.new( self, controller )
	ElementsSideL:setLeftRight( false, false, -624, -155 )
	ElementsSideL:setTopBottom( false, false, -313, 303 )
	ElementsSideL:setRGB( 1, 1, 1 )
	ElementsSideL:setAlpha( 0 )
	self:addElement( ElementsSideL )
	self.ElementsSideL = ElementsSideL
	
	local ElementsSideR = CoD.AbilityWheel_ElementsSide.new( self, controller )
	ElementsSideR:setLeftRight( false, false, 155, 624 )
	ElementsSideR:setTopBottom( false, false, -313, 303 )
	ElementsSideR:setRGB( 1, 1, 1 )
	ElementsSideR:setAlpha( 0 )
	ElementsSideR:setYRot( -180 )
	self:addElement( ElementsSideR )
	self.ElementsSideR = ElementsSideR
	
	local DNIContainer = CoD.AbilityWheel_DNIContainer.new( self, controller )
	DNIContainer:setLeftRight( true, false, 548, 732 )
	DNIContainer:setTopBottom( true, false, 5, 69 )
	DNIContainer:setRGB( 1, 1, 1 )
	DNIContainer:setAlpha( 0 )
	self:addElement( DNIContainer )
	self.DNIContainer = DNIContainer
	
	local CenterElements = CoD.AbilityWheel_CenterElements.new( self, controller )
	CenterElements:setLeftRight( true, false, 532, 748 )
	CenterElements:setTopBottom( true, false, 300, 516 )
	CenterElements:setRGB( 1, 1, 1 )
	CenterElements:setAlpha( 0 )
	self:addElement( CenterElements )
	self.CenterElements = CenterElements
	
	local BracketBlurBack = CoD.AbilityWheel_BracketBlur.new( self, controller )
	BracketBlurBack:setLeftRight( true, false, 236, 1055.3 )
	BracketBlurBack:setTopBottom( true, false, 185.67, 798.33 )
	BracketBlurBack:setRGB( 1, 1, 1 )
	BracketBlurBack:setAlpha( 0.11 )
	BracketBlurBack:setZoom( -4000 )
	self:addElement( BracketBlurBack )
	self.BracketBlurBack = BracketBlurBack
	
	local AbilityButton6 = CoD.AbilityButtonNew.new( self, controller )
	AbilityButton6:setLeftRight( false, false, 104, 254 )
	AbilityButton6:setTopBottom( false, false, -135, 15 )
	AbilityButton6:setRGB( 1, 1, 1 )
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
	AbilityButton5:setRGB( 1, 1, 1 )
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
	AbilityButton4:setRGB( 1, 1, 1 )
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
	AbilityButton3:setRGB( 1, 1, 1 )
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
	AbilityButton2:setRGB( 1, 1, 1 )
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
	AbilityButton1:setTopBottom( false, false, -240, -90 )
	AbilityButton1:setRGB( 1, 1, 1 )
	AbilityButton1:setAlpha( RandomAddPercent( 0.7, 20 ) )
	AbilityButton1.GradBracketR:setAlpha( 0.3 )
	AbilityButton1.GrabBrakcetL:setAlpha( 0.3 )
	AbilityButton1:subscribeToGlobalModel( controller, "AbilityWheel", "AbilityWheelWeapon1", function ( model )
		AbilityButton1:setModel( model, controller )
	end )
	self:addElement( AbilityButton1 )
	self.AbilityButton1 = AbilityButton1
	
	local BracketBlur = CoD.AbilityWheel_BracketBlur.new( self, controller )
	BracketBlur:setLeftRight( true, false, 236, 1055.3 )
	BracketBlur:setTopBottom( true, false, 90.67, 703.33 )
	BracketBlur:setRGB( 1, 1, 1 )
	BracketBlur:setAlpha( 0.2 )
	BracketBlur:setZoom( 200 )
	self:addElement( BracketBlur )
	self.BracketBlur = BracketBlur
	
	local TabC = CoD.AbilityWheel_TabC.new( self, controller )
	TabC:setLeftRight( true, false, 522, 755 )
	TabC:setTopBottom( true, false, 71, 125 )
	TabC:setRGB( 1, 1, 1 )
	TabC:setAlpha( 0 )
	self:addElement( TabC )
	self.TabC = TabC
	
	local Description = CoD.AbilityWheel_Description.new( self, controller )
	Description:setLeftRight( false, false, -116.5, 116.5 )
	Description:setTopBottom( false, false, -35, 134 )
	Description:setRGB( 1, 1, 1 )
	Description:setAlpha( 0 )
	self:addElement( Description )
	self.Description = Description
	
	local Contextual1 = CoD.AbilityWheel_AbilityContextual2.new( self, controller )
	Contextual1:setLeftRight( true, false, 17.5, 263.5 )
	Contextual1:setTopBottom( true, false, 219, 397 )
	Contextual1:setRGB( 1, 1, 1 )
	Contextual1:setAlpha( 0 )
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
	Contextual2:setTopBottom( true, false, 374, 552 )
	Contextual2:setRGB( 1, 1, 1 )
	Contextual2:setAlpha( 0 )
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
				self:setupElementClipCounter( 22 )
				local PanelFrame2 = function ( Panel, event )
					if not event.interrupted then
						Panel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
						Multiply0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
						Vignette:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
						Texture:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
															HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
														HexCenter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame11 )
													end
												end
												
												if event.interrupted then
													HexCenterFrame10( HexCenter, event )
													return 
												else
													HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										HexCenter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
							HexCenter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HexCenter:setAlpha( 1 )
							HexCenter:setZoom( 236.25 )
							HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame4 )
						end
					end
					
					if event.interrupted then
						HexCenterFrame3( HexCenter, event )
						return 
					else
						HexCenter:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						HexCenter:registerEventHandler( "transition_complete_keyframe", HexCenterFrame3 )
					end
				end
				
				HexCenter:completeAnimation()
				self.HexCenter:setAlpha( 0 )
				self.HexCenter:setZoom( 315 )
				HexCenterFrame2( HexCenter, {} )
				local OutterGridFrame2 = function ( OutterGrid, event )
					local OutterGridFrame3 = function ( OutterGrid, event )
						local OutterGridFrame4 = function ( OutterGrid, event )
							local OutterGridFrame5 = function ( OutterGrid, event )
								local OutterGridFrame6 = function ( OutterGrid, event )
									local OutterGridFrame7 = function ( OutterGrid, event )
										if not event.interrupted then
											OutterGrid:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										OutterGrid:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( OutterGrid, event )
										else
											OutterGrid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										OutterGridFrame7( OutterGrid, event )
										return 
									else
										OutterGrid:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame7 )
									end
								end
								
								if event.interrupted then
									OutterGridFrame6( OutterGrid, event )
									return 
								else
									OutterGrid:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									OutterGrid:setAlpha( 0 )
									OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame6 )
								end
							end
							
							if event.interrupted then
								OutterGridFrame5( OutterGrid, event )
								return 
							else
								OutterGrid:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame5 )
							end
						end
						
						if event.interrupted then
							OutterGridFrame4( OutterGrid, event )
							return 
						else
							OutterGrid:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OutterGrid:setAlpha( 1 )
							OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame4 )
						end
					end
					
					if event.interrupted then
						OutterGridFrame3( OutterGrid, event )
						return 
					else
						OutterGrid:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame3 )
					end
				end
				
				OutterGrid:completeAnimation()
				self.OutterGrid:setAlpha( 0 )
				OutterGridFrame2( OutterGrid, {} )
				local ElementsSideLFrame2 = function ( ElementsSideL, event )
					local ElementsSideLFrame3 = function ( ElementsSideL, event )
						local ElementsSideLFrame4 = function ( ElementsSideL, event )
							local ElementsSideLFrame5 = function ( ElementsSideL, event )
								local ElementsSideLFrame6 = function ( ElementsSideL, event )
									local ElementsSideLFrame7 = function ( ElementsSideL, event )
										local ElementsSideLFrame8 = function ( ElementsSideL, event )
											if not event.interrupted then
												ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
											ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ElementsSideL:setAlpha( 0.2 )
											ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame8 )
										end
									end
									
									if event.interrupted then
										ElementsSideLFrame7( ElementsSideL, event )
										return 
									else
										ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame7 )
									end
								end
								
								if event.interrupted then
									ElementsSideLFrame6( ElementsSideL, event )
									return 
								else
									ElementsSideL:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ElementsSideL:setAlpha( 0.6 )
									ElementsSideL:registerEventHandler( "transition_complete_keyframe", ElementsSideLFrame6 )
								end
							end
							
							if event.interrupted then
								ElementsSideLFrame5( ElementsSideL, event )
								return 
							else
								ElementsSideL:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
						ElementsSideL:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
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
												ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										ElementsSideR:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
						ElementsSideR:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
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
															DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
														DNIContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame11 )
													end
												end
												
												if event.interrupted then
													DNIContainerFrame10( DNIContainer, event )
													return 
												else
													DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										DNIContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
							DNIContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							DNIContainer:setAlpha( 1 )
							DNIContainer:setZoom( 38.25 )
							DNIContainer:registerEventHandler( "transition_complete_keyframe", DNIContainerFrame4 )
						end
					end
					
					if event.interrupted then
						DNIContainerFrame3( DNIContainer, event )
						return 
					else
						DNIContainer:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
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
														if not event.interrupted then
															CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														CenterElements:setAlpha( 1 )
														CenterElements:setZoom( -40 )
														if event.interrupted then
															self.clipFinished( CenterElements, event )
														else
															CenterElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														CenterElementsFrame11( CenterElements, event )
														return 
													else
														CenterElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame11 )
													end
												end
												
												if event.interrupted then
													CenterElementsFrame10( CenterElements, event )
													return 
												else
													CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													CenterElements:setAlpha( 0.8 )
													CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame10 )
												end
											end
											
											if event.interrupted then
												CenterElementsFrame9( CenterElements, event )
												return 
											else
												CenterElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame9 )
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
							CenterElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CenterElements:setAlpha( 1 )
							CenterElements:setZoom( -30 )
							CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame4 )
						end
					end
					
					if event.interrupted then
						CenterElementsFrame3( CenterElements, event )
						return 
					else
						CenterElements:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						CenterElements:registerEventHandler( "transition_complete_keyframe", CenterElementsFrame3 )
					end
				end
				
				CenterElements:completeAnimation()
				self.CenterElements:setAlpha( 0 )
				self.CenterElements:setZoom( -40 )
				CenterElementsFrame2( CenterElements, {} )
				local BracketBlurBackFrame2 = function ( BracketBlurBack, event )
					local BracketBlurBackFrame3 = function ( BracketBlurBack, event )
						local BracketBlurBackFrame4 = function ( BracketBlurBack, event )
							local BracketBlurBackFrame5 = function ( BracketBlurBack, event )
								local BracketBlurBackFrame6 = function ( BracketBlurBack, event )
									local BracketBlurBackFrame7 = function ( BracketBlurBack, event )
										if not event.interrupted then
											BracketBlurBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										BracketBlurBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame7 )
									end
								end
								
								if event.interrupted then
									BracketBlurBackFrame6( BracketBlurBack, event )
									return 
								else
									BracketBlurBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BracketBlurBack:setAlpha( 0 )
									BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame6 )
								end
							end
							
							if event.interrupted then
								BracketBlurBackFrame5( BracketBlurBack, event )
								return 
							else
								BracketBlurBack:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								BracketBlurBack:setAlpha( 0.11 )
								BracketBlurBack:setZoom( -4000 )
								BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame5 )
							end
						end
						
						if event.interrupted then
							BracketBlurBackFrame4( BracketBlurBack, event )
							return 
						else
							BracketBlurBack:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							BracketBlurBack:setAlpha( 0 )
							BracketBlurBack:registerEventHandler( "transition_complete_keyframe", BracketBlurBackFrame4 )
						end
					end
					
					if event.interrupted then
						BracketBlurBackFrame3( BracketBlurBack, event )
						return 
					else
						BracketBlurBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
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
						local AbilityButton6Frame4 = function ( AbilityButton6, event )
							local AbilityButton6Frame5 = function ( AbilityButton6, event )
								local AbilityButton6Frame6 = function ( AbilityButton6, event )
									local AbilityButton6Frame7 = function ( AbilityButton6, event )
										local AbilityButton6Frame8 = function ( AbilityButton6, event )
											local AbilityButton6Frame9 = function ( AbilityButton6, event )
												local AbilityButton6Frame10 = function ( AbilityButton6, event )
													if not event.interrupted then
														AbilityButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
													AbilityButton6Frame10( AbilityButton6, event )
													return 
												else
													AbilityButton6:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton6Frame9( AbilityButton6, event )
												return 
											else
												AbilityButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityButton6:setAlpha( 0.8 )
												AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton6Frame8( AbilityButton6, event )
											return 
										else
											AbilityButton6:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton6Frame7( AbilityButton6, event )
										return 
									else
										AbilityButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityButton6:setAlpha( 1 )
										AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton6Frame6( AbilityButton6, event )
									return 
								else
									AbilityButton6:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton6Frame5( AbilityButton6, event )
								return 
							else
								AbilityButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityButton6:setAlpha( 0.5 )
								AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton6Frame4( AbilityButton6, event )
							return 
						else
							AbilityButton6:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							AbilityButton6:setAlpha( 1 )
							AbilityButton6:setZoom( 0 )
							AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityButton6Frame3( AbilityButton6, event )
						return 
					else
						AbilityButton6:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						AbilityButton6:registerEventHandler( "transition_complete_keyframe", AbilityButton6Frame3 )
					end
				end
				
				AbilityButton6:completeAnimation()
				self.AbilityButton6:setAlpha( 0 )
				self.AbilityButton6:setZoom( -6000 )
				AbilityButton6Frame2( AbilityButton6, {} )
				local AbilityButton5Frame2 = function ( AbilityButton5, event )
					local AbilityButton5Frame3 = function ( AbilityButton5, event )
						local AbilityButton5Frame4 = function ( AbilityButton5, event )
							local AbilityButton5Frame5 = function ( AbilityButton5, event )
								local AbilityButton5Frame6 = function ( AbilityButton5, event )
									local AbilityButton5Frame7 = function ( AbilityButton5, event )
										local AbilityButton5Frame8 = function ( AbilityButton5, event )
											local AbilityButton5Frame9 = function ( AbilityButton5, event )
												local AbilityButton5Frame10 = function ( AbilityButton5, event )
													if not event.interrupted then
														AbilityButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
													AbilityButton5Frame10( AbilityButton5, event )
													return 
												else
													AbilityButton5:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton5Frame9( AbilityButton5, event )
												return 
											else
												AbilityButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityButton5:setAlpha( 0.8 )
												AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton5Frame8( AbilityButton5, event )
											return 
										else
											AbilityButton5:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton5Frame7( AbilityButton5, event )
										return 
									else
										AbilityButton5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										AbilityButton5:setAlpha( 1 )
										AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton5Frame6( AbilityButton5, event )
									return 
								else
									AbilityButton5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton5Frame5( AbilityButton5, event )
								return 
							else
								AbilityButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityButton5:setAlpha( 0.5 )
								AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton5Frame4( AbilityButton5, event )
							return 
						else
							AbilityButton5:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							AbilityButton5:setAlpha( 1 )
							AbilityButton5:setZoom( 0 )
							AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityButton5Frame3( AbilityButton5, event )
						return 
					else
						AbilityButton5:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						AbilityButton5:registerEventHandler( "transition_complete_keyframe", AbilityButton5Frame3 )
					end
				end
				
				AbilityButton5:completeAnimation()
				self.AbilityButton5:setAlpha( 0 )
				self.AbilityButton5:setZoom( -6000 )
				AbilityButton5Frame2( AbilityButton5, {} )
				local AbilityButton4Frame2 = function ( AbilityButton4, event )
					local AbilityButton4Frame3 = function ( AbilityButton4, event )
						local AbilityButton4Frame4 = function ( AbilityButton4, event )
							local AbilityButton4Frame5 = function ( AbilityButton4, event )
								local AbilityButton4Frame6 = function ( AbilityButton4, event )
									local AbilityButton4Frame7 = function ( AbilityButton4, event )
										local AbilityButton4Frame8 = function ( AbilityButton4, event )
											local AbilityButton4Frame9 = function ( AbilityButton4, event )
												local AbilityButton4Frame10 = function ( AbilityButton4, event )
													if not event.interrupted then
														AbilityButton4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
													AbilityButton4Frame10( AbilityButton4, event )
													return 
												else
													AbilityButton4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton4Frame9( AbilityButton4, event )
												return 
											else
												AbilityButton4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AbilityButton4:setAlpha( 0.8 )
												AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton4Frame8( AbilityButton4, event )
											return 
										else
											AbilityButton4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton4Frame7( AbilityButton4, event )
										return 
									else
										AbilityButton4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityButton4:setAlpha( 1 )
										AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton4Frame6( AbilityButton4, event )
									return 
								else
									AbilityButton4:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton4Frame5( AbilityButton4, event )
								return 
							else
								AbilityButton4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityButton4:setAlpha( 0.5 )
								AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton4Frame4( AbilityButton4, event )
							return 
						else
							AbilityButton4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							AbilityButton4:setAlpha( 1 )
							AbilityButton4:setZoom( 0 )
							AbilityButton4:registerEventHandler( "transition_complete_keyframe", AbilityButton4Frame4 )
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
						local AbilityButton3Frame4 = function ( AbilityButton3, event )
							local AbilityButton3Frame5 = function ( AbilityButton3, event )
								local AbilityButton3Frame6 = function ( AbilityButton3, event )
									local AbilityButton3Frame7 = function ( AbilityButton3, event )
										local AbilityButton3Frame8 = function ( AbilityButton3, event )
											local AbilityButton3Frame9 = function ( AbilityButton3, event )
												local AbilityButton3Frame10 = function ( AbilityButton3, event )
													if not event.interrupted then
														AbilityButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
													AbilityButton3Frame10( AbilityButton3, event )
													return 
												else
													AbilityButton3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton3Frame9( AbilityButton3, event )
												return 
											else
												AbilityButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityButton3:setAlpha( 0.8 )
												AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton3Frame8( AbilityButton3, event )
											return 
										else
											AbilityButton3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton3Frame7( AbilityButton3, event )
										return 
									else
										AbilityButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityButton3:setAlpha( 1 )
										AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton3Frame6( AbilityButton3, event )
									return 
								else
									AbilityButton3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton3Frame5( AbilityButton3, event )
								return 
							else
								AbilityButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityButton3:setAlpha( 0.5 )
								AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton3Frame4( AbilityButton3, event )
							return 
						else
							AbilityButton3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							AbilityButton3:setAlpha( 1 )
							AbilityButton3:setZoom( 0 )
							AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityButton3Frame3( AbilityButton3, event )
						return 
					else
						AbilityButton3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						AbilityButton3:registerEventHandler( "transition_complete_keyframe", AbilityButton3Frame3 )
					end
				end
				
				AbilityButton3:completeAnimation()
				self.AbilityButton3:setAlpha( 0 )
				self.AbilityButton3:setZoom( -6000 )
				AbilityButton3Frame2( AbilityButton3, {} )
				local AbilityButton2Frame2 = function ( AbilityButton2, event )
					local AbilityButton2Frame3 = function ( AbilityButton2, event )
						local AbilityButton2Frame4 = function ( AbilityButton2, event )
							local AbilityButton2Frame5 = function ( AbilityButton2, event )
								local AbilityButton2Frame6 = function ( AbilityButton2, event )
									local AbilityButton2Frame7 = function ( AbilityButton2, event )
										local AbilityButton2Frame8 = function ( AbilityButton2, event )
											local AbilityButton2Frame9 = function ( AbilityButton2, event )
												local AbilityButton2Frame10 = function ( AbilityButton2, event )
													if not event.interrupted then
														AbilityButton2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
													AbilityButton2Frame10( AbilityButton2, event )
													return 
												else
													AbilityButton2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton2Frame9( AbilityButton2, event )
												return 
											else
												AbilityButton2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityButton2:setAlpha( 0.8 )
												AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton2Frame8( AbilityButton2, event )
											return 
										else
											AbilityButton2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton2Frame7( AbilityButton2, event )
										return 
									else
										AbilityButton2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										AbilityButton2:setAlpha( 1 )
										AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton2Frame6( AbilityButton2, event )
									return 
								else
									AbilityButton2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton2Frame5( AbilityButton2, event )
								return 
							else
								AbilityButton2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityButton2:setAlpha( 0.5 )
								AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton2Frame4( AbilityButton2, event )
							return 
						else
							AbilityButton2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							AbilityButton2:setAlpha( 1 )
							AbilityButton2:setZoom( 0 )
							AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityButton2Frame3( AbilityButton2, event )
						return 
					else
						AbilityButton2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						AbilityButton2:registerEventHandler( "transition_complete_keyframe", AbilityButton2Frame3 )
					end
				end
				
				AbilityButton2:completeAnimation()
				self.AbilityButton2:setAlpha( 0 )
				self.AbilityButton2:setZoom( -6000 )
				AbilityButton2Frame2( AbilityButton2, {} )
				local AbilityButton1Frame2 = function ( AbilityButton1, event )
					local AbilityButton1Frame3 = function ( AbilityButton1, event )
						local AbilityButton1Frame4 = function ( AbilityButton1, event )
							local AbilityButton1Frame5 = function ( AbilityButton1, event )
								local AbilityButton1Frame6 = function ( AbilityButton1, event )
									local AbilityButton1Frame7 = function ( AbilityButton1, event )
										local AbilityButton1Frame8 = function ( AbilityButton1, event )
											local AbilityButton1Frame9 = function ( AbilityButton1, event )
												local AbilityButton1Frame10 = function ( AbilityButton1, event )
													if not event.interrupted then
														AbilityButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													AbilityButton1:setAlpha( RandomAddPercent( 1, 20 ) )
													AbilityButton1:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( AbilityButton1, event )
													else
														AbilityButton1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													AbilityButton1Frame10( AbilityButton1, event )
													return 
												else
													AbilityButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AbilityButton1:setAlpha( RandomAddPercent( 0.7, 20 ) )
													AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityButton1Frame9( AbilityButton1, event )
												return 
											else
												AbilityButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityButton1Frame8( AbilityButton1, event )
											return 
										else
											AbilityButton1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityButton1Frame7( AbilityButton1, event )
										return 
									else
										AbilityButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										AbilityButton1:setAlpha( RandomAddPercent( 1, 20 ) )
										AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityButton1Frame6( AbilityButton1, event )
									return 
								else
									AbilityButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityButton1Frame5( AbilityButton1, event )
								return 
							else
								AbilityButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityButton1:setAlpha( RandomAddPercent( 0.5, 20 ) )
								AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityButton1Frame4( AbilityButton1, event )
							return 
						else
							AbilityButton1:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							AbilityButton1:setAlpha( RandomAddPercent( 1, 20 ) )
							AbilityButton1:setZoom( 0 )
							AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame4 )
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
				self.AbilityButton1:setAlpha( RandomAddPercent( 0, 20 ) )
				self.AbilityButton1:setZoom( -6000 )
				AbilityButton1Frame2( AbilityButton1, {} )
				local BracketBlurFrame2 = function ( BracketBlur, event )
					local BracketBlurFrame3 = function ( BracketBlur, event )
						local BracketBlurFrame4 = function ( BracketBlur, event )
							local BracketBlurFrame5 = function ( BracketBlur, event )
								local BracketBlurFrame6 = function ( BracketBlur, event )
									local BracketBlurFrame7 = function ( BracketBlur, event )
										local BracketBlurFrame8 = function ( BracketBlur, event )
											local BracketBlurFrame9 = function ( BracketBlur, event )
												local BracketBlurFrame10 = function ( BracketBlur, event )
													if not event.interrupted then
														BracketBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													BracketBlur:setAlpha( 0.2 )
													BracketBlur:setZoom( 200 )
													if event.interrupted then
														self.clipFinished( BracketBlur, event )
													else
														BracketBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BracketBlurFrame10( BracketBlur, event )
													return 
												else
													BracketBlur:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame10 )
												end
											end
											
											if event.interrupted then
												BracketBlurFrame9( BracketBlur, event )
												return 
											else
												BracketBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BracketBlur:setAlpha( 0.1 )
												BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame9 )
											end
										end
										
										if event.interrupted then
											BracketBlurFrame8( BracketBlur, event )
											return 
										else
											BracketBlur:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame8 )
										end
									end
									
									if event.interrupted then
										BracketBlurFrame7( BracketBlur, event )
										return 
									else
										BracketBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										BracketBlur:setAlpha( 0.2 )
										BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame7 )
									end
								end
								
								if event.interrupted then
									BracketBlurFrame6( BracketBlur, event )
									return 
								else
									BracketBlur:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame6 )
								end
							end
							
							if event.interrupted then
								BracketBlurFrame5( BracketBlur, event )
								return 
							else
								BracketBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								BracketBlur:setAlpha( 0 )
								BracketBlur:registerEventHandler( "transition_complete_keyframe", BracketBlurFrame5 )
							end
						end
						
						if event.interrupted then
							BracketBlurFrame4( BracketBlur, event )
							return 
						else
							BracketBlur:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
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
						BracketBlur:setZoom( -3192.31 )
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
															TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														TabC:setLeftRight( true, false, 522, 755 )
														TabC:setTopBottom( true, false, 71, 125 )
														TabC:setAlpha( 1 )
														TabC:setZoom( 0 )
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
													TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										TabC:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
							TabC:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TabC:setAlpha( 1 )
							TabC:setZoom( -85.5 )
							TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame4 )
						end
					end
					
					if event.interrupted then
						TabCFrame3( TabC, event )
						return 
					else
						TabC:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						TabC:registerEventHandler( "transition_complete_keyframe", TabCFrame3 )
					end
				end
				
				TabC:completeAnimation()
				self.TabC:setLeftRight( true, false, 522, 755 )
				self.TabC:setTopBottom( true, false, 71, 125 )
				self.TabC:setAlpha( 0 )
				self.TabC:setZoom( -114 )
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
															Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
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
														Description:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame11 )
													end
												end
												
												if event.interrupted then
													DescriptionFrame10( Description, event )
													return 
												else
													Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
											Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
									Description:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Description:setAlpha( 0.7 )
									Description:setZoom( 0 )
									Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame6 )
								end
							end
							
							if event.interrupted then
								DescriptionFrame5( Description, event )
								return 
							else
								Description:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Description:setZoom( 2.5 )
								Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame5 )
							end
						end
						
						if event.interrupted then
							DescriptionFrame4( Description, event )
							return 
						else
							Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Description:setAlpha( 1 )
							Description:setZoom( 7.5 )
							Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame4 )
						end
					end
					
					if event.interrupted then
						DescriptionFrame3( Description, event )
						return 
					else
						Description:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						Description:setZoom( 10 )
						Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame3 )
					end
				end
				
				Description:completeAnimation()
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
															Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
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
													Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
							Contextual1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Contextual1:setAlpha( 1 )
							Contextual1:setZoom( 33 )
							Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame4 )
						end
					end
					
					if event.interrupted then
						Contextual1Frame3( Contextual1, event )
						return 
					else
						Contextual1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						Contextual1:registerEventHandler( "transition_complete_keyframe", Contextual1Frame3 )
					end
				end
				
				Contextual1:completeAnimation()
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
															Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
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
														Contextual2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame11 )
													end
												end
												
												if event.interrupted then
													Contextual2Frame10( Contextual2, event )
													return 
												else
													Contextual2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Contextual2:setAlpha( 0.8 )
													Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame10 )
												end
											end
											
											if event.interrupted then
												Contextual2Frame9( Contextual2, event )
												return 
											else
												Contextual2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame9 )
											end
										end
										
										if event.interrupted then
											Contextual2Frame8( Contextual2, event )
											return 
										else
											Contextual2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
								Contextual2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
						Contextual2:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						Contextual2:registerEventHandler( "transition_complete_keyframe", Contextual2Frame3 )
					end
				end
				
				Contextual2:completeAnimation()
				self.Contextual2:setAlpha( 0 )
				self.Contextual2:setZoom( 39 )
				Contextual2Frame2( Contextual2, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 22 )
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
				local OutterGridFrame2 = function ( OutterGrid, event )
					local OutterGridFrame3 = function ( OutterGrid, event )
						local OutterGridFrame4 = function ( OutterGrid, event )
							local OutterGridFrame5 = function ( OutterGrid, event )
								local OutterGridFrame6 = function ( OutterGrid, event )
									local OutterGridFrame7 = function ( OutterGrid, event )
										local OutterGridFrame8 = function ( OutterGrid, event )
											if not event.interrupted then
												OutterGrid:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											end
											OutterGrid:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( OutterGrid, event )
											else
												OutterGrid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											OutterGridFrame8( OutterGrid, event )
											return 
										else
											OutterGrid:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											OutterGrid:setAlpha( 0.6 )
											OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame8 )
										end
									end
									
									if event.interrupted then
										OutterGridFrame7( OutterGrid, event )
										return 
									else
										OutterGrid:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame7 )
									end
								end
								
								if event.interrupted then
									OutterGridFrame6( OutterGrid, event )
									return 
								else
									OutterGrid:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									OutterGrid:setAlpha( 0 )
									OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame6 )
								end
							end
							
							if event.interrupted then
								OutterGridFrame5( OutterGrid, event )
								return 
							else
								OutterGrid:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame5 )
							end
						end
						
						if event.interrupted then
							OutterGridFrame4( OutterGrid, event )
							return 
						else
							OutterGrid:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OutterGrid:setAlpha( 1 )
							OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame4 )
						end
					end
					
					if event.interrupted then
						OutterGridFrame3( OutterGrid, event )
						return 
					else
						OutterGrid:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						OutterGrid:registerEventHandler( "transition_complete_keyframe", OutterGridFrame3 )
					end
				end
				
				OutterGrid:completeAnimation()
				self.OutterGrid:setAlpha( 0 )
				OutterGridFrame2( OutterGrid, {} )
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
					if not event.interrupted then
						AbilityButton6:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					AbilityButton6:setAlpha( 0 )
					AbilityButton6:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( AbilityButton6, event )
					else
						AbilityButton6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityButton6:completeAnimation()
				self.AbilityButton6:setAlpha( 1 )
				self.AbilityButton6:setZoom( 0 )
				AbilityButton6Frame2( AbilityButton6, {} )
				local AbilityButton5Frame2 = function ( AbilityButton5, event )
					if not event.interrupted then
						AbilityButton5:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					AbilityButton5:setAlpha( 0 )
					AbilityButton5:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( AbilityButton5, event )
					else
						AbilityButton5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityButton5:completeAnimation()
				self.AbilityButton5:setAlpha( 1 )
				self.AbilityButton5:setZoom( 0 )
				AbilityButton5Frame2( AbilityButton5, {} )
				local AbilityButton4Frame2 = function ( AbilityButton4, event )
					if not event.interrupted then
						AbilityButton4:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					AbilityButton4:setAlpha( 0 )
					AbilityButton4:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( AbilityButton4, event )
					else
						AbilityButton4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityButton4:completeAnimation()
				self.AbilityButton4:setAlpha( 1 )
				self.AbilityButton4:setZoom( 0 )
				AbilityButton4Frame2( AbilityButton4, {} )
				local AbilityButton3Frame2 = function ( AbilityButton3, event )
					if not event.interrupted then
						AbilityButton3:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					AbilityButton3:setAlpha( 0 )
					AbilityButton3:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( AbilityButton3, event )
					else
						AbilityButton3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityButton3:completeAnimation()
				self.AbilityButton3:setAlpha( 1 )
				self.AbilityButton3:setZoom( 0 )
				AbilityButton3Frame2( AbilityButton3, {} )
				local AbilityButton2Frame2 = function ( AbilityButton2, event )
					if not event.interrupted then
						AbilityButton2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					AbilityButton2:setAlpha( 0 )
					AbilityButton2:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( AbilityButton2, event )
					else
						AbilityButton2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityButton2:completeAnimation()
				self.AbilityButton2:setAlpha( 1 )
				self.AbilityButton2:setZoom( 0 )
				AbilityButton2Frame2( AbilityButton2, {} )
				local AbilityButton1Frame2 = function ( AbilityButton1, event )
					local AbilityButton1Frame3 = function ( AbilityButton1, event )
						if not event.interrupted then
							AbilityButton1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						AbilityButton1:setAlpha( RandomAddPercent( 0, 20 ) )
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
						AbilityButton1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						AbilityButton1:setAlpha( RandomAddPercent( 0, 20 ) )
						AbilityButton1:setZoom( 750 )
						AbilityButton1:registerEventHandler( "transition_complete_keyframe", AbilityButton1Frame3 )
					end
				end
				
				AbilityButton1:completeAnimation()
				self.AbilityButton1:setAlpha( RandomAddPercent( 0.7, 20 ) )
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
				self.BracketBlur:setAlpha( 0.2 )
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
												TabC:setLeftRight( true, false, 522, 755 )
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
				self.TabC:setLeftRight( true, false, 522, 755 )
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
			end
		}
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.shoulderl = function ( menu, element, event )
		if HasMultiCoreRig( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.shoulderr = function ( menu, element, event )
		if HasMultiCoreRig( controller ) then
			return true
		else
			
		end
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if not IsGamepad( controller ) then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	self:registerEventHandler( "input_source_changed", function ( element, event )
		if not element.buttonPromptAddFunctions.secondary( self, element, event ) then
			self:removeButtonPrompt( "secondary", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "shoulderl" or event.button == "key_shortcut" and event.key == "MWHEELUP") and HasMultiCoreRig( controller ) then
			ChangeAbilityWheelItems( controller, self, -1 )
			PlaySoundSetSound( self, "left_bumper" )
		end
		if not self.occludedBy and (event.button == "shoulderr" or event.button == "key_shortcut" and event.key == "MWHEELDOWN") and HasMultiCoreRig( controller ) then
			ChangeAbilityWheelItems( controller, self, 1 )
			PlaySoundSetSound( self, "right_bumper" )
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") and not IsGamepad( controller ) then
			Close( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.Panel:close()
		self.Multiply0:close()
		self.Vignette:close()
		self.Texture:close()
		self.HexCenter:close()
		self.ElementsSideL:close()
		self.ElementsSideR:close()
		self.DNIContainer:close()
		self.CenterElements:close()
		self.BracketBlurBack:close()
		self.AbilityButton6:close()
		self.AbilityButton5:close()
		self.AbilityButton4:close()
		self.AbilityButton3:close()
		self.AbilityButton2:close()
		self.AbilityButton1:close()
		self.BracketBlur:close()
		self.TabC:close()
		self.Description:close()
		self.Contextual1:close()
		self.Contextual2:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

