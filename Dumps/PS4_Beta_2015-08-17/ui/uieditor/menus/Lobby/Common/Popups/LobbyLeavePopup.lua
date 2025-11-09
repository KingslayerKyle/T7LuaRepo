require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.LobbyLeavePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyLeavePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyLeavePopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.9 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( false, false, -166, 196 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 500, 911 )
	Title:setTopBottom( true, false, 264, 298 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "LeaveLobbyPopup", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Hint = LUI.UIText.new()
	Hint:setLeftRight( true, false, 500, 940 )
	Hint:setTopBottom( true, false, 299, 318 )
	Hint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Hint:subscribeToGlobalModel( controller, "LeaveLobbyPopup", "hint", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Hint:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Hint )
	self.Hint = Hint
	
	local DisplayText = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	DisplayText:makeFocusable()
	DisplayText:setLeftRight( true, false, 500, 780 )
	DisplayText:setTopBottom( true, false, 365, 465 )
	DisplayText:setDataSource( "LeaveLobbyPopupButtons" )
	DisplayText:setWidgetType( CoD.List1ButtonLarge_PH )
	DisplayText:setVerticalCount( 3 )
	DisplayText:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	DisplayText:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( DisplayText, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		PlayClip( self, "Update", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( DisplayText )
	self.DisplayText = DisplayText
	
	local line = LUI.UIImage.new()
	line:setLeftRight( true, false, 0, 1280 )
	line:setTopBottom( true, false, 192, 195 )
	line:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( line )
	self.line = line
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 443.11, 494.04 )
	icon:setTopBottom( true, false, 257.06, 308 )
	icon:setImage( RegisterImage( "uie_t7_menu_social_leave_party" ) )
	self:addElement( icon )
	self.icon = icon
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 190.83, 198.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 0, 1280 )
	CategoryListLine00:setTopBottom( true, false, 550.83, 558.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1187, 1223 )
	Image30:setTopBottom( false, false, 134.22, 137.91 )
	Image30:setZRot( 360 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1187, 1223 )
	Image41:setTopBottom( false, false, -121, -117.5 )
	Image41:setZRot( 360 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( true, false, 1208, 1224 )
	Image400:setTopBottom( true, false, 341, 393 )
	Image400:setZoom( -5 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1202.5, 1207.5 )
	LineSide00:setTopBottom( true, false, 255.06, 485.44 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 56.5, 92.5 )
	Image300:setTopBottom( false, false, 134.22, 137.91 )
	Image300:setZRot( 180 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Image410 = LUI.UIImage.new()
	Image410:setLeftRight( true, false, 56.5, 92.5 )
	Image410:setTopBottom( false, false, -121, -117.5 )
	Image410:setZRot( 180 )
	Image410:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image410:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image410 )
	self.Image410 = Image410
	
	local Image4000 = LUI.UIImage.new()
	Image4000:setLeftRight( true, false, 56, 72 )
	Image4000:setTopBottom( true, false, 341, 393 )
	Image4000:setZoom( -5 )
	Image4000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image4000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4000 )
	self.Image4000 = Image4000
	
	local LineSide000 = LUI.UIImage.new()
	LineSide000:setLeftRight( true, false, 72, 77 )
	LineSide000:setTopBottom( true, false, 255.06, 485.44 )
	LineSide000:setAlpha( 0.8 )
	LineSide000:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide000 )
	self.LineSide000 = LineSide000
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK_CAPS" )
		return true
	end, false )
	DisplayText.id = "DisplayText"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.DisplayText:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.DisplayText:close()
		self.Title:close()
		self.Hint:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyLeavePopup.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

