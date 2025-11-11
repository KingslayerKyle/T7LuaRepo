require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialControls" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialInfo" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialSwatch" )
require( "ui.uieditor.widgets.PC.Craft.CraftActionHeader" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

if CoD.isPC then
	require( "ui.uieditor.widgets.PC.Craft.CraftActionButton" )
	require( "ui.uieditor.widgets.PC.Craft.CraftActionSlider" )
	DataSources.CraftMaterialActionsPC = DataSourceHelpers.ListSetup( "PC.CraftMaterialActionsPC", function ( controller )
		return CoD.PCUtil.Craft_GetEmblemEditorMaterialActions( controller )
	end, true )
	DataSources.CraftMaterialActionsPC.getWidgetTypeForItem = CoD.PCUtil.Craft_WidgetSelectorFunc
end
local SetupPC = function ( self, controller )
	self.emblemDrawWidget0:registerEventHandler( "button_action", function ( element, event )
		return true
	end )
	self.emblemDrawWidget0:registerEventHandler( "leftmousedown", function ( element, event )
		element.m_lastX = event.x
		element.m_lastY = event.y
	end )
	self.emblemDrawWidget0:registerEventHandler( "mousedrag", function ( element, event )
		local left, top, right, bottom = element:getRect()
		local dx = (event.x - element.m_lastX) / (right - left)
		local dy = (event.y - element.m_lastY) / (bottom - top)
		local scaleMode = CoD.GetEditorProperties( controller, "materialScaleMode" )
		if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
			local scaleDelta = dx
			if math.abs( dx ) < math.abs( dy ) then
				scaleDelta = dy
			end
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleX " .. scaleDelta )
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleY " .. scaleDelta )
		else
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleX " .. dx )
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleY " .. dy )
		end
		element.m_lastX = event.x
		element.m_lastY = event.y
	end )
	CoD.Menu.AddButtonCallbackFunction( self, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleX 0.02" )
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleY 0.02" )
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( self, self, controller, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( element, menu, controller, model )
		if not self.m_disableNavigation then
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleX -0.02" )
			Engine.ExecNow( controller, "emblemUpdateMaterialScaleY -0.02" )
		end
	end )
	self.actionsListPC:setDataSource( "CraftMaterialActionsPC" )
	self.actionsListPC.navigation = nil
end

local SubscribeToRightStickUpdates = function ( self, controller )
	local rightStickUpdateTimer = 100
	local ClampRightStickValues = function ()
		if self.xValue ~= 0 and self.yValue ~= 0 and self.length ~= 0 then
			local length = self.length
			if length >= 0.5 then
				length = (length - 0.45) * 2
			elseif length >= 0.2 then
				length = 0.1
			else
				length = 0
			end
			self.xValue = self.xValue * length
			self.yValue = self.yValue * length
		end
	end
	
	local UpdateMaterialScale = function ()
		if self.xValue ~= 0 and self.yValue ~= 0 then
			local scale_velocity = 0.05
			local min_scale_step = 0
			local xScaleStep = self.xValue * scale_velocity
			local yScaleStep = self.yValue * scale_velocity
			local scaleMode = CoD.GetEditorProperties( controller, "materialScaleMode" )
			if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
				if min_scale_step < math.abs( xScaleStep ) then
					Engine.ExecNow( controller, "emblemUpdateMaterialScaleX " .. xScaleStep )
					Engine.ExecNow( controller, "emblemUpdateMaterialScaleY " .. xScaleStep )
				end
			else
				if min_scale_step < math.abs( xScaleStep ) then
					Engine.ExecNow( controller, "emblemUpdateMaterialScaleX " .. xScaleStep )
				end
				if min_scale_step < math.abs( yScaleStep ) then
					Engine.ExecNow( controller, "emblemUpdateMaterialScaleY " .. yScaleStep )
				end
			end
		end
	end
	
	local GetRightStickValues = function ( self, event )
		local rightStickModel = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
		if rightStickModel then
			self.xValue = Engine.GetModelValue( Engine.GetModel( rightStickModel, "X" ) )
			self.yValue = Engine.GetModelValue( Engine.GetModel( rightStickModel, "Y" ) )
			self.length = Engine.GetModelValue( Engine.GetModel( rightStickModel, "Length" ) )
			ClampRightStickValues()
			UpdateMaterialScale()
		end
	end
	
	self:addElement( LUI.UITimer.new( rightStickUpdateTimer, "get_right_stick_values", false, self ) )
	self:registerEventHandler( "get_right_stick_values", GetRightStickValues )
end

local PostLoadFunc = function ( self, controller )
	SubscribeToRightStickUpdates( self, controller )
	self.materialSwatch.navigation = nil
	self.emblemDrawWidget0.navigation = nil
	if CoD.isPC then
		SetupPC( self, controller )
	end
end

local GetSelectedMaterialCategory = function ( self, controller )
	local selectedLayerMaterialID = CoD.perController[controller].selectedLayerMaterialID
	if selectedLayerMaterialID ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
		for key, tabData in ipairs( CoD.CraftUtility.EmblemMaterialCategory ) do
			if Engine.GetSelectedLayerMaterialIndex( controller, tabData.category, selectedLayerMaterialID ) ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
				return tabData.category
			end
		end
		
	else
		return CoD.CraftUtility.EmblemMaterialCategory[1].category
	end
end

local FindTabIDForSelectedLayerMaterial = function ( controller )
	for key, tabData in ipairs( CoD.CraftUtility.EmblemMaterialCategory ) do
		if tabData.category == CoD.perController[controller].selectedMaterialCategory then
			return key + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local selectedLayerMaterialID = CoD.perController[controller].selectedLayerMaterialID
		if selectedLayerMaterialID ~= CoD.CraftUtility.EMBLEM_INVALID_ID then
			CoD.perController[controller].selectedMaterialCategory = GetSelectedMaterialCategory( self, controller )
			local tabGrid = self.materialSwatch.tabList.Tabs.grid
			if tabGrid then
				local selectedTabWidget = tabGrid:getItemAt( FindTabIDForSelectedLayerMaterial( controller ) )
				if selectedTabWidget then
					tabGrid:setActiveItem( selectedTabWidget )
				end
			end
			local focussedWidget = self.materialSwatch.materialSwatch:findItem( {
				materialID = selectedLayerMaterialID
			}, nil, false )
			if focussedWidget then
				self.materialSwatch.materialSwatch:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = focussedWidget.gridInfoTable.zeroBasedIndex
				} )
				return true
			end
		end
		self.materialSwatch.lastSavedColor:processEvent( {
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 164, -164 )
	StartMenuBackground0:setAlpha( 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -957, 963 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setAlpha( 0 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( 0, 1, 0, 0 )
	ScreenBkgd:setTopBottom( 0, 1, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0 )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local TitleBacking00 = LUI.UIImage.new()
	TitleBacking00:setLeftRight( 0.5, 0.5, -960, 960 )
	TitleBacking00:setTopBottom( 0.5, 0.5, -540, -411 )
	TitleBacking00:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking00 )
	self.TitleBacking00 = TitleBacking00
	
	local emblemDrawWidget0 = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget0:setLeftRight( 0, 0, 585, 1335 )
	emblemDrawWidget0:setTopBottom( 0, 0, 195, 661 )
	emblemDrawWidget0:setAlpha( 0 )
	self:addElement( emblemDrawWidget0 )
	self.emblemDrawWidget0 = emblemDrawWidget0
	
	local materialSwatch = CoD.EmblemEditorMaterialSwatch.new( self, controller )
	materialSwatch:setLeftRight( 0, 0, 502.5, 1417.5 )
	materialSwatch:setTopBottom( 0, 0, 689, 991 )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( 0.5, 0.5, -960, 960 )
	FooterBacking:setTopBottom( 0.5, 0.5, 437, 540 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 0, 1920 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local materialInfo = CoD.EmblemEditorMaterialInfo.new( self, controller )
	materialInfo:setLeftRight( 0, 0, 1374, 1626 )
	materialInfo:setTopBottom( 0, 0, 193.5, 412.5 )
	materialInfo:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		materialInfo:setModel( model, controller )
	end )
	self:addElement( materialInfo )
	self.materialInfo = materialInfo
	
	local materialControls = CoD.EmblemEditorMaterialControls.new( self, controller )
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
		self:updateElementState( materialControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.materialScaleMode"
		} )
	end )
	materialControls:setLeftRight( 0, 0, 164.5, 539.5 )
	materialControls:setTopBottom( 0, 0, 195, 413 )
	self:addElement( materialControls )
	self.materialControls = materialControls
	
	local actionsListPC = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	actionsListPC:makeFocusable()
	actionsListPC:setLeftRight( 0, 0, 96, 471 )
	actionsListPC:setTopBottom( 0, 0, 171, 489 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 10 )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	local EmblemEditorFrame = CoD.GenericMenuFrame.new( self, controller )
	EmblemEditorFrame:setLeftRight( 0, 1, 0, 0 )
	EmblemEditorFrame:setTopBottom( 0, 1, 0, 0 )
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
	self.resetProperties = function ()
		ScreenBkgd:completeAnimation()
		Background:completeAnimation()
		StartMenuBackground0:completeAnimation()
		actionsListPC:completeAnimation()
		materialInfo:completeAnimation()
		emblemDrawWidget0:completeAnimation()
		materialControls:completeAnimation()
		ScreenBkgd:setAlpha( 0 )
		Background:setAlpha( 0 )
		StartMenuBackground0:setAlpha( 0 )
		actionsListPC:setLeftRight( 0, 0, 96, 471 )
		actionsListPC:setTopBottom( 0, 0, 171, 489 )
		actionsListPC:setAlpha( 0 )
		materialInfo:setLeftRight( 0, 0, 1374, 1626 )
		materialInfo:setTopBottom( 0, 0, 193.5, 412.5 )
		emblemDrawWidget0:setAlpha( 0 )
		materialControls:setLeftRight( 0, 0, 164.5, 539.5 )
		materialControls:setTopBottom( 0, 0, 195, 413 )
		materialControls:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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
				self.materialInfo:setLeftRight( 0, 0, 1374, 1628 )
				self.materialInfo:setTopBottom( 0, 0, 193.5, 412.5 )
				self.clipFinished( materialInfo, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 96, 471 )
				self.actionsListPC:setTopBottom( 0, 0, 193.5, 520.5 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 0.01 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( 0, 0, 96.5, 471.5 )
				self.materialControls:setTopBottom( 0, 0, 165, 383 )
				self.materialControls:setAlpha( 0 )
				self.clipFinished( materialControls, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 96, 471 )
				self.actionsListPC:setTopBottom( 0, 0, 193.5, 520.5 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( 0, 0, 1572, 1824 )
				self.materialInfo:setTopBottom( 0, 0, 193.5, 412.5 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( 0, 0, 96.5, 471.5 )
				self.materialControls:setTopBottom( 0, 0, 195, 413 )
				self.clipFinished( materialControls, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 96, 471 )
				self.actionsListPC:setTopBottom( 0, 0, 194.5, 521.5 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor_PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
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
				self.materialInfo:setLeftRight( 1, 1, -546, -292 )
				self.materialInfo:setTopBottom( 0, 0, 194.5, 413.5 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( 0, 0, 169.5, 544.5 )
				self.materialControls:setTopBottom( 0, 0, 195, 413 )
				self.materialControls:setAlpha( 0 )
				self.clipFinished( materialControls, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 96, 471 )
				self.actionsListPC:setTopBottom( 0, 0, 194.5, 521.5 )
				self.actionsListPC:setAlpha( 1 )
				self.clipFinished( actionsListPC, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self.resetProperties()
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
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( 1, 1, -546, -292 )
				self.materialInfo:setTopBottom( 0, 0, 193.5, 412.5 )
				self.clipFinished( materialInfo, {} )
				actionsListPC:completeAnimation()
				self.actionsListPC:setLeftRight( 0, 0, 96, 471 )
				self.actionsListPC:setTopBottom( 0, 0, 194.5, 521.5 )
				self.clipFinished( actionsListPC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Paintshop_PC",
			condition = function ( menu, element, event )
				local f29_local0 = IsPaintshop( controller )
				if f29_local0 then
					if not IsGamepad( controller ) then
						f29_local0 = IsPC()
					else
						f29_local0 = false
					end
				end
				return f29_local0
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
				local f31_local0 = IsEmblemEditor( controller )
				if f31_local0 then
					if not IsGamepad( controller ) then
						f31_local0 = IsPC()
					else
						f31_local0 = false
					end
				end
				return f31_local0
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
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, "-1", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, "1", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_ToggleScaleMode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.materialSwatch:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.emblemDrawWidget0:close()
		self.materialSwatch:close()
		self.materialInfo:close()
		self.materialControls:close()
		self.actionsListPC:close()
		self.EmblemEditorFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

