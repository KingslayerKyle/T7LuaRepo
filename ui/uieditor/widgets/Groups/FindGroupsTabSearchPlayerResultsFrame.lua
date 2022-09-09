-- 49bd28be088378c4b115a8634d1b054e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupPlayerSearch" )
end

CoD.FindGroupsTabSearchPlayerResultsFrame = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabSearchPlayerResultsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabSearchPlayerResultsFrame )
	self.id = "FindGroupsTabSearchPlayerResultsFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 724 )
	self:setTopBottom( true, false, 0, 417 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PlayersList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PlayersList:makeFocusable()
	PlayersList:setLeftRight( true, false, 0, 374 )
	PlayersList:setTopBottom( true, false, 0, 370 )
	PlayersList:setWidgetType( CoD.GroupsRosterRow )
	PlayersList:setVerticalCount( 6 )
	PlayersList:setVerticalCounter( CoD.verticalCounter )
	PlayersList:setDataSource( "SocialPlayersList" )
	PlayersList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		SetSelectedFriendXUID( self, element, controller )
		return f3_local0
	end )
	PlayersList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	PlayersList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( PlayersList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		OpenOverlay( self, "Social_PlayerDetailsPopup", f6_arg2, "", "" )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	PlayersList:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "groups.searchPlayerInProgress" )
			end
		}
	} )
	PlayersList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchPlayerInProgress" ), function ( model )
		menu:updateElementState( PlayersList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchPlayerInProgress"
		} )
	end )
	self:addElement( PlayersList )
	self.PlayersList = PlayersList
	
	local NoResults = LUI.UIText.new()
	NoResults:setLeftRight( true, false, 0, 708 )
	NoResults:setTopBottom( true, false, 191.5, 231.5 )
	NoResults:setAlpha( 0 )
	NoResults:setText( Engine.Localize( "GROUPS_SEARCH_NO_RESULTS_FOR_PLAYER_SEARCH" ) )
	NoResults:setTTF( "fonts/default.ttf" )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoResults )
	self.NoResults = NoResults
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PlayersList:completeAnimation()
				self.PlayersList:setAlpha( 1 )
				self.clipFinished( PlayersList, {} )

				NoResults:completeAnimation()
				self.NoResults:setAlpha( 0 )
				self.clipFinished( NoResults, {} )
			end
		},
		NoContent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PlayersList:completeAnimation()
				self.PlayersList:setAlpha( 0 )
				self.clipFinished( PlayersList, {} )

				NoResults:completeAnimation()
				self.NoResults:setAlpha( 1 )
				self.clipFinished( NoResults, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoContent",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "groups.searchPlayerResultsCount", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchPlayerResultsCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchPlayerResultsCount"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetGlobalModelValue( "socialRoot.tab", "groups" )
	end )
	PlayersList.id = "PlayersList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.PlayersList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayersList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
