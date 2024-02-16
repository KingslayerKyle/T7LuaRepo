-- 4aa3202201dafe6d68617ca49e165eec
-- This hash is used for caching, delete to decompile the file again

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

CoD.SwitchCameraWheel = {}
CoD.SwitchCameraWheel.LastSelectedWidget = nil
local PreLoadFunc = function ( f1_arg0 )
	f1_arg0.restoreState = function ( f2_arg0 )
		return true
	end
	
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	for f3_local0 = 1, 7, 1 do
		local f3_local3 = f3_arg0["CameraButton" .. f3_local0]
		f3_local3.modelName = "Camera" .. f3_local0
		f3_local3:registerEventHandler( "gain_focus", function ( element, event )
			local f4_local0 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "SwitchCameraWheel" )
			local f4_local1 = Engine.GetModelValue( Engine.GetModel( f4_local0, element.modelName .. ".displayName" ) )
			local f4_local2 = Engine.GetModelValue( Engine.GetModel( f4_local0, element.modelName .. ".description" ) )
			Engine.SetModelValue( Engine.GetModel( f4_local0, "selectedCameraDisplayName" ), f4_local1 )
			Engine.SetModelValue( Engine.GetModel( f4_local0, "selectedCameraDisplayDesc" ), f4_local2 )
			CoD.SwitchCameraWheel.LastSelectedWidget = element
			return LUI.UIElement.gainFocus( element, event )
		end )
	end
	f3_arg0:registerEventHandler( "close_popup", function ( element, event )
		if element.menuName == event.popupName then
			local f5_local0 = CoD.SwitchCameraWheel.LastSelectedWidget
			local f5_local1 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "SwitchCameraWheel" )
			if Engine.GetModelValue( Engine.GetModel( f5_local1, f5_local0.modelName .. ".disabled" ) ) == false then
				Engine.SwitchDemoCameraMode( Engine.GetModelValue( Engine.GetModel( f5_local1, f5_local0.modelName .. ".cameraMode" ) ) )
				local f5_local2 = Engine.GetModel( f5_local1, f5_local0.modelName .. ".freeCameraMode" )
				if f5_local2 ~= nil then
					Engine.SwitchDemoFreeCameraMode( Engine.GetModelValue( f5_local2 ) )
				end
			end
			element:goBack()
			return true
		else
			
		end
	end )
	CoD.SwitchCameraWheel.LastSelectedWidget = f3_arg0.CameraButton1
	CoD.SwitchCameraWheel.LastSelectedWidget:processEvent( {
		name = "gain_focus",
		controller = f3_arg1
	} )
end

