-- abc1b6fd4c8b28fde39a7f324a950220
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 156 )
	self:setTopBottom( true, false, 0, 28 )
	
	local groupsUsedValue = LUI.UIText.new()
	groupsUsedValue:setLeftRight( false, true, -156, 0 )
	groupsUsedValue:setTopBottom( true, false, 4.5, 23.5 )
	groupsUsedValue:setText( Engine.Localize( "MENU_NEW" ) )
	groupsUsedValue:setTTF( "fonts/escom.ttf" )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	groupsUsedValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( groupsUsedValue )
	self.groupsUsedValue = groupsUsedValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				groupsUsedValue:completeAnimation()
				self.groupsUsedValue:setRGB( 1, 1, 1 )
				self.groupsUsedValue:setAlpha( 1 )
				self.clipFinished( groupsUsedValue, {} )
			end
		},
		GroupsFull = {
			DefaultClip = function ()
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
