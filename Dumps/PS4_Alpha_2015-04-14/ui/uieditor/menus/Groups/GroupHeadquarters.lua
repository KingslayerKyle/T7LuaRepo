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

local PostLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedGroup )
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
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local GroupsBackground0 = CoD.GroupsBackground.new( self, controller )
	GroupsBackground0:setLeftRight( true, false, 0, 1280 )
	GroupsBackground0:setTopBottom( true, false, 0, 720 )
	GroupsBackground0:setRGB( 1, 1, 1 )
	GroupsBackground0:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupsBackground0.titleLabel:setText( Engine.Localize( modelValue ) )
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
	Title:setRGB( 1, 1, 1 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "GROUPS_HEADQUARTERS" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Tab = CoD.basicTabList.new( self, controller )
	Tab:setLeftRight( true, false, 64, 1110.25 )
	Tab:setTopBottom( true, false, 125, 165 )
	Tab:setRGB( 1, 1, 1 )
	Tab.grid:setDataSource( "GroupsHeadquartersTabList" )
	Tab.grid:setWidgetType( CoD.paintshopTabWidget )
	Tab.grid:setHorizontalCount( 8 )
	self:addElement( Tab )
	self.Tab = Tab
	
	local PaintshopLine0 = CoD.PaintshopLine.new( self, controller )
	PaintshopLine0:setLeftRight( true, false, 65.52, 1213.52 )
	PaintshopLine0:setTopBottom( true, false, 173.36, 177.36 )
	PaintshopLine0:setRGB( 1, 1, 1 )
	PaintshopLine0:setAlpha( 0 )
	self:addElement( PaintshopLine0 )
	self.PaintshopLine0 = PaintshopLine0
	
	local panel = LUI.UIImage.new()
	panel:setLeftRight( true, false, 64, 1216 )
	panel:setTopBottom( true, false, 181, 642 )
	panel:setRGB( 0.15, 0.15, 0.15 )
	panel:setAlpha( 0.8 )
	panel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( panel )
	self.panel = panel
	
	local Frame = LUI.UIFrame.new( self, controller, 0, 0 )
	Frame:setLeftRight( true, true, 64, -64 )
	Frame:setTopBottom( true, false, 181, 642 )
	Frame:setRGB( 1, 1, 1 )
	self:addElement( Frame )
	self.Frame = Frame
	
	Frame:linkToElementModel( Tab.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Frame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if IsGroupHeadquartersTabSelected( controller, "leaderboard" ) and DoesHaveAdminRightsForGroup( element, controller ) and IsGroupLeaderboardInitialized() then
			menu:addButtonPrompt( "alt2", Engine.Localize( "GROUPS_EDIT_LEADERBOARD" ), "A", element )
			return true
		else
			
		end
	end
	
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.grouphqtabname" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.grouphqtabname"
		}
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
	end )
	self:linkToElementModel( self, "lbInitialized", true, function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lbInitialized"
		}
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			ClearSelectedGroup( self, element, controller )
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "A") and IsGroupHeadquartersTabSelected( controller, "leaderboard" ) and DoesHaveAdminRightsForGroup( element, controller ) and IsGroupLeaderboardInitialized() then
			OpenLeaderboardMaker( self, element, controller, "SelectAction" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		SetGroupHeadquarterTabName( self, element, controller )
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		SetElementStateByElementName( self, "GroupsBackground0", controller, "SelectedGroup" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.GroupsBackground0:close()
		self.Tab:close()
		self.PaintshopLine0:close()
		self.Frame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

