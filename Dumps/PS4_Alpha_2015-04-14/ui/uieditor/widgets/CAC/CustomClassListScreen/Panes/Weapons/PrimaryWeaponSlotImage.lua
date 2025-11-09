CoD.PrimaryWeaponSlotImage = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponSlotImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponSlotImage )
	self.id = "PrimaryWeaponSlotImage"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 660 )
	self:setTopBottom( true, false, 0, 266 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -266, 266 )
	Icon:setTopBottom( false, false, -133, 133 )
	Icon:setRGB( 1, 1, 1 )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Extracam = LUI.UIImage.new()
	Extracam:setLeftRight( false, false, -330, 330 )
	Extracam:setTopBottom( false, false, -133, 133 )
	Extracam:setRGB( 1, 1, 1 )
	Extracam:setAlpha( 0 )
	Extracam:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_3" ) )
	Extracam:setShaderVector( 0, 0, 0.09, 1, 0.91 )
	Extracam:setShaderVector( 1, 0.02, 0.02, 0, 0 )
	self:addElement( Extracam )
	self.Extracam = Extracam
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Icon:completeAnimation()
				self.Icon:setLeftRight( false, false, -266, 266 )
				self.Icon:setTopBottom( false, false, -133, 133 )
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
				Extracam:completeAnimation()
				self.Extracam:setAlpha( 1 )
				self.clipFinished( Extracam, {} )
			end
		},
		Extracam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				Extracam:completeAnimation()
				self.Extracam:setAlpha( 1 )
				self.clipFinished( Extracam, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

