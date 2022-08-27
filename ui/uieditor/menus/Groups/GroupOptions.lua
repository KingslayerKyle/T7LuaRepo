-- 262d4187936ce926f54d4fd6a2100a4c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_OptionsButton" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 355
end

LUI.createMenu.GroupOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupOptions.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, true, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -355, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -355, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local optionsList = LUI.UIList.new( f2_local1, controller, 1, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( false, true, -322.5, -67.5 )
	optionsList:setTopBottom( true, false, 135, 282 )
	optionsList:setWidgetType( CoD.GameSettings_OptionsButton )
	optionsList:setVerticalCount( 4 )
	optionsList:setSpacing( 1 )
	optionsList:setDataSource( "GroupHeadquartersOverviewButtonList" )
	optionsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		ClassOptionsSetHintText( self, element, controller )
		return f3_local0
	end )
	optionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	optionsList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( optionsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		ProcessListAction( self, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local title = LUI.UIText.new()
	title:setLeftRight( false, true, -322.5, -100 )
	title:setTopBottom( true, false, 96, 122 )
	title:setRGB( 1, 0.47, 0 )
	title:setText( Engine.Localize( "GROUPS_GROUP_OPTIONS_CAPS" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( f2_local1, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -356, -355 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -356, -355 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( false, true, -308.5, -83.75 )
	HintText:setTopBottom( true, false, 308, 328 )
	HintText:setTTF( "fonts/default.ttf" )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	local Arrow1 = LUI.UIImage.new()
	Arrow1:setLeftRight( false, true, -322.5, -313.5 )
	Arrow1:setTopBottom( true, false, 313.5, 322.5 )
	Arrow1:setAlpha( 0.6 )
	Arrow1:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow_white" ) )
	self:addElement( Arrow1 )
	self.Arrow1 = Arrow1
	
	HintText:linkToElementModel( optionsList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			HintText:setText( Engine.Localize( hintText ) )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "ClassSets",
			condition = function ( menu, element, event )
				return IsClassSetsAvailableForCurrentGameMode() and DoesPlayerHaveExtraSlotsItem( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f12_local0 = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", element, controller, event )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		GoBack( self, f13_arg2 )
		ClearSavedState( self, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	optionsList.id = "optionsList"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.optionsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.optionsList:close()
		element.fefooterRighSlideIn:close()
		element.HintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

