-- 54b283db38f521354187f481661d35fb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileshareNoContentGraphic" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardRow" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardHeader" )
require( "ui.uieditor.widgets.Leaderboard.Leaderboard_VerticalCounter" )

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
	f1_arg0.LeaderboardRows.updateCounters = function ( f3_arg0 )
		local f3_local0 = "DefaultState"
		local f3_local1 = f3_arg0.activeWidget
		if f3_arg0.requestedRowCount <= f3_arg0.vCount then
			f3_local0 = "AtTopAndBottom"
		elseif f3_local1 then
			local f3_local2 = Engine.GetModelValue( Engine.GetModel( f3_local1:getModel(), "counterPosition" ) )
			local f3_local3 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ) )
			if f3_local2 == 1 then
				f3_local0 = "AtTop"
			elseif f3_local2 == f3_local3 then
				f3_local0 = "AtBottom"
			end
		end
		SetElementState( f1_arg0, f1_arg0.VerticalCounter, f1_arg1, f3_local0 )
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
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 470 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 780 )
	BG:setTopBottom( true, false, 0, 35.87 )
	BG:setAlpha( 0.08 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareNoContentGraphic = CoD.FileshareNoContentGraphic.new( menu, controller )
	FileshareNoContentGraphic:setLeftRight( true, true, 1, 5 )
	FileshareNoContentGraphic:setTopBottom( true, true, 39.87, -24 )
	self:addElement( FileshareNoContentGraphic )
	self.FileshareNoContentGraphic = FileshareNoContentGraphic
	
	local LeaderboardRows = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	LeaderboardRows:makeFocusable()
	LeaderboardRows:setLeftRight( true, false, 0, 780 )
	LeaderboardRows:setTopBottom( true, false, 38, 470 )
	LeaderboardRows:setAlpha( 0 )
	LeaderboardRows:setWidgetType( CoD.LeaderboardRow )
	LeaderboardRows:setVerticalCount( 18 )
	LeaderboardRows:setSpacing( 0 )
	LeaderboardRows:setDataSource( "LeaderboardRows" )
	LeaderboardRows:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		LeaderboardEnablePCacheBuffer( self, element, controller )
		return f5_local0
	end )
	LeaderboardRows:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f6_local0 = nil
		LeaderboardDisablePCacheBuffer( self, element, controller )
		return f6_local0
	end )
	LeaderboardRows:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_UP )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_DOWN )
		return f7_local0
	end )
	LeaderboardRows:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_LTRIG, "PGUP", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( f9_arg3 ) then
			Leaderboard_PageUp( self, f9_arg0, f9_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "MENU_LB_PAGE_UP" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_RTRIG, "PGDN", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( f11_arg3 ) then
			Leaderboard_PageDown( self, f11_arg0, f11_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsSelfInState( self, "DefaultState" ) and not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_RTRIG, "MENU_LB_PAGE_DOWN" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "T", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_GoToTopOfList( self, f13_arg0, f13_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_LB_TOP_OF_LIST" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_OpenPlayerDetails( self, f15_arg0, f15_arg2 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_MoveUp( self, f17_arg0, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( LeaderboardRows, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsSelfInState( self, "DefaultState" ) then
			Leaderboard_MoveDown( self, f19_arg0, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if IsSelfInState( self, "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
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
		},
		{
			stateName = "DOA",
			condition = function ( menu, element, event )
				return IsDOALeaderboard( controller )
			end
		},
		{
			stateName = "Rankless",
			condition = function ( menu, element, event )
				return IsCustomLeaderboard( controller )
			end
		}
	} )
	self:addElement( LeaderboardRows )
	self.LeaderboardRows = LeaderboardRows
	
	local LeaderboardHeader = CoD.LeaderboardHeader.new( menu, controller )
	LeaderboardHeader:setLeftRight( true, false, -1, 779 )
	LeaderboardHeader:setTopBottom( true, false, 9, 29 )
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
				local f26_local0 = IsCurrentLanguageArabic()
				if f26_local0 then
					if not IsFreerunLeaderboard( controller ) then
						f26_local0 = not IsDOALeaderboard( controller )
					else
						f26_local0 = false
					end
				end
				return f26_local0
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
		},
		{
			stateName = "Rankless",
			condition = function ( menu, element, event )
				return IsCustomLeaderboard( controller ) and not IsCurrentLanguageArabic()
			end
		},
		{
			stateName = "RanklessArabic",
			condition = function ( menu, element, event )
				return IsCustomLeaderboard( controller ) and IsCurrentLanguageArabic()
			end
		}
	} )
	self:addElement( LeaderboardHeader )
	self.LeaderboardHeader = LeaderboardHeader
	
	local LoadingText = LUI.UIText.new()
	LoadingText:setLeftRight( true, false, 326, 436 )
	LoadingText:setTopBottom( true, false, 181, 201 )
	LoadingText:setAlpha( 0 )
	LoadingText:setText( Engine.Localize( "MENU_LB_LOADING" ) )
	LoadingText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingText )
	self.LoadingText = LoadingText
	
	local LeaderboardEmptyText = LUI.UIText.new()
	LeaderboardEmptyText:setLeftRight( true, false, 172.5, 613.5 )
	LeaderboardEmptyText:setTopBottom( true, false, 225, 245 )
	LeaderboardEmptyText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	LeaderboardEmptyText:setText( Engine.Localize( "GROUPS_LEADERBOARD_EMPTY" ) )
	LeaderboardEmptyText:setTTF( "fonts/escom.ttf" )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LeaderboardEmptyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LeaderboardEmptyText )
	self.LeaderboardEmptyText = LeaderboardEmptyText
	
	local VerticalCounter = CoD.Leaderboard_VerticalCounter.new( menu, controller )
	VerticalCounter:setLeftRight( true, false, 289.5, 489.5 )
	VerticalCounter:setTopBottom( true, false, 475.5, 500.5 )
	VerticalCounter:setAlpha( 0 )
	VerticalCounter:subscribeToGlobalModel( controller, "Leaderboard", "totalResults", function ( model )
		local totalResults = Engine.GetModelValue( model )
		if totalResults then
			VerticalCounter.count:setText( Engine.Localize( totalResults ) )
		end
	end )
	self:addElement( VerticalCounter )
	self.VerticalCounter = VerticalCounter
	
	VerticalCounter:linkToElementModel( LeaderboardRows, "counterPosition", true, function ( model )
		local counterPosition = Engine.GetModelValue( model )
		if counterPosition then
			VerticalCounter.currentItem:setText( Engine.Localize( counterPosition ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setAlpha( 0 )
				self.clipFinished( FileshareNoContentGraphic, {} )

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

				VerticalCounter:completeAnimation()
				self.VerticalCounter:setAlpha( 1 )
				self.clipFinished( VerticalCounter, {} )
			end
		},
		UpdatingLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setAlpha( 0 )
				self.clipFinished( FileshareNoContentGraphic, {} )

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

				VerticalCounter:completeAnimation()
				self.VerticalCounter:setAlpha( 0 )
				self.clipFinished( VerticalCounter, {} )
			end
		},
		EmptyLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				FileshareNoContentGraphic:completeAnimation()
				self.FileshareNoContentGraphic:setLeftRight( true, true, 1, 5 )
				self.FileshareNoContentGraphic:setTopBottom( true, true, 39.87, -24 )
				self.FileshareNoContentGraphic:setAlpha( 1 )
				self.clipFinished( FileshareNoContentGraphic, {} )

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
				self.LeaderboardEmptyText:setLeftRight( true, false, 172.5, 613.5 )
				self.LeaderboardEmptyText:setTopBottom( true, false, 225, 245 )
				self.LeaderboardEmptyText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.LeaderboardEmptyText:setAlpha( 1 )
				self.clipFinished( LeaderboardEmptyText, {} )

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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.LeaderboardRows:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareNoContentGraphic:close()
		element.LeaderboardRows:close()
		element.LeaderboardHeader:close()
		element.VerticalCounter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

