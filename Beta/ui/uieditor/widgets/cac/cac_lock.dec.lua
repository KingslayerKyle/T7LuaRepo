CoD.cac_lock = InheritFrom( LUI.UIElement )
CoD.cac_lock.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_lock )
	self.id = "cac_lock"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local lockedIcon0 = LUI.UIImage.new()
	lockedIcon0:setLeftRight( true, true, 0, 0 )
	lockedIcon0:setTopBottom( true, true, 0, 0 )
	lockedIcon0:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( true, true, 0, 0 )
	lockedIcon:setTopBottom( true, true, 0, 0 )
	lockedIcon:setAlpha( 0.47 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

