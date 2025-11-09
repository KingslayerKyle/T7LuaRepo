require( "ui.uieditor.widgets.CAC.cac_WeapStatsBarEmpty" )

CoD.WeaponAttributesBar = InheritFrom( LUI.UIElement )
CoD.WeaponAttributesBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponAttributesBar )
	self.id = "WeaponAttributesBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 14 )
	self.anyChildUsesUpdateState = true
	
	local Dash10Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash10Empty:setLeftRight( true, false, 241, 273 )
	Dash10Empty:setTopBottom( true, false, -1, 15 )
	Dash10Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash10Empty )
	self.Dash10Empty = Dash10Empty
	
	local Dash9Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash9Empty:setLeftRight( true, false, 214, 246 )
	Dash9Empty:setTopBottom( true, false, -1, 15 )
	Dash9Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash9Empty )
	self.Dash9Empty = Dash9Empty
	
	local Dash8Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash8Empty:setLeftRight( true, false, 187, 219 )
	Dash8Empty:setTopBottom( true, false, -1, 15 )
	Dash8Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash8Empty )
	self.Dash8Empty = Dash8Empty
	
	local Dash7Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash7Empty:setLeftRight( true, false, 160, 192 )
	Dash7Empty:setTopBottom( true, false, -1, 15 )
	Dash7Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash7Empty )
	self.Dash7Empty = Dash7Empty
	
	local Dash6Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash6Empty:setLeftRight( true, false, 133, 165 )
	Dash6Empty:setTopBottom( true, false, -1, 15 )
	Dash6Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash6Empty )
	self.Dash6Empty = Dash6Empty
	
	local Dash5Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash5Empty:setLeftRight( true, false, 106, 138 )
	Dash5Empty:setTopBottom( true, false, -1, 15 )
	Dash5Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash5Empty )
	self.Dash5Empty = Dash5Empty
	
	local Dash4Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash4Empty:setLeftRight( true, false, 79, 111 )
	Dash4Empty:setTopBottom( true, false, -1, 15 )
	Dash4Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash4Empty )
	self.Dash4Empty = Dash4Empty
	
	local Dash3Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash3Empty:setLeftRight( true, false, 52, 84 )
	Dash3Empty:setTopBottom( true, false, -1, 15 )
	Dash3Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash3Empty )
	self.Dash3Empty = Dash3Empty
	
	local Dash2Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash2Empty:setLeftRight( true, false, 25, 57 )
	Dash2Empty:setTopBottom( true, false, -1, 15 )
	Dash2Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash2Empty )
	self.Dash2Empty = Dash2Empty
	
	local Dash1Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash1Empty:setLeftRight( true, false, -2, 30 )
	Dash1Empty:setTopBottom( true, false, -1, 15 )
	Dash1Empty:setRGB( 1, 1, 1 )
	self:addElement( Dash1Empty )
	self.Dash1Empty = Dash1Empty
	
	local weaponAttribute = LUI.UIImage.new()
	weaponAttribute:setLeftRight( true, true, 0, 0 )
	weaponAttribute:setTopBottom( true, true, 0, 0 )
	weaponAttribute:setRGB( 1, 1, 1 )
	weaponAttribute:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxameterfill" ) )
	weaponAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	weaponAttribute:setShaderVector( 0, 0, 0, 0, 0 )
	weaponAttribute:setShaderVector( 1, 0, 0, 0, 0 )
	weaponAttribute:setShaderVector( 2, 1, 0, 0, 0 )
	weaponAttribute:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( weaponAttribute )
	self.weaponAttribute = weaponAttribute
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		BarNone = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Dash10Empty:completeAnimation()
				self.Dash10Empty:setAlpha( 1 )
				self.clipFinished( Dash10Empty, {} )
				Dash9Empty:completeAnimation()
				self.Dash9Empty:setAlpha( 1 )
				self.clipFinished( Dash9Empty, {} )
				Dash8Empty:completeAnimation()
				self.Dash8Empty:setAlpha( 1 )
				self.clipFinished( Dash8Empty, {} )
				Dash7Empty:completeAnimation()
				self.Dash7Empty:setAlpha( 1 )
				self.clipFinished( Dash7Empty, {} )
				Dash6Empty:completeAnimation()
				self.Dash6Empty:setAlpha( 1 )
				self.clipFinished( Dash6Empty, {} )
				Dash5Empty:completeAnimation()
				self.Dash5Empty:setAlpha( 1 )
				self.clipFinished( Dash5Empty, {} )
			end,
			Bar1 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar2 = function ()
				self:setupElementClipCounter( 0 )
			end,
			BarNone = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar3 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar1 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar4 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar2 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar5 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar3 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar6 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar4 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar7 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar5 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar8 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar6 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar8 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar9 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar7 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar9 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar10 = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar8 = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bar10 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bar9 = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.Dash10Empty:close()
		self.Dash9Empty:close()
		self.Dash8Empty:close()
		self.Dash7Empty:close()
		self.Dash6Empty:close()
		self.Dash5Empty:close()
		self.Dash4Empty:close()
		self.Dash3Empty:close()
		self.Dash2Empty:close()
		self.Dash1Empty:close()
		CoD.WeaponAttributesBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

