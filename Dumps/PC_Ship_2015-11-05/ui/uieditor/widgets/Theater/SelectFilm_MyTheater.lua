require( "ui.uieditor.widgets.FileShare.MyShowcase_CategorySelector" )

CoD.SelectFilm_MyTheater = InheritFrom( LUI.UIElement )
CoD.SelectFilm_MyTheater.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectFilm_MyTheater )
	self.id = "SelectFilm_MyTheater"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MyShowcaseCategorySelector0 = CoD.MyShowcase_CategorySelector.new( menu, controller )
	MyShowcaseCategorySelector0:setLeftRight( true, false, 63, 1213 )
	MyShowcaseCategorySelector0:setTopBottom( true, false, 84, 633 )
	MyShowcaseCategorySelector0.contentList:setDataSource( "FileshareCommunityList" )
	MyShowcaseCategorySelector0.FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareMyTheaterCategoriesList" )
	self:addElement( MyShowcaseCategorySelector0 )
	self.MyShowcaseCategorySelector0 = MyShowcaseCategorySelector0
	
	MyShowcaseCategorySelector0.id = "MyShowcaseCategorySelector0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MyShowcaseCategorySelector0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MyShowcaseCategorySelector0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

