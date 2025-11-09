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
	self:setLeftRight( true, false, 0, 357 )
	self:setTopBottom( true, false, 0, 100 )
	
	local ListLabel = LUI.UIText.new()
	ListLabel:setLeftRight( true, false, 0, 357 )
	ListLabel:setTopBottom( true, false, 0, 25 )
	ListLabel:setText( Engine.Localize( "GROUPS_NOT_IN_GROUPS" ) )
	ListLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ListLabel )
	self.ListLabel = ListLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ListLabel:completeAnimation()
				self.ListLabel:setLeftRight( true, false, 0, 357 )
				self.ListLabel:setTopBottom( true, false, 0, 16 )
				self.ListLabel:setText( Engine.Localize( "GROUPS_MY_GROUPS" ) )
				self.clipFinished( ListLabel, {} )
			end
		},
		NoGroups = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ListLabel:completeAnimation()
				self.ListLabel:setLeftRight( true, false, 0, 357 )
				self.ListLabel:setTopBottom( true, false, 0, 25 )
				self.ListLabel:setText( Engine.Localize( "GROUPS_NOT_IN_GROUPS" ) )
				self.clipFinished( ListLabel, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

