CoD.MissionRecordVault_ChallengeSelectedInfo = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ChallengeSelectedInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ChallengeSelectedInfo )
	self.id = "MissionRecordVault_ChallengeSelectedInfo"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 257 )
	self:setTopBottom( true, false, 0, 469 )
	
	local selectedImage = LUI.UIImage.new()
	selectedImage:setLeftRight( true, false, 12, 244 )
	selectedImage:setTopBottom( true, false, 0, 232 )
	selectedImage:setRGB( 1, 1, 1 )
	selectedImage:setAlpha( 0 )
	selectedImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	selectedImage:linkToElementModel( self, "challengeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( selectedImage )
	self.selectedImage = selectedImage
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1, 41 )
	Image0:setTopBottom( false, true, -40, 0 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Image0:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 42, 257 )
	TextBox0:setTopBottom( true, false, 436, 462 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "rewardName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 1, 256 )
	TextBox1:setTopBottom( true, false, 240, 276 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox1:linkToElementModel( self, "challengeName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 1, 256 )
	TextBox2:setTopBottom( true, false, 276, 301 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox2:linkToElementModel( self, "challengeDetails", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 256 )
	Image1:setTopBottom( true, false, 352, 374 )
	Image1:setRGB( 0.75, 0.75, 0.75 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 256 )
	Image2:setTopBottom( true, false, 374, 420 )
	Image2:setRGB( 0.37, 0.37, 0.37 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 4, 252 )
	Image3:setTopBottom( true, false, 376, 418 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 1, 256 )
	TextBox3:setTopBottom( true, false, 352, 374 )
	TextBox3:setRGB( 0, 0, 0 )
	TextBox3:setAlpha( 0 )
	TextBox3:setText( Engine.Localize( "Your Best" ) )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 1, 256 )
	TextBox4:setTopBottom( true, false, 380.5, 413.5 )
	TextBox4:setRGB( 1, 1, 1 )
	TextBox4:setTTF( "fonts/default.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox4:linkToElementModel( self, "challengeProgressQuantity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox4:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local yellowstar = LUI.UIImage.new()
	yellowstar:setLeftRight( true, false, 205, 252 )
	yellowstar:setTopBottom( true, false, 0, 47 )
	yellowstar:setRGB( 1, 1, 1 )
	yellowstar:setAlpha( 0 )
	yellowstar:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	yellowstar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( yellowstar )
	self.yellowstar = yellowstar
	
	local centerTextWhite = LUI.UITightText.new()
	centerTextWhite:setLeftRight( false, false, -59.5, 58.5 )
	centerTextWhite:setTopBottom( true, false, 89, 151 )
	centerTextWhite:setRGB( 1, 1, 1 )
	centerTextWhite:setTTF( "fonts/agencyr.ttf" )
	centerTextWhite:linkToElementModel( self, "centerTextWhite", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			centerTextWhite:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( centerTextWhite )
	self.centerTextWhite = centerTextWhite
	
	local centerTextBlack = LUI.UITightText.new()
	centerTextBlack:setLeftRight( false, false, -59.5, 58.5 )
	centerTextBlack:setTopBottom( true, false, 89, 151 )
	centerTextBlack:setRGB( 0, 0, 0 )
	centerTextBlack:setTTF( "fonts/agencyr.ttf" )
	centerTextBlack:linkToElementModel( self, "centerTextBlack", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			centerTextBlack:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( centerTextBlack )
	self.centerTextBlack = centerTextBlack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				selectedImage:completeAnimation()
				self.selectedImage:setRGB( 1, 0.88, 0 )
				self.selectedImage:setAlpha( 1 )
				self.clipFinished( selectedImage, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setRGB( 1, 0.88, 0 )
				self.clipFinished( TextBox0, {} )
				Image1:completeAnimation()
				self.Image1:setRGB( 1, 0.88, 0 )
				self.clipFinished( Image1, {} )
				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 1 )
				self.clipFinished( TextBox3, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 1 )
				self.clipFinished( yellowstar, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setRGB( 1, 0.88, 0 )
				self.clipFinished( centerTextWhite, {} )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 0 )
				self.clipFinished( selectedImage, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 0 )
				self.clipFinished( TextBox3, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 0 )
				self.clipFinished( yellowstar, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				selectedImage:completeAnimation()
				self.selectedImage:setRGB( 1, 1, 1 )
				self.selectedImage:setAlpha( 1 )
				self.clipFinished( selectedImage, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setRGB( 1, 1, 1 )
				self.clipFinished( TextBox0, {} )
				Image1:completeAnimation()
				self.Image1:setRGB( 0.75, 0.75, 0.75 )
				self.clipFinished( Image1, {} )
				TextBox3:completeAnimation()
				self.TextBox3:setAlpha( 1 )
				self.clipFinished( TextBox3, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 0 )
				self.clipFinished( yellowstar, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setLeftRight( false, false, -59.5, 58.5 )
				self.centerTextWhite:setTopBottom( true, false, 89, 151 )
				self.centerTextWhite:setRGB( 1, 1, 1 )
				self.clipFinished( centerTextWhite, {} )
				centerTextBlack:completeAnimation()
				self.centerTextBlack:setLeftRight( false, false, -59.5, 58.5 )
				self.centerTextBlack:setTopBottom( true, false, 89, 151 )
				self.clipFinished( centerTextBlack, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "challengeImage" )
			end
		},
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "challengeImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "challengeImage"
		} )
	end )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self.close = function ( self )
		self.selectedImage:close()
		self.Image0:close()
		self.TextBox0:close()
		self.TextBox1:close()
		self.TextBox2:close()
		self.TextBox4:close()
		self.centerTextWhite:close()
		self.centerTextBlack:close()
		CoD.MissionRecordVault_ChallengeSelectedInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

