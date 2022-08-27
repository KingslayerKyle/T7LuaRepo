-- 8d60c7196040219696b9fd6bb7f27507
-- This hash is used for caching, delete to decompile the file again

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
	MyShowcaseCategorySelector0.FileshareCategorySelectoryListWidget.itemList:setDataSource( "FileshareMyTheaterCategoriesList" )
	self:addElement( MyShowcaseCategorySelector0 )
	self.MyShowcaseCategorySelector0 = MyShowcaseCategorySelector0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f3_arg0, f3_arg1, f3_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f3_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	MyShowcaseCategorySelector0.id = "MyShowcaseCategorySelector0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.MyShowcaseCategorySelector0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

