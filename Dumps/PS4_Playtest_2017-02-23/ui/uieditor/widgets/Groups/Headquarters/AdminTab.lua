require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupApplications" )
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
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 691 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, 0, 456 )
	BlackTint:setTopBottom( 0, 0, -83, 826 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local ButtonList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 18, 438 )
	ButtonList:setTopBottom( 0, 0, -64, 390 )
	ButtonList:setWidgetType( CoD.List1ButtonLarge_Left_wHeader )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setSpacing( 10 )
	ButtonList:setDataSource( "GroupHeadquartersAdminButtonList" )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	Frame:setLeftRight( 0, 0, 494, 1668 )
	Frame:setTopBottom( 0, 0, -56, 570 )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( ButtonList, nil, false, function ( model )
		Frame:setModel( model, controller )
	end )
	Frame:linkToElementModel( ButtonList, "frameWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	ButtonList.navigation = {
		right = Frame
	}
	Frame.navigation = {
		left = ButtonList
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	Frame.id = "Frame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.Frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

