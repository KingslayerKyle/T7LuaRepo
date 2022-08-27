-- 8f0df728bb93069818afe34de9cf0718
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

CoD.AdminTabGroupDeleteFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupDeleteFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupDeleteFrame )
	self.id = "AdminTabGroupDeleteFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DeleteButton = CoD.List1ButtonLarge_PH.new( menu, controller )
	DeleteButton:setLeftRight( true, false, 0, 280 )
	DeleteButton:setTopBottom( true, false, 296.82, 328.82 )
	DeleteButton.btnDisplayText:setText( Engine.Localize( "GROUPS_DELETE_GROUP_CAPS" ) )
	DeleteButton.btnDisplayTextStroke:setText( Engine.Localize( "GROUPS_DELETE_GROUP_CAPS" ) )
	DeleteButton:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	DeleteButton:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( DeleteButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DeleteButton )
	self.DeleteButton = DeleteButton
	
	local GroupsNoConentDetail = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsNoConentDetail:setLeftRight( true, false, 0, 268 )
	GroupsNoConentDetail:setTopBottom( true, false, 0, 270 )
	GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_DELETE_GROUP" ) )
	GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_DELETE_GROUP_DESC" ) )
	GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
	self:addElement( GroupsNoConentDetail )
	self.GroupsNoConentDetail = GroupsNoConentDetail
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GroupsNoConentDetail:completeAnimation()
				GroupsNoConentDetail.HeaderBkgd:completeAnimation()
				GroupsNoConentDetail.HeaderIcon:completeAnimation()
				GroupsNoConentDetail.Header:completeAnimation()
				GroupsNoConentDetail.Desc:completeAnimation()
				GroupsNoConentDetail.Glow2:completeAnimation()
				self.GroupsNoConentDetail.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
				self.GroupsNoConentDetail.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
				self.GroupsNoConentDetail.Header:setText( LocalizeToUpperString( "GROUPS_DELETE_GROUP" ) )
				self.GroupsNoConentDetail.Desc:setText( Engine.Localize( "GROUPS_DELETE_GROUP_DESC" ) )
				self.GroupsNoConentDetail.Glow2:setRGB( 0.39, 0.07, 0.06 )
				self.clipFinished( GroupsNoConentDetail, {} )
			end
		}
	}
	DeleteButton.id = "DeleteButton"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.DeleteButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DeleteButton:close()
		element.GroupsNoConentDetail:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

