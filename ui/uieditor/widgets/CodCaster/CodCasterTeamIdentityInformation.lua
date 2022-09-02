-- edac54983a3baa7edcf5e47d90ac62e4
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 456 )
	self:setTopBottom( true, false, 0, 183 )
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, false, 4, 213 )
	BorderBakedSolid0:setTopBottom( true, false, 36.5, 170 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( true, false, 239, 448 )
	BorderBakedSolid00:setTopBottom( true, false, 36.5, 69.5 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local BorderBakedSolid1 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid1:setLeftRight( true, false, 239, 448 )
	BorderBakedSolid1:setTopBottom( true, false, 111, 143.5 )
	self:addElement( BorderBakedSolid1 )
	self.BorderBakedSolid1 = BorderBakedSolid1
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( true, false, 6, 205 )
	TeamLogoTitle:setTopBottom( true, false, 13.5, 33.5 )
	TeamLogoTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM1_LOGO" ) ) )
	TeamLogoTitle:setTTF( "fonts/escom.ttf" )
	TeamLogoTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamLogoTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamLogoTitle:setLetterSpacing( 1 )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamLogoImage = LUI.UIImage.new()
	TeamLogoImage:setLeftRight( true, false, 6, 210 )
	TeamLogoImage:setTopBottom( true, false, 38.5, 166.5 )
	TeamLogoImage:linkToElementModel( self, "teamLogo", true, function ( model )
		local teamLogo = Engine.GetModelValue( model )
		if teamLogo then
			TeamLogoImage:setImage( RegisterImage( teamLogo ) )
		end
	end )
	self:addElement( TeamLogoImage )
	self.TeamLogoImage = TeamLogoImage
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( true, false, 241, 441 )
	TeamNameTitle:setTopBottom( true, false, 13.5, 33.5 )
	TeamNameTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM1_NAME" ) ) )
	TeamNameTitle:setTTF( "fonts/escom.ttf" )
	TeamNameTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamNameTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamNameTitle:setLetterSpacing( 1 )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameText = LUI.UIText.new()
	TeamNameText:setLeftRight( true, false, 249, 441 )
	TeamNameText:setTopBottom( true, false, 40.5, 64.5 )
	TeamNameText:setTTF( "fonts/default.ttf" )
	TeamNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TeamNameText:linkToElementModel( self, "teamName", true, function ( model )
		local teamName = Engine.GetModelValue( model )
		if teamName then
			TeamNameText:setText( Engine.Localize( teamName ) )
		end
	end )
	self:addElement( TeamNameText )
	self.TeamNameText = TeamNameText
	
	local TeamColorTitle = LUI.UIText.new()
	TeamColorTitle:setLeftRight( true, false, 241, 441 )
	TeamColorTitle:setTopBottom( true, false, 87.5, 107.5 )
	TeamColorTitle:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM1_COLOR" ) ) )
	TeamColorTitle:setTTF( "fonts/escom.ttf" )
	TeamColorTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TeamColorTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamColorTitle:setLetterSpacing( 1 )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorImage = LUI.UIImage.new()
	TeamColorImage:setLeftRight( true, false, 242, 445 )
	TeamColorImage:setTopBottom( true, false, 113, 141 )
	TeamColorImage:setAlpha( 0.6 )
	TeamColorImage:linkToElementModel( self, "teamColor", true, function ( model )
		local teamColor = Engine.GetModelValue( model )
		if teamColor then
			TeamColorImage:setRGB( teamColor )
		end
	end )
	self:addElement( TeamColorImage )
	self.TeamColorImage = TeamColorImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				TeamLogoTitle:completeAnimation()
				self.TeamLogoTitle:setAlpha( 1 )
				self.clipFinished( TeamLogoTitle, {} )

				TeamLogoImage:completeAnimation()
				self.TeamLogoImage:setAlpha( 1 )
				self.clipFinished( TeamLogoImage, {} )

				TeamNameTitle:completeAnimation()
				self.TeamNameTitle:setAlpha( 1 )
				self.clipFinished( TeamNameTitle, {} )

				TeamNameText:completeAnimation()
				self.TeamNameText:setAlpha( 1 )
				self.clipFinished( TeamNameText, {} )

				TeamColorTitle:completeAnimation()
				self.TeamColorTitle:setAlpha( 1 )
				self.clipFinished( TeamColorTitle, {} )

				TeamColorImage:completeAnimation()
				self.TeamColorImage:setAlpha( 1 )
				self.clipFinished( TeamColorImage, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid0:close()
		element.BorderBakedSolid00:close()
		element.BorderBakedSolid1:close()
		element.TeamLogoImage:close()
		element.TeamNameText:close()
		element.TeamColorImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

