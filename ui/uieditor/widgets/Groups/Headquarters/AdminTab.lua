-- a60a97eab765de9775b5a10a8b227e1a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.List2ButtonLarge_Groups" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.AdminOptions:registerEventHandler( "mouse_focus", function ( element, event )
		f1_arg0.Frame:processEvent( {
			name = "lose_focus",
			controller = f1_arg1
		} )
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.AdminTab = InheritFrom( LUI.UIElement )
CoD.AdminTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTab )
	self.id = "AdminTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, 0, 310.04 )
	BlackTint:setTopBottom( true, false, -29, 582 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local AdminOptions = LUI.UIList.new( menu, controller, 6, 0, nil, false, false, 0, 0, false, false )
	AdminOptions:makeFocusable()
	AdminOptions:setLeftRight( true, false, 14, 296 )
	AdminOptions:setTopBottom( true, false, 0, 442 )
	AdminOptions:setWidgetType( CoD.List2ButtonLarge_Groups )
	AdminOptions:setVerticalCount( 8 )
	AdminOptions:setSpacing( 6 )
	AdminOptions:setDataSource( "GroupHeadquartersAdminButtonList" )
	AdminOptions:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		SetLoseFocusToElement( self, "Frame", controller )
		return f5_local0
	end )
	self:addElement( AdminOptions )
	self.AdminOptions = AdminOptions
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( true, false, 333, 1116 )
	Frame:setTopBottom( true, false, 0, 417 )
	LUI.OverrideFunction_CallOriginalFirst( Frame, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( AdminOptions, nil, false, function ( model )
		Frame:setModel( model, controller )
	end )
	Frame:linkToElementModel( AdminOptions, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			Frame:changeFrameWidget( frameWidget )
		end
	end )
	AdminOptions.navigation = {
		right = Frame
	}
	Frame.navigation = {
		left = AdminOptions
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	AdminOptions.id = "AdminOptions"
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.AdminOptions:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AdminOptions:close()
		element.Frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

