-- 5464e2341683d848e5603bf754b2fbea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

CoD.systemOverlay_Layout_ForegroundVLayout = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_ForegroundVLayout.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 10
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_ForegroundVLayout )
	self.id = "systemOverlay_Layout_ForegroundVLayout"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 795 )
	self:setTopBottom( true, false, 0, 280 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 1, 796 )
	text:setTopBottom( true, false, 0, 20 )
	text:setAlpha( 0.7 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local options = LUI.UIList.new( menu, controller, 3, 0, nil, true, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( true, false, 0, 330 )
	options:setTopBottom( true, false, 30, 272 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 7 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f4_local0 = options
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not IsDisabled( f7_arg0, f7_arg2 ) then
			ProcessListAction( self, f7_arg0, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f8_arg0, f8_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.options:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

