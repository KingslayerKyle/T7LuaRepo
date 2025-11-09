CoD.RestrictedItemWarning = InheritFrom( LUI.UIElement )
CoD.RestrictedItemWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RestrictedItemWarning )
	self.id = "RestrictedItemWarning"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 44 )
	self:setTopBottom( true, false, 0, 38 )
	
	local RestrictedWarning = LUI.UIImage.new()
	RestrictedWarning:setLeftRight( true, false, 0, 37.5 )
	RestrictedWarning:setTopBottom( true, false, 0, 30 )
	RestrictedWarning:setAlpha( 0 )
	RestrictedWarning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( RestrictedWarning )
	self.RestrictedWarning = RestrictedWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RestrictedWarning:completeAnimation()
				self.RestrictedWarning:setAlpha( 0 )
				self.clipFinished( RestrictedWarning, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RestrictedWarning:completeAnimation()
				self.RestrictedWarning:setAlpha( 1 )
				self.clipFinished( RestrictedWarning, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

