require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_NearCompletion" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletionWidget_Long" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "update_tier_list", function ( self, event )
		self.CallingCardProfiler.TierList:updateDataSource()
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
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_NearCompletion.new( menu, controller )
	CallingCardProfiler:setLeftRight( 1, 1, -557, -20 )
	CallingCardProfiler:setTopBottom( 0, 1, 43, -37 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	local NearCompletionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	NearCompletionList:makeFocusable()
	NearCompletionList:setLeftRight( 0, 0, 75, 975 )
	NearCompletionList:setTopBottom( 0.5, 0.5, -341, 341 )
	NearCompletionList:setWidgetType( CoD.Challenges_NearCompletionWidget_Long )
	NearCompletionList:setVerticalCount( 6 )
	NearCompletionList:setVerticalCounter( CoD.verticalCounter )
	NearCompletionList:setDataSource( "ChallengesNearCompletionList" )
	self:addElement( NearCompletionList )
	self.NearCompletionList = NearCompletionList
	
	CallingCardProfiler:linkToElementModel( NearCompletionList, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "maxTier", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.TierText:setText( Engine.Localize( PrependLocalizeString( "CHALLENGE_TIER", LocalizeString( PrependString( "CHALLENGE_TIER_", modelValue ) ) ) ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.CardDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "statPercent", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "statFractionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "tierStatus", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.TierStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	CallingCardProfiler:linkToElementModel( NearCompletionList, "xp", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardProfiler.XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", modelValue ) )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardProfiler:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardProfiler:close()
		self.NearCompletionList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

