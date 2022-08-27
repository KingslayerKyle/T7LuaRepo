-- b54a8dca278b0e83170d686038ff6b68
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.Mods.WidgetModsLoad" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	Engine.Mods_Lists_UpdateMods()
end

LUI.createMenu.MenuModsLoad = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MenuModsLoad" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MenuModsLoad.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( f2_local1, controller )
	MPBackground:setLeftRight( true, false, 0, 1280 )
	MPBackground:setTopBottom( true, false, 0, 720 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FETabIdle0 = CoD.FE_TabIdle.new( f2_local1, controller )
	FETabIdle0:setLeftRight( true, true, -3, 1277 )
	FETabIdle0:setTopBottom( true, false, 82.5, 124.5 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local WidgetModsLoad0 = CoD.WidgetModsLoad.new( f2_local1, controller )
	WidgetModsLoad0:setLeftRight( true, false, 75, 675 )
	WidgetModsLoad0:setTopBottom( true, false, 124.5, 604.5 )
	self:addElement( WidgetModsLoad0 )
	self.WidgetModsLoad0 = WidgetModsLoad0
	
	local DetailsTextBox = LUI.UIText.new()
	DetailsTextBox:setLeftRight( true, true, 775, -69 )
	DetailsTextBox:setTopBottom( true, false, 93.5, 117.5 )
	DetailsTextBox:setAlpha( 0 )
	DetailsTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	DetailsTextBox:setText( Engine.Localize( "MENU_DETAILS_CAPS" ) )
	DetailsTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DetailsTextBox )
	self.DetailsTextBox = DetailsTextBox
	
	local VersionText = LUI.UIText.new()
	VersionText:setLeftRight( true, true, 599, -550 )
	VersionText:setTopBottom( true, false, 95, 118.5 )
	VersionText:setAlpha( 0 )
	VersionText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	VersionText:setText( Engine.Localize( "MENU_VERSION_CAPS" ) )
	VersionText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	VersionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	VersionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VersionText )
	self.VersionText = VersionText
	
	local ModNameText = LUI.UIText.new()
	ModNameText:setLeftRight( true, true, 75, -966 )
	ModNameText:setTopBottom( true, false, 94.5, 118.5 )
	ModNameText:setAlpha( 0 )
	ModNameText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	ModNameText:setText( Engine.Localize( "PLATFORM_SELECT_MOD_TO_LOAD" ) )
	ModNameText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ModNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ModNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ModNameText )
	self.ModNameText = ModNameText
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, -192, 64 )
	Title:setTopBottom( true, false, -183, -129 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ModsGlobal.update" ), function ( model )
		local f3_local0 = self
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "ModsGlobal.update"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "R", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		Mods_RefreshListMods( f6_arg2, f6_arg0 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REFRESH" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "U", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if Mods_IsUsingMods() then
			Mods_Unload( f8_arg2, f8_arg0 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if Mods_IsUsingMods() then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "PLATFORM_MODS_UNLOAD" )
			return true
		else
			return false
		end
	end, false )
	WidgetModsLoad0.id = "WidgetModsLoad0"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.WidgetModsLoad0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPBackground:close()
		element.FETabIdle0:close()
		element.WidgetModsLoad0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MenuModsLoad.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

