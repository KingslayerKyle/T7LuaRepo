-- 4e214adf2b8e0be6c7fa8723918dde85
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunt_TauntOptionButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntOptionInfo" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ChooseTaunts_TauntOptions = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_TauntOptions.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_TauntOptions )
	self.id = "ChooseTaunts_TauntOptions"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 564 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local optionsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 0, 209 )
	optionsList:setTopBottom( true, false, 25, 520 )
	optionsList:setWidgetType( CoD.ChooseTaunt_TauntOptionButton )
	optionsList:setVerticalCount( 9 )
	optionsList:setSpacing( 0 )
	optionsList:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local optionsDatasource = Engine.GetModelValue( model )
		if optionsDatasource then
			optionsList:setDataSource( optionsDatasource )
		end
	end )
	optionsList:linkToElementModel( optionsList, "isBMClassified", true, function ( model )
		local f5_local0 = optionsList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:linkToElementModel( optionsList, "canPreview", true, function ( model )
		local f6_local0 = optionsList
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "canPreview"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		if IsCurrentTauntNew( self, element, controller ) then
			SetHeroTauntAsOld( self, element, controller )
			UpdateSelfElementState( menu, element, controller )
		end
		return f7_local0
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f8_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsSelfModelValueTrue( f10_arg0, f10_arg2, "isBMClassified" ) then
			TauntItemSelected( f10_arg1, f10_arg0, f10_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsSelfModelValueTrue( f11_arg0, f11_arg2, "isBMClassified" ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsSelfModelValueTrue( f12_arg0, f12_arg2, "isBMClassified" ) and IsSelfModelValueTrue( f12_arg0, f12_arg2, "canPreview" ) then
			PreviewTaunt( f12_arg2, f12_arg0 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		if not IsSelfModelValueTrue( f13_arg0, f13_arg2, "isBMClassified" ) and IsSelfModelValueTrue( f13_arg0, f13_arg2, "canPreview" ) then
			return false
		else
			return false
		end
	end, false )
	optionsList:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCurrentTauntNew( self, element, controller )
			end
		}
	} )
	optionsList:linkToElementModel( optionsList, "isBMClassified", true, function ( model )
		menu:updateElementState( optionsList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local categoryName = LUI.UITightText.new()
	categoryName:setLeftRight( true, false, 0, 72 )
	categoryName:setTopBottom( true, false, 0, 25 )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:linkToElementModel( self, "categoryName", true, function ( model )
		local _categoryName = Engine.GetModelValue( model )
		if _categoryName then
			categoryName:setText( Engine.Localize( _categoryName ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local verticalCounter0 = CoD.verticalCounter.new( menu, controller )
	verticalCounter0:setLeftRight( true, false, 4, 204 )
	verticalCounter0:setTopBottom( true, false, 520, 545 )
	verticalCounter0:registerEventHandler( "menu_loaded", function ( element, event )
		local f17_local0 = nil
		SetAsListVerticalCounter( self, element, "optionsList" )
		if not f17_local0 then
			f17_local0 = element:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:addElement( verticalCounter0 )
	self.verticalCounter0 = verticalCounter0
	
	local ChooseTauntsTauntOptionInfo0 = CoD.ChooseTaunts_TauntOptionInfo.new( menu, controller )
	ChooseTauntsTauntOptionInfo0:setLeftRight( true, false, 236, 617 )
	ChooseTauntsTauntOptionInfo0:setTopBottom( true, false, 25, 59 )
	self:addElement( ChooseTauntsTauntOptionInfo0 )
	self.ChooseTauntsTauntOptionInfo0 = ChooseTauntsTauntOptionInfo0
	
	ChooseTauntsTauntOptionInfo0:linkToElementModel( optionsList, nil, false, function ( model )
		ChooseTauntsTauntOptionInfo0:setModel( model, controller )
	end )
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
		element.verticalCounter0:close()
		element.ChooseTauntsTauntOptionInfo0:close()
		element.categoryName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

