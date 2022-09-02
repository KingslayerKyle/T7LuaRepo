-- 0e3ebdf8747fa8fb34eb05ce59b1ca2a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveItemInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getHeightInList = function ( f2_arg0, f2_arg1 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
		local f2_local4 = f2_arg0.internal:getHeightInList( f2_arg1 )
		f2_arg0:setTopBottom( true, false, f2_local1, f2_local1 + f2_local4 )
		return f2_local4
	end
	
end

CoD.MissionObjectiveItem = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveItem )
	self.id = "MissionObjectiveItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 115 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.MissionObjectiveItemInternal.new( menu, controller )
	internal:setLeftRight( true, false, 0, 250 )
	internal:setTopBottom( true, false, 0, 115 )
	internal:mergeStateConditions( {
		{
			stateName = "Done",
			condition = function ( menu, element, event )
				return IsObjectiveComplete( element, controller )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsObjectiveActive( element, controller )
			end
		}
	} )
	self:addElement( internal )
	self.internal = internal
	
	self.internal:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			internal.objectiveName:setText( Engine.Localize( displayText ) )
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

