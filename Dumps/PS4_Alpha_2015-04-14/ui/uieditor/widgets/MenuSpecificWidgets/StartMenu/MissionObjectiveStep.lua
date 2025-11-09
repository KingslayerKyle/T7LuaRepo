require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveStepInternal" )

local PostLoadFunc = function ( self, controller )
	self.getHeightInList = function ( self )
		local self_left, self_top, self_right, self_bottom = self:getLocalRect()
		local childHeight = self.internal:getHeightInList()
		self:setTopBottom( true, false, self_top, self_top + childHeight )
		return childHeight
	end
	
end

CoD.MissionObjectiveStep = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveStep.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveStep )
	self.id = "MissionObjectiveStep"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 245 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.MissionObjectiveStepInternal.new( menu, controller )
	internal:setLeftRight( true, false, 2, 245 )
	internal:setTopBottom( true, false, 2, 27 )
	internal:setRGB( 1, 1, 1 )
	internal.stepText:setText( Engine.Localize( "MENU_NEW" ) )
	internal:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsObjectiveComplete( element, controller )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsObjectiveActive( element, controller )
			end
		},
		{
			stateName = "Failed",
			condition = function ( menu, element, event )
				return IsObjectiveFailed( element, controller )
			end
		},
		{
			stateName = "Description",
			condition = function ( menu, element, event )
				return IsObjectiveDescription( element, controller )
			end
		}
	} )
	self:addElement( internal )
	self.internal = internal
	
	self.close = function ( self )
		self.internal:close()
		CoD.MissionObjectiveStep.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

