require( "ui.uieditor.widgets.Leaderboard.Leaderboard_VerticalCounter" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardHeader" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardRow" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "grid_updated", function ( element, event )
		local grid = event.grid
		local activeWidget = grid.activeWidget
		if not activeWidget then
			return 
		end
		local currentRow = activeWidget.gridInfoTable.gridRowIndex
		local datasource = grid:getDataSource()
		local properties = datasource.getCustomPropertiesForItem( grid, currentRow )
		local visibleRows = grid.vCount
		local rowOffset = 0
		if CoD.perController[controller].leaderboardTopOrBottom == CoD.LeaderboardUtility.TOP then
			rowOffset = 0
		elseif CoD.perController[controller].leaderboardTopOrBottom == CoD.LeaderboardUtility.BOTTOM then
			rowOffset = visibleRows - 1
		elseif CoD.SafeGetModelValue( activeWidget:getModel(), "xuid" ) == Engine.GetXUID64( controller ) then
			rowOffset = visibleRows - CoD.LeaderboardUtility.PLAYER_POSITION_IN_LEADERBOARD
		end
		local bottomWidget = grid:getItemAtPosition( currentRow + rowOffset, 1, true )
		if bottomWidget then
			grid:setActiveItem( bottomWidget )
			grid:setActiveItem( activeWidget )
		end
	end )
	self.LeaderboardRows.updateCounters = function ( list )
		local newState = "DefaultState"
		local activeWidget = list.activeWidget
		if list.requestedRowCount <= list.vCount then
			newState = "AtTopAndBottom"
		elseif activeWidget then
			local counterPosition = Engine.GetModelValue( Engine.GetModel( activeWidget:getModel(), "counterPosition" ) )
			local totalResults = DataSources.LeaderboardRows.getCount()
			if counterPosition == 1 then
				newState = "AtTop"
			elseif counterPosition == totalResults then
				newState = "AtBottom"
			end
		end
		SetElementState( self, self.VerticalCounter, controller, newState )
	end
	
end

