-- 1412234c549c325e0919c33506a8bc69
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.Demo.demo_options_slider" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

local PreLoadFunc = function ( self, controller )
	CoD.DemoUtility.RebuildHighlightReelTimeline( controller )
end

CoD.DemoCustomizeHighlightReel = InheritFrom( LUI.UIElement )
CoD.DemoCustomizeHighlightReel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoCustomizeHighlightReel )
	self.id = "DemoCustomizeHighlightReel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 420 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( true, false, 381, 411 )
	categoryTypeImage:setTopBottom( true, false, 27.09, 57.09 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local categoryType = Engine.GetModelValue( model )
		if categoryType then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( categoryType ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 415, 615 )
	title:setTopBottom( true, false, 26.09, 56.09 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 417, 1212 )
	text:setTopBottom( true, false, 56.09, 76.09 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local numAvailableHighlights = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	numAvailableHighlights:setLeftRight( true, false, 417, 1212 )
	numAvailableHighlights:setTopBottom( true, false, 103.09, 123.09 )
	numAvailableHighlights.text:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE" ) )
	numAvailableHighlights:subscribeToGlobalModel( controller, "Demo", "numHighlightReelMoments", function ( model )
		UpdateNumHighlightReelMomentsElementColor( numAvailableHighlights, controller )
	end )
	self:addElement( numAvailableHighlights )
	self.numAvailableHighlights = numAvailableHighlights
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 400, 940 )
	ButtonList:setTopBottom( false, true, -287.09, -73.09 )
	ButtonList:setDataSource( "DemoHighlightReelSettingsButtonList" )
	ButtonList:setWidgetType( CoD.demo_options_slider )
	ButtonList:setVerticalCount( 6 )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local btnStartHighlightReel = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	btnStartHighlightReel:makeFocusable()
	btnStartHighlightReel:setLeftRight( true, false, 415, 745 )
	btnStartHighlightReel:setTopBottom( false, true, -62.81, -30.81 )
	btnStartHighlightReel:setWidgetType( CoD.CACGenericButton )
	btnStartHighlightReel:setSpacing( 3 )
	btnStartHighlightReel:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			btnStartHighlightReel:setDataSource( listDatasource )
		end
	end )
	btnStartHighlightReel:linkToElementModel( btnStartHighlightReel, "disabled", true, function ( model )
		local f8_local0 = btnStartHighlightReel
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	btnStartHighlightReel:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	btnStartHighlightReel:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( btnStartHighlightReel, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not IsDisabled( f11_arg0, f11_arg2 ) then
			ProcessListAction( self, f11_arg0, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( btnStartHighlightReel )
	self.btnStartHighlightReel = btnStartHighlightReel
	
	ButtonList.navigation = {
		down = btnStartHighlightReel
	}
	btnStartHighlightReel.navigation = {
		up = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	btnStartHighlightReel.id = "btnStartHighlightReel"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.numAvailableHighlights:close()
		element.ButtonList:close()
		element.btnStartHighlightReel:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

