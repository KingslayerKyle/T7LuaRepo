require( "ui.uieditor.widgets.Leaderboard.LeaderboardRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardHeader" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "grid_updated", function ( element, event )
		local f2_local0 = event.grid
		local f2_local1 = f2_local0.activeWidget
		if not f2_local1 then
			return 
		end
		local f2_local2 = f2_local1.gridInfoTable.gridRowIndex
		local f2_local3 = f2_local0:getDataSource()
		local f2_local4 = f2_local3.getCustomPropertiesForItem( f2_local0, f2_local2 )
		local f2_local5 = f2_local0.vCount
		local f2_local6 = 0
		if CoD.perController[f1_arg1].leaderboardTopOrBottom == CoD.LeaderboardUtility.TOP then
			f2_local6 = 0
		elseif CoD.perController[f1_arg1].leaderboardTopOrBottom == CoD.LeaderboardUtility.BOTTOM then
			f2_local6 = f2_local5 - 1
		elseif Engine.GetModelValue( Engine.GetModel( f2_local1:getModel(), "xuid" ) ) == Engine.GetXUID64( f1_arg1 ) then
			f2_local6 = f2_local5 - CoD.LeaderboardUtility.PLAYER_POSITION_IN_LEADERBOARD
		end
		local f2_local7 = f2_local0:getItemAtPosition( f2_local2 + f2_local6, 1, true )
		if f2_local7 then
			f2_local0:setActiveItem( f2_local7 )
			f2_local0:setActiveItem( f2_local1 )
		end
	end )
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
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 391 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 780 )
	BG:setTopBottom( true, false, 0, 28.87 )
	BG:setAlpha( 0.08 )
	self:addElement( BG )
	self.BG = BG
	
	local LeaderboardRows = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	LeaderboardRows:makeFocusable()
	LeaderboardRows:setLeftRight( true, false, 0, 780 )
	LeaderboardRows:setTopBottom( true, false, 31, 463 )
	LeaderboardRows:setDataSource( "LeaderboardRows" )
	LeaderboardRows:setWidgetType( CoD.LeaderboardRow )
	LeaderboardRows:setVerticalCount( 18 )
	LeaderboardRows:setSpacing( 0 )
	LeaderboardRows:setVerticalCounter( CoD.verticalCounter )
	LeaderboardRows:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_UP )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_DOWN )
		return f4_local0
	end )
	LeaderboardRows:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_LTRIG, "PGUP", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			Leaderboard_PageUp( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "MENU_LB_PAGE_UP" )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( nil ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_RTRIG, "PGDN", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( model ) then
			Leaderboard_PageDown( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "MENU_LB_PAGE_DOWN" )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( nil ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "T", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_GoToTopOfList( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_LB_TOP_OF_LIST" )
		if IsSelfInState( self, "DefaultState" ) then
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSelfInState( self, "DefaultState" ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_MoveUp( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		if IsSelfInState( self, "DefaultState" ) then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_MoveDown( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		if IsSelfInState( self, "DefaultState" ) then
			return false
		else
			return false
		end
	end, false )
	LeaderboardRows:mergeStateConditions( {
		{
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller )
			end
		}
	} )
	self:addElement( LeaderboardRows )
	self.LeaderboardRows = LeaderboardRows
	
	local LeaderboardHeader = CoD.LeaderboardHeader.new( menu, controller )
	LeaderboardHeader:setLeftRight( true, false, 0, 780 )
	LeaderboardHeader:setTopBottom( true, false, 4, 24 )
	LeaderboardHeader:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		LeaderboardHeader:setModel( model, controller )
	end )
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
				return IsCurrentLanguageArabic() and not IsFreerunLeaderboard( controller )
			end
		},
		{
			stateName = "FreerunArabic",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller ) and IsCurrentLanguageArabic()
			end
		}
	} )
	self:addElement( LeaderboardHeader )
	self.LeaderboardHeader = LeaderboardHeader
	
	local LoadingText = LUI.UIText.new()
	LoadingText:setLeftRight( true, false, 326, 436 )
	LoadingText:setTopBottom( true, false, 174, 194 )
	LoadingText:setText( Engine.Localize( "MENU_LB_LOADING" ) )
	LoadingText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingText )
	self.LoadingText = LoadingText
	
	local LeaderboardEmptyText = LUI.UIText.new()
	LeaderboardEmptyText:setLeftRight( true, false, 169.5, 610.5 )
	LeaderboardEmptyText:setTopBottom( true, false, 174, 194 )
	LeaderboardEmptyText:setText( Engine.Localize( "GROUPS_LEADERBOARD_EMPTY" ) )
	LeaderboardEmptyText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LeaderboardEmptyText )
	self.LeaderboardEmptyText = LeaderboardEmptyText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 1 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
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
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 1 )
				self.clipFinished( LoadingText, {} )
				LeaderboardEmptyText:completeAnimation()
				self.LeaderboardEmptyText:setAlpha( 0 )
				self.clipFinished( LeaderboardEmptyText, {} )
			end
		},
		EmptyLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				LeaderboardEmptyText:completeAnimation()
				self.LeaderboardEmptyText:setAlpha( 1 )
				self.clipFinished( LeaderboardEmptyText, {} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsInDefaultState( element ) then
			UpdateElementDataSource( self, "LeaderboardRows" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeaderboardRows:close()
		element.LeaderboardHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

