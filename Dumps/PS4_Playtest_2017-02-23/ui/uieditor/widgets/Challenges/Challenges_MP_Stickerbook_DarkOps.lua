require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_DarkOps" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.Challenges_MP_Stickerbook_DarkOps = InheritFrom( LUI.UIElement )
CoD.Challenges_MP_Stickerbook_DarkOps.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MP_Stickerbook_DarkOps )
	self.id = "Challenges_MP_Stickerbook_DarkOps"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 20, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Classified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "isLocked", true, function ( model )
		menu:updateElementState( CallingCardGrid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	CallingCardGrid:setLeftRight( 0, 0, 14.5, 1134.5 )
	CallingCardGrid:setTopBottom( 0, 0, 23, 733 )
	CallingCardGrid:setWidgetType( CoD.Challenges_CallingCardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 5 )
	CallingCardGrid:setSpacing( 20 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "DarkOpsCallingCards" )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_DarkOps.new( menu, controller )
	CallingCardProfiler:setLeftRight( 1, 1, -568.5, -43.5 )
	CallingCardProfiler:setTopBottom( 0, 1, 21, -45 )
	CallingCardProfiler.DarkOpsDescription:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS_HINT" ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardGrid:close()
		self.CallingCardProfiler:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

