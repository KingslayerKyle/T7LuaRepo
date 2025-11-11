CoD.GroupFractionLabel = InheritFrom( LUI.UIElement )
CoD.GroupFractionLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupFractionLabel )
	self.id = "GroupFractionLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 234 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local groupsUsedValue = LUI.UIText.new()
	groupsUsedValue:setLeftRight( 1, 1, -234, 0 )
	groupsUsedValue:setTopBottom( 0, 0, 7, 35 )
	groupsUsedValue:setText( Engine.Localize( "MENU_NEW" ) )
	groupsUsedValue:setTTF( "fonts/escom.ttf" )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( groupsUsedValue )
	self.groupsUsedValue = groupsUsedValue
	
	self.resetProperties = function ()
		groupsUsedValue:completeAnimation()
		groupsUsedValue:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		GroupsFull = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setRGB( 1, 0, 0 )
				self.clipFinished( groupsUsedValue, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

