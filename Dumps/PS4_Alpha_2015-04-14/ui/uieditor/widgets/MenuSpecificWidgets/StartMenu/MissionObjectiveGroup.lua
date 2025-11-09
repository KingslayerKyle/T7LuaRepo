require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveGroupInternal" )

local PostLoadFunc = function ( self, controller )
	self.getHeightInList = function ( self )
		local self_left, self_top, self_right, self_bottom = self:getLocalRect()
		local childHeight = self.internal:getHeightInList()
		self:setTopBottom( true, false, self_top, self_top + childHeight )
		return childHeight
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
	internal:setRGB( 1, 1, 1 )
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
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			internal.groupHeaderText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.MissionObjectiveGroup.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

