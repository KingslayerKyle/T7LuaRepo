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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MyShowcaseCategorySelector0 = CoD.MyShowcase_CategorySelector.new( menu, controller )
	MyShowcaseCategorySelector0:setLeftRight( 0, 0, 95, 1820 )
	MyShowcaseCategorySelector0:setTopBottom( 0, 0, 126, 950 )
	MyShowcaseCategorySelector0.FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareMyTheaterCategoriesList" )
	self:addElement( MyShowcaseCategorySelector0 )
	self.MyShowcaseCategorySelector0 = MyShowcaseCategorySelector0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
			return true
		else
			return false
		end
	end, false )
	MyShowcaseCategorySelector0.id = "MyShowcaseCategorySelector0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MyShowcaseCategorySelector0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MyShowcaseCategorySelector0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

