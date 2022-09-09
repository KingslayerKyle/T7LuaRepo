-- 8cbe61a208cd2fb9833408201fe5c0b5
-- This hash is used for caching, delete to decompile the file again

CoD.BM_CompleteRibbon = InheritFrom( LUI.UIElement )
CoD.BM_CompleteRibbon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_CompleteRibbon )
	self.id = "BM_CompleteRibbon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 24 )
	
	local CompletedIcon0 = LUI.UIImage.new()
	CompletedIcon0:setLeftRight( true, true, 1, -48 )
	CompletedIcon0:setTopBottom( true, false, 0, 24 )
	CompletedIcon0:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribboncenter" ) )
	self:addElement( CompletedIcon0 )
	self.CompletedIcon0 = CompletedIcon0
	
	local CompletedIcon00 = LUI.UIImage.new()
	CompletedIcon00:setLeftRight( false, true, -48, 0 )
	CompletedIcon00:setTopBottom( true, false, 0, 24 )
	CompletedIcon00:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbonright" ) )
	self:addElement( CompletedIcon00 )
	self.CompletedIcon00 = CompletedIcon00
	
	local CompletedIcon000 = LUI.UIImage.new()
	CompletedIcon000:setLeftRight( true, false, -23, 1 )
	CompletedIcon000:setTopBottom( true, false, 0, 24 )
	CompletedIcon000:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbonleft" ) )
	self:addElement( CompletedIcon000 )
	self.CompletedIcon000 = CompletedIcon000
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 1, -8 )
	Text:setTopBottom( false, false, -7.75, 7.25 )
	Text:setRGB( 0.67, 1, 0.66 )
	Text:setText( Engine.Localize( "MPUI_BM_CONTRACTS_AVAILABLE" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Text:setShaderVector( 0, 0.03, 0, 0, 0 )
	Text:setShaderVector( 1, 0.01, 0, 0, 0 )
	Text:setShaderVector( 2, 1, 0, 0, 0 )
	Text:setLetterSpacing( 0.8 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAlignedNoReverse( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				CompletedIcon0:completeAnimation()
				self.CompletedIcon0:setAlpha( 1 )
				self.clipFinished( CompletedIcon0, {} )

				CompletedIcon00:completeAnimation()
				self.CompletedIcon00:setAlpha( 1 )
				self.clipFinished( CompletedIcon00, {} )

				CompletedIcon000:completeAnimation()
				self.CompletedIcon000:setAlpha( 1 )
				self.clipFinished( CompletedIcon000, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				CompletedIcon0:completeAnimation()
				self.CompletedIcon0:setAlpha( 0 )
				self.clipFinished( CompletedIcon0, {} )

				CompletedIcon00:completeAnimation()
				self.CompletedIcon00:setAlpha( 0 )
				self.clipFinished( CompletedIcon00, {} )

				CompletedIcon000:completeAnimation()
				self.CompletedIcon000:setAlpha( 0 )
				self.clipFinished( CompletedIcon000, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
