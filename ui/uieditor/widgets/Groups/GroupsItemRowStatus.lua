-- 1b3ffcc76fa5e8e76899f2c4b9035c29
-- This hash is used for caching, delete to decompile the file again

CoD.GroupsItemRowStatus = InheritFrom( LUI.UIElement )
CoD.GroupsItemRowStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsItemRowStatus )
	self.id = "GroupsItemRowStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 18 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local MemberStatus = LUI.UIText.new()
	MemberStatus:setLeftRight( false, true, -200, 0 )
	MemberStatus:setTopBottom( true, false, 0, 18 )
	MemberStatus:setRGB( 0.28, 0.59, 0.99 )
	MemberStatus:setText( Engine.Localize( "GROUPS_ADMIN" ) )
	MemberStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MemberStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	MemberStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MemberStatus )
	self.MemberStatus = MemberStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				MemberStatus:completeAnimation()
				self.MemberStatus:setAlpha( 0 )
				self.clipFinished( MemberStatus, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Admin = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				MemberStatus:completeAnimation()
				self.MemberStatus:setAlpha( 1 )
				self.clipFinished( MemberStatus, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Owner = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				MemberStatus:completeAnimation()
				self.MemberStatus:setAlpha( 1 )
				self.MemberStatus:setText( Engine.Localize( "GROUPS_OWNER" ) )
				self.clipFinished( MemberStatus, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

