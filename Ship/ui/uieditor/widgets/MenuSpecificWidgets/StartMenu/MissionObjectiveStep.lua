-- c458a7e4d808b6d2deaf7c943f1d40a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveStepInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getHeightInList = function ( f2_arg0 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
		local f2_local4 = f2_arg0.internal:getHeightInList()
		f2_arg0:setTopBottom( true, false, f2_local1, f2_local1 + f2_local4 )
		return f2_local4
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
