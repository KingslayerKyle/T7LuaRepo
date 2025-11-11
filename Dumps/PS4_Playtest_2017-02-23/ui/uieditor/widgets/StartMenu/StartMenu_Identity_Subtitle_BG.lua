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
	self:setLeftRight( 0, 0, 0, 352 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, 0, 0 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 6 )
	self:addElement( Image )
	self.Image = Image
	
	self.resetProperties = function ()
		Image:completeAnimation()
		Image:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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

