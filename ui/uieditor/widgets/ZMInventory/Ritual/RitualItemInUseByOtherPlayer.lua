-- 132f126e5fbd0afac076ec869ee479b2
-- This hash is used for caching, delete to decompile the file again

CoD.RitualItemInUseByOtherPlayer = InheritFrom( LUI.UIElement )
CoD.RitualItemInUseByOtherPlayer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RitualItemInUseByOtherPlayer )
	self.id = "RitualItemInUseByOtherPlayer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 63 )
	self:setTopBottom( true, false, 0, 61 )
	
	local InUseByOtherPlayerImage = LUI.UIImage.new()
	InUseByOtherPlayerImage:setLeftRight( true, false, 0, 63 )
	InUseByOtherPlayerImage:setTopBottom( true, false, 0, 61 )
	self:addElement( InUseByOtherPlayerImage )
	self.InUseByOtherPlayerImage = InUseByOtherPlayerImage
	
	local PlayerImage = LUI.UIImage.new()
	PlayerImage:setLeftRight( true, false, 27.5, 63 )
	PlayerImage:setTopBottom( true, false, 25.5, 61 )
	self:addElement( PlayerImage )
	self.PlayerImage = PlayerImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Found = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "Found"
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Worm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

