require( "ui.uieditor.widgets.Challenges.Challenges_MasterCallingCardWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_ArenaVet" )

CoD.Challenges_MP_Stickerbook_ArenaVet = InheritFrom( LUI.UIElement )
CoD.Challenges_MP_Stickerbook_ArenaVet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MP_Stickerbook_ArenaVet )
	self.id = "Challenges_MP_Stickerbook_ArenaVet"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCallingCardWidget = CoD.Challenges_MasterCallingCardWidget.new( menu, controller )
	MasterCallingCardWidget:setLeftRight( true, false, 8, 758 )
	MasterCallingCardWidget:setTopBottom( false, true, -121, -23 )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "MasterCallingCard", nil, function ( model )
		MasterCallingCardWidget:setModel( model, controller )
	end )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "MasterCallingCard", nil, function ( model )
		MasterCallingCardWidget.MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardWidget )
	self.MasterCallingCardWidget = MasterCallingCardWidget
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 13, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 756 )
	CallingCardGrid:setTopBottom( true, false, 16, 391 )
	CallingCardGrid:setWidgetType( CoD.Challenges_CallingCardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 13 )
	CallingCardGrid:setDataSource( "ArenaVetCallingCards" )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_ArenaVet.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardProfiler:setTopBottom( true, true, 14, -24 )
	CallingCardProfiler.ArenaVetDescription:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ARENAVET_HINT" ) )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MasterCallingCardWidget:close()
		element.CallingCardGrid:close()
		element.CallingCardProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

