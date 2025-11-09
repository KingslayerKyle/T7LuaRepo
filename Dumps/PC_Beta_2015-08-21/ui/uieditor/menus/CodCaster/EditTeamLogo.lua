require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamLogoButton" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "TeamIdentity" )
	if f1_local0 then
		local f1_local1 = Engine.ToUpper( Engine.Localize( "CODCASTER_" .. Engine.GetModelValue( Engine.GetModel( f1_local0, "team" ) ) .. "_LOGO" ) )
		f1_arg0.GenericMenuFrame.titleLabel:setText( f1_local1 )
		f1_arg0.GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( f1_local1 )
	end
end

LUI.createMenu.EditTeamLogo = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EditTeamLogo" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditTeamLogo.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local LogoList = LUI.UIList.new( self, controller, 35, 0, nil, false, false, 0, 0, false, false )
	LogoList:makeFocusable()
	LogoList:setLeftRight( true, false, 78.5, 568.5 )
	LogoList:setTopBottom( true, false, 121, 586 )
	LogoList:setDataSource( "TeamIdentityLogoList" )
	LogoList:setWidgetType( CoD.CodCasterTeamLogoButton )
	LogoList:setHorizontalCount( 3 )
	LogoList:setVerticalCount( 4 )
	LogoList:setSpacing( 35 )
	LogoList:linkToElementModel( LogoList, "disabled", true, function ( model )
		local f3_local0 = LogoList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	LogoList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	LogoList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( LogoList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			SetTeamIdentityTeamLogo( self, element, controller )
			SetTeamIdentityProfileValue( self, element, controller, "icon" )
			SaveShoutcasterSettings( self, element, controller )
			GoBack( self, controller )
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
	self:addElement( LogoList )
	self.LogoList = LogoList
	
	local LogoImageHintImage = LUI.UIImage.new()
	LogoImageHintImage:setLeftRight( true, false, 599, 1187 )
	LogoImageHintImage:setTopBottom( true, false, 121, 491 )
	self:addElement( LogoImageHintImage )
	self.LogoImageHintImage = LogoImageHintImage
	
	local LogoImageHintText = LUI.UIText.new()
	LogoImageHintText:setLeftRight( true, false, 682.5, 1030.5 )
	LogoImageHintText:setTopBottom( true, false, 503.5, 528.5 )
	LogoImageHintText:setTTF( "fonts/default.ttf" )
	LogoImageHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LogoImageHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LogoImageHintText )
	self.LogoImageHintText = LogoImageHintText
	
	LogoImageHintImage:linkToElementModel( LogoList, "ref", true, function ( model )
		local ref = Engine.GetModelValue( model )
		if ref then
			LogoImageHintImage:setImage( RegisterImage( ref ) )
		end
	end )
	LogoImageHintText:linkToElementModel( LogoList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			LogoImageHintText:setText( Engine.Localize( name ) )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f10_local0 = nil
		HandleTeamIdentityKeyboardComplete( self, self, controller, event )
		if not f10_local0 then
			f10_local0 = self:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		SaveShoutcasterSettings( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	LogoList.id = "LogoList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.LogoList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericMenuFrame:close()
		element.LogoList:close()
		element.LogoImageHintImage:close()
		element.LogoImageHintText:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditTeamLogo.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

