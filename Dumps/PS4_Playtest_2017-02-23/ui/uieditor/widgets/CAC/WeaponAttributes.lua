require( "ui.uieditor.widgets.CAC.WeaponAttributes_Internal" )

CoD.WeaponAttributes = InheritFrom( LUI.UIElement )
CoD.WeaponAttributes.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponAttributes )
	self.id = "WeaponAttributes"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 504 )
	self:setTopBottom( 0, 0, 0, 111 )
	self.anyChildUsesUpdateState = true
	
	local weaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	weaponAttributesInternal:setLeftRight( 0, 0, 0, 400 )
	weaponAttributesInternal:setTopBottom( 0, 0, 0, 111 )
	self:addElement( weaponAttributesInternal )
	self.weaponAttributesInternal = weaponAttributesInternal
	
	self.resetProperties = function ()
		weaponAttributesInternal:completeAnimation()
		weaponAttributesInternal:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				weaponAttributesInternal:completeAnimation()
				self.weaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( weaponAttributesInternal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponAttributesInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

