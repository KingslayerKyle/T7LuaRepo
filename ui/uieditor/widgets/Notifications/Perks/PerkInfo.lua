-- e2e31d875482583faa0b9cf893b2deb9
-- This hash is used for caching, delete to decompile the file again

CoD.PerkInfo = InheritFrom( LUI.UIElement )
CoD.PerkInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PerkInfo )
	self.id = "PerkInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 62 )
	
	local PerkImage1 = LUI.UIImage.new()
	PerkImage1:setLeftRight( false, true, -62, 0 )
	PerkImage1:setTopBottom( true, false, 0, 62 )
	self:addElement( PerkImage1 )
	self.PerkImage1 = PerkImage1
	
	local PerkImage0 = LUI.UIImage.new()
	PerkImage0:setLeftRight( false, true, -124, -62 )
	PerkImage0:setTopBottom( true, false, 0, 62 )
	self:addElement( PerkImage0 )
	self.PerkImage0 = PerkImage0
	
	local DoublePerkDescription = LUI.UIText.new()
	DoublePerkDescription:setLeftRight( false, true, -500, -126 )
	DoublePerkDescription:setTopBottom( true, false, 22, 38 )
	DoublePerkDescription:setText( Engine.Localize( "TEST" ) )
	DoublePerkDescription:setTTF( "fonts/escom.ttf" )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DoublePerkDescription )
	self.DoublePerkDescription = DoublePerkDescription
	
	local DoublePerkDescriptionArabic = LUI.UIText.new()
	DoublePerkDescriptionArabic:setLeftRight( false, true, -500, -126 )
	DoublePerkDescriptionArabic:setTopBottom( true, false, 18, 34 )
	DoublePerkDescriptionArabic:setAlpha( 0 )
	DoublePerkDescriptionArabic:setText( Engine.Localize( "TEST" ) )
	DoublePerkDescriptionArabic:setTTF( "fonts/escom.ttf" )
	DoublePerkDescriptionArabic:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DoublePerkDescriptionArabic:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DoublePerkDescriptionArabic )
	self.DoublePerkDescriptionArabic = DoublePerkDescriptionArabic
	
	local SinglePerkDescription = LUI.UITightText.new()
	SinglePerkDescription:setLeftRight( false, true, -500, -124 )
	SinglePerkDescription:setTopBottom( true, false, 22, 38 )
	SinglePerkDescription:setAlpha( 0 )
	SinglePerkDescription:setText( Engine.Localize( "TEST" ) )
	SinglePerkDescription:setTTF( "fonts/escom.ttf" )
	SinglePerkDescription:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	SinglePerkDescription:setShaderVector( 0, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 1, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 2, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 3, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 4, 0, 0, 0, 0 )
	SinglePerkDescription:setLetterSpacing( 0.5 )
	self:addElement( SinglePerkDescription )
	self.SinglePerkDescription = SinglePerkDescription
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PerkImage1:completeAnimation()
				self.PerkImage1:setLeftRight( false, true, -62, 0 )
				self.PerkImage1:setTopBottom( true, false, 0, 62 )
				self.PerkImage1:setAlpha( 0 )
				self.clipFinished( PerkImage1, {} )

				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -124, -62 )
				self.PerkImage0:setTopBottom( true, false, 0, 62 )
				self.PerkImage0:setAlpha( 0 )
				self.clipFinished( PerkImage0, {} )

				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescription:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescription:setAlpha( 0 )
				self.clipFinished( DoublePerkDescription, {} )

				DoublePerkDescriptionArabic:completeAnimation()
				self.DoublePerkDescriptionArabic:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescriptionArabic:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescriptionArabic:setAlpha( 0 )
				self.clipFinished( DoublePerkDescriptionArabic, {} )

				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setLeftRight( false, true, -500, -68 )
				self.SinglePerkDescription:setTopBottom( true, false, 18, 34 )
				self.SinglePerkDescription:setAlpha( 0 )
				self.clipFinished( SinglePerkDescription, {} )
			end
		},
		SinglePerk = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PerkImage1:completeAnimation()
				self.PerkImage1:setLeftRight( false, true, -62, 0 )
				self.PerkImage1:setTopBottom( true, false, 0, 62 )
				self.PerkImage1:setAlpha( 0 )
				self.clipFinished( PerkImage1, {} )

				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -62, 0 )
				self.PerkImage0:setTopBottom( true, false, 0, 62 )
				self.PerkImage0:setAlpha( 1 )
				self.clipFinished( PerkImage0, {} )

				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescription:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescription:setAlpha( 0 )
				self.clipFinished( DoublePerkDescription, {} )

				DoublePerkDescriptionArabic:completeAnimation()
				self.DoublePerkDescriptionArabic:setAlpha( 0 )
				self.clipFinished( DoublePerkDescriptionArabic, {} )

				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setLeftRight( false, true, -500, -62 )
				self.SinglePerkDescription:setTopBottom( true, false, 18, 34 )
				self.SinglePerkDescription:setAlpha( 1 )
				self.clipFinished( SinglePerkDescription, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		DoublePerk = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PerkImage1:completeAnimation()
				self.PerkImage1:setLeftRight( false, true, -62, 0 )
				self.PerkImage1:setTopBottom( true, false, 0, 62 )
				self.PerkImage1:setAlpha( 1 )
				self.clipFinished( PerkImage1, {} )

				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -124, -62 )
				self.PerkImage0:setTopBottom( true, false, 0, 62 )
				self.PerkImage0:setAlpha( 1 )
				self.clipFinished( PerkImage0, {} )

				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescription:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescription:setAlpha( 1 )
				self.clipFinished( DoublePerkDescription, {} )

				DoublePerkDescriptionArabic:completeAnimation()
				self.DoublePerkDescriptionArabic:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescriptionArabic:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescriptionArabic:setAlpha( 0 )
				self.clipFinished( DoublePerkDescriptionArabic, {} )

				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setLeftRight( false, true, -500, -151 )
				self.SinglePerkDescription:setTopBottom( true, false, 18, 34 )
				self.SinglePerkDescription:setAlpha( 0 )
				self.clipFinished( SinglePerkDescription, {} )
			end
		},
		DoublePerkArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				PerkImage1:completeAnimation()
				self.PerkImage1:setLeftRight( false, true, -62, 0 )
				self.PerkImage1:setTopBottom( true, false, 0, 62 )
				self.PerkImage1:setAlpha( 1 )
				self.clipFinished( PerkImage1, {} )

				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -124, -62 )
				self.PerkImage0:setTopBottom( true, false, 0, 62 )
				self.PerkImage0:setAlpha( 1 )
				self.clipFinished( PerkImage0, {} )

				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescription:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescription:setAlpha( 0 )
				self.clipFinished( DoublePerkDescription, {} )

				DoublePerkDescriptionArabic:completeAnimation()
				self.DoublePerkDescriptionArabic:setLeftRight( false, true, -500, -126 )
				self.DoublePerkDescriptionArabic:setTopBottom( true, false, 18, 34 )
				self.DoublePerkDescriptionArabic:setAlpha( 1 )
				self.clipFinished( DoublePerkDescriptionArabic, {} )

				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setLeftRight( false, true, -500, -151 )
				self.SinglePerkDescription:setTopBottom( true, false, 18, 34 )
				self.SinglePerkDescription:setAlpha( 0 )
				self.clipFinished( SinglePerkDescription, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

