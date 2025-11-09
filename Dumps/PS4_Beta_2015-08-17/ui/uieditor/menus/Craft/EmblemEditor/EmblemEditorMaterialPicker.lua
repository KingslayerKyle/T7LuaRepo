require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialSwatch" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialInfo" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialControls" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

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
end

local GetSelectedMaterialCategory = function ( self, controller )
	local selectedLayerMaterialID = CoD.perController[controller].selectedLayerMaterialID
	if selectedLayerMaterialID ~= CoD.emblem.INVALID_ID then
		for key, tabData in ipairs( CoD.emblem.MaterialCategory ) do
			if Engine.GetSelectedLayerMaterialIndex( controller, tabData.category, selectedLayerMaterialID ) ~= CoD.emblem.INVALID_ID then
				return tabData.category
			end
		end
		
	else
		return CoD.emblem.MaterialCategory[1].category
	end
end

local FindTabIDForSelectedLayerMaterial = function ( controller )
	for key, tabData in ipairs( CoD.emblem.MaterialCategory ) do
		if tabData.category == CoD.perController[controller].selectedMaterialCategory then
			return key + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local selectedLayerMaterialID = CoD.perController[controller].selectedLayerMaterialID
		if selectedLayerMaterialID ~= CoD.emblem.INVALID_ID then
			CoD.perController[controller].selectedMaterialCategory = GetSelectedMaterialCategory( self, controller )
			self.materialSwatch.tabList.grid:setActiveItem( self.materialSwatch.tabList.grid:getItemAt( FindTabIDForSelectedLayerMaterial( controller ) ) )
			local totalIcons = Engine.GetEmblemMaterialFilterCount( controller, CoD.perController[controller].selectedMaterialCategory )
			local focussedWidget = self.materialSwatch.materialSwatch:findItem( {
				materialID = selectedLayerMaterialID
			}, nil, false )
			if focussedWidget then
				self.materialSwatch.materialSwatch:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = focussedWidget.gridInfoTable.zeroBasedIndex
				} )
			end
		else
			self.materialSwatch.lastSavedColor:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
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
	
	local emblemDrawWidget0 = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget0:setLeftRight( true, false, 394, 889 )
	emblemDrawWidget0:setTopBottom( true, false, 110, 390.5 )
	self:addElement( emblemDrawWidget0 )
	self.emblemDrawWidget0 = emblemDrawWidget0
	
	local materialSwatch = CoD.EmblemEditorMaterialSwatch.new( self, controller )
	materialSwatch:setLeftRight( true, false, 282, 953 )
	materialSwatch:setTopBottom( true, false, 470.5, 631.5 )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -640, 640 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setAlpha( 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TitleEditLayer = CoD.cac_3dTitleIntermediary.new( self, controller )
	TitleEditLayer:setLeftRight( true, false, -77.33, 500.67 )
	TitleEditLayer:setTopBottom( true, false, 1, 147 )
	TitleEditLayer.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_LAYER_MATERIAL" ) )
	TitleEditLayer.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_paintshop" ) )
	TitleEditLayer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( TitleEditLayer )
	self.TitleEditLayer = TitleEditLayer
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local materialInfo = CoD.EmblemEditorMaterialInfo.new( self, controller )
	materialInfo:setLeftRight( true, false, 1048, 1216 )
	materialInfo:setTopBottom( true, false, 111, 257 )
	materialInfo:subscribeToGlobalModel( controller, "EmblemSelectedLayerProperties", nil, function ( model )
		materialInfo:setModel( model, controller )
	end )
	self:addElement( materialInfo )
	self.materialInfo = materialInfo
	
	local materialControls = CoD.EmblemEditorMaterialControls.new( self, controller )
	materialControls:setLeftRight( true, false, 115, 365 )
	materialControls:setTopBottom( true, false, 111, 256 )
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
	self:addElement( materialControls )
	self.materialControls = materialControls
	
	local buttonBar = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	buttonBar:setLeftRight( true, false, 0.26, 1280.26 )
	buttonBar:setTopBottom( true, false, 653.5, 718.5 )
	self:addElement( buttonBar )
	self.buttonBar = buttonBar
	
	emblemDrawWidget0.navigation = {
		down = materialSwatch
	}
	materialSwatch.navigation = {
		up = emblemDrawWidget0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				StartMenuBackground0:completeAnimation()
				self.StartMenuBackground0:setAlpha( 0.37 )
				self.clipFinished( StartMenuBackground0, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0.75 )
				self.clipFinished( ScreenBkgd, {} )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 64, 314 )
				self.materialControls:setTopBottom( true, false, 110, 255 )
				self.clipFinished( materialControls, {} )
			end
		},
		EmblemEditor = {
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
				emblemDrawWidget0:completeAnimation()
				self.emblemDrawWidget0:setAlpha( 1 )
				self.clipFinished( emblemDrawWidget0, {} )
				materialInfo:completeAnimation()
				self.materialInfo:setLeftRight( true, false, 1048, 1216 )
				self.materialInfo:setTopBottom( true, false, 111, 257 )
				self.clipFinished( materialInfo, {} )
				materialControls:completeAnimation()
				self.materialControls:setLeftRight( true, false, 115, 365 )
				self.materialControls:setTopBottom( true, false, 111, 256 )
				self.clipFinished( materialControls, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		},
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, "-1", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, "1", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		EmblemChooseMaterial_ToggleScaleMode( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
		return false
	end, false )
	emblemDrawWidget0.id = "emblemDrawWidget0"
	materialSwatch.id = "materialSwatch"
	buttonBar:setModel( self.buttonModel, controller )
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
		self.TitleEditLayer:close()
		self.materialInfo:close()
		self.materialControls:close()
		self.buttonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

