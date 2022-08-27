-- ac48d000bb7216a438de6faf7ec85992
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCP_Contents" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disablePopupOpenCloseAnim = true
end

LUI.createMenu.CombatRecordCP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordCP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCP.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f2_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 80, 697.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f2_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CombatRecordCPContents = CoD.CombatRecordCP_Contents.new( f2_local1, controller )
	CombatRecordCPContents:setLeftRight( true, false, 77, 1201.5 )
	CombatRecordCPContents:setTopBottom( true, false, 98, 642.5 )
	CombatRecordCPContents:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp", function ( model )
		local statsCp = Engine.GetModelValue( model )
		if statsCp then
			CombatRecordCPContents.RankName:setText( Engine.Localize( RankTitleFromStorage( controller, "cp", statsCp ) ) )
		end
	end )
	self:addElement( CombatRecordCPContents )
	self.CombatRecordCPContents = CombatRecordCPContents
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		GoBack( self, f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	CombatRecordCPContents.id = "CombatRecordCPContents"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.CombatRecordCPContents:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.CombatRecordCPContents:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordCP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

