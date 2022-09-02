-- 3a72ca06ac602daeab8104268b3cf62b
-- This hash is used for caching, delete to decompile the file again

CoD.AtviCopy = InheritFrom( LUI.UIElement )
CoD.AtviCopy.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.AtviCopy )
	self.id = "AtviCopy"
	self.soundSet = "FrontendMain"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ActivisionIncDurango = LUI.UIImage.new()
	ActivisionIncDurango:setLeftRight( false, true, -175, 9 )
	ActivisionIncDurango:setTopBottom( true, false, 30, 58 )
	ActivisionIncDurango:setRGB( 0.68, 0.68, 0.68 )
	ActivisionIncDurango:setAlpha( 0.9 )
	ActivisionIncDurango:setImage( RegisterImage( "uie_t7_activisionpublishinginc" ) )
	self:addElement( ActivisionIncDurango )
	self.ActivisionIncDurango = ActivisionIncDurango
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "DefaultClip"
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "Focus"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

