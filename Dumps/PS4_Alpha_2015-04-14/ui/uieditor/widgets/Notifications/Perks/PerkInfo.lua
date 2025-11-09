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
	self:setTopBottom( true, false, 0, 50 )
	
	local PerkImage1 = LUI.UIImage.new()
	PerkImage1:setLeftRight( false, true, -50, 0 )
	PerkImage1:setTopBottom( true, false, 0, 50 )
	PerkImage1:setRGB( 1, 1, 1 )
	PerkImage1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( PerkImage1 )
	self.PerkImage1 = PerkImage1
	
	local PerkImage0 = LUI.UIImage.new()
	PerkImage0:setLeftRight( false, true, -103, -53 )
	PerkImage0:setTopBottom( true, false, 0, 50 )
	PerkImage0:setRGB( 1, 1, 1 )
	PerkImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( PerkImage0 )
	self.PerkImage0 = PerkImage0
	
	local DoublePerkDescription = LUI.UIText.new()
	DoublePerkDescription:setLeftRight( false, true, -500, -106 )
	DoublePerkDescription:setTopBottom( true, false, 20, 36 )
	DoublePerkDescription:setRGB( 1, 1, 1 )
	DoublePerkDescription:setText( Engine.Localize( "TEST" ) )
	DoublePerkDescription:setTTF( "fonts/Entovo.ttf" )
	DoublePerkDescription:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	DoublePerkDescription:setShaderVector( 0, 0, 0, 0, 0 )
	DoublePerkDescription:setShaderVector( 1, 0, 0, 0, 0 )
	DoublePerkDescription:setShaderVector( 2, 0, 0, 0, 0 )
	DoublePerkDescription:setShaderVector( 3, 0, 0, 0, 0 )
	DoublePerkDescription:setShaderVector( 4, 0, 0, 0, 0 )
	DoublePerkDescription:setLetterSpacing( 0.5 )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DoublePerkDescription )
	self.DoublePerkDescription = DoublePerkDescription
	
	local SinglePerkDescription = LUI.UIText.new()
	SinglePerkDescription:setLeftRight( false, true, -500, -53 )
	SinglePerkDescription:setTopBottom( true, false, 20, 36 )
	SinglePerkDescription:setRGB( 1, 1, 1 )
	SinglePerkDescription:setAlpha( 0 )
	SinglePerkDescription:setText( Engine.Localize( "TEST" ) )
	SinglePerkDescription:setTTF( "fonts/Entovo.ttf" )
	SinglePerkDescription:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	SinglePerkDescription:setShaderVector( 0, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 1, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 2, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 3, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 4, 0, 0, 0, 0 )
	SinglePerkDescription:setLetterSpacing( 0.5 )
	SinglePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	SinglePerkDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SinglePerkDescription )
	self.SinglePerkDescription = SinglePerkDescription
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PerkImage1:completeAnimation()
				self.PerkImage1:setAlpha( 0 )
				self.clipFinished( PerkImage1, {} )
				PerkImage0:completeAnimation()
				self.PerkImage0:setAlpha( 0 )
				self.clipFinished( PerkImage0, {} )
				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setAlpha( 0 )
				self.clipFinished( DoublePerkDescription, {} )
				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setAlpha( 0 )
				self.clipFinished( SinglePerkDescription, {} )
			end
		},
		SinglePerk = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PerkImage1:completeAnimation()
				self.PerkImage1:setAlpha( 0 )
				self.clipFinished( PerkImage1, {} )
				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -50, 0 )
				self.PerkImage0:setTopBottom( true, false, 0, 50 )
				self.PerkImage0:setAlpha( 1 )
				self.clipFinished( PerkImage0, {} )
				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setAlpha( 0 )
				self.clipFinished( DoublePerkDescription, {} )
				SinglePerkDescription:completeAnimation()
				self.SinglePerkDescription:setAlpha( 1 )
				self.clipFinished( SinglePerkDescription, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DoublePerk = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PerkImage1:completeAnimation()
				self.PerkImage1:setAlpha( 1 )
				self.clipFinished( PerkImage1, {} )
				PerkImage0:completeAnimation()
				self.PerkImage0:setLeftRight( false, true, -103, -53 )
				self.PerkImage0:setTopBottom( true, false, -0, 50 )
				self.PerkImage0:setAlpha( 1 )
				self.clipFinished( PerkImage0, {} )
				DoublePerkDescription:completeAnimation()
				self.DoublePerkDescription:setAlpha( 1 )
				self.clipFinished( DoublePerkDescription, {} )
				SinglePerkDescription:completeAnimation()
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

