-- 1d508d0ff8772f9bb0dee3914b06e38a
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_IconEnviroHazardType = InheritFrom( LUI.UIElement )
CoD.DamageWidget_IconEnviroHazardType.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_IconEnviroHazardType )
	self.id = "DamageWidget_IconEnviroHazardType"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 23 )
	self:setTopBottom( true, false, 0, 21 )
	
	local ImgIconFilter = LUI.UIImage.new()
	ImgIconFilter:setLeftRight( true, false, 0, 22.67 )
	ImgIconFilter:setTopBottom( true, false, 0, 21.33 )
	ImgIconFilter:setAlpha( 0 )
	ImgIconFilter:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_icon_filter" ) )
	self:addElement( ImgIconFilter )
	self.ImgIconFilter = ImgIconFilter
	
	local ImgIconHeat = LUI.UIImage.new()
	ImgIconHeat:setLeftRight( true, false, 0, 22.67 )
	ImgIconHeat:setTopBottom( true, false, 0, 21.33 )
	ImgIconHeat:setAlpha( 0 )
	ImgIconHeat:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_icon_heat" ) )
	self:addElement( ImgIconHeat )
	self.ImgIconHeat = ImgIconHeat
	
	local ImgIconO2 = LUI.UIImage.new()
	ImgIconO2:setLeftRight( true, false, 0, 22.67 )
	ImgIconO2:setTopBottom( true, false, 0, 21.33 )
	ImgIconO2:setAlpha( 0 )
	ImgIconO2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_icon_o2" ) )
	self:addElement( ImgIconO2 )
	self.ImgIconO2 = ImgIconO2
	
	local ImgIconRadiation = LUI.UIImage.new()
	ImgIconRadiation:setLeftRight( true, false, 0, 22.67 )
	ImgIconRadiation:setTopBottom( true, false, 0, 21.33 )
	ImgIconRadiation:setAlpha( 0 )
	ImgIconRadiation:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_icon_radiation" ) )
	self:addElement( ImgIconRadiation )
	self.ImgIconRadiation = ImgIconRadiation
	
	local ImgIconBio = LUI.UIImage.new()
	ImgIconBio:setLeftRight( true, false, 0, 23 )
	ImgIconBio:setTopBottom( true, false, -0.65, 21 )
	ImgIconBio:setAlpha( 0 )
	ImgIconBio:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_icon_bio" ) )
	self:addElement( ImgIconBio )
	self.ImgIconBio = ImgIconBio
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 0 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 0 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 0 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 0 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 0 )
				self.clipFinished( ImgIconBio, {} )
			end
		},
		Heat = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 0 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 1 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 0 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 0 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 0 )
				self.clipFinished( ImgIconBio, {} )
			end
		},
		Filter = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 1 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 0 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 0 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 0 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 0 )
				self.clipFinished( ImgIconBio, {} )
			end
		},
		O2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 0 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 0 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 1 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 0 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 0 )
				self.clipFinished( ImgIconBio, {} )
			end
		},
		Radiation = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 0 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 0 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 0 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 1 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 0 )
				self.clipFinished( ImgIconBio, {} )
			end
		},
		Bio = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ImgIconFilter:completeAnimation()
				self.ImgIconFilter:setAlpha( 0 )
				self.clipFinished( ImgIconFilter, {} )

				ImgIconHeat:completeAnimation()
				self.ImgIconHeat:setAlpha( 0 )
				self.clipFinished( ImgIconHeat, {} )

				ImgIconO2:completeAnimation()
				self.ImgIconO2:setAlpha( 0 )
				self.clipFinished( ImgIconO2, {} )

				ImgIconRadiation:completeAnimation()
				self.ImgIconRadiation:setAlpha( 0 )
				self.clipFinished( ImgIconRadiation, {} )

				ImgIconBio:completeAnimation()
				self.ImgIconBio:setAlpha( 1 )
				self.clipFinished( ImgIconBio, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
