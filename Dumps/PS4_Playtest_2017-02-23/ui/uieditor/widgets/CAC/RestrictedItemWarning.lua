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
	self:setLeftRight( 0, 0, 0, 66 )
	self:setTopBottom( 0, 0, 0, 57 )
	
	local RestrictedWarning = LUI.UIImage.new()
	RestrictedWarning:setLeftRight( 0, 0, 0, 56 )
	RestrictedWarning:setTopBottom( 0, 0, 0, 45 )
	RestrictedWarning:setAlpha( 0 )
	RestrictedWarning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( RestrictedWarning )
	self.RestrictedWarning = RestrictedWarning
	
	self.resetProperties = function ()
		RestrictedWarning:completeAnimation()
		RestrictedWarning:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
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

