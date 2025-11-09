CoD.LobbySlideEmblemInternalWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideEmblemInternalWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideEmblemInternalWidget )
	self.id = "LobbySlideEmblemInternalWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 216 )
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 10, 330 )
	emblem:setTopBottom( true, false, 10, 206 )
	self:addElement( emblem )
	self.emblem = emblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SlideLeft = function ()
				self:setupElementClipCounter( 0 )
			end,
			SlideRight = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
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

