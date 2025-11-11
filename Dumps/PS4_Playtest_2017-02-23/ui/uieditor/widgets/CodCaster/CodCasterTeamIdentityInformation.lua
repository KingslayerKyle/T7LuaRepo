require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.CodCasterTeamIdentityInformation = InheritFrom( LUI.UIElement )
CoD.CodCasterTeamIdentityInformation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterTeamIdentityInformation )
	self.id = "CodCasterTeamIdentityInformation"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 684 )
	self:setTopBottom( 0, 0, 0, 274 )
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 0, 6, 320 )
	BorderBakedSolid0:setTopBottom( 0, 0, 55, 255 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( 0, 0, 358, 672 )
	BorderBakedSolid00:setTopBottom( 0, 0, 55, 105 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid1:setLeftRight( 0, 0, 358, 672 )
	BorderBakedSolid1:setTopBottom( 0, 0, 166, 215 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( 0, 0, 9, 307 )
	TeamLogoTitle:setTopBottom( 0, 0, 20, 50 )
	TeamLogoTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_LOGO" ) )
	TeamLogoTitle:setTTF( "fonts/escom.ttf" )
	TeamLogoTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamLogoTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamLogoTitle:setLetterSpacing( 1 )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamLogoImage = LUI.UIImage.new()
	TeamLogoImage:setLeftRight( 0, 0, 9, 315 )
	TeamLogoImage:setTopBottom( 0, 0, 58, 250 )
	TeamLogoImage:linkToElementModel( self, "teamLogo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamLogoImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TeamLogoImage )
	self.TeamLogoImage = TeamLogoImage
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( 0, 0, 362, 662 )
	TeamNameTitle:setTopBottom( 0, 0, 20, 50 )
	TeamNameTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_NAME" ) )
	TeamNameTitle:setTTF( "fonts/escom.ttf" )
	TeamNameTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamNameTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamNameTitle:setLetterSpacing( 1 )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameText = LUI.UIText.new()
	TeamNameText:setLeftRight( 0, 0, 374, 662 )
	TeamNameText:setTopBottom( 0, 0, 61, 97 )
	TeamNameText:setTTF( "fonts/default.ttf" )
	TeamNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TeamNameText:linkToElementModel( self, "teamName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamNameText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TeamNameText )
	self.TeamNameText = TeamNameText
	
	local TeamColorTitle = LUI.UIText.new()
	TeamColorTitle:setLeftRight( 0, 0, 362, 662 )
	TeamColorTitle:setTopBottom( 0, 0, 131, 161 )
	TeamColorTitle:setText( LocalizeToUpperString( "CODCASTER_TEAM1_COLOR" ) )
	TeamColorTitle:setTTF( "fonts/escom.ttf" )
	TeamColorTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TeamColorTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamColorTitle:setLetterSpacing( 1 )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorImage = LUI.UIImage.new()
	TeamColorImage:setLeftRight( 0, 0, 363, 667 )
	TeamColorImage:setTopBottom( 0, 0, 169, 211 )
	TeamColorImage:setAlpha( 0.6 )
	TeamColorImage:linkToElementModel( self, "teamColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TeamColorImage:setRGB( modelValue )
		end
	end )
	self:addElement( TeamColorImage )
	self.TeamColorImage = TeamColorImage
	
	self.resetProperties = function ()
		TeamColorImage:completeAnimation()
		TeamColorTitle:completeAnimation()
		TeamNameText:completeAnimation()
		TeamNameTitle:completeAnimation()
		TeamLogoImage:completeAnimation()
		TeamLogoTitle:completeAnimation()
		TeamColorImage:setAlpha( 0.6 )
		TeamColorTitle:setAlpha( 1 )
		TeamNameText:setAlpha( 1 )
		TeamNameTitle:setAlpha( 1 )
		TeamLogoImage:setAlpha( 1 )
		TeamLogoTitle:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TeamColorImage:completeAnimation()
				self.TeamColorImage:setAlpha( 1 )
				self.clipFinished( TeamColorImage, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				TeamLogoTitle:completeAnimation()
				self.TeamLogoTitle:setAlpha( 0 )
				self.clipFinished( TeamLogoTitle, {} )
				TeamLogoImage:completeAnimation()
				self.TeamLogoImage:setAlpha( 0 )
				self.clipFinished( TeamLogoImage, {} )
				TeamNameTitle:completeAnimation()
				self.TeamNameTitle:setAlpha( 0 )
				self.clipFinished( TeamNameTitle, {} )
				TeamNameText:completeAnimation()
				self.TeamNameText:setAlpha( 0 )
				self.clipFinished( TeamNameText, {} )
				TeamColorTitle:completeAnimation()
				self.TeamColorTitle:setAlpha( 0 )
				self.clipFinished( TeamColorTitle, {} )
				TeamColorImage:completeAnimation()
				self.TeamColorImage:setAlpha( 0 )
				self.clipFinished( TeamColorImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedSolid0:close()
		self.BorderBakedSolid00:close()
		self.BorderBakedSolid1:close()
		self.TeamLogoImage:close()
		self.TeamNameText:close()
		self.TeamColorImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

