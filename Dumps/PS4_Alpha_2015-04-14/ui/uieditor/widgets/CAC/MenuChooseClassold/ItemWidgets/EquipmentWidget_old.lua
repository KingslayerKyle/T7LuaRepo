CoD.EquipmentWidget_old = InheritFrom( LUI.UIElement )
CoD.EquipmentWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquipmentWidget_old )
	self.id = "EquipmentWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	
	local mainItem = LUI.UIImage.new()
	mainItem:setLeftRight( true, true, 0, 0 )
	mainItem:setTopBottom( true, true, 0, 0 )
	mainItem:setRGB( 1, 1, 1 )
	mainItem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( mainItem )
	self.mainItem = mainItem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				mainItem:completeAnimation()
				self.mainItem:setAlpha( 1 )
				self.clipFinished( mainItem, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

