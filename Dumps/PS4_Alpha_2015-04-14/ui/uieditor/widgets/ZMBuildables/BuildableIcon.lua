require( "ui.uieditor.widgets.ZMBuildables.BuildableIconBg" )
require( "ui.uieditor.widgets.ZMBuildables.BuildableBorder" )

CoD.BuildableIcon = InheritFrom( LUI.UIElement )
CoD.BuildableIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BuildableIcon )
	self.id = "BuildableIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local IconBg = CoD.BuildableIconBg.new( menu, controller )
	IconBg:setLeftRight( true, true, 0, 0 )
	IconBg:setTopBottom( true, true, 0, 0 )
	IconBg:setRGB( 1, 1, 1 )
	self:addElement( IconBg )
	self.IconBg = IconBg
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, true, 0, 0 )
	iconImage:setTopBottom( true, true, 0, 0 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setAlpha( 0.25 )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	iconImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			iconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local crossoutImage = LUI.UIImage.new()
	crossoutImage:setLeftRight( true, true, 2, -2 )
	crossoutImage:setTopBottom( true, true, 2, -2 )
	crossoutImage:setRGB( 0, 1, 0 )
	crossoutImage:setAlpha( 0 )
	crossoutImage:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	crossoutImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( crossoutImage )
	self.crossoutImage = crossoutImage
	
	local playerIDText = LUI.UITightText.new()
	playerIDText:setLeftRight( false, true, -1, -1 )
	playerIDText:setTopBottom( true, false, 34, 50 )
	playerIDText:setRGB( 1, 1, 1 )
	playerIDText:setText( Engine.Localize( "" ) )
	playerIDText:setTTF( "fonts/default.ttf" )
	self:addElement( playerIDText )
	self.playerIDText = playerIDText
	
	local border = CoD.BuildableBorder.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ItemPickUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0.6 )
				self.clipFinished( iconImage, {} )
				crossoutImage:completeAnimation()
				self.crossoutImage:setAlpha( 0 )
				self.clipFinished( crossoutImage, {} )
			end
		},
		ItemUsed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0.25 )
				self.clipFinished( iconImage, {} )
				crossoutImage:completeAnimation()
				self.crossoutImage:setAlpha( 0.5 )
				self.clipFinished( crossoutImage, {} )
			end
		},
		ItemDrop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0.25 )
				self.clipFinished( iconImage, {} )
				crossoutImage:completeAnimation()
				self.crossoutImage:setAlpha( 0 )
				self.clipFinished( crossoutImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.IconBg:close()
		self.border:close()
		self.iconImage:close()
		CoD.BuildableIcon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

