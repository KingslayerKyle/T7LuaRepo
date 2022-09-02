-- 1ffff4897f993471c79ae498335267d7
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_Fist = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_Fist.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_Fist )
	self.id = "AmmoWidget_Fist"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 35 )
	self:setTopBottom( true, false, 0, 75 )
	
	local Fist = LUI.UIImage.new()
	Fist:setLeftRight( true, false, 0, 35.48 )
	Fist:setTopBottom( true, false, 0, 74.5 )
	Fist:setImage( RegisterImage( "uie_img_t7_hud_icon_fist_proto" ) )
	self:addElement( Fist )
	self.Fist = Fist
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			AmmoUpdate = function ()
				self:setupElementClipCounter( 0 )

			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

