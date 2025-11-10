require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = f1_arg3.input
	local f1_local1 = CoD.perController[f1_arg2].classNum
	if f1_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS then
		if f1_local0 ~= nil then
			local f1_local2 = CoD.CACUtility.GetLoadoutNameFromIndex( f1_arg2, f1_local1 )
			f1_local2:set( f1_local0 )
		end
		GoBack( f1_arg0, f1_arg2 )
		CoD.CACUtility.UpdateAllClasses( f1_arg2 )
	end
end

local PreLoadFunc = function ( self, controller )
	if not Engine.IsSplitscreen() then
		self.animateInFromOffset = 340
	end
	self:setModel( CoD.perController[controller].classModel )
	self.handleKeyboardComplete = f0_local0
end

CoD.OverlayUtility.AddSystemOverlay( "CopyClass", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_TITLE_CAPS" ),
	description = Engine.Localize( "MPUI_COPY_CUSTOM_CLASS_DESC" ),
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ChooseClassList",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( f4_arg0, f4_arg1, f4_arg2 )
			ClassOptionsCopyLoadout( f4_arg0, f4_arg1, f4_arg2 )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "ResetToDefault", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_ClassOptionsFrame",
	title = Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_TITLE_CAPS" ),
	description = Engine.Localize( "MENU_WHICH_DEFAULT_CLASS_DESC" ),
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = "ResetDefaultClass",
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
	[CoD.OverlayUtility.ProcessActionPropertyName] = function ()
		return function ( f6_arg0, f6_arg1, f6_arg2 )
			ClassOptionsResetToDefault( f6_arg0, f6_arg1, f6_arg2 )
		end
		
	end
} )
DataSources.CACClassOptions = DataSourceHelpers.ListSetup( "CACClassOptions", function ( f7_arg0 )
	local f7_local0 = {}
	local f7_local1 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
		return {
			models = {
				displayText = f8_arg0,
				icon = f8_arg1,
				description = Engine.Localize( f8_arg2 )
			},
			properties = {
				action = f8_arg3,
				actionParam = f8_arg4
			}
		}
	end
	
	local f7_local2 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
		ShowKeyboard( f9_arg0, f9_arg1, f9_arg2, "KEYBOARD_TYPE_CUSTOM_CLASS" )
	end
	
	local f7_local3 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
		CoD.OverlayUtility.CreateOverlay( f10_arg2, f10_arg4, "CopyClass", f10_arg2 )
	end
	
	local f7_local4 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
		CoD.OverlayUtility.CreateOverlay( f11_arg2, f11_arg4, "ResetToDefault", f11_arg2 )
	end
	
	local f7_local5 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
		if not IsCampaign() then
			ClassOptionsClearLoadout( f12_arg0, f12_arg1, f12_arg2 )
			GoBack( f12_arg0, f12_arg2 )
			ClearSavedState( f12_arg0, f12_arg2 )
		end
	end
	
	table.insert( f7_local0, f7_local1( "MENU_RENAME_LOADOUT_CAPS", "t7_icon_menu_simple_rename", "MENU_RENAME_CLASS_LOADOUT_DESC", f7_local2 ) )
	table.insert( f7_local0, f7_local1( "MENU_COPY_CAPS", "t7_icon_menu_simple_copy", "MENU_COPY_CLASS_DESC", f7_local3 ) )
	table.insert( f7_local0, f7_local1( "MENU_RESET_TO_DEFAULT_CAPS", "t7_icon_menu_simple_revertsetting", "MENU_RESET_CLASS_TO_DEFAULT_DESC", f7_local4 ) )
	if not IsCampaign() then
		table.insert( f7_local0, f7_local1( "MENU_CLEAR_LOADOUT_CAPS", "t7_icon_menu_simple_delete", "MENU_CLEAR_LOADOUT_DESC", f7_local5 ) )
	end
	return f7_local0
end, true )
LUI.createMenu.ClassOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ClassOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, true, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -355, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local description = LUI.UIText.new()
	description:setLeftRight( false, true, -307.25, -82.5 )
	description:setTopBottom( true, false, 296, 316 )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( description )
	self.description = description
	
	local classOptionsList = LUI.UIList.new( self, controller, 1, 0, nil, false, false, 0, 0, false, false )
	classOptionsList:makeFocusable()
	classOptionsList:setLeftRight( false, true, -322.5, -67.5 )
	classOptionsList:setTopBottom( true, false, 135, 282 )
	classOptionsList:setDataSource( "CACClassOptions" )
	classOptionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	classOptionsList:setVerticalCount( 4 )
	classOptionsList:setSpacing( 1 )
	classOptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	classOptionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( classOptionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( classOptionsList )
	self.classOptionsList = classOptionsList
	
	local customClassNameTitile = LUI.UIText.new()
	customClassNameTitile:setLeftRight( false, true, -322.5, -100 )
	customClassNameTitile:setTopBottom( true, false, 96, 122 )
	customClassNameTitile:setRGB( 1, 0.47, 0 )
	customClassNameTitile:setTTF( "fonts/escom.ttf" )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	customClassNameTitile:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	customClassNameTitile:subscribeToGlobalModel( controller, "CustomClassMenu", "customClassName", function ( model )
		local customClassName = Engine.GetModelValue( model )
		if customClassName then
			customClassNameTitile:setText( Engine.Localize( customClassName ) )
		end
	end )
	self:addElement( customClassNameTitile )
	self.customClassNameTitile = customClassNameTitile
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -356, -355 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, true, -322.5, -313.5 )
	Arrow:setTopBottom( true, false, 301.5, 310.5 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -356, -355 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	description:linkToElementModel( classOptionsList, "description", true, function ( model )
		local _description = Engine.GetModelValue( model )
		if _description then
			description:setText( Engine.Localize( _description ) )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f22_local0 = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", self, controller, event )
		if not f22_local0 then
			f22_local0 = self:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	classOptionsList.id = "classOptionsList"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.classOptionsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.classOptionsList:close()
		element.fefooterRighSlideIn:close()
		element.description:close()
		element.customClassNameTitile:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ClassOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

