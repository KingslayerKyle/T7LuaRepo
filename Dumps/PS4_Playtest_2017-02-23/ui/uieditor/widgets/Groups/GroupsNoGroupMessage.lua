CoD.GroupsNoGroupMessage = InheritFrom( LUI.UIElement )
CoD.GroupsNoGroupMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GroupsNoGroupMessage )
	self.id = "GroupsNoGroupMessage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 438 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local ListLabel = LUI.UIText.new()
	ListLabel:setLeftRight( 0, 0, 0, 438 )
	ListLabel:setTopBottom( 0, 0, 0, 30 )
	ListLabel:setText( Engine.Localize( "GROUPS_NOT_IN_GROUPS" ) )
	ListLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ListLabel )
	self.ListLabel = ListLabel
	
	self.resetProperties = function ()
		ListLabel:completeAnimation()
		ListLabel:setText( Engine.Localize( "GROUPS_NOT_IN_GROUPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ListLabel:completeAnimation()
				self.ListLabel:setText( Engine.Localize( "GROUPS_MY_GROUPS" ) )
				self.clipFinished( ListLabel, {} )
			end
		},
		NoGroups = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

