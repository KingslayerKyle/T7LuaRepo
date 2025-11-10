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
	self:setLeftRight( true, false, 0, 336 )
	self:setTopBottom( true, false, 0, 74 )
	self.anyChildUsesUpdateState = true
	
	local weaponAttributesInternal = CoD.WeaponAttributes_Internal.new( menu, controller )
	weaponAttributesInternal:setLeftRight( true, false, 0, 267 )
	weaponAttributesInternal:setTopBottom( true, false, 0, 74 )
	self:addElement( weaponAttributesInternal )
	self.weaponAttributesInternal = weaponAttributesInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				weaponAttributesInternal:completeAnimation()
				self.weaponAttributesInternal:setAlpha( 1 )
				self.clipFinished( weaponAttributesInternal, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				weaponAttributesInternal:completeAnimation()
				self.weaponAttributesInternal:setAlpha( 0 )
				self.clipFinished( weaponAttributesInternal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weaponAttributesInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

