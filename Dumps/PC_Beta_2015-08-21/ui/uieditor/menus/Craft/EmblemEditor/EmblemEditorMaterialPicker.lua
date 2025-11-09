require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialSwatch" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialInfo" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialControls" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 100
	local f1_local1 = function ()
		if f1_arg0.xValue ~= 0 and f1_arg0.yValue ~= 0 and f1_arg0.length ~= 0 then
			local f2_local0 = f1_arg0.length
			if f2_local0 >= 0.5 then
				f2_local0 = (f2_local0 - 0.45) * 2
			elseif f2_local0 >= 0.2 then
				f2_local0 = 0.1
			else
				f2_local0 = 0
			end
			f1_arg0.xValue = f1_arg0.xValue * f2_local0
			f1_arg0.yValue = f1_arg0.yValue * f2_local0
		end
	end
	
	local f1_local2 = function ()
		if f1_arg0.xValue ~= 0 and f1_arg0.yValue ~= 0 then
			local f3_local0 = 0.05
			local f3_local1 = 0
			local f3_local2 = f1_arg0.xValue * f3_local0
			local f3_local3 = f1_arg0.yValue * f3_local0
			if CoD.GetEditorProperties( f1_arg1, "materialScaleMode" ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
				if f3_local1 < math.abs( f3_local2 ) then
					Engine.ExecNow( f1_arg1, "emblemUpdateMaterialScaleX " .. f3_local2 )
					Engine.ExecNow( f1_arg1, "emblemUpdateMaterialScaleY " .. f3_local2 )
				end
			else
				if f3_local1 < math.abs( f3_local2 ) then
					Engine.ExecNow( f1_arg1, "emblemUpdateMaterialScaleX " .. f3_local2 )
				end
				if f3_local1 < math.abs( f3_local3 ) then
					Engine.ExecNow( f1_arg1, "emblemUpdateMaterialScaleY " .. f3_local3 )
				end
			end
		end
	end
	
	local f1_local3 = function ( f4_arg0, f4_arg1 )
		local f4_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "RightStick" )
		if f4_local0 then
			f4_arg0.xValue = Engine.GetModelValue( Engine.GetModel( f4_local0, "X" ) )
			f4_arg0.yValue = Engine.GetModelValue( Engine.GetModel( f4_local0, "Y" ) )
			f4_arg0.length = Engine.GetModelValue( Engine.GetModel( f4_local0, "Length" ) )
			f1_local1()
			f1_local2()
		end
	end
	
	f1_arg0:addElement( LUI.UITimer.new( f1_local0, "get_right_stick_values", false, f1_arg0 ) )
	f1_arg0:registerEventHandler( "get_right_stick_values", f1_local3 )
end

local PostLoadFunc = function ( f5_arg0, f5_arg1 )
	f0_local0( f5_arg0, f5_arg1 )
	f5_arg0.materialSwatch.navigation = nil
	f5_arg0.emblemDrawWidget0.navigation = nil
end

local f0_local2 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = CoD.perController[f6_arg1].selectedLayerMaterialID
	if f6_local0 ~= CoD.emblem.INVALID_ID then
		for f6_local4, f6_local5 in ipairs( CoD.emblem.MaterialCategory ) do
			if Engine.GetSelectedLayerMaterialIndex( f6_arg1, f6_local5.category, f6_local0 ) ~= CoD.emblem.INVALID_ID then
				return f6_local5.category
			end
		end
		
	else
		return CoD.emblem.MaterialCategory[1].category
	end
end

local f0_local3 = function ( f7_arg0 )
	for f7_local3, f7_local4 in ipairs( CoD.emblem.MaterialCategory ) do
		if f7_local4.category == CoD.perController[f7_arg0].selectedMaterialCategory then
			return f7_local3 + 1
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( f9_arg0 )
		local f9_local0 = CoD.perController[controller].selectedLayerMaterialID
		if f9_local0 ~= CoD.emblem.INVALID_ID then
			CoD.perController[controller].selectedMaterialCategory = f0_local2( f9_arg0, controller )
			f9_arg0.materialSwatch.tabList.grid:setActiveItem( f9_arg0.materialSwatch.tabList.grid:getItemAt( f0_local3( controller ) ) )
			local f9_local1 = Engine.GetEmblemMaterialFilterCount( controller, CoD.perController[controller].selectedMaterialCategory )
			local f9_local2 = f9_arg0.materialSwatch.materialSwatch:findItem( {
				materialID = f9_local0
			}, nil, false )
			if f9_local2 then
				f9_arg0.materialSwatch.materialSwatch:processEvent( {
					name = "gain_focus",
					controller = controller,
					selectIndex = f9_local2.gridInfoTable.zeroBasedIndex
				} )
			end
		else
			f9_arg0.materialSwatch.lastSavedColor:processEvent( {
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
		local f12_local0 = nil
		if IsEmblemEditor( controller ) then
			ShowHeaderIconOnly( self )
		elseif IsPaintshop( controller ) then
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToSelectedWeapon( controller )
		end
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.emblemDrawWidget0:close()
		element.materialSwatch:close()
		element.TitleEditLayer:close()
		element.materialInfo:close()
		element.materialControls:close()
		element.buttonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemEditorMaterialPicker.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

