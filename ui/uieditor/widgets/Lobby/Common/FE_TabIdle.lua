-- 56aee06db21121b781899fe23646ed36
-- This hash is used for caching, delete to decompile the file again

CoD.FE_TabIdle = InheritFrom( LUI.UIElement )
CoD.FE_TabIdle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_TabIdle )
	self.id = "FE_TabIdle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 152 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.05, 0.2, 0, 0 )
	Image:setupNineSliceShader( 8, 8 )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Active = function ()
				self:setupElementClipCounter( 0 )

			end,
			GainActive = function ()
				self:setupElementClipCounter( 0 )

			end,
			LoseActive = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

