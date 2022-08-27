-- 889c6bc6c3119ad980dd913ac1fc1896
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMPromotional.ZM_Promo_DoubleVialWidgetListItem" )

CoD.ZM_PromoListItem = InheritFrom( LUI.UIElement )
CoD.ZM_PromoListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_PromoListItem )
	self.id = "ZM_PromoListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 49 )
	self:setTopBottom( true, false, 0, 49 )
	
	local FirstOneFree = LUI.UIImage.new()
	FirstOneFree:setLeftRight( false, false, -24.5, 24.5 )
	FirstOneFree:setTopBottom( false, false, -24.5, 24.5 )
	FirstOneFree:setImage( RegisterImage( "uie_t7_menu_frontend_zm_gg_backer" ) )
	self:addElement( FirstOneFree )
	self.FirstOneFree = FirstOneFree
	
	local ZMPromoDoubleVialWidget = CoD.ZM_Promo_DoubleVialWidgetListItem.new( menu, controller )
	ZMPromoDoubleVialWidget:setLeftRight( true, false, 0.35, 49.35 )
	ZMPromoDoubleVialWidget:setTopBottom( true, false, 0, 49 )
	self:addElement( ZMPromoDoubleVialWidget )
	self.ZMPromoDoubleVialWidget = ZMPromoDoubleVialWidget
	
	local DoubleWeaponXP = LUI.UIImage.new()
	DoubleWeaponXP:setLeftRight( false, false, -24.5, 24.5 )
	DoubleWeaponXP:setTopBottom( false, false, -24.5, 24.5 )
	DoubleWeaponXP:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_weapon" ) )
	self:addElement( DoubleWeaponXP )
	self.DoubleWeaponXP = DoubleWeaponXP
	
	local DoubleXP = LUI.UIImage.new()
	DoubleXP:setLeftRight( false, false, -24.5, 24.5 )
	DoubleXP:setTopBottom( false, false, -24.5, 24.5 )
	DoubleXP:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp" ) )
	self:addElement( DoubleXP )
	self.DoubleXP = DoubleXP
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 8.1, 40.9 )
	Text:setTopBottom( true, false, 16.22, 32.78 )
	Text:setRGB( 1, 0.87, 0.25 )
	Text:setText( Engine.Localize( AppendLocalizeString( "MENU_XP_CAPS", "2" ) ) )
	Text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Text:setShaderVector( 0, 0.05, 0, 0, 0 )
	Text:setShaderVector( 1, 0.5, 0, 0, 0 )
	Text:setShaderVector( 2, 1, 0, 0, 0 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FirstOneFree:completeAnimation()
				self.FirstOneFree:setAlpha( 0 )
				self.clipFinished( FirstOneFree, {} )
				ZMPromoDoubleVialWidget:completeAnimation()
				self.ZMPromoDoubleVialWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleVialWidget, {} )
				DoubleWeaponXP:completeAnimation()
				self.DoubleWeaponXP:setAlpha( 0 )
				self.clipFinished( DoubleWeaponXP, {} )
				DoubleXP:completeAnimation()
				self.DoubleXP:setAlpha( 0 )
				self.clipFinished( DoubleXP, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FirstOneFree:completeAnimation()
				self.FirstOneFree:setAlpha( 0 )
				self.clipFinished( FirstOneFree, {} )
				ZMPromoDoubleVialWidget:completeAnimation()
				self.ZMPromoDoubleVialWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleVialWidget, {} )
				DoubleWeaponXP:completeAnimation()
				self.DoubleWeaponXP:setAlpha( 0 )
				self.clipFinished( DoubleWeaponXP, {} )
				DoubleXP:completeAnimation()
				self.DoubleXP:setAlpha( 1 )
				self.clipFinished( DoubleXP, {} )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FirstOneFree:completeAnimation()
				self.FirstOneFree:setAlpha( 0 )
				self.clipFinished( FirstOneFree, {} )
				ZMPromoDoubleVialWidget:completeAnimation()
				self.ZMPromoDoubleVialWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleVialWidget, {} )
				DoubleWeaponXP:completeAnimation()
				self.DoubleWeaponXP:setAlpha( 1 )
				self.clipFinished( DoubleWeaponXP, {} )
				DoubleXP:completeAnimation()
				self.DoubleXP:setAlpha( 0 )
				self.clipFinished( DoubleXP, {} )
				Text:completeAnimation()
				self.Text:setRGB( 1, 0.87, 0.25 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		DoubleVial = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FirstOneFree:completeAnimation()
				self.FirstOneFree:setAlpha( 0 )
				self.clipFinished( FirstOneFree, {} )
				ZMPromoDoubleVialWidget:completeAnimation()
				self.ZMPromoDoubleVialWidget:setAlpha( 1 )
				self.clipFinished( ZMPromoDoubleVialWidget, {} )
				DoubleWeaponXP:completeAnimation()
				self.DoubleWeaponXP:setAlpha( 0 )
				self.clipFinished( DoubleWeaponXP, {} )
				DoubleXP:completeAnimation()
				self.DoubleXP:setAlpha( 0 )
				self.clipFinished( DoubleXP, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		FirstOneFree = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FirstOneFree:completeAnimation()
				self.FirstOneFree:setAlpha( 1 )
				self.clipFinished( FirstOneFree, {} )
				ZMPromoDoubleVialWidget:completeAnimation()
				self.ZMPromoDoubleVialWidget:setAlpha( 0 )
				self.clipFinished( ZMPromoDoubleVialWidget, {} )
				DoubleWeaponXP:completeAnimation()
				self.DoubleWeaponXP:setAlpha( 0 )
				self.clipFinished( DoubleWeaponXP, {} )
				DoubleXP:completeAnimation()
				self.DoubleXP:setAlpha( 0 )
				self.clipFinished( DoubleXP, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "doublexp" )
			end
		},
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "doubleweaponxp" )
			end
		},
		{
			stateName = "DoubleVial",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "doublevials" )
			end
		},
		{
			stateName = "FirstOneFree",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "firstonefree" )
			end
		}
	} )
	self:linkToElementModel( self, "type", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMPromoDoubleVialWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

