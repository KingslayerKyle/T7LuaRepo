-- 9c1091a09887ff231c3b5e91bef91f9e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardWidget" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Challenges.Challenges_CallingCardProfiler_DarkOps" )

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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 13, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 10, 756 )
	CallingCardGrid:setTopBottom( true, false, 16, 488 )
	CallingCardGrid:setDataSource( "DarkOpsCallingCards" )
	CallingCardGrid:setWidgetType( CoD.Challenges_CallingCardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 5 )
	CallingCardGrid:setSpacing( 13 )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
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
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local CallingCardProfiler = CoD.Challenges_CallingCardProfiler_DarkOps.new( menu, controller )
	CallingCardProfiler:setLeftRight( false, true, -379, -29 )
	CallingCardProfiler:setTopBottom( true, true, 14, -30 )
	self:addElement( CallingCardProfiler )
	self.CallingCardProfiler = CallingCardProfiler
	
	CallingCardProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardGrid:close()
		element.CallingCardProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

