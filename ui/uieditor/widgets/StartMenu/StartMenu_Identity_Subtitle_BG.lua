-- 29879e04f3577f99d81d837cdb634d87
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_Identity_Subtitle_BG = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity_Subtitle_BG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity_Subtitle_BG )
	self.id = "StartMenu_Identity_Subtitle_BG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.07, 0.17, 0, 0 )
	Image:setupNineSliceShader( 16, 4 )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

