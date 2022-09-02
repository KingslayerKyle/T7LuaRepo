-- b7fb20c453f179d1a0d1cd3f7dee2bd5
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreInfo_Meter = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_Meter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_Meter )
	self.id = "ScoreInfo_Meter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 53 )
	self:setTopBottom( true, false, 0, 24 )
	
	local ImgMeterEnvBack = LUI.UIImage.new()
	ImgMeterEnvBack:setLeftRight( true, false, 0, 88 )
	ImgMeterEnvBack:setTopBottom( true, false, 0, 8 )
	ImgMeterEnvBack:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_simplemeterback" ) )
	self:addElement( ImgMeterEnvBack )
	self.ImgMeterEnvBack = ImgMeterEnvBack
	
	local ImgMeterEnvFill = LUI.UIImage.new()
	ImgMeterEnvFill:setLeftRight( true, true, 2, -1.67 )
	ImgMeterEnvFill:setTopBottom( true, true, 2, -2 )
	ImgMeterEnvFill:setAlpha( 0 )
	ImgMeterEnvFill:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_hess_meterfill" ) )
	ImgMeterEnvFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_angled_wipe_normal" ) )
	ImgMeterEnvFill:setShaderVector( 0, 0.84, 0, 0, 0 )
	ImgMeterEnvFill:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( ImgMeterEnvFill )
	self.ImgMeterEnvFill = ImgMeterEnvFill
	
	local ImgMeterEnvFillLine = LUI.UIImage.new()
	ImgMeterEnvFillLine:setLeftRight( true, false, 0, 84 )
	ImgMeterEnvFillLine:setTopBottom( true, false, 2, 6 )
	ImgMeterEnvFillLine:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_simplemeterfill" ) )
	ImgMeterEnvFillLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ImgMeterEnvFillLine:setShaderVector( 0, 1, 0, 0, 0 )
	ImgMeterEnvFillLine:setShaderVector( 1, 0, 0, 0, 0 )
	ImgMeterEnvFillLine:setShaderVector( 2, 1, 0, 0, 0 )
	ImgMeterEnvFillLine:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ImgMeterEnvFillLine )
	self.ImgMeterEnvFillLine = ImgMeterEnvFillLine
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 128, 151 )
	Image0:setTopBottom( true, false, 5, 19 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 178.5, 201.5 )
	Image1:setTopBottom( true, false, 5, 19 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ImgMeterEnvBack:completeAnimation()
				self.ImgMeterEnvBack:setAlpha( 0 )
				self.clipFinished( ImgMeterEnvBack, {} )

				ImgMeterEnvFill:completeAnimation()
				self.ImgMeterEnvFill:setAlpha( 0 )
				self.clipFinished( ImgMeterEnvFill, {} )

				ImgMeterEnvFillLine:completeAnimation()
				self.ImgMeterEnvFillLine:setAlpha( 0 )
				self.clipFinished( ImgMeterEnvFillLine, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ImgMeterEnvBack:completeAnimation()
				self.ImgMeterEnvBack:setAlpha( 1 )
				self.clipFinished( ImgMeterEnvBack, {} )

				ImgMeterEnvFill:completeAnimation()
				self.ImgMeterEnvFill:setAlpha( 0 )
				self.clipFinished( ImgMeterEnvFill, {} )

				ImgMeterEnvFillLine:completeAnimation()
				self.ImgMeterEnvFillLine:setAlpha( 1 )
				self.clipFinished( ImgMeterEnvFillLine, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not HideScoreMeterDueToGameType()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

