require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.overCapacityScorestreakButtonNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeC" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeD" )

local PostLoadFunc = function ( self, controller )
	self.updateSelectedImage = function ( self, itemIndex )
		self.selectedScorestreak:setImage( RegisterImage( GetItemImageFromIndex( itemIndex ) .. "_menu_large" ) )
	end
	
end

LUI.createMenu.ScorestreakOverCapacity = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ScorestreakOverCapacity" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	self:addElement( background )
	self.background = background
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 83, 384 )
	titleLabel:setTopBottom( true, false, 144, 192 )
	titleLabel:setRGB( 0.87, 0.88, 0.78 )
	titleLabel:setText( Engine.Localize( "MPUI_TOO_MANY_STREAKS_CAPS" ) )
	titleLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local desc = LUI.UITightText.new()
	desc:setLeftRight( true, false, 450, 798 )
	desc:setTopBottom( true, false, 223.25, 248.25 )
	desc:setRGB( 0.5, 0.51, 0.52 )
	desc:setText( Engine.Localize( "MPUI_TOO_MANY_STREAKS_DESC" ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setLetterSpacing( 0.5 )
	self:addElement( desc )
	self.desc = desc
	
	local selectedScorestreak = LUI.UIImage.new()
	selectedScorestreak:setLeftRight( true, false, 92, 330 )
	selectedScorestreak:setTopBottom( true, false, 226.19, 464.19 )
	selectedScorestreak:setRGB( 1, 1, 1 )
	selectedScorestreak:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( selectedScorestreak )
	self.selectedScorestreak = selectedScorestreak
	
	local selectionList = LUI.UIList.new( self, controller, 10, 0, nil, true, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 450, 830 )
	selectionList:setTopBottom( true, false, 261, 381 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setDataSource( "EquippedScorestreaksList" )
	selectionList:setWidgetType( CoD.overCapacityScorestreakButtonNew )
	selectionList:setHorizontalCount( 3 )
	selectionList:setSpacing( 10 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		RemoveScorestreak( self, element, controller )
		ClearMenuSavedState( self )
		GoBack( self, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 828, 864 )
	Image5:setTopBottom( false, false, -99.75, -96.25 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 828, 864 )
	Image0:setTopBottom( false, false, 19.5, 23 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 416, 452 )
	Image1:setTopBottom( false, false, -99.75, -96.25 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 416, 452 )
	Image2:setTopBottom( false, false, 19.5, 21.25 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local FETitleLineU = CoD.FE_TitleLine.new( self, controller )
	FETitleLineU:setLeftRight( true, true, 86, -581 )
	FETitleLineU:setTopBottom( false, false, -219, -215 )
	FETitleLineU:setRGB( 1, 1, 1 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local FETitleLine0 = CoD.FE_TitleLine.new( self, controller )
	FETitleLine0:setLeftRight( true, true, 86, -581 )
	FETitleLine0:setTopBottom( false, false, -175, -171 )
	FETitleLine0:setRGB( 1, 1, 1 )
	self:addElement( FETitleLine0 )
	self.FETitleLine0 = FETitleLine0
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 10, 46 )
	Image3:setTopBottom( false, false, 99.5, 103 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 10, 46 )
	Image4:setTopBottom( false, false, -136.75, -133.25 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 25.5, 30.5 )
	LineSide0:setTopBottom( true, false, 230, 460.38 )
	LineSide0:setRGB( 1, 1, 1 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 10, 46 )
	Image6:setTopBottom( false, false, -175, -171.5 )
	Image6:setRGB( 1, 1, 1 )
	Image6:setZRot( 180 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 10, 46 )
	Image7:setTopBottom( false, false, -218.5, -215 )
	Image7:setRGB( 1, 1, 1 )
	Image7:setZRot( 180 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 25.5, 30.5 )
	Image8:setTopBottom( true, false, 146.81, 184.75 )
	Image8:setRGB( 1, 1, 1 )
	Image8:setAlpha( 0.8 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 7, 23 )
	Image40:setTopBottom( true, false, 295, 347 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local ElemForeA0 = CoD.FE_TitleElemForeA.new( self, controller )
	ElemForeA0:setLeftRight( true, false, 58, 86 )
	ElemForeA0:setTopBottom( true, false, 136, 200 )
	ElemForeA0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeA0 )
	self.ElemForeA0 = ElemForeA0
	
	local ElemForeC0 = CoD.FE_TitleElemForeC.new( self, controller )
	ElemForeC0:setLeftRight( true, false, 50, 66 )
	ElemForeC0:setTopBottom( true, false, 135.16, 200.5 )
	ElemForeC0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeC0 )
	self.ElemForeC0 = ElemForeC0
	
	local ElemForeD0 = CoD.FE_TitleElemForeD.new( self, controller )
	ElemForeD0:setLeftRight( true, false, 24, 52 )
	ElemForeD0:setTopBottom( true, false, 135.83, 199.83 )
	ElemForeD0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeD0 )
	self.ElemForeD0 = ElemForeD0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 192.83, 200.5 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1231, 1267 )
	Image30:setTopBottom( false, false, 99.5, 103 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1231, 1267 )
	Image41:setTopBottom( false, false, -136.75, -133.25 )
	Image41:setRGB( 1, 1, 1 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1246.5, 1251.5 )
	LineSide00:setTopBottom( true, false, 230, 460.38 )
	LineSide00:setRGB( 1, 1, 1 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, false, 1231, 1267 )
	Image60:setTopBottom( false, false, -175, -171.5 )
	Image60:setRGB( 1, 1, 1 )
	Image60:setZRot( 180 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image70 = LUI.UIImage.new()
	Image70:setLeftRight( true, false, 1231, 1267 )
	Image70:setTopBottom( false, false, -218.5, -215 )
	Image70:setRGB( 1, 1, 1 )
	Image70:setZRot( 180 )
	Image70:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image70:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image70 )
	self.Image70 = Image70
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearSavedState( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList.id = "selectionList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.selectionList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.background:close()
		self.selectionList:close()
		self.FETitleLineU:close()
		self.FETitleLine0:close()
		self.ElemForeA0:close()
		self.ElemForeC0:close()
		self.ElemForeD0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

