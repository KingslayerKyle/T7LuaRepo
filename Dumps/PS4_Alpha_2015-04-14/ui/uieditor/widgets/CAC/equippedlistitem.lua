require( "ui.uieditor.widgets.Border" )

CoD.EquippedListItem = InheritFrom( LUI.UIElement )
CoD.EquippedListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquippedListItem )
	self.id = "EquippedListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 80 )
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( false, false, -25, 25 )
	iconImage:setTopBottom( false, false, -25, 25 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setAlpha( 0 )
	iconImage:setImage( RegisterImage( "uie_cac_mods_rapid_fire" ) )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local plus = LUI.UIImage.new()
	plus:setLeftRight( false, false, -16, 16 )
	plus:setTopBottom( false, false, -16, 16 )
	plus:setRGB( 0.51, 0.53, 0.59 )
	plus:setAlpha( 0.3 )
	plus:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	plus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( plus )
	self.plus = plus
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.35, 0.35, 0.35 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local equippedBox = LUI.UIImage.new()
	equippedBox:setLeftRight( true, true, 0, 0 )
	equippedBox:setTopBottom( true, true, 0, 0 )
	equippedBox:setRGB( 1, 1, 1 )
	equippedBox:setAlpha( 0.3 )
	equippedBox:setImage( RegisterImage( "uie_t7_menu_mp_cac_equippedbox" ) )
	equippedBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( equippedBox )
	self.equippedBox = equippedBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				equippedBox:completeAnimation()
				self.equippedBox:setLeftRight( true, true, 0, 0 )
				self.equippedBox:setTopBottom( true, true, 0, 0 )
				self.equippedBox:setAlpha( 0.3 )
				self.clipFinished( equippedBox, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0.3 )
				self.clipFinished( plus, {} )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				equippedBox:completeAnimation()
				self.equippedBox:setAlpha( 0.3 )
				self.clipFinished( equippedBox, {} )
			end
		}
	}
	self.close = function ( self )
		self.border:close()
		CoD.EquippedListItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

