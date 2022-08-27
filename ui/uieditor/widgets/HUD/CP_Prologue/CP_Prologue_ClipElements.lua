-- 26f1fb94ba7b5b316913bcb6f168fc60
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_SemiCircle" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Separator" )

CoD.CP_Prologue_ClipElements = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_ClipElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_ClipElements )
	self.id = "CP_Prologue_ClipElements"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local BackLine1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	BackLine1:setLeftRight( true, false, 54, 156.33 )
	BackLine1:setTopBottom( true, false, 51.5, 54.5 )
	BackLine1:setZoom( -1 )
	self:addElement( BackLine1 )
	self.BackLine1 = BackLine1
	
	local BackLine2 = CoD.AmmoWidget_BackLine.new( menu, controller )
	BackLine2:setLeftRight( true, false, 54, 156.33 )
	BackLine2:setTopBottom( true, false, 3.5, 6.5 )
	BackLine2:setScale( -1 )
	self:addElement( BackLine2 )
	self.BackLine2 = BackLine2
	
	local ImgSemiCircle = CoD.AmmoWidget_SemiCircle.new( menu, controller )
	ImgSemiCircle:setLeftRight( false, true, -110, -100.67 )
	ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
	ImgSemiCircle:setZoom( 0.5 )
	ImgSemiCircle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgSemiCircle:setShaderVector( 0, 0.05, 1, 0, 0 )
	ImgSemiCircle:setShaderVector( 1, 2, 0, 0, 0 )
	ImgSemiCircle:setShaderVector( 2, 0.2, -0.2, 0, 0 )
	ImgSemiCircle:setShaderVector( 3, 0, 0, 0, 0 )
	ImgSemiCircle:setShaderVector( 4, 0, 0, 0, 0 )
	ImgSemiCircle.ImgSemiCircle0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_semiline" ) )
	self:addElement( ImgSemiCircle )
	self.ImgSemiCircle = ImgSemiCircle
	
	local ImgSeperator = CoD.AmmoWidget_Separator.new( menu, controller )
	ImgSeperator:setLeftRight( false, true, -57.16, -53.84 )
	ImgSeperator:setTopBottom( true, false, 198.67, 233.34 )
	ImgSeperator:setZRot( 90 )
	ImgSeperator:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgSeperator:setShaderVector( 0, 0.1, 1, 0, 0 )
	ImgSeperator:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgSeperator:setShaderVector( 2, 0, 0, 0, 0 )
	ImgSeperator:setShaderVector( 3, 0, 0, 0, 0 )
	ImgSeperator:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ImgSeperator )
	self.ImgSeperator = ImgSeperator
	
	local ImgSeparatorDual = CoD.AmmoWidget_Separator.new( menu, controller )
	ImgSeparatorDual:setLeftRight( false, true, -57.16, -53.84 )
	ImgSeparatorDual:setTopBottom( true, false, 198.67, 233.34 )
	ImgSeparatorDual:setZRot( 90 )
	ImgSeparatorDual:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgSeparatorDual:setShaderVector( 0, 0.1, 1, 0, 0 )
	ImgSeparatorDual:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgSeparatorDual:setShaderVector( 2, 0, 0, 0, 0 )
	ImgSeparatorDual:setShaderVector( 3, 0, 0, 0, 0 )
	ImgSeparatorDual:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ImgSeparatorDual )
	self.ImgSeparatorDual = ImgSeparatorDual
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 18.67, 152.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 18.67, 152.33 )
				self.BackLine2:setTopBottom( true, false, 3.5, 6.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -141, -131.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.ImgSemiCircle:setRGB( 1, 1, 1 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.84, -68.51 )
				self.ImgSeperator:setTopBottom( true, false, 13.67, 48.34 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
				ImgSeparatorDual:completeAnimation()
				self.ImgSeparatorDual:setLeftRight( false, true, -57.16, -53.84 )
				self.ImgSeparatorDual:setTopBottom( true, false, 198.67, 233.34 )
				self.clipFinished( ImgSeparatorDual, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, -40, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 12, 70 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -210, -200.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.84, -68.51 )
				self.ImgSeperator:setTopBottom( true, false, 13.67, 48.34 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
				ImgSeparatorDual:completeAnimation()
				self.ImgSeparatorDual:setLeftRight( false, true, -139.17, -135.84 )
				self.ImgSeparatorDual:setTopBottom( true, false, 13.67, 48.34 )
				self.ImgSeparatorDual:setZRot( 0 )
				self.clipFinished( ImgSeparatorDual, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 23.67, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 23.67, 157.33 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -141, -131.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.ImgSemiCircle:setRGB( 1, 1, 1 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.84, -68.51 )
				self.ImgSeperator:setTopBottom( true, false, 13.67, 48.34 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
				ImgSeparatorDual:completeAnimation()
				self.ImgSeparatorDual:setLeftRight( false, true, -57.16, -53.84 )
				self.ImgSeparatorDual:setTopBottom( true, false, 198.67, 233.34 )
				self.clipFinished( ImgSeparatorDual, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 55, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 55, 157.33 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -110, -100.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -56.84, -53.51 )
				self.ImgSeperator:setTopBottom( true, false, 198.67, 233.34 )
				self.ImgSeperator:setZRot( 90 )
				self.clipFinished( ImgSeperator, {} )
				ImgSeparatorDual:completeAnimation()
				self.ImgSeparatorDual:setLeftRight( false, true, -57.16, -53.84 )
				self.ImgSeparatorDual:setTopBottom( true, false, 198.67, 233.34 )
				self.clipFinished( ImgSeparatorDual, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackLine1:completeAnimation()
				self.BackLine1:setLeftRight( true, false, 12, 157.33 )
				self.BackLine1:setTopBottom( true, false, 51.5, 54.5 )
				self.clipFinished( BackLine1, {} )
				BackLine2:completeAnimation()
				self.BackLine2:setLeftRight( true, false, 12, 157.33 )
				self.BackLine2:setTopBottom( true, false, 2.5, 5.5 )
				self.clipFinished( BackLine2, {} )
				ImgSemiCircle:completeAnimation()
				self.ImgSemiCircle:setLeftRight( false, true, -155, -145.67 )
				self.ImgSemiCircle:setTopBottom( true, false, 1, 55.67 )
				self.clipFinished( ImgSemiCircle, {} )
				ImgSeperator:completeAnimation()
				self.ImgSeperator:setLeftRight( false, true, -71.84, -68.51 )
				self.ImgSeperator:setTopBottom( true, false, 13.67, 48.34 )
				self.ImgSeperator:setZRot( 0 )
				self.clipFinished( ImgSeperator, {} )
				ImgSeparatorDual:completeAnimation()
				self.ImgSeparatorDual:setLeftRight( false, true, -57.16, -53.84 )
				self.ImgSeparatorDual:setTopBottom( true, false, 198.67, 233.34 )
				self.clipFinished( ImgSeparatorDual, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackLine1:close()
		element.BackLine2:close()
		element.ImgSemiCircle:close()
		element.ImgSeperator:close()
		element.ImgSeparatorDual:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

