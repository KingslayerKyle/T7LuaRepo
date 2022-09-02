-- 4bf8fab46103b2f52f58d5429e3c0467
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )
require( "ui.uieditor.widgets.Controls.Slider_Small" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setHandleMouseButton( false )
		self:setForceMouseEventDispatch( true )
	end
end

CoD.Competitive_SettingsList = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsList )
	self.id = "Competitive_SettingsList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 670 )
	self:setTopBottom( true, false, 0, 110 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( true, false, 41, 539 )
	Title:setTopBottom( true, false, 0, 37 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.DescTitle:setText( LocalizeToUpperString( "DRAFT SETTINGS" ) )
	self:addElement( Title )
	self.Title = Title
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 0, 670 )
	ButtonList:setTopBottom( true, false, 37, 103 )
	ButtonList:setWidgetType( CoD.Slider_Small )
	ButtonList:setVerticalCount( 2 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f3_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if not IsPerControllerTablePropertyValue( f5_arg2, "disableGameSettingsOptions", true ) then
			OpenGameSettingsOptionsMenu( self, f5_arg0, f5_arg2, f5_arg1 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if not IsPerControllerTablePropertyValue( f6_arg2, "disableGameSettingsOptions", true ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 40, 382 )
				self.Title:setTopBottom( true, false, 0, 40 )
				self.clipFinished( Title, {} )
			end
		},
		NoHeader = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 40, 382 )
				self.Title:setTopBottom( true, false, 0, 10 )
				self.clipFinished( Title, {} )
			end
		}
	}
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Title:close()
		element.ButtonList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

