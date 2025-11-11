require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_MasterCallingCardWidget" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "update_tier_list", function ( self, event )
		self.CallingCardProfiler.TierList:updateDataSource()
	end )
end

CoD.Challenges_MP_Stickerbook = InheritFrom( LUI.UIElement )
CoD.Challenges_MP_Stickerbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MP_Stickerbook )
	self.id = "Challenges_MP_Stickerbook"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCallingCardWidget = CoD.Challenges_MasterCallingCardWidget.new( menu, controller )
	MasterCallingCardWidget:setLeftRight( 0, 0, 12, 1137 )
	MasterCallingCardWidget:setTopBottom( 1, 1, -181.5, -34.5 )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "MasterCallingCard", nil, function ( model )
		MasterCallingCardWidget:setModel( model, controller )
	end )
	MasterCallingCardWidget:subscribeToGlobalModel( controller, "MasterCallingCard", nil, function ( model )
		MasterCallingCardWidget.MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardWidget )
	self.MasterCallingCardWidget = MasterCallingCardWidget
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 20, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( 0, 0, 14.5, 1134.5 )
	CallingCardGrid:setTopBottom( 0, 0, 23, 587 )
	CallingCardGrid:setWidgetType( CoD.Challenges_CallingCardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 20 )
	CallingCardGrid:setDataSource( "CallingCards" )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler.new( menu, controller )
	CallingCardProfiler:setLeftRight( 1, 1, -568.5, -43.5 )
	CallingCardProfiler:setTopBottom( 0, 1, 20, -36 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	MasterCallingCardWidget.navigation = {
		up = CallingCardGrid
	}
	CallingCardGrid.navigation = {
		down = MasterCallingCardWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	MasterCallingCardWidget.id = "MasterCallingCardWidget"
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MasterCallingCardWidget:close()
		self.CallingCardGrid:close()
		self.CallingCardProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

