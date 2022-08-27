-- 01a231b878793b2026dad1fe1d1d5546
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_NearCompletion" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletionWidget_Long" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "update_tier_list", function ( element, event )
		element.CallingCardProfiler.TierList:updateDataSource()
	end )
end

CoD.Challenges_FrameWidget_NearCompletion = InheritFrom( LUI.UIElement )
CoD.Challenges_FrameWidget_NearCompletion.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_FrameWidget_NearCompletion )
	self.id = "Challenges_FrameWidget_NearCompletion"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_NearCompletion.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -371, -13 )
	CallingCardProfiler:setTopBottom( true, true, 29, -25 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	local NearCompletionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	NearCompletionList:makeFocusable()
	NearCompletionList:setLeftRight( true, false, 50, 650 )
	NearCompletionList:setTopBottom( false, false, -230, 230 )
	NearCompletionList:setDataSource( "ChallengesNearCompletionList" )
	NearCompletionList:setWidgetType( CoD.Challenges_NearCompletionWidget_Long )
	NearCompletionList:setVerticalCount( 6 )
	NearCompletionList:setVerticalCounter( CoD.verticalCounter )
	self:addElement( NearCompletionList )
	self.NearCompletionList = NearCompletionList
	
	CallingCardProfiler:linkToElementModel( NearCompletionList, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "iconId", true, function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			CallingCardProfiler.SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "maxTier", true, function ( model )
		local maxTier = Engine.GetModelValue( model )
		if maxTier then
			CallingCardProfiler.TierText:setText( Engine.Localize( PrependLocalizeString( "CHALLENGE_TIER", LocalizeString( PrependString( "CHALLENGE_TIER_", maxTier ) ) ) ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			CallingCardProfiler.CardDescription:setText( Engine.Localize( description ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "statPercent", true, function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			CallingCardProfiler.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "statFractionText", true, function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			CallingCardProfiler.ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "tierStatus", true, function ( model )
		local tierStatus = Engine.GetModelValue( model )
		if tierStatus then
			CallingCardProfiler.TierStatus:setText( Engine.Localize( tierStatus ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "xp", true, function ( model )
		local xp = Engine.GetModelValue( model )
		if xp then
			CallingCardProfiler.XPText:setText( Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", xp ) ) )
		end
	end )
	CallingCardProfiler.navigation = {
		left = NearCompletionList
	}
	NearCompletionList.navigation = {
		right = CallingCardProfiler
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	CallingCardProfiler.id = "CallingCardProfiler"
	NearCompletionList.id = "NearCompletionList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardProfiler:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardProfiler:close()
		element.NearCompletionList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

