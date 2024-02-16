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
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 14 )
	self.anyChildUsesUpdateState = true
	
	local Dash10Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash10Empty:setLeftRight( true, false, 250, 286 )
	Dash10Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash10Empty )
	self.Dash10Empty = Dash10Empty
	
	local Dash9Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash9Empty:setLeftRight( true, false, 222, 258 )
	Dash9Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash9Empty )
	self.Dash9Empty = Dash9Empty
	
	local Dash8Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash8Empty:setLeftRight( true, false, 194, 230 )
	Dash8Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash8Empty )
	self.Dash8Empty = Dash8Empty
	
	local Dash7Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash7Empty:setLeftRight( true, false, 166, 202 )
	Dash7Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash7Empty )
	self.Dash7Empty = Dash7Empty
	
	local Dash6Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash6Empty:setLeftRight( true, false, 138, 174 )
	Dash6Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash6Empty )
	self.Dash6Empty = Dash6Empty
	
	local Dash5Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash5Empty:setLeftRight( true, false, 110, 146 )
	Dash5Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash5Empty )
	self.Dash5Empty = Dash5Empty
	
	local Dash4Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash4Empty:setLeftRight( true, false, 82, 118 )
	Dash4Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash4Empty )
	self.Dash4Empty = Dash4Empty
	
	local Dash3Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash3Empty:setLeftRight( true, false, 54, 90 )
	Dash3Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash3Empty )
	self.Dash3Empty = Dash3Empty
	
	local Dash2Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash2Empty:setLeftRight( true, false, 26, 62 )
	Dash2Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash2Empty )
	self.Dash2Empty = Dash2Empty
	
	local Dash1Empty = CoD.cac_WeapStatsBarEmpty.new( menu, controller )
	Dash1Empty:setLeftRight( true, false, -2, 34 )
	Dash1Empty:setTopBottom( true, false, -1, 15 )
	self:addElement( Dash1Empty )
	self.Dash1Empty = Dash1Empty
	
	local weaponAttribute = LUI.UIImage.new()
	weaponAttribute:setLeftRight( true, true, 0, 0 )
	weaponAttribute:setTopBottom( true, true, -1, 1 )
	weaponAttribute:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxameterfill" ) )
	weaponAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	weaponAttribute:setShaderVector( 0, 0, 0, 0, 0 )
	weaponAttribute:setShaderVector( 1, 0, 0, 0, 0 )
	weaponAttribute:setShaderVector( 2, 1, 0, 0, 0 )
	weaponAttribute:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( weaponAttribute )
	self.weaponAttribute = weaponAttribute
	
	local attachmentAttribute = LUI.UIImage.new()
	attachmentAttribute:setLeftRight( true, true, 0, 0 )
	attachmentAttribute:setTopBottom( true, true, -1, 1 )
	attachmentAttribute:setRGB( 1, 0, 0 )
	attachmentAttribute:setImage( RegisterImage( "uie_img_t7_menu_cacselection_infoboxameterfill" ) )
	attachmentAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	attachmentAttribute:setShaderVector( 0, 0, 0, 0, 0 )
	attachmentAttribute:setShaderVector( 1, 0, 0, 0, 0 )
	attachmentAttribute:setShaderVector( 2, 0, 1, 0, 0 )
	attachmentAttribute:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( attachmentAttribute )
	self.attachmentAttribute = attachmentAttribute
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				weaponAttribute:completeAnimation()
				self.weaponAttribute:setAlpha( 1 )
				self.weaponAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.weaponAttribute:setShaderVector( 0, 0, 0, 0, 0 )
				self.weaponAttribute:setShaderVector( 1, 0, 0, 0, 0 )
				self.weaponAttribute:setShaderVector( 2, 1, 0, 0, 0 )
				self.weaponAttribute:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( weaponAttribute, {} )
				attachmentAttribute:completeAnimation()
				self.attachmentAttribute:setRGB( 1, 1, 1 )
				self.attachmentAttribute:setAlpha( 1 )
				self.attachmentAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.attachmentAttribute:setShaderVector( 0, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 1, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 2, 0, 1, 0, 0 )
				self.attachmentAttribute:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( attachmentAttribute, {} )
			end
		},
		Increase = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				attachmentAttribute:completeAnimation()
				self.attachmentAttribute:setRGB( 0, 1, 0 )
				self.attachmentAttribute:setAlpha( 1 )
				self.attachmentAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.attachmentAttribute:setShaderVector( 0, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 1, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 2, 0, 1, 0, 0 )
				self.attachmentAttribute:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( attachmentAttribute, {} )
			end
		},
		Decrease = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				attachmentAttribute:completeAnimation()
				self.attachmentAttribute:setRGB( 1, 0, 0 )
				self.attachmentAttribute:setAlpha( 1 )
				self.attachmentAttribute:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.attachmentAttribute:setShaderVector( 0, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 1, 0, 0, 0, 0 )
				self.attachmentAttribute:setShaderVector( 2, 0, 1, 0, 0 )
				self.attachmentAttribute:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( attachmentAttribute, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