CoD.Leaderboard = InheritFrom( LUI.UIElement )
CoD.Leaderboard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard )
	self.id = "Leaderboard"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1170 )
	self:setTopBottom( 0, 0, 0, 705 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 1170 )
	BG:setTopBottom( 0, 0, 0, 54 )
	BG:setAlpha( 0.08 )
	self:addElement( BG )
	self.BG = BG
	
	local LeaderboardRows = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	LeaderboardRows:makeFocusable()
	LeaderboardRows:mergeStateConditions( {
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller )
			end
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return IsDOALeaderboard( controller )
			end
		}
	} )
	LeaderboardRows:setLeftRight( 0, 0, 0, 1170 )
	LeaderboardRows:setTopBottom( 0, 0, 57, 705 )
	LeaderboardRows:setWidgetType( CoD.LeaderboardRow )
	LeaderboardRows:setVerticalCount( 18 )
	LeaderboardRows:setSpacing( 0 )
	LeaderboardRows:setDataSource( "LeaderboardRows" )
	LeaderboardRows:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		LeaderboardEnablePCacheBuffer( self, element, controller )
		return retVal
	end )
	LeaderboardRows:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		LeaderboardDisablePCacheBuffer( self, element, controller )
		return retVal
	end )
	LeaderboardRows:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	LeaderboardRows:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_LTRIG, nil, function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			Leaderboard_PageUp( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "MENU_LB_PAGE_UP", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_RTRIG, nil, function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			Leaderboard_PageDown( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "MENU_LB_PAGE_DOWN", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_GoToTopOfList( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_LB_TOP_OF_LIST", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_OpenPlayerDetails( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( LeaderboardRows )
	self.LeaderboardRows = LeaderboardRows
	
	local LeaderboardHeader = CoD.LeaderboardHeader.new( menu, controller )
	LeaderboardHeader:mergeStateConditions( {
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller ) and not IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				local f20_local0 = IsCurrentLanguageArabic()
				if f20_local0 then
					if not IsFreerunLeaderboard( controller ) then
						f20_local0 = not IsDOALeaderboard( controller )
					else
						f20_local0 = false
					end
				end
				return f20_local0
			end
		},
		{
			stateName = "FreerunArabic",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller ) and IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return IsDOALeaderboard( controller ) and not IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "DOAArabic",
			condition = function ( menu, element, event )
				return IsDOALeaderboard( controller ) and IsCurrentLanguageArabic()
			end
		}
	} )
	LeaderboardHeader:setLeftRight( 0, 0, 0, 1170 )
	LeaderboardHeader:setTopBottom( 0, 0, 13, 43 )
	LeaderboardHeader:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		LeaderboardHeader:setModel( model, controller )
	end )
	self:addElement( LeaderboardHeader )
	self.LeaderboardHeader = LeaderboardHeader
	
	local LoadingText = LUI.UIText.new()
	LoadingText:setLeftRight( 0, 0, 489, 654 )
	LoadingText:setTopBottom( 0, 0, 271, 301 )
	LoadingText:setText( Engine.Localize( "MENU_LB_LOADING" ) )
	LoadingText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingText )
	self.LoadingText = LoadingText
	
	local LeaderboardEmptyText = LUI.UIText.new()
	LeaderboardEmptyText:setLeftRight( 0, 0, 254, 916 )
	LeaderboardEmptyText:setTopBottom( 0, 0, 271, 301 )
	LeaderboardEmptyText:setText( Engine.Localize( "GROUPS_LEADERBOARD_EMPTY" ) )
	LeaderboardEmptyText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LeaderboardEmptyText )
	self.LeaderboardEmptyText = LeaderboardEmptyText
	
	local VerticalCounter = CoD.Leaderboard_VerticalCounter.new( menu, controller )
	VerticalCounter:setLeftRight( 0, 0, 434, 734 )
	VerticalCounter:setTopBottom( 0, 0, 713, 751 )
	VerticalCounter:subscribeToGlobalModel( controller, "LeaderboardRows", "totalCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VerticalCounter.count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( VerticalCounter )
	self.VerticalCounter = VerticalCounter
	
	VerticalCounter:linkToElementModel( LeaderboardRows, "counterPosition", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VerticalCounter.currentItem:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		LoadingText:completeAnimation()
		LeaderboardEmptyText:completeAnimation()
		LeaderboardRows:completeAnimation()
		VerticalCounter:completeAnimation()
		LoadingText:setAlpha( 1 )
		LeaderboardEmptyText:setAlpha( 1 )
		LeaderboardRows:setAlpha( 1 )
		VerticalCounter:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				LeaderboardEmptyText:completeAnimation()
				self.LeaderboardEmptyText:setAlpha( 0 )
				self.clipFinished( LeaderboardEmptyText, {} )
			end
		},
		UpdatingLeaderboard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardEmptyText:completeAnimation()
				self.LeaderboardEmptyText:setAlpha( 0 )
				self.clipFinished( LeaderboardEmptyText, {} )
				VerticalCounter:completeAnimation()
				self.VerticalCounter:setAlpha( 0 )
				self.clipFinished( VerticalCounter, {} )
			end
		},
		EmptyLeaderboard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				VerticalCounter:completeAnimation()
				self.VerticalCounter:setAlpha( 0 )
				self.clipFinished( VerticalCounter, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "UpdatingLeaderboard",
			condition = function ( menu, element, event )
				return IsLeaderboardUpdating()
			end
		},
		{
			stateName = "EmptyLeaderboard",
			condition = function ( menu, element, event )
				return IsLeaderboardEmpty()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "status" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( DataSources.LeaderboardRows.getModel( controller ), "totalCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "totalCount"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) then
			Leaderboard_UpdateHeaderModel( self, controller )
			UpdateAllMenuButtonPrompts( menu, controller )
		else
			UpdateAllMenuButtonPrompts( menu, controller )
		end
	end )
	LeaderboardRows.id = "LeaderboardRows"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LeaderboardRows:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeaderboardRows:close()
		self.LeaderboardHeader:close()
		self.VerticalCounter:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

