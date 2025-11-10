require( "ui.uieditor.widgets.Groups.Common.GroupsBackground" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopLine" )
require( "ui.uieditor.widgets.Groups.Headquarters.OverviewTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.RosterTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.BadgesTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.LeaderboardTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.ShareTab" )
require( "ui.uieditor.widgets.Groups.Headquarters.AdminTab" )
require( "ui.uieditor.menus.Groups.LeaderboardMaker" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setModel( CoD.perController[f1_arg1].selectedGroup )
end

LUI.createMenu.GroupHeadquarters = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupHeadquarters" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 720 )
	GroupsBackground0:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			GroupsBackground0.titleLabel:setText( Engine.Localize( name ) )
		end
	end )
	GroupsBackground0:mergeStateConditions( {
		{
			stateName = "SelectedGroup",
			condition = function ( menu, element, event )
				return HasSelectedGroup( element, controller )
			end
		}
	} )
	GroupsBackground0:linkToElementModel( GroupsBackground0, "groupId", true, function ( model )
		self:updateElementState( GroupsBackground0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	self:addElement( GroupsBackground0 )
	self.GroupsBackground0 = GroupsBackground0
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 101.5, 465.5 )
	Title:setTopBottom( true, false, 51.5, 99.5 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "GROUPS_HEADQUARTERS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Tab = CoD.basicTabList.new( self, controller )
	Tab:setLeftRight( true, false, 64, 1110.25 )
	Tab:setTopBottom( true, false, 125, 165 )
	Tab.grid:setDataSource( "GroupsHeadquartersTabList" )
	Tab.grid:setWidgetType( CoD.paintshopTabWidget )
	Tab.grid:setHorizontalCount( 8 )
	self:addElement( Tab )
	self.Tab = Tab
	
	local PaintshopLine0 = CoD.PaintshopLine.new( self, controller )
	PaintshopLine0:setLeftRight( true, false, 65.52, 1213.52 )
	PaintshopLine0:setTopBottom( true, false, 173.36, 177.36 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local panel = LUI.UIImage.new()
	panel:setLeftRight( true, false, 64, 1216 )
	panel:setTopBottom( true, false, 181, 642 )
	panel:setRGB( 0.15, 0.15, 0.15 )
	panel:setAlpha( 0.8 )
	self:addElement( panel )
	self.panel = panel
	
	local Frame = LUI.UIFrame.new( self, controller, 0, 0, false )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 181, 642 )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( Tab.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			Frame:changeFrameWidget( tabWidget )
		end
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.grouphqtabname" ), function ( model )
		local f7_local0 = self
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.grouphqtabname"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:linkToElementModel( self, "lbInitialized", true, function ( model )
		local f8_local0 = self
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbInitialized"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:registerEventHandler( "list_active_changed", function ( self, event )
		local f9_local0 = nil
		SetGroupHeadquarterTabName( self, self, controller )
		return f9_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f10_local0 = nil
		SetElementStateByElementName( self, "GroupsBackground0", controller, "SelectedGroup" )
		if not f10_local0 then
			f10_local0 = self:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f11_local0 = nil
		HandleGroupHeadquartersKeyboardComplete( self, self, controller, event )
		if not f11_local0 then
			f11_local0 = self:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ClearSelectedGroup( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsGroupHeadquartersTabSelected( controller, "leaderboard" ) and DoesHaveAdminRightsForGroup( element, controller ) and IsGroupLeaderboardInitialized() then
			OpenLeaderboardMaker( self, element, controller, "SelectAction" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "GROUPS_EDIT_LEADERBOARD" )
		if IsGroupHeadquartersTabSelected( controller, "leaderboard" ) and DoesHaveAdminRightsForGroup( element, controller ) and IsGroupLeaderboardInitialized() then
			return true
		else
			return false
		end
	end, false )
	Frame.id = "Frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBackground0:close()
		element.Tab:close()
		element.PaintshopLine0:close()
		element.Frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupHeadquarters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

