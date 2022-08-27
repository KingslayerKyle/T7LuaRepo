-- baf0322be25e4b451ac5f2eea7804193
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTeamLogoButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsTitle" )

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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EditTeamLogo.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f2_local1, controller )
	FadeForStreamer:setLeftRight( true, true, 0, 0 )
	FadeForStreamer:setTopBottom( true, true, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f2_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 595.5, 1104.5 )
	BoxButtonLrgIdle:setTopBottom( true, false, 144, 462.5 )
	BoxButtonLrgIdle:setAlpha( 0.45 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.09, 0.09, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, false, 601.5, 1098.12 )
	Border:setTopBottom( true, false, 147, 459.5 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.01, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local LogoList = LUI.UIList.new( f2_local1, controller, 7, 0, nil, true, false, 0, 0, false, false )
	LogoList:makeFocusable()
	LogoList:setLeftRight( true, false, 68.5, 502.5 )
	LogoList:setTopBottom( true, false, 148, 529 )
	LogoList:setDataSource( "TeamIdentityLogoList" )
	LogoList:setWidgetType( CoD.CodCasterTeamLogoButton )
	LogoList:setHorizontalCount( 3 )
	LogoList:setVerticalCount( 4 )
	LogoList:setSpacing( 7 )
	LogoList:linkToElementModel( LogoList, "disabled", true, function ( model )
		local f5_local0 = LogoList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	LogoList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	LogoList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f2_local1:AddButtonCallbackFunction( LogoList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsDisabled( f8_arg0, f8_arg2 ) then
			SetTeamIdentityTeamLogo( self, f8_arg0, f8_arg2 )
			SetTeamIdentityProfileValue( self, f8_arg0, f8_arg2, "icon" )
			SaveShoutcasterSettings( self, f8_arg0, f8_arg2 )
			GoBack( self, f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f9_arg0, f9_arg2 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( LogoList )
	self.LogoList = LogoList
	
	local LogoImageHintImage = LUI.UIImage.new()
	LogoImageHintImage:setLeftRight( true, false, 595.5, 1092.12 )
	LogoImageHintImage:setTopBottom( true, false, 146, 458.5 )
	self:addElement( LogoImageHintImage )
	self.LogoImageHintImage = LogoImageHintImage
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local TitleBox = CoD.matchSettingsTitle.new( f2_local1, controller )
	TitleBox:setLeftRight( true, false, 598.5, 1052.5 )
	TitleBox:setTopBottom( true, false, 478.5, 513.5 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	LogoImageHintImage:linkToElementModel( LogoList, "ref", true, function ( model )
		local ref = Engine.GetModelValue( model )
		if ref then
			LogoImageHintImage:setImage( RegisterImage( ref ) )
		end
	end )
	TitleBox:linkToElementModel( LogoList, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			TitleBox.TitleBox.ScorestreaksLabel:setText( Engine.Localize( name ) )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f12_local0 = nil
		HandleTeamIdentityKeyboardComplete( self, element, controller, event )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		GoBack( self, f13_arg2 )
		SaveShoutcasterSettings( self, f13_arg0, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.LogoList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer0:close()
		element.FadeForStreamer:close()
		element.GenericMenuFrame:close()
		element.LogoList:close()
		element.FEMenuLeftGraphics:close()
		element.TitleBox:close()
		element.LogoImageHintImage:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EditTeamLogo.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

