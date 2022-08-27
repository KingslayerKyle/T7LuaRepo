-- e06c8d2a854616b22b8fbf39c313c6df
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialSwatch" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialInfo" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialControls" )
require( "ui.uieditor.widgets.PC.Craft.CraftEmblemEditMouseInstructions" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftMaterialActionsPC = DataSourceHelpers.ListSetup( "PC.CraftMaterialActionsPC", function ( f1_arg0 )
		return CoD.PCUtil.Craft_GetEmblemEditorMaterialActions( f1_arg0 )
	end, true )
	DataSources.CraftMaterialActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local f0_local0 = function ( f2_arg0, f2_arg1 )
	f2_arg0.emblemDrawWidget0:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	f2_arg0.emblemDrawWidget0:registerEventHandler( "leftmousedown", function ( element, event )
		element.m_lastX = event.x
		element.m_lastY = event.y
	end )
	f2_arg0.emblemDrawWidget0:registerEventHandler( "mousedrag", function ( element, event )
		local f5_local0, f5_local1, f5_local2, f5_local3 = element:getRect()
		local f5_local4 = (event.x - element.m_lastX) / (f5_local2 - f5_local0)
		local f5_local5 = (event.y - element.m_lastY) / (f5_local3 - f5_local1)
		if CoD.GetEditorProperties( f2_arg1, "materialScaleMode" ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
			local f5_local6 = f5_local4
			if math.abs( f5_local4 ) < math.abs( f5_local5 ) then
				f5_local6 = f5_local5
			end
			Engine.ExecNow( f2_arg1, "emblemUpdateMaterialScaleX " .. f5_local6 )
			Engine.ExecNow( f2_arg1, "emblemUpdateMaterialScaleY " .. f5_local6 )
		else
			Engine.ExecNow( f2_arg1, "emblemUpdateMaterialScaleX " .. f5_local4 )
			Engine.ExecNow( f2_arg1, "emblemUpdateMaterialScaleY " .. f5_local5 )
		end
		element.m_lastX = event.x
		element.m_lastY = event.y
	end )
	CoD.Menu.AddButtonCallbackFunction( f2_arg0, f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not f2_arg0.m_disableNavigation then
			Engine.ExecNow( f6_arg2, "emblemUpdateMaterialScaleX 0.02" )
			Engine.ExecNow( f6_arg2, "emblemUpdateMaterialScaleY 0.02" )
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f2_arg0, f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not f2_arg0.m_disableNavigation then
			Engine.ExecNow( f7_arg2, "emblemUpdateMaterialScaleX -0.02" )
			Engine.ExecNow( f7_arg2, "emblemUpdateMaterialScaleY -0.02" )
		end
	end )
	f2_arg0.actionsListPC:setDataSource( "CraftMaterialActionsPC" )
	f2_arg0.actionsListPC.navigation = nil
end

local f0_local1 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = 100
	local f8_local1 = function ()
		if f8_arg0.xValue ~= 0 and f8_arg0.yValue ~= 0 and f8_arg0.length ~= 0 then
			local f9_local0 = f8_arg0.length
			if f9_local0 >= 0.5 then
				f9_local0 = (f9_local0 - 0.45) * 2
			elseif f9_local0 >= 0.2 then
				f9_local0 = 0.1
			else
				f9_local0 = 0
			end
			f8_arg0.xValue = f8_arg0.xValue * f9_local0
			f8_arg0.yValue = f8_arg0.yValue * f9_local0
		end
	end
	
	local f8_local2 = function ()
		if f8_arg0.xValue ~= 0 and f8_arg0.yValue ~= 0 then
			local f10_local0 = 0.05
			local f10_local1 = 0
			local f10_local2 = f8_arg0.xValue * f10_local0
			local f10_local3 = f8_arg0.yValue * f10_local0
			if CoD.GetEditorProperties( f8_arg1, "materialScaleMode" ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
				if f10_local1 < math.abs( f10_local2 ) then
					Engine.ExecNow( f8_arg1, "emblemUpdateMaterialScaleX " .. f10_local2 )
					Engine.ExecNow( f8_arg1, "emblemUpdateMaterialScaleY " .. f10_local2 )
				end
			else
				if f10_local1 < math.abs( f10_local2 ) then
					Engine.ExecNow( f8_arg1, "emblemUpdateMaterialScaleX " .. f10_local2 )
				end
				if f10_local1 < math.abs( f10_local3 ) then
					Engine.ExecNow( f8_arg1, "emblemUpdateMaterialScaleY " .. f10_local3 )
				end
			end
		end
	end
	
	local f8_local3 = function ( f11_arg0, f11_arg1 )
		local f11_local0 = Engine.GetModel( Engine.GetModelForController( f8_arg1 ), "RightStick" )
		if f11_local0 then
			f11_arg0.xValue = Engine.GetModelValue( Engine.GetModel( f11_local0, "X" ) )
			f11_arg0.yValue = Engine.GetModelValue( Engine.GetModel( f11_local0, "Y" ) )
			f11_arg0.length = Engine.GetModelValue( Engine.GetModel( f11_local0, "Length" ) )
			f8_local1()
			f8_local2()
		end
	end
	
	f8_arg0:addElement( LUI.UITimer.new( f8_local0, "get_right_stick_values", false, f8_arg0 ) )
	f8_arg0:registerEventHandler( "get_right_stick_values", f8_local3 )
end

local PostLoadFunc = function ( f12_arg0, f12_arg1 )
	f0_local1( f12_arg0, f12_arg1 )
	f12_arg0.materialSwatch.navigation = nil
	f12_arg0.emblemDrawWidget0.navigation = nil
	if CoD.isPC then
		f0_local0( f12_arg0, f12_arg1 )
	end
end

local f0_local3 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = CoD.perController[f13_arg1].selectedLayerMaterialID
	if f13_local0 ~= CoD.emblem.INVALID_ID then
		for f13_local4, f13_local5 in ipairs( CoD.emblem.MaterialCategory ) do
			if Engine.GetSelectedLayerMaterialIndex( f13_arg1, f13_local5.category, f13_local0 ) ~= CoD.emblem.INVALID_ID then
				return f13_local5.category
			end
		end
		
	else
		return CoD.emblem.MaterialCategory[1].category
	end
end

local f0_local4 = function ( f14_arg0 )
	for f14_local3, f14_local4 in ipairs( CoD.emblem.MaterialCategory ) do
		if f14_local4.category == CoD.perController[f14_arg0].selectedMaterialCategory then
			return f14_local3
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( f16_arg0 )
		local f16_local0 = CoD.perController[controller].selectedLayerMaterialID
		if f16_local0 ~= CoD.emblem.INVALID_ID then
			CoD.perController[controller].selectedMaterialCategory = f0_local3( f16_arg0, controller )
			local f16_local1 = f16_arg0.materialSwatch.tabList.Tabs.grid
			if f16_local1 then
				f16_local1:findItem( nil, {
					filter = CoD.perController[controller].selectedMaterialCategory
				}, true, nil )
			end
			local f16_local2 = f16_arg0.materialSwatch.materialSwatch:findItem( {
				materialID = f16_local0
			}, nil, true )
			if f16_local2 then
				f16_arg0.materialSwatch.materialSwatch:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = f16_local2.gridInfoTable.zeroBasedIndex
				} )
				return true
			end
		end
		f16_arg0.materialSwatch.lastSavedColor:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
		return true
	end
	
end

LUI.createMenu.EmblemEditorMaterialPicker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditorMaterialPicker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "SelectColor"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" )
	local f17_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f17_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 109, -109 )
	StartMenuBackground0:setAlpha( 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -638, 642 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setAlpha( 0 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( true, true, 0, 0 )
	ScreenBkgd:setTopBottom( true, true, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0 )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local TitleBacking00 = LUI.UIImage.new()
	TitleBacking00:setLeftRight( false, false, -640, 640 )
	TitleBacking00:setTopBottom( false, false, -360, -274 )
	TitleBacking00:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking00 )
	self.TitleBacking00 = TitleBacking00
	
	local emblemDrawWidget0 = CoD.EmblemDrawWidgetNew.new( f17_local1, controller )
	emblemDrawWidget0:setLeftRight( true, false, 390, 890 )
	emblemDrawWidget0:setTopBottom( true, false, 130, 441 )
	emblemDrawWidget0:setAlpha( 0 )
	self:addElement( emblemDrawWidget0 )
	self.emblemDrawWidget0 = emblemDrawWidget0
	
	local materialSwatch = CoD.EmblemEditorMaterialSwatch.new( f17_local1, controller )
	materialSwatch:setLeftRight( true, false, 335, 945 )
	materialSwatch:setTopBottom( true, false, 459.5, 660.5 )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -640, 640 )
	FooterBacking:setTopBottom( false, false, 291.5, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local materialInfo = CoD.EmblemEditorMaterialInfo.new( f17_local1, controller )
	materialInfo:setLeftRight( true, false, 916, 1084 )
	materialInfo:setTopBottom( true, false, 129, 275 )
	materialInfo:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		materialInfo:setModel( model, controller )
	end )
	self:addElement( materialInfo )
	self.materialInfo = materialInfo
	
	local materialControls = CoD.EmblemEditorMaterialControls.new( f17_local1, controller )
	materialControls:setLeftRight( true, false, 110, 360 )
	materialControls:setTopBottom( true, false, 130, 275 )
	materialControls:mergeStateConditions( {
		{
			stateName = "FixedScale",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.materialScaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
			end
		},
		{
			stateName = "FreeScale",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.materialScaleMode", Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE )
			end
		}
	} )
	materialControls:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.materialScaleMode" ), function ( model )
		f17_local1:updateElementState( materialControls, {
			name = "model_validation",
			menu = f17_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.materialScaleMode"
		} )
	end )
	self:addElement( materialControls )
	self.materialControls = materialControls
	
	local mouseInstructions = CoD.CraftEmblemEditMouseInstructions.new( f17_local1, controller )
	mouseInstructions:setLeftRight( true, false, 916, 1084 )
	mouseInstructions:setTopBottom( true, false, 285.5, 365.5 )
	mouseInstructions:setAlpha( 0 )
	mouseInstructions:mergeStateConditions( {
		{
			stateName = "MaterialScale",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( mouseInstructions )
	self.mouseInstructions = mouseInstructions
	
	local actionsListPC = LUI.UIList.new( f17_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( true, false, 64, 314 )
	actionsListPC:setTopBottom( true, false, 111, 329 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 10 )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	local EmblemEditorFrame = CoD.GenericMenuFrame.new( f17_local1, controller )
	EmblemEditorFrame:setLeftRight( true, true, 0, 0 )
	EmblemEditorFrame:setTopBottom( true, true, 0, 0 )
	EmblemEditorFrame.titleLabel:setText( Engine.Localize( "MENU_EDIT_LAYER_MATERIAL" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_LAYER_MATERIAL" ) )
	EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( EmblemEditorFrame )
	self.EmblemEditorFrame = EmblemEditorFrame
	
	emblemDrawWidget0.navigation = {
		left = actionsListPC,
		down = materialSwatch
	}
	materialSwatch.navigation = {
		up = emblemDrawWidget0
	}
	actionsListPC.navigation = {
		right = emblemDrawWidget0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( true, false, 916, 1085 )
				self.materialInfo:setTopBottom( true, false, 129, 275 )
				self.clipFinished( materialInfo, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 64, 314 )
				self.actionsListPC:setTopBottom( true, false, 129, 347 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 0.01 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( true, false, 1048, 1216 )
				self.materialInfo:setTopBottom( true, false, 111, 257 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 64, 314 )
				self.materialControls:setTopBottom( true, false, 110, 255 )
				self.materialControls:setAlpha( 0 )
				self.clipFinished( materialControls, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 1048, 1216 )
				self.mouseInstructions:setTopBottom( true, false, 265.5, 345.5 )
				self.mouseInstructions:setAlpha( 1 )
				self.clipFinished( mouseInstructions, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 64, 314 )
				self.actionsListPC:setTopBottom( true, false, 129, 347 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 0 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( true, false, 1048, 1216 )
				self.materialInfo:setTopBottom( true, false, 129, 275 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 64, 314 )
				self.materialControls:setTopBottom( true, false, 130, 275 )
				self.materialControls:setAlpha( 1 )
				self.clipFinished( materialControls, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 1048, 1216 )
				self.mouseInstructions:setTopBottom( true, false, 265.5, 345.5 )
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 64, 314 )
				self.actionsListPC:setTopBottom( true, false, 130, 348 )
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
				EmblemEditorFrame:completeAnimation()
				self.EmblemEditorFrame:setAlpha( 1 )
				self.clipFinished( EmblemEditorFrame, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( false, true, -364, -195 )
				self.materialInfo:setTopBottom( true, false, 130, 276 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 113, 363 )
				self.materialControls:setTopBottom( true, false, 130, 275 )
				self.materialControls:setAlpha( 0 )
				self.clipFinished( materialControls, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 916, 1084 )
				self.mouseInstructions:setTopBottom( true, false, 280, 360 )
				self.mouseInstructions:setAlpha( 1 )
				self.clipFinished( mouseInstructions, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 64, 314 )
				self.actionsListPC:setTopBottom( true, false, 130, 348 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( false, true, -364, -195 )
				self.materialInfo:setTopBottom( true, false, 129, 275 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 110, 360 )
				self.materialControls:setTopBottom( true, false, 130, 275 )
				self.materialControls:setAlpha( 1 )
				self.clipFinished( materialControls, {} )
				mouseInstructions:completeAnimation()
				self.mouseInstructions:setLeftRight( true, false, 1048, 1216 )
				self.mouseInstructions:setTopBottom( true, false, 264.5, 344.5 )
				self.mouseInstructions:setAlpha( 0 )
				self.clipFinished( mouseInstructions, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( true, false, 64, 314 )
				self.actionsListPC:setTopBottom( true, false, 130, 348 )
				self.actionsListPC:setAlpha( 0 )
				self.clipFinished( actionsListPC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Paintshop_PC",
			condition = function ( menu, element, event )
				return IsPaintshop( controller ) and not IsGamepad( controller )
			end
		},
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		},
		{
			stateName = "EmblemEditor_PC",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller ) and not IsGamepad( controller )
			end
		},
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f17_local15 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or f17_local1
			element:updateState( event )
			return f17_local15( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		f17_local1:updateElementState( self, {
			name = "model_validation",
			menu = f17_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f17_local1, self, controller )
	f17_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		GoBack( self, f36_arg2 )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f17_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, f38_arg0, "-1", f38_arg2 )
		return true
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "" )
		return false
	end, false )
	f17_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, f40_arg0, "1", f40_arg2 )
		return true
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		return false
	end, false )
	f17_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		EmblemChooseMaterial_ToggleScaleMode( self, f42_arg0, f42_arg2 )
		return true
	end, function ( f43_arg0, f43_arg1, f43_arg2 )
		CoD.Menu.SetButtonLabel( f43_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
		return false
	end, false )
	emblemDrawWidget0.id = "emblemDrawWidget0"
	materialSwatch.id = "materialSwatch"
	actionsListPC.id = "actionsListPC"
	EmblemEditorFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f17_local1
	} )
	if not self:restoreState() then
		self.materialSwatch:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.emblemDrawWidget0:close()
		element.materialSwatch:close()
		element.materialInfo:close()
		element.materialControls:close()
		element.mouseInstructions:close()
		element.actionsListPC:close()
		element.EmblemEditorFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

