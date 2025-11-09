require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_SemiCircle" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Separator" )

CoD.AmmoWidget_ClipElements = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipElements )
	self.id = "AmmoWidget_ClipElements"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local BackLine1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	BackLine1:setLeftRight( true, false, 55, 157.33 )
	BackLine1:setTopBottom( true, false, 51.5, 54.5 )
	BackLine1:setRGB( 1, 1, 1 )
	BackLine1:setZoom( -1 )
	self:addElement( BackLine1 )
	self.BackLine1 = BackLine1
	
	local BackLine2 = CoD.AmmoWidget_BackLine.new( menu, controller )
	BackLine2:setLeftRight( true, false, 55, 70 )
	BackLine2:setTopBottom( true, false, 2.5, 5.5 )
	BackLine2:setRGB( 1, 1, 1 )
	BackLine2:setZoom( -1 )
	self:addElement( BackLine2 )
	self.BackLine2 = BackLine2
	
	local ImgSemiCircle = CoD.AmmoWidget_SemiCircle.new( menu, controller )
	ImgSemiCircle:setLeftRight( false, true, -110, -100.67 )
	ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
	ImgSemiCircle:setRGB( 1, 1, 1 )
	ImgSemiCircle:setZoom( 1 )
	ImgSemiCircle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgSemiCircle:setShaderVector( 0, 0.05, 1, 0, 0 )
	ImgSemiCircle:setShaderVector( 1, 2, 0, 0, 0 )
	ImgSemiCircle:setShaderVector( 2, 0.2, -0.2, 0, 0 )
	ImgSemiCircle:setShaderVector( 3, 0, 0, 0, 0 )
	ImgSemiCircle:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ImgSemiCircle )
	self.ImgSemiCircle = ImgSemiCircle
	
	local ImgSeperator = CoD.AmmoWidget_Separator.new( menu, controller )
	ImgSeperator:setLeftRight( false, true, -56.84, -53.51 )
	ImgSeperator:setTopBottom( true, false, 198.67, 233.34 )
	ImgSeperator:setRGB( 1, 1, 1 )
	ImgSeperator:setZRot( 90 )
	ImgSeperator:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgSeperator:setShaderVector( 0, 0.1, 1, 0, 0 )
	ImgSeperator:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgSeperator:setShaderVector( 2, 0, 0, 0, 0 )
	ImgSeperator:setShaderVector( 3, 0, 0, 0, 0 )
	ImgSeperator:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ImgSeperator )
	self.ImgSeperator = ImgSeperator
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 23.67, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 23.67, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -141, -131.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.ImgSemiCircle:setRGB( 1, 1, 1 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.83, -68.5 )
				self.ImgSeperator:setTopBottom( true, false, 13.66, 48.33 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 55, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 55, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -110, -100.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -56.83, -53.51 )
				self.ImgSeperator:setTopBottom( true, false, 198.66, 233.34 )
				self.ImgSeperator:setZRot( 90 )
				self.clipFinished( ImgSeperator, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 23.67, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 23.67, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -141, -131.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.ImgSemiCircle:setRGB( 1, 1, 1 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.83, -68.5 )
				self.ImgSeperator:setTopBottom( true, false, 13.66, 48.33 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 55, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 55, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -110, -100.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -56.83, -53.51 )
				self.ImgSeperator:setTopBottom( true, false, 198.66, 233.34 )
				self.ImgSeperator:setZRot( 90 )
				self.clipFinished( ImgSeperator, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 12, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 12, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -155, -145.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.83, -68.5 )
				self.ImgSeperator:setTopBottom( true, false, 13.66, 48.33 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				return not WeaponUsesAmmo( controller )
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
		} )
	end )
	self.close = function ( self )
		self.BackLine1:close()
		self.BackLine2:close()
		self.ImgSemiCircle:close()
		self.ImgSeperator:close()
		CoD.AmmoWidget_ClipElements.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

