-- 1a26925e1c76575c44b2c8554b35e1c4
-- This hash is used for caching, delete to decompile the file again

CoD.vtolCenterMissilesLocked = InheritFrom( LUI.UIElement )
CoD.vtolCenterMissilesLocked.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vtolCenterMissilesLocked )
	self.id = "vtolCenterMissilesLocked"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 436 )
	self:setTopBottom( true, false, 0, 80 )
	
	local bkg = LUI.UIImage.new()
	bkg:setLeftRight( false, true, -436, -145.33 )
	bkg:setTopBottom( false, true, -80, -26.7 )
	bkg:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_locked" ) )
	self:addElement( bkg )
	self.bkg = bkg
	
	local MissileLock = LUI.UIText.new()
	MissileLock:setLeftRight( false, true, -419.67, -157.67 )
	MissileLock:setTopBottom( false, true, -66, -40 )
	MissileLock:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_MISSILE_LOCK" ) )
	MissileLock:setTTF( "fonts/escom.ttf" )
	MissileLock:setLetterSpacing( 3 )
	MissileLock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissileLock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( MissileLock )
	self.MissileLock = MissileLock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

