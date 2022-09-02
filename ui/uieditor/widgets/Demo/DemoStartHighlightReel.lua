-- 1f643b27492aa8889e7d527055f6444d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

local PreLoadFunc = function ( self, controller )
	CoD.DemoUtility.RebuildHighlightReelTimeline( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	UpdateNumHighlightReelMomentsElementColor( f2_arg0.numAvailableHighlights, f2_arg1 )
end

CoD.DemoStartHighlightReel = InheritFrom( LUI.UIElement )
CoD.DemoStartHighlightReel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DemoStartHighlightReel )
	self.id = "DemoStartHighlightReel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 184 )
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
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 423, 1218 )
	text:setTopBottom( true, false, 40, 60 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local numAvailableHighlights = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	numAvailableHighlights:setLeftRight( true, false, 423, 1218 )
	numAvailableHighlights:setTopBottom( true, false, 88, 108 )
	numAvailableHighlights.text:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE" ) )
	numAvailableHighlights:subscribeToGlobalModel( controller, "demo", "numHighlightReelMoments", function ( model )
		UpdateNumHighlightReelMomentsElementColor( numAvailableHighlights, controller )
	end )
	self:addElement( numAvailableHighlights )
	self.numAvailableHighlights = numAvailableHighlights
	
	local options = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( true, false, 421, 751 )
	options:setTopBottom( true, false, 114, 181 )
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
		local f9_local0 = options
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			ProcessListAction( self, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 83.09, 268.91 )
	Icon:setTopBottom( true, false, 0, 185.83 )
	Icon:setScale( 0.7 )
	Icon:setImage( RegisterImage( "uie_t7_icons_theater_film" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
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
		element.numAvailableHighlights:close()
		element.options:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

