-- 3045eac5b8919c23d7f1e3af14c022fa
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.InputButton" )
require( "ui.uieditor.widgets.AccountLink.MonthItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbarNew" )

CoD.MonthList = InheritFrom( LUI.UIElement )
CoD.MonthList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MonthList )
	self.id = "MonthList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DropdownRoot = CoD.InputButton.new( menu, controller )
	DropdownRoot:setLeftRight( true, true, 0, 0 )
	DropdownRoot:setTopBottom( true, true, 0, 0 )
	DropdownRoot.Text:setText( Engine.Localize( "MENU_NEW" ) )
	DropdownRoot:registerEventHandler( "button_action", function ( element, event )
		local f2_local0 = nil
		ToggleDropdownListInUse_Console( self, controller )
		UpdateState( self, event )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( DropdownRoot )
	self.DropdownRoot = DropdownRoot
	
	local SelectedValue = LUI.UIText.new()
	SelectedValue:setLeftRight( true, true, 12.75, -12.75 )
	SelectedValue:setTopBottom( true, false, 5.5, 30.5 )
	SelectedValue:setText( Engine.Localize( "" ) )
	SelectedValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	SelectedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SelectedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelectedValue )
	self.SelectedValue = SelectedValue
	
	local DropdownList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, true )
	DropdownList:makeFocusable()
	DropdownList:setLeftRight( false, false, -192.5, 192.5 )
	DropdownList:setTopBottom( false, false, -88, 90 )
	DropdownList:setAlpha( 0 )
	DropdownList:setDataSource( "Month" )
	DropdownList:setWidgetType( CoD.MonthItem )
	DropdownList:setVerticalCount( 5 )
	DropdownList:setVerticalScrollbar( CoD.verticalScrollbarNew )
	DropdownList:registerEventHandler( "list_item_button_action", function ( element, event )
		local f3_local0 = nil
		ToggleDropdownListInUse_Console( self, controller )
		UpdateState( self, event )
		AccountLink_SelectMonth( self, element, controller )
		return f3_local0
	end )
	self:addElement( DropdownList )
	self.DropdownList = DropdownList
	
	DropdownRoot.navigation = {
		left = DropdownList,
		down = DropdownList
	}
	DropdownList.navigation = {
		left = DropdownRoot,
		up = DropdownRoot
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DropdownList:completeAnimation()
				self.DropdownList:setAlpha( 0 )
				self.clipFinished( DropdownList, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DropdownList:completeAnimation()
				self.DropdownList:setAlpha( 1 )
				self.clipFinished( DropdownList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return DropdownListIsInUse_Console( element )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsInDefaultState( element ) then
			MakeElementNotFocusable( self, "DropdownList", controller )
		end
	end )
	DropdownRoot.id = "DropdownRoot"
	DropdownList.id = "DropdownList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.DropdownList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DropdownRoot:close()
		element.DropdownList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

