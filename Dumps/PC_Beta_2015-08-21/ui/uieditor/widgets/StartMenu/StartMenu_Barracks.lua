require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Button" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Barracks_Stat" )

CoD.StartMenu_Barracks = InheritFrom( LUI.UIElement )
CoD.StartMenu_Barracks.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Barracks )
	self.id = "StartMenu_Barracks"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CP = CoD.StartMenu_Barracks_Button.new( menu, controller )
	CP:setLeftRight( true, false, 9, 385 )
	CP:setTopBottom( true, true, 1, -5 )
	CP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	CP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	CP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp_offline", function ( model )
		local statsCpOffline = Engine.GetModelValue( model )
		if statsCpOffline then
			CP.RankName:setText( Engine.Localize( RankToTitleString( "cp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsCpOffline ) ) ) )
		end
	end )
	CP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_cp_offline", function ( model )
		local statsCpOffline = Engine.GetModelValue( model )
		if statsCpOffline then
			CP.Rank:setText( Engine.Localize( RankToLevelString( "cp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsCpOffline ) ) ) )
		end
	end )
	self:addElement( CP )
	self.CP = CP
	
	local MP = CoD.StartMenu_Barracks_Button.new( menu, controller )
	MP:setLeftRight( true, false, 396, 761.83 )
	MP:setTopBottom( true, true, 1, -5 )
	MP.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	MP.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	MP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			MP.RankName:setText( Engine.Localize( RankToTitleString( "mp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsMp ) ) ) )
		end
	end )
	MP:subscribeToGlobalModel( controller, "StorageGlobal", "stats_mp", function ( model )
		local statsMp = Engine.GetModelValue( model )
		if statsMp then
			MP.Rank:setText( Engine.Localize( RankToLevelString( "mp", StorageLookup( controller, "playerstatslist.rank.statvalue", statsMp ) ) ) )
		end
	end )
	self:addElement( MP )
	self.MP = MP
	
	local ZM = CoD.StartMenu_Barracks_Button.new( menu, controller )
	ZM:setLeftRight( true, true, 771, -9 )
	ZM:setTopBottom( true, true, 1, -5 )
	ZM.SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	ZM.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	ZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			ZM.RankName:setText( Engine.Localize( RankToTitleString( "zm", StorageLookup( controller, "playerstatslist.rank.statvalue", statsZm ) ) ) )
		end
	end )
	ZM:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local statsZm = Engine.GetModelValue( model )
		if statsZm then
			ZM.Rank:setText( Engine.Localize( RankToLevelString( "zm", StorageLookup( controller, "playerstatslist.rank.statvalue", statsZm ) ) ) )
		end
	end )
	self:addElement( ZM )
	self.ZM = ZM
	
	local TotalKills = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	TotalKills:setLeftRight( true, false, 393, 512.67 )
	TotalKills:setTopBottom( true, false, 388.94, 449.94 )
	TotalKills:setAlpha( 0 )
	TotalKills.Value:setText( Engine.Localize( "MPUI_TOTAL_KILLS_CAPS" ) )
	TotalKills.Title:setText( Engine.Localize( "42,000" ) )
	self:addElement( TotalKills )
	self.TotalKills = TotalKills
	
	local KD = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	KD:setLeftRight( true, false, 517.17, 593.83 )
	KD:setTopBottom( true, false, 388.94, 449.94 )
	KD:setAlpha( 0 )
	KD.Value:setText( Engine.Localize( "MPUI_RANK" ) )
	KD.Title:setText( Engine.Localize( "0.93" ) )
	self:addElement( KD )
	self.KD = KD
	
	local SPM = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	SPM:setLeftRight( true, false, 600.83, 677.5 )
	SPM:setTopBottom( true, false, 388.94, 449.94 )
	SPM:setAlpha( 0 )
	SPM.Value:setText( Engine.Localize( "SPM" ) )
	SPM.Title:setText( Engine.Localize( "4.25" ) )
	self:addElement( SPM )
	self.SPM = SPM
	
	local WL = CoD.StartMenu_Barracks_Stat.new( menu, controller )
	WL:setLeftRight( true, false, 682.17, 758.83 )
	WL:setTopBottom( true, false, 388.94, 449.94 )
	WL:setAlpha( 0 )
	WL.Value:setText( Engine.Localize( "W/L" ) )
	WL.Title:setText( Engine.Localize( "1.75" ) )
	self:addElement( WL )
	self.WL = WL
	
	CP.navigation = {
		right = MP
	}
	MP.navigation = {
		left = CP,
		right = ZM
	}
	ZM.navigation = {
		left = MP
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CP.id = "CP"
	MP.id = "MP"
	ZM.id = "ZM"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.MP:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CP:close()
		element.MP:close()
		element.ZM:close()
		element.TotalKills:close()
		element.KD:close()
		element.SPM:close()
		element.WL:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

