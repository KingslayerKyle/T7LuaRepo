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
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 360 )
	
	local BorderBakedSolid = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid:setLeftRight( true, false, 0, 220 )
	BorderBakedSolid:setTopBottom( true, false, 0, 360 )
	self:addElement( BorderBakedSolid )
	self.BorderBakedSolid = BorderBakedSolid
	
	local TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle:setLeftRight( true, false, 10, 210 )
	TeamLogoTitle:setTopBottom( true, false, 19.5, 41.5 )
	TeamLogoTitle:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM1_LOGO" ) )
	TeamLogoTitle:setTTF( "fonts/default.ttf" )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamLogoImage = LUI.UIImage.new()
	TeamLogoImage:setLeftRight( false, false, -102, 102 )
	TeamLogoImage:setTopBottom( false, false, -123, 5 )
	TeamLogoImage:linkToElementModel( self, "teamLogo", true, function ( model )
		local teamLogo = Engine.GetModelValue( model )
		if teamLogo then
			TeamLogoImage:setImage( RegisterImage( teamLogo ) )
		end
	end )
	self:addElement( TeamLogoImage )
	self.TeamLogoImage = TeamLogoImage
	
	local TeamNameTitle = LUI.UIText.new()
	TeamNameTitle:setLeftRight( true, false, 10, 210 )
	TeamNameTitle:setTopBottom( true, false, 199.5, 221.5 )
	TeamNameTitle:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM1_NAME" ) )
	TeamNameTitle:setTTF( "fonts/default.ttf" )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamNameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameText = LUI.UIText.new()
	TeamNameText:setLeftRight( true, false, 10, 210 )
	TeamNameText:setTopBottom( true, false, 229.5, 259.5 )
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
	TeamColorTitle:setLeftRight( true, false, 10, 210 )
	TeamColorTitle:setTopBottom( true, false, 277.5, 299.5 )
	TeamColorTitle:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
	TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM1_COLOR" ) )
	TeamColorTitle:setTTF( "fonts/default.ttf" )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeamColorTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamColorImage = LUI.UIImage.new()
	TeamColorImage:setLeftRight( true, false, 10, 210 )
	TeamColorImage:setTopBottom( true, false, 310.5, 340.5 )
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
				self:setupElementClipCounter( 7 )
				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid, {} )
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
				self:setupElementClipCounter( 7 )
				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid, {} )
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
		element.BorderBakedSolid:close()
		element.TeamLogoImage:close()
		element.TeamNameText:close()
		element.TeamColorImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