LUI.createMenu.SwitchCameraWheel = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SwitchCameraWheel" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "AbilityWheel"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SwitchCameraWheel.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.AbilityWheel_Panel.new( f6_local1, controller )
	Panel:setLeftRight( false, false, -272, 272 )
	Panel:setTopBottom( false, false, -224, 320 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Multiply0 = CoD.AbilityWheel_Multiply.new( f6_local1, controller )
	Multiply0:setLeftRight( false, false, -336, 336 )
	Multiply0:setTopBottom( false, false, -314, 358 )
	self:addElement( Multiply0 )
	self.Multiply0 = Multiply0
	
	local Vignette = CoD.AbilityWheel_Vignette.new( f6_local1, controller )
	Vignette:setLeftRight( true, false, 0, 1280 )
	Vignette:setTopBottom( true, false, 0, 720 )
	Vignette:setRGB( 0.47, 0.47, 0.47 )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local Texture = CoD.AbilityWheel_Texture.new( f6_local1, controller )
	Texture:setLeftRight( true, false, 240, 1040 )
	Texture:setTopBottom( true, false, 81, 617 )
	self:addElement( Texture )
	self.Texture = Texture
	
	local HexCenter = CoD.AbilityWheel_CenterHex.new( f6_local1, controller )
	HexCenter:setLeftRight( false, false, -144, 144 )
	HexCenter:setTopBottom( false, false, -119, 209 )
	HexCenter:setAlpha( 0 )
	self:addElement( HexCenter )
	self.HexCenter = HexCenter
	
	local OutterGrid = LUI.UIImage.new()
	OutterGrid:setLeftRight( false, false, -68, 68 )
	OutterGrid:setTopBottom( false, false, 296, 312 )
	OutterGrid:setAlpha( 0 )
	OutterGrid:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtergrid" ) )
	OutterGrid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutterGrid )
	self.OutterGrid = OutterGrid
	
	local ElementsSideL = CoD.AbilityWheel_ElementsSide.new( f6_local1, controller )
	ElementsSideL:setLeftRight( false, false, -624, -155 )
	ElementsSideL:setTopBottom( false, false, -313, 303 )
	ElementsSideL:setAlpha( 0 )
	self:addElement( ElementsSideL )
	self.ElementsSideL = ElementsSideL
	
	local ElementsSideR = CoD.AbilityWheel_ElementsSide.new( f6_local1, controller )
	ElementsSideR:setLeftRight( false, false, 155, 624 )
	ElementsSideR:setTopBottom( false, false, -313, 303 )
	ElementsSideR:setAlpha( 0 )
	ElementsSideR:setYRot( -180 )
	self:addElement( ElementsSideR )
	self.ElementsSideR = ElementsSideR
	
	local DNIContainer = CoD.AbilityWheel_DNIContainer.new( f6_local1, controller )
	DNIContainer:setLeftRight( true, false, 548, 732 )
	DNIContainer:setTopBottom( true, false, 5, 69 )
	DNIContainer:setAlpha( 0 )
	self:addElement( DNIContainer )
	self.DNIContainer = DNIContainer
	
	local CenterElements = CoD.AbilityWheel_CenterElements.new( f6_local1, controller )
	CenterElements:setLeftRight( true, false, 532, 748 )
	CenterElements:setTopBottom( true, false, 300, 516 )
	CenterElements:setAlpha( 0 )
	CenterElements:subscribeToGlobalModel( controller, "SwitchCameraWheel", nil, function ( model )
		CenterElements:setModel( model, controller )
	end )
	self:addElement( CenterElements )
	self.CenterElements = CenterElements
	
	local BracketBlurBack = CoD.AbilityWheel_BracketBlur.new( f6_local1, controller )
	BracketBlurBack:setLeftRight( true, false, 236, 1055.3 )
	BracketBlurBack:setTopBottom( true, false, 185.67, 798.33 )
	BracketBlurBack:setAlpha( 0.11 )
	BracketBlurBack:setZoom( -4000 )
	self:addElement( BracketBlurBack )
	self.BracketBlurBack = BracketBlurBack
	
	local CameraButton7 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton7:setLeftRight( false, false, 87, 237 )
	CameraButton7:setTopBottom( false, false, -173, -23 )
	CameraButton7:setZRot( -51.43 )
	CameraButton7.GrabBrakcetL:setAlpha( 0 )
	CameraButton7.AbilitylIcon:setZRot( 60 )
	CameraButton7:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera7", function ( model )
		CameraButton7:setModel( model, controller )
	end )
	CameraButton7:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f9_local0 = IsDisabled( element, controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	CameraButton7:linkToElementModel( CameraButton7, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton7, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton7:linkToElementModel( CameraButton7, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton7, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton7:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton7, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton7 )
	self.CameraButton7 = CameraButton7
	
	local CameraButton6 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton6:setLeftRight( false, false, 127, 277 )
	CameraButton6:setTopBottom( false, false, 0, 150 )
	CameraButton6:setZRot( -102.84 )
	CameraButton6.GrabBrakcetL:setAlpha( 0 )
	CameraButton6.AbilitylIcon:setZRot( 60 )
	CameraButton6:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera6", function ( model )
		CameraButton6:setModel( model, controller )
	end )
	CameraButton6:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f14_local0 = IsDisabled( element, controller )
				else
					f14_local0 = false
				end
				return f14_local0
			end
		}
	} )
	CameraButton6:linkToElementModel( CameraButton6, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton6, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton6:linkToElementModel( CameraButton6, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton6, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton6:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton6, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton6 )
	self.CameraButton6 = CameraButton6
	
	local CameraButton5 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton5:setLeftRight( false, false, 17, 167 )
	CameraButton5:setTopBottom( false, false, 142, 292 )
	CameraButton5:setZRot( -154.26 )
	CameraButton5.GradBracketR:setAlpha( 0 )
	CameraButton5.AbilitylIcon:setZRot( 120 )
	CameraButton5:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera5", function ( model )
		CameraButton5:setModel( model, controller )
	end )
	CameraButton5:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f19_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f19_local0 = IsDisabled( element, controller )
				else
					f19_local0 = false
				end
				return f19_local0
			end
		}
	} )
	CameraButton5:linkToElementModel( CameraButton5, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton5, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton5:linkToElementModel( CameraButton5, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton5, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton5:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton5, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton5 )
	self.CameraButton5 = CameraButton5
	
	local CameraButton4 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton4:setLeftRight( false, false, -167, -17 )
	CameraButton4:setTopBottom( false, false, 142, 292 )
	CameraButton4:setZRot( 154.26 )
	CameraButton4.GradBracketR:setAlpha( 0 )
	CameraButton4.GrabBrakcetL:setAlpha( 0 )
	CameraButton4.AbilitylIcon:setZRot( 180 )
	CameraButton4:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera4", function ( model )
		CameraButton4:setModel( model, controller )
	end )
	CameraButton4:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f24_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f24_local0 = IsDisabled( element, controller )
				else
					f24_local0 = false
				end
				return f24_local0
			end
		}
	} )
	CameraButton4:linkToElementModel( CameraButton4, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton4, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton4:linkToElementModel( CameraButton4, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton4, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton4, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton4 )
	self.CameraButton4 = CameraButton4
	
	local CameraButton3 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton3:setLeftRight( false, false, -276, -126 )
	CameraButton3:setTopBottom( false, false, 0, 150 )
	CameraButton3:setZRot( 102.84 )
	CameraButton3.GrabBrakcetL:setAlpha( 0 )
	CameraButton3.AbilitylIcon:setZRot( 240 )
	CameraButton3:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera3", function ( model )
		CameraButton3:setModel( model, controller )
	end )
	CameraButton3:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f29_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f29_local0 = IsDisabled( element, controller )
				else
					f29_local0 = false
				end
				return f29_local0
			end
		}
	} )
	CameraButton3:linkToElementModel( CameraButton3, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton3, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton3:linkToElementModel( CameraButton3, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton3, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton3, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton3 )
	self.CameraButton3 = CameraButton3
	
	local CameraButton2 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton2:setLeftRight( false, false, -242, -92 )
	CameraButton2:setTopBottom( false, false, -165, -15 )
	CameraButton2:setZRot( 51.43 )
	CameraButton2.GradBracketR:setAlpha( 0 )
	CameraButton2.AbilitylIcon:setZRot( -60 )
	CameraButton2:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera2", function ( model )
		CameraButton2:setModel( model, controller )
	end )
	CameraButton2:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f34_local0 = IsDisabled( element, controller )
				else
					f34_local0 = false
				end
				return f34_local0
			end
		}
	} )
	CameraButton2:linkToElementModel( CameraButton2, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton2, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton2:linkToElementModel( CameraButton2, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton2, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton2, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton2 )
	self.CameraButton2 = CameraButton2
	
	local CameraButton1 = CoD.AbilityButtonNew.new( f6_local1, controller )
	CameraButton1:setLeftRight( false, false, -75, 75 )
	CameraButton1:setTopBottom( false, false, -248, -98 )
	CameraButton1:setAlpha( RandomAddPercent( 20, 0.7 ) )
	CameraButton1.GradBracketR:setAlpha( 0.3 )
	CameraButton1.GrabBrakcetL:setAlpha( 0.3 )
	CameraButton1:subscribeToGlobalModel( controller, "SwitchCameraWheel", "Camera1", function ( model )
		CameraButton1:setModel( model, controller )
	end )
	CameraButton1:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f39_local0
				if not IsSelfModelValueTrue( element, controller, "enabled" ) then
					f39_local0 = IsDisabled( element, controller )
				else
					f39_local0 = false
				end
				return f39_local0
			end
		}
	} )
	CameraButton1:linkToElementModel( CameraButton1, "enabled", true, function ( model )
		f6_local1:updateElementState( CameraButton1, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "enabled"
		} )
	end )
	CameraButton1:linkToElementModel( CameraButton1, "disabled", true, function ( model )
		f6_local1:updateElementState( CameraButton1, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	CameraButton1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" ), function ( model )
		f6_local1:updateElementState( CameraButton1, {
			name = "model_validation",
			menu = f6_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomActiveType"
		} )
	end )
	self:addElement( CameraButton1 )
	self.CameraButton1 = CameraButton1
	
	local BracketBlur = CoD.AbilityWheel_BracketBlur.new( f6_local1, controller )
	BracketBlur:setLeftRight( true, false, 236, 1055.3 )
	BracketBlur:setTopBottom( true, false, 90.67, 703.33 )
	BracketBlur:setAlpha( 0.2 )
	BracketBlur:setZoom( 200 )
	self:addElement( BracketBlur )
	self.BracketBlur = BracketBlur
	
	local TabC = CoD.AbilityWheel_TabC.new( f6_local1, controller )
	TabC:setLeftRight( true, false, 522, 755 )
	TabC:setTopBottom( true, false, 71, 125 )
	TabC:setAlpha( 0 )
	TabC:subscribeToGlobalModel( controller, "SwitchCameraWheel", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			TabC.TextTab:setText( Engine.Localize( LocalizeToUpperString( name ) ) )
		end
	end )
	self:addElement( TabC )
	self.TabC = TabC
	
	local Description = CoD.AbilityWheel_Description.new( f6_local1, controller )
	Description:setLeftRight( false, false, -116.5, 116.5 )
	Description:setTopBottom( false, false, -35, 134 )
	Description:setAlpha( 0 )
	Description:subscribeToGlobalModel( controller, "SwitchCameraWheel", "selectedCameraDisplayDesc", function ( model )
		local selectedCameraDisplayDesc = Engine.GetModelValue( model )
		if selectedCameraDisplayDesc then
			Description.AbilityWheelDescriptionBottom.TextDesc:setText( Engine.Localize( selectedCameraDisplayDesc ) )
		end
	end )
	Description:subscribeToGlobalModel( controller, "SwitchCameraWheel", "selectedCameraDisplayName", function ( model )
		local selectedCameraDisplayName = Engine.GetModelValue( model )
		if selectedCameraDisplayName then
			Description.AbilityWheelDescriptionText.TextName:setText( Engine.Localize( selectedCameraDisplayName ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	CameraButton7.navigation = {
		left = CameraButton1,
		down = CameraButton6
	}
	CameraButton6.navigation = {
		left = CameraButton5,
		up = CameraButton7,
		down = CameraButton5
	}
	CameraButton5.navigation = {
		left = CameraButton4,
		up = CameraButton6,
		right = CameraButton6
	}
	CameraButton4.navigation = {
		left = CameraButton3,
		up = CameraButton3,
		right = CameraButton5
	}
	CameraButton3.navigation = {
		up = CameraButton2,
		right = CameraButton4,
		down = CameraButton4
	}
	CameraButton2.navigation = {
		right = CameraButton1,
		down = CameraButton3
	}
	CameraButton1.navigation = {
		left = CameraButton2,
		right = CameraButton7,
		down = {
			CameraButton4,
			CameraButton5
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
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
				local CameraButton6Frame2 = function ( CameraButton6, event )
					local CameraButton6Frame3 = function ( CameraButton6, event )
						local CameraButton6Frame4 = function ( CameraButton6, event )
							local CameraButton6Frame5 = function ( CameraButton6, event )
								local CameraButton6Frame6 = function ( CameraButton6, event )
									local CameraButton6Frame7 = function ( CameraButton6, event )
										local CameraButton6Frame8 = function ( CameraButton6, event )
											local CameraButton6Frame9 = function ( CameraButton6, event )
												local CameraButton6Frame10 = function ( CameraButton6, event )
													if not event.interrupted then
														CameraButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													CameraButton6:setAlpha( 1 )
													CameraButton6:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton6, event )
													else
														CameraButton6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton6Frame10( CameraButton6, event )
													return 
												else
													CameraButton6:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton6Frame9( CameraButton6, event )
												return 
											else
												CameraButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												CameraButton6:setAlpha( 0.8 )
												CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton6Frame8( CameraButton6, event )
											return 
										else
											CameraButton6:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton6Frame7( CameraButton6, event )
										return 
									else
										CameraButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										CameraButton6:setAlpha( 1 )
										CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton6Frame6( CameraButton6, event )
									return 
								else
									CameraButton6:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton6Frame5( CameraButton6, event )
								return 
							else
								CameraButton6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CameraButton6:setAlpha( 0.5 )
								CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton6Frame4( CameraButton6, event )
							return 
						else
							CameraButton6:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							CameraButton6:setAlpha( 1 )
							CameraButton6:setZoom( 0 )
							CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton6Frame3( CameraButton6, event )
						return 
					else
						CameraButton6:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						CameraButton6:registerEventHandler( "transition_complete_keyframe", CameraButton6Frame3 )
					end
				end
				
				CameraButton6:completeAnimation()
				self.CameraButton6:setAlpha( 0 )
				self.CameraButton6:setZoom( -6000 )
				CameraButton6Frame2( CameraButton6, {} )
				local CameraButton5Frame2 = function ( CameraButton5, event )
					local CameraButton5Frame3 = function ( CameraButton5, event )
						local CameraButton5Frame4 = function ( CameraButton5, event )
							local CameraButton5Frame5 = function ( CameraButton5, event )
								local CameraButton5Frame6 = function ( CameraButton5, event )
									local CameraButton5Frame7 = function ( CameraButton5, event )
										local CameraButton5Frame8 = function ( CameraButton5, event )
											local CameraButton5Frame9 = function ( CameraButton5, event )
												local CameraButton5Frame10 = function ( CameraButton5, event )
													if not event.interrupted then
														CameraButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													CameraButton5:setAlpha( 1 )
													CameraButton5:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton5, event )
													else
														CameraButton5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton5Frame10( CameraButton5, event )
													return 
												else
													CameraButton5:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton5Frame9( CameraButton5, event )
												return 
											else
												CameraButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												CameraButton5:setAlpha( 0.8 )
												CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton5Frame8( CameraButton5, event )
											return 
										else
											CameraButton5:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton5Frame7( CameraButton5, event )
										return 
									else
										CameraButton5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										CameraButton5:setAlpha( 1 )
										CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton5Frame6( CameraButton5, event )
									return 
								else
									CameraButton5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton5Frame5( CameraButton5, event )
								return 
							else
								CameraButton5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CameraButton5:setAlpha( 0.5 )
								CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton5Frame4( CameraButton5, event )
							return 
						else
							CameraButton5:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							CameraButton5:setAlpha( 1 )
							CameraButton5:setZoom( 0 )
							CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton5Frame3( CameraButton5, event )
						return 
					else
						CameraButton5:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						CameraButton5:registerEventHandler( "transition_complete_keyframe", CameraButton5Frame3 )
					end
				end
				
				CameraButton5:completeAnimation()
				self.CameraButton5:setAlpha( 0 )
				self.CameraButton5:setZoom( -6000 )
				CameraButton5Frame2( CameraButton5, {} )
				local CameraButton4Frame2 = function ( CameraButton4, event )
					local CameraButton4Frame3 = function ( CameraButton4, event )
						local CameraButton4Frame4 = function ( CameraButton4, event )
							local CameraButton4Frame5 = function ( CameraButton4, event )
								local CameraButton4Frame6 = function ( CameraButton4, event )
									local CameraButton4Frame7 = function ( CameraButton4, event )
										local CameraButton4Frame8 = function ( CameraButton4, event )
											local CameraButton4Frame9 = function ( CameraButton4, event )
												local CameraButton4Frame10 = function ( CameraButton4, event )
													if not event.interrupted then
														CameraButton4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													CameraButton4:setAlpha( 1 )
													CameraButton4:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton4, event )
													else
														CameraButton4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton4Frame10( CameraButton4, event )
													return 
												else
													CameraButton4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton4Frame9( CameraButton4, event )
												return 
											else
												CameraButton4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												CameraButton4:setAlpha( 0.8 )
												CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton4Frame8( CameraButton4, event )
											return 
										else
											CameraButton4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton4Frame7( CameraButton4, event )
										return 
									else
										CameraButton4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										CameraButton4:setAlpha( 1 )
										CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton4Frame6( CameraButton4, event )
									return 
								else
									CameraButton4:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton4Frame5( CameraButton4, event )
								return 
							else
								CameraButton4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CameraButton4:setAlpha( 0.5 )
								CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton4Frame4( CameraButton4, event )
							return 
						else
							CameraButton4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							CameraButton4:setAlpha( 1 )
							CameraButton4:setZoom( 0 )
							CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton4Frame3( CameraButton4, event )
						return 
					else
						CameraButton4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						CameraButton4:registerEventHandler( "transition_complete_keyframe", CameraButton4Frame3 )
					end
				end
				
				CameraButton4:completeAnimation()
				self.CameraButton4:setAlpha( 0 )
				self.CameraButton4:setZoom( -6000 )
				CameraButton4Frame2( CameraButton4, {} )
				local CameraButton3Frame2 = function ( CameraButton3, event )
					local CameraButton3Frame3 = function ( CameraButton3, event )
						local CameraButton3Frame4 = function ( CameraButton3, event )
							local CameraButton3Frame5 = function ( CameraButton3, event )
								local CameraButton3Frame6 = function ( CameraButton3, event )
									local CameraButton3Frame7 = function ( CameraButton3, event )
										local CameraButton3Frame8 = function ( CameraButton3, event )
											local CameraButton3Frame9 = function ( CameraButton3, event )
												local CameraButton3Frame10 = function ( CameraButton3, event )
													if not event.interrupted then
														CameraButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													CameraButton3:setAlpha( 1 )
													CameraButton3:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton3, event )
													else
														CameraButton3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton3Frame10( CameraButton3, event )
													return 
												else
													CameraButton3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton3Frame9( CameraButton3, event )
												return 
											else
												CameraButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												CameraButton3:setAlpha( 0.8 )
												CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton3Frame8( CameraButton3, event )
											return 
										else
											CameraButton3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton3Frame7( CameraButton3, event )
										return 
									else
										CameraButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										CameraButton3:setAlpha( 1 )
										CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton3Frame6( CameraButton3, event )
									return 
								else
									CameraButton3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton3Frame5( CameraButton3, event )
								return 
							else
								CameraButton3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CameraButton3:setAlpha( 0.5 )
								CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton3Frame4( CameraButton3, event )
							return 
						else
							CameraButton3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							CameraButton3:setAlpha( 1 )
							CameraButton3:setZoom( 0 )
							CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton3Frame3( CameraButton3, event )
						return 
					else
						CameraButton3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						CameraButton3:registerEventHandler( "transition_complete_keyframe", CameraButton3Frame3 )
					end
				end
				
				CameraButton3:completeAnimation()
				self.CameraButton3:setAlpha( 0 )
				self.CameraButton3:setZoom( -6000 )
				CameraButton3Frame2( CameraButton3, {} )
				local CameraButton2Frame2 = function ( CameraButton2, event )
					local CameraButton2Frame3 = function ( CameraButton2, event )
						local CameraButton2Frame4 = function ( CameraButton2, event )
							local CameraButton2Frame5 = function ( CameraButton2, event )
								local CameraButton2Frame6 = function ( CameraButton2, event )
									local CameraButton2Frame7 = function ( CameraButton2, event )
										local CameraButton2Frame8 = function ( CameraButton2, event )
											local CameraButton2Frame9 = function ( CameraButton2, event )
												local CameraButton2Frame10 = function ( CameraButton2, event )
													if not event.interrupted then
														CameraButton2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													CameraButton2:setAlpha( 1 )
													CameraButton2:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton2, event )
													else
														CameraButton2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton2Frame10( CameraButton2, event )
													return 
												else
													CameraButton2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton2Frame9( CameraButton2, event )
												return 
											else
												CameraButton2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												CameraButton2:setAlpha( 0.8 )
												CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton2Frame8( CameraButton2, event )
											return 
										else
											CameraButton2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton2Frame7( CameraButton2, event )
										return 
									else
										CameraButton2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										CameraButton2:setAlpha( 1 )
										CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton2Frame6( CameraButton2, event )
									return 
								else
									CameraButton2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton2Frame5( CameraButton2, event )
								return 
							else
								CameraButton2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								CameraButton2:setAlpha( 0.5 )
								CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton2Frame4( CameraButton2, event )
							return 
						else
							CameraButton2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							CameraButton2:setAlpha( 1 )
							CameraButton2:setZoom( 0 )
							CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton2Frame3( CameraButton2, event )
						return 
					else
						CameraButton2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						CameraButton2:registerEventHandler( "transition_complete_keyframe", CameraButton2Frame3 )
					end
				end
				
				CameraButton2:completeAnimation()
				self.CameraButton2:setAlpha( 0 )
				self.CameraButton2:setZoom( -6000 )
				CameraButton2Frame2( CameraButton2, {} )
				local CameraButton1Frame2 = function ( CameraButton1, event )
					local CameraButton1Frame3 = function ( CameraButton1, event )
						local CameraButton1Frame4 = function ( CameraButton1, event )
							local CameraButton1Frame5 = function ( CameraButton1, event )
								local CameraButton1Frame6 = function ( CameraButton1, event )
									local CameraButton1Frame7 = function ( CameraButton1, event )
										local CameraButton1Frame8 = function ( CameraButton1, event )
											local CameraButton1Frame9 = function ( CameraButton1, event )
												local CameraButton1Frame10 = function ( CameraButton1, event )
													if not event.interrupted then
														CameraButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													CameraButton1:setAlpha( RandomAddPercent( 20, 1 ) )
													CameraButton1:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( CameraButton1, event )
													else
														CameraButton1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													CameraButton1Frame10( CameraButton1, event )
													return 
												else
													CameraButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													CameraButton1:setAlpha( RandomAddPercent( 20, 0.7 ) )
													CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame10 )
												end
											end
											
											if event.interrupted then
												CameraButton1Frame9( CameraButton1, event )
												return 
											else
												CameraButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame9 )
											end
										end
										
										if event.interrupted then
											CameraButton1Frame8( CameraButton1, event )
											return 
										else
											CameraButton1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame8 )
										end
									end
									
									if event.interrupted then
										CameraButton1Frame7( CameraButton1, event )
										return 
									else
										CameraButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										CameraButton1:setAlpha( RandomAddPercent( 20, 1 ) )
										CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame7 )
									end
								end
								
								if event.interrupted then
									CameraButton1Frame6( CameraButton1, event )
									return 
								else
									CameraButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame6 )
								end
							end
							
							if event.interrupted then
								CameraButton1Frame5( CameraButton1, event )
								return 
							else
								CameraButton1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								CameraButton1:setAlpha( RandomAddPercent( 20, 0.5 ) )
								CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame5 )
							end
						end
						
						if event.interrupted then
							CameraButton1Frame4( CameraButton1, event )
							return 
						else
							CameraButton1:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							CameraButton1:setAlpha( RandomAddPercent( 20, 1 ) )
							CameraButton1:setZoom( 0 )
							CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame4 )
						end
					end
					
					if event.interrupted then
						CameraButton1Frame3( CameraButton1, event )
						return 
					else
						CameraButton1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame3 )
					end
				end
				
				CameraButton1:completeAnimation()
				self.CameraButton1:setAlpha( RandomAddPercent( 20, 0 ) )
				self.CameraButton1:setZoom( -6000 )
				CameraButton1Frame2( CameraButton1, {} )
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
			end,
			Close = function ()
				self:setupElementClipCounter( 20 )
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
				local CameraButton6Frame2 = function ( CameraButton6, event )
					if not event.interrupted then
						CameraButton6:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CameraButton6:setAlpha( 0 )
					CameraButton6:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( CameraButton6, event )
					else
						CameraButton6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CameraButton6:completeAnimation()
				self.CameraButton6:setAlpha( 1 )
				self.CameraButton6:setZoom( 0 )
				CameraButton6Frame2( CameraButton6, {} )
				local CameraButton5Frame2 = function ( CameraButton5, event )
					if not event.interrupted then
						CameraButton5:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CameraButton5:setAlpha( 0 )
					CameraButton5:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( CameraButton5, event )
					else
						CameraButton5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CameraButton5:completeAnimation()
				self.CameraButton5:setAlpha( 1 )
				self.CameraButton5:setZoom( 0 )
				CameraButton5Frame2( CameraButton5, {} )
				local CameraButton4Frame2 = function ( CameraButton4, event )
					if not event.interrupted then
						CameraButton4:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CameraButton4:setAlpha( 0 )
					CameraButton4:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( CameraButton4, event )
					else
						CameraButton4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CameraButton4:completeAnimation()
				self.CameraButton4:setAlpha( 1 )
				self.CameraButton4:setZoom( 0 )
				CameraButton4Frame2( CameraButton4, {} )
				local CameraButton3Frame2 = function ( CameraButton3, event )
					if not event.interrupted then
						CameraButton3:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CameraButton3:setAlpha( 0 )
					CameraButton3:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( CameraButton3, event )
					else
						CameraButton3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CameraButton3:completeAnimation()
				self.CameraButton3:setAlpha( 1 )
				self.CameraButton3:setZoom( 0 )
				CameraButton3Frame2( CameraButton3, {} )
				local CameraButton2Frame2 = function ( CameraButton2, event )
					if not event.interrupted then
						CameraButton2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CameraButton2:setAlpha( 0 )
					CameraButton2:setZoom( 750 )
					if event.interrupted then
						self.clipFinished( CameraButton2, event )
					else
						CameraButton2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CameraButton2:completeAnimation()
				self.CameraButton2:setAlpha( 1 )
				self.CameraButton2:setZoom( 0 )
				CameraButton2Frame2( CameraButton2, {} )
				local CameraButton1Frame2 = function ( CameraButton1, event )
					local CameraButton1Frame3 = function ( CameraButton1, event )
						if not event.interrupted then
							CameraButton1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						CameraButton1:setAlpha( RandomAddPercent( 20, 0 ) )
						CameraButton1:setZoom( 750 )
						if event.interrupted then
							self.clipFinished( CameraButton1, event )
						else
							CameraButton1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CameraButton1Frame3( CameraButton1, event )
						return 
					else
						CameraButton1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						CameraButton1:setAlpha( RandomAddPercent( 20, 0 ) )
						CameraButton1:setZoom( 750 )
						CameraButton1:registerEventHandler( "transition_complete_keyframe", CameraButton1Frame3 )
					end
				end
				
				CameraButton1:completeAnimation()
				self.CameraButton1:setAlpha( RandomAddPercent( 20, 0.7 ) )
				self.CameraButton1:setZoom( 0 )
				CameraButton1Frame2( CameraButton1, {} )
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
			end
		}
	}
	self:registerEventHandler( "input_source_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	CoD.Menu.AddNavigationHandler( f6_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f264_local0 = nil
		LockInput( self, controller, true )
		if not f264_local0 then
			f264_local0 = element:dispatchEventToChildren( event )
		end
		return f264_local0
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, "MWHEELUP", function ( f265_arg0, f265_arg1, f265_arg2, f265_arg3 )
		if IsMulticoreActivated( f265_arg2 ) then
			ChangeAbilityWheelItems( f265_arg2, f265_arg1, -1 )
			PlaySoundSetSound( self, "left_bumper" )
			return true
		else
			
		end
	end, function ( f266_arg0, f266_arg1, f266_arg2 )
		CoD.Menu.SetButtonLabel( f266_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		if IsMulticoreActivated( f266_arg2 ) then
			return false
		else
			return false
		end
	end, false )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, "MWHEELDOWN", function ( f267_arg0, f267_arg1, f267_arg2, f267_arg3 )
		if IsMulticoreActivated( f267_arg2 ) then
			ChangeAbilityWheelItems( f267_arg2, f267_arg1, 1 )
			PlaySoundSetSound( self, "right_bumper" )
			return true
		else
			
		end
	end, function ( f268_arg0, f268_arg1, f268_arg2 )
		CoD.Menu.SetButtonLabel( f268_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		if IsMulticoreActivated( f268_arg2 ) then
			return false
		else
			return false
		end
	end, false )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f269_arg0, f269_arg1, f269_arg2, f269_arg3 )
		if not IsGamepad( f269_arg2 ) then
			Close( self, f269_arg2 )
			return true
		else
			
		end
	end, function ( f270_arg0, f270_arg1, f270_arg2 )
		CoD.Menu.SetButtonLabel( f270_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if not IsGamepad( f270_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	CameraButton7.id = "CameraButton7"
	CameraButton6.id = "CameraButton6"
	CameraButton5.id = "CameraButton5"
	CameraButton4.id = "CameraButton4"
	CameraButton3.id = "CameraButton3"
	CameraButton2.id = "CameraButton2"
	CameraButton1.id = "CameraButton1"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.CameraButton1:processEvent( {
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
		element.CameraButton7:close()
		element.CameraButton6:close()
		element.CameraButton5:close()
		element.CameraButton4:close()
		element.CameraButton3:close()
		element.CameraButton2:close()
		element.CameraButton1:close()
		element.BracketBlur:close()
		element.TabC:close()
		element.Description:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SwitchCameraWheel.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

