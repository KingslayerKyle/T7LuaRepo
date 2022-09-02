-- 3444caf7b0d5606a75dd5424835340eb
-- This hash is used for caching, delete to decompile the file again

CoD.CommsWidget_CharacterBack = InheritFrom( LUI.UIElement )
CoD.CommsWidget_CharacterBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_CharacterBack )
	self.id = "CommsWidget_CharacterBack"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 165 )
	
	local ImgCharBack = LUI.UIImage.new()
	ImgCharBack:setLeftRight( true, false, 5, 179.33 )
	ImgCharBack:setTopBottom( true, false, 0, 165.33 )
	ImgCharBack:setAlpha( 0.6 )
	ImgCharBack:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_imageback" ) )
	ImgCharBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgCharBack )
	self.ImgCharBack = ImgCharBack
	
	local ImgCharBack0 = LUI.UIImage.new()
	ImgCharBack0:setLeftRight( true, false, 5, 179.33 )
	ImgCharBack0:setTopBottom( true, false, 0, 165.33 )
	ImgCharBack0:setRGB( 0, 0.66, 1 )
	ImgCharBack0:setAlpha( 0.44 )
	ImgCharBack0:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_imageback" ) )
	ImgCharBack0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	ImgCharBack0:setShaderVector( 0, 33.11, 0, 0, 0 )
	ImgCharBack0:setShaderVector( 1, 1, 0, 0, 0 )
	ImgCharBack0:setShaderVector( 2, 0.33, 0, 0, 0 )
	self:addElement( ImgCharBack0 )
	self.ImgCharBack0 = ImgCharBack0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImgCharBack:completeAnimation()
				self.ImgCharBack:setAlpha( 0.51 )
				self.clipFinished( ImgCharBack, {} )

				ImgCharBack0:completeAnimation()
				self.ImgCharBack0:setAlpha( 0.52 )
				self.clipFinished( ImgCharBack0, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			HudStart = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

