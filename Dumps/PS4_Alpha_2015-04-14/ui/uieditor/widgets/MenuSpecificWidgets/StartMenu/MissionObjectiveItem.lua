require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveItemInternal" )

local PostLoadFunc = function ( self, controller )
	self.getHeightInList = function ( self, controller )
		local self_left, self_top, self_right, self_bottom = self:getLocalRect()
		local childHeight = self.internal:getHeightInList( controller )
		self:setTopBottom( true, false, self_top, self_top + childHeight )
		return childHeight
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
	internal:setRGB( 1, 1, 1 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			internal.objectiveName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.MissionObjectiveItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

