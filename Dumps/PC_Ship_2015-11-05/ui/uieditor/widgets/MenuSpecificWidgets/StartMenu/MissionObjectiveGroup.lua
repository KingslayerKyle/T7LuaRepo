require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveGroupInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getHeightInList = function ( f2_arg0 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
		local f2_local4 = f2_arg0.internal:getHeightInList()
		f2_arg0:setTopBottom( true, false, f2_local1, f2_local1 + f2_local4 )
		return f2_local4
	end
	
end

CoD.MissionObjectiveGroup = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveGroup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveGroup )
	self.id = "MissionObjectiveGroup"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 270 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.MissionObjectiveGroupInternal.new( menu, controller )
	internal:setLeftRight( true, false, 0, 260 )
	internal:setTopBottom( true, false, 0, 270 )
	internal:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsObjectiveActive( element, controller )
			end
		},
		{
			stateName = "Done",
			condition = function ( menu, element, event )
				return IsObjectiveComplete( element, controller )
			end
		}
	} )
	self:addElement( internal )
	self.internal = internal
	
	self.internal:linkToElementModel( self, "category", true, function ( model )
		local category = Engine.GetModelValue( model )
		if category then
			internal.groupHeaderText:setText( Engine.Localize( category ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

