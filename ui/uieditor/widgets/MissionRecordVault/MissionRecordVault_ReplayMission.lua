-- b2b64ba7c43bb77dd35813868a6e6d9c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_list1buttonGameOptions" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_Heading" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ReplayMissionMapInfo" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	if f1_local0 == nil then
		return 
	end
	local f1_local1 = Engine.GetModelValue( f1_local0 )
	local f1_local2 = Engine.CreateModel( menu:getModel(), "selectedMission" )
	Engine.CreateModel( f1_local2, "mapName" )
	Engine.CreateModel( f1_local2, "mapNameCaps" )
	Engine.CreateModel( f1_local2, "previewImage" )
	Engine.CreateModel( f1_local2, "mapLocation" )
	Engine.CreateModel( f1_local2, "mapDescription" )
	Engine.CreateModel( f1_local2, "collectiblesFound" )
	Engine.CreateModel( f1_local2, "collectiblesTotal" )
	Engine.CreateModel( f1_local2, "completionDifficulty" )
	Engine.CreateModel( f1_local2, "highestScore" )
	local f1_local3 = self.MapList:findItem( nil, {
		mapId = f1_local1
	}, false, false )
	if f1_local3 ~= nil then
		self.MapList:setActiveItem( f1_local3 )
	end
end

CoD.MissionRecordVault_ReplayMission = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ReplayMission.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ReplayMission )
	self.id = "MissionRecordVault_ReplayMission"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, false, -80, 399 )
	TitleBG:setTopBottom( true, false, 5, 75 )
	TitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_pri_title_bg" ) )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local MapList = LUI.UIList.new( menu, controller, 4, 0, nil, true, false, 0, 0, false, false )
	MapList:makeFocusable()
	MapList:setLeftRight( true, false, 4, 248 )
	MapList:setTopBottom( true, false, 98, 490 )
	MapList:setWidgetType( CoD.StartMenu_list1buttonGameOptions )
	MapList:setVerticalCount( 11 )
	MapList:setSpacing( 4 )
	MapList:setDataSource( "CPMapsList" )
	MapList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		MRV_SelectReplayMission( menu, element, controller )
		return f3_local0
	end )
	MapList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	MapList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( MapList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		MRV_ClickReplayMission( self, f6_arg1, f6_arg0, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MapList:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsElementPropertyValue( element, "classified", true )
			end
		}
	} )
	self:addElement( MapList )
	self.MapList = MapList
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 10, 300 )
	Subtitle:setTopBottom( true, false, 50, 68 )
	Subtitle:setAlpha( 0.5 )
	Subtitle:setTTF( "fonts/escom.ttf" )
	Subtitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Subtitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	Subtitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	Subtitle:setShaderVector( 2, 1, 0, 0, 0 )
	Subtitle:setLetterSpacing( 1 )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Subtitle:linkToElementModel( self, "selectedMission.mapLocation", true, function ( model )
		local selectedMissionMapLocation = Engine.GetModelValue( model )
		if selectedMissionMapLocation then
			Subtitle:setText( LocalizeToUpperString( selectedMissionMapLocation ) )
		end
	end )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local MissionRecordVaultHeading = CoD.MissionRecordVault_Heading.new( menu, controller )
	MissionRecordVaultHeading:setLeftRight( true, false, -9, 1265 )
	MissionRecordVaultHeading:setTopBottom( true, false, -3, 100 )
	MissionRecordVaultHeading:linkToElementModel( self, "selectedMission.mapNameCaps", true, function ( model )
		local selectedMissionMapNameCaps = Engine.GetModelValue( model )
		if selectedMissionMapNameCaps then
			MissionRecordVaultHeading.Title:setText( LocalizeToUpperString( selectedMissionMapNameCaps ) )
		end
	end )
	self:addElement( MissionRecordVaultHeading )
	self.MissionRecordVaultHeading = MissionRecordVaultHeading
	
	local MissionRecordVaultReplayMissionMapInfo = CoD.MissionRecordVault_ReplayMissionMapInfo.new( menu, controller )
	MissionRecordVaultReplayMissionMapInfo:setLeftRight( true, false, 258, 1170 )
	MissionRecordVaultReplayMissionMapInfo:setTopBottom( true, false, 98, 550 )
	self:addElement( MissionRecordVaultReplayMissionMapInfo )
	self.MissionRecordVaultReplayMissionMapInfo = MissionRecordVaultReplayMissionMapInfo
	
	MissionRecordVaultReplayMissionMapInfo:linkToElementModel( MapList, nil, false, function ( model )
		MissionRecordVaultReplayMissionMapInfo:setModel( model, controller )
	end )
	MapList.id = "MapList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.MapList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapList:close()
		element.MissionRecordVaultHeading:close()
		element.MissionRecordVaultReplayMissionMapInfo:close()
		element.Subtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

