require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.menus.CharacterCustomization.PersonalizeCharacter" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacterCarouselItem" )
require( "ui.uieditor.widgets.onOffText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Heroes.PersonalizeElemsSideList" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.characterCarousel.m_disableNavigation = true
end

LUI.createMenu.ChoosePersonalizationCharacter = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChoosePersonalizationCharacter" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChoosePersonalizationCharacter.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( false, false, -640, 640 )
	BG:setTopBottom( false, false, -360, 360 )
	BG:setRGB( 0, 0, 0 )
	self:addElement( BG )
	self.BG = BG
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( true, false, 0, 1280 )
	GenericMenuFrame0:setTopBottom( true, false, 0, 720 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( AppendString( "_CAPS", "HEROES_PERSONALIZE_HERO_NAME_CAPS" ) ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_PERSONALIZE_SPECIALISTS_CAPS" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	GenericMenuFrame0:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		ShowHeaderKickerAndIcon( self )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local characterCarousel = LUI.UIList.new( self, controller, 4, 200, nil, false, true, 232, 0, false, false )
	characterCarousel:makeFocusable()
	characterCarousel:setLeftRight( true, false, 0, 7608 )
	characterCarousel:setTopBottom( true, false, 137, 637 )
	characterCarousel:setDataSource( "HeroesList" )
	characterCarousel:setWidgetType( CoD.PersonalizeCharacterCarouselItem )
	characterCarousel:setHorizontalCount( 9 )
	characterCarousel:setSpacing( 4 )
	characterCarousel:linkToElementModel( characterCarousel, "disabled", true, function ( model )
		local f4_local0 = characterCarousel
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	characterCarousel:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		UpdateEditingHero( element, controller )
		UpdateElementState( self, "leftBumper", controller )
		UpdateElementState( self, "rightBumper", controller )
		return f5_local0
	end )
	characterCarousel:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		return f6_local0
	end )
	characterCarousel:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			NavigateToMenu( self, "PersonalizeCharacter", true, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_LB, "A", function ( element, menu, controller, model )
		SelectPreviousItemIfPossible( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( characterCarousel, controller, Enum.LUIButton.LUI_KEY_RB, "D", function ( element, menu, controller, model )
		SelectNextItemIfPossible( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:addElement( characterCarousel )
	self.characterCarousel = characterCarousel
	
	local leftBumper = CoD.onOffText.new( self, controller )
	leftBumper:setLeftRight( true, false, 237, 464 )
	leftBumper:setTopBottom( true, false, 106, 131 )
	leftBumper.lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERL^" ) )
	leftBumper.lbText:setTTF( "fonts/default.ttf" )
	leftBumper.lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	leftBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtStart( self, "characterCarousel", event )
			end
		}
	} )
	if leftBumper.m_eventHandlers.list_focus_changed then
		local rightBumper = leftBumper.m_eventHandlers.list_focus_changed
		leftBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return rightBumper( element, event )
		end )
	else
		leftBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	if leftBumper.m_eventHandlers.input_source_changed then
		local rightBumper = leftBumper.m_eventHandlers.input_source_changed
		leftBumper:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return rightBumper( element, event )
		end )
	else
		leftBumper:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local rightBumper = CoD.onOffText.new( self, controller )
	rightBumper:setLeftRight( true, false, 806, 1043 )
	rightBumper:setTopBottom( true, false, 106, 131 )
	rightBumper.lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERR^" ) )
	rightBumper.lbText:setTTF( "fonts/default.ttf" )
	rightBumper.lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rightBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtEnd( self, "characterCarousel", event )
			end
		}
	} )
	if rightBumper.m_eventHandlers.list_focus_changed then
		local FETitleNumBrdr0 = rightBumper.m_eventHandlers.list_focus_changed
		rightBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return FETitleNumBrdr0( element, event )
		end )
	else
		rightBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	if rightBumper.m_eventHandlers.input_source_changed then
		local FETitleNumBrdr0 = rightBumper.m_eventHandlers.input_source_changed
		rightBumper:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or self
			element:updateState( event )
			return FETitleNumBrdr0( element, event )
		end )
	else
		rightBumper:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( self, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 232, -232 )
	FETitleNumBrdr0:setTopBottom( false, false, -256, -227 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 191, 227 )
	Image0:setTopBottom( false, false, -257.75, -254.25 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 191, 227 )
	Image1:setTopBottom( false, false, -229, -226 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 1053, 1089 )
	Image2:setTopBottom( false, false, -257.75, -254.25 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 1053, 1089 )
	Image3:setTopBottom( false, false, -228.5, -225 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 191, 227 )
	Image4:setTopBottom( false, false, 273.5, 276.5 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 1053, 1089 )
	Image5:setTopBottom( false, false, 275, 278.5 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local PersonalizeElemsSideList = CoD.PersonalizeElemsSideList.new( self, controller )
	PersonalizeElemsSideList:setLeftRight( true, false, 0, 68 )
	PersonalizeElemsSideList:setTopBottom( true, false, 78, 748 )
	self:addElement( PersonalizeElemsSideList )
	self.PersonalizeElemsSideList = PersonalizeElemsSideList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local characterCarouselFrame2 = function ( characterCarousel, event )
					local characterCarouselFrame3 = function ( characterCarousel, event )
						if not event.interrupted then
							characterCarousel:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						characterCarousel:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( characterCarousel, event )
						else
							characterCarousel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						characterCarouselFrame3( characterCarousel, event )
						return 
					else
						characterCarousel:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						characterCarousel:registerEventHandler( "transition_complete_keyframe", characterCarouselFrame3 )
					end
				end
				
				characterCarousel:completeAnimation()
				self.characterCarousel:setRGB( 0, 0, 0 )
				characterCarouselFrame2( characterCarousel, {} )
			end
		}
	}
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f23_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		if not f23_local0 then
			f23_local0 = self:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT_CAPS" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ClearSavedHeroForEdits( controller )
		ClearSavedState( self, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	characterCarousel.id = "characterCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.characterCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame0:close()
		element.characterCarousel:close()
		element.leftBumper:close()
		element.rightBumper:close()
		element.FETitleNumBrdr0:close()
		element.PersonalizeElemsSideList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChoosePersonalizationCharacter.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

