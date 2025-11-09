require( "ui.uieditor.widgets.Heroes.heroCustomizationListButton" )

CoD.personalizeCustomizationList = InheritFrom( LUI.UIElement )
CoD.personalizeCustomizationList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.personalizeCustomizationList )
	self.id = "personalizeCustomizationList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 253 )
	self:setTopBottom( true, false, 0, 475 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setRGB( 1, 1, 1 )
	backing:setAlpha( 0.05 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local customizationList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	customizationList:makeFocusable()
	customizationList:setLeftRight( true, false, 10, 243 )
	customizationList:setTopBottom( true, false, 10, 644 )
	customizationList:setRGB( 1, 1, 1 )
	customizationList:setDataSource( "HeroCustomizationButtonList" )
	customizationList:setWidgetType( CoD.heroCustomizationListButton )
	customizationList:setVerticalCount( 12 )
	customizationList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		BeginEdittingHeroOption( menu, element, controller )
		return retVal
	end )
	customizationList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		HeroItemHighlighted( element, controller )
		return retVal
	end )
	self:addElement( customizationList )
	self.customizationList = customizationList
	
	customizationList.id = "customizationList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.customizationList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.customizationList:close()
		CoD.personalizeCustomizationList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

