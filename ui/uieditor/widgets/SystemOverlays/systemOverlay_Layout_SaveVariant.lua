-- 35c54165e9a873496a705ec735925ee3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWarningWidget" )

CoD.systemOverlay_Layout_SaveVariant = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_SaveVariant.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_SaveVariant )
	self.id = "systemOverlay_Layout_SaveVariant"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( true, false, 384, 414 )
	categoryTypeImage:setTopBottom( true, false, 11, 41 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local categoryType = Engine.GetModelValue( model )
		if categoryType then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( categoryType ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 421, 621 )
	title:setTopBottom( true, false, 10, 40 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local description = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	description:setLeftRight( true, false, 423, 1218 )
	description:setTopBottom( true, false, 41, 61 )
	description:setAlpha( 0.7 )
	description:linkToElementModel( self, "description", true, function ( model )
		local _description = Engine.GetModelValue( model )
		if _description then
			description.text:setText( Engine.Localize( _description ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	local options = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( true, false, 421, 751 )
	options:setTopBottom( true, false, 111, 178 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 2 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f6_local0 = options
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsDisabled( f9_arg0, f9_arg2 ) then
			ProcessListAction( self, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f10_arg0, f10_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	local warning = CoD.GunsmithWarningWidget.new( menu, controller )
	warning:setLeftRight( true, false, 421, 1124 )
	warning:setTopBottom( true, false, 260, 284 )
	warning.warningMsg.text:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_STATS_RESET_WARNING" ) )
	warning:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not Gunsmith_IsCurrentVariantChanged( controller )
			end
		}
	} )
	self:addElement( warning )
	self.warning = warning
	
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.description:close()
		element.options:close()
		element.warning:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

