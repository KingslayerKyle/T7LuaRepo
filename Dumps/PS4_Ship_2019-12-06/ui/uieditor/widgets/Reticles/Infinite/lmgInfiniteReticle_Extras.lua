CoD.lmgInfiniteReticle_Extras = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_Extras.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_Extras )
	self.id = "lmgInfiniteReticle_Extras"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 118 )
	self:setTopBottom( true, false, 0, 18 )
	
	local extras = LUI.UIImage.new()
	extras:setLeftRight( true, false, 0, 23 )
	extras:setTopBottom( true, false, 0, 10 )
	extras:setAlpha( 0.5 )
	extras:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras1" ) )
	extras:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras )
	self.extras = extras
	
	local extras0 = LUI.UIImage.new()
	extras0:setLeftRight( true, false, 62, 85 )
	extras0:setTopBottom( true, false, 0, 10 )
	extras0:setAlpha( 0.5 )
	extras0:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras1" ) )
	extras0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras0 )
	self.extras0 = extras0
	
	local extras00 = LUI.UIImage.new()
	extras00:setLeftRight( true, false, 1, 20 )
	extras00:setTopBottom( true, false, 7, 17 )
	extras00:setAlpha( 0.5 )
	extras00:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras1" ) )
	extras00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras00 )
	self.extras00 = extras00
	
	local extras000 = LUI.UIImage.new()
	extras000:setLeftRight( true, false, 63, 82 )
	extras000:setTopBottom( true, false, 7, 17 )
	extras000:setAlpha( 0.5 )
	extras000:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras1" ) )
	extras000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras000 )
	self.extras000 = extras000
	
	local extras001 = LUI.UIImage.new()
	extras001:setLeftRight( true, false, 66.09, 117.59 )
	extras001:setTopBottom( true, false, 2.35, 9.65 )
	extras001:setAlpha( 0.75 )
	extras001:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras4" ) )
	extras001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras001 )
	self.extras001 = extras001
	
	local extras0010 = LUI.UIImage.new()
	extras0010:setLeftRight( true, false, 66.09, 101.52 )
	extras0010:setTopBottom( true, false, 10, 17.7 )
	extras0010:setAlpha( 0.75 )
	extras0010:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras6" ) )
	extras0010:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras0010 )
	self.extras0010 = extras0010
	
	local extras00100 = LUI.UIImage.new()
	extras00100:setLeftRight( true, false, 4.29, 39.29 )
	extras00100:setTopBottom( true, false, 3.35, 9.35 )
	extras00100:setAlpha( 0.75 )
	extras00100:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras3" ) )
	extras00100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras00100 )
	self.extras00100 = extras00100
	
	local extras001000 = LUI.UIImage.new()
	extras001000:setLeftRight( true, false, 4.29, 40.29 )
	extras001000:setTopBottom( true, false, 10, 17.7 )
	extras001000:setAlpha( 0.75 )
	extras001000:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_extras5" ) )
	extras001000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( extras001000 )
	self.extras001000 = extras001000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Printing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		WeaponFiring = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Printing = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MagazineFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		EmptyMagazine = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Printing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_PRINTING )
			end
		},
		{
			stateName = "WeaponFiring",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_FIRING )
			end
		},
		{
			stateName = "MagazineFull",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_FULL )
			end
		},
		{
			stateName = "EmptyMagazine",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_EMPTY )
			end
		}
	} )
	self:linkToElementModel( self, "lmgInfiniteState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lmgInfiniteState"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

