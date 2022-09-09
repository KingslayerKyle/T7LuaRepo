-- fc4a492ec6b1127cb7451e4cdde503c8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 292 )
	self:setTopBottom( true, false, 0, 100 )
	
	local ListLabel = LUI.UIText.new()
	ListLabel:setLeftRight( true, false, 0, 292 )
	ListLabel:setTopBottom( true, false, 0, 20 )
	ListLabel:setText( Engine.Localize( "GROUPS_NOT_IN_GROUPS" ) )
	ListLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ListLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ListLabel )
	self.ListLabel = ListLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ListLabel:completeAnimation()
				self.ListLabel:setText( Engine.Localize( "GROUPS_MY_GROUPS" ) )
				self.clipFinished( ListLabel, {} )
			end
		},
		NoGroups = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ListLabel:completeAnimation()
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
