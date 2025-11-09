require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_DataVault" )
require( "ui.uieditor.widgets.PersonalDataVault.CategoryNameWidgetScalable" )

CoD.genericVaultList = InheritFrom( LUI.UIElement )
CoD.genericVaultList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.genericVaultList )
	self.id = "genericVaultList"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 304 )
	self:setTopBottom( true, false, 0, 800 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listHeaderUnderline = LUI.UIImage.new()
	listHeaderUnderline:setLeftRight( true, true, 0, 0 )
	listHeaderUnderline:setTopBottom( true, false, 30, 32 )
	listHeaderUnderline:setRGB( 0.61, 0.61, 0.61 )
	listHeaderUnderline:setAlpha( 0 )
	listHeaderUnderline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( listHeaderUnderline )
	self.listHeaderUnderline = listHeaderUnderline
	
	local selectionList = LUI.UIList.new( menu, controller, 0, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 16, 266 )
	selectionList:setTopBottom( true, false, 46, 462 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "PersonalDataVault_CareerData" )
	selectionList:setWidgetType( CoD.List1ButtonLarge_Left_DataVault )
	selectionList:setVerticalCount( 13 )
	selectionList:setSpacing( 0 )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local listHeaderBackdrop = CoD.CategoryNameWidgetScalable.new( menu, controller )
	listHeaderBackdrop:setLeftRight( true, false, 16, 269 )
	listHeaderBackdrop:setTopBottom( true, false, 3.95, 37.95 )
	listHeaderBackdrop:setRGB( 1, 1, 1 )
	listHeaderBackdrop.categoryNameLabel:setText( Engine.Localize( "" ) )
	self:addElement( listHeaderBackdrop )
	self.listHeaderBackdrop = listHeaderBackdrop
	
	local listHeader = LUI.UITightText.new()
	listHeader:setLeftRight( true, false, 24, 155 )
	listHeader:setTopBottom( true, false, 5, 35 )
	listHeader:setRGB( 0, 0, 0 )
	listHeader:setText( Engine.Localize( "CPUI_CAREER_DATA" ) )
	listHeader:setTTF( "fonts/escom.ttf" )
	self:addElement( listHeader )
	self.listHeader = listHeader
	
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.selectionList:close()
		self.listHeaderBackdrop:close()
		CoD.genericVaultList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

