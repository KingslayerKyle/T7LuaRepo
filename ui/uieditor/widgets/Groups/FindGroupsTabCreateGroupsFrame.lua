-- d21954f907817bbc9db7a863def07913
-- This hash is used for caching, delete to decompile the file again

CoD.FindGroupsTabCreateGroupsFrame = InheritFrom( LUI.UIElement )
CoD.FindGroupsTabCreateGroupsFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FindGroupsTabCreateGroupsFrame )
	self.id = "FindGroupsTabCreateGroupsFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 488 )

	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
