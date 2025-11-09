require( "ui.uieditor.widgets.BorderThin" )

CoD.MissionRecordVault_ChallengeRow = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ChallengeRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ChallengeRow )
	self.id = "MissionRecordVault_ChallengeRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 125 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local missionRecordRowBG = LUI.UIImage.new()
	missionRecordRowBG:setLeftRight( true, true, 3, -3 )
	missionRecordRowBG:setTopBottom( false, true, -21, -3 )
	missionRecordRowBG:setRGB( 0.16, 0.16, 0.16 )
	missionRecordRowBG:setAlpha( 0.7 )
	missionRecordRowBG:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( missionRecordRowBG )
	self.missionRecordRowBG = missionRecordRowBG
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -50, 50 )
	image:setTopBottom( true, false, 4, 104 )
	image:setRGB( 1, 0.88, 0 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "challengeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local BorderThin = CoD.BorderThin.new( menu, controller )
	BorderThin:setLeftRight( true, true, 2, -2 )
	BorderThin:setTopBottom( true, true, 2, -2 )
	BorderThin:setRGB( 1, 1, 1 )
	self:addElement( BorderThin )
	self.BorderThin = BorderThin
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, true, 3, -3 )
	Name:setTopBottom( true, false, 104, 122 )
	Name:setRGB( 1, 1, 1 )
	Name:setTTF( "fonts/default.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "challengeName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local centerTextBlack = LUI.UITightText.new()
	centerTextBlack:setLeftRight( false, false, -18, 18 )
	centerTextBlack:setTopBottom( true, false, 37, 73 )
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
	
	local centerTextWhite = LUI.UITightText.new()
	centerTextWhite:setLeftRight( false, false, -18, 18 )
	centerTextWhite:setTopBottom( true, false, 37, 73 )
	centerTextWhite:setRGB( 1, 0.88, 0 )
	centerTextWhite:setTTF( "fonts/agencyr.ttf" )
	centerTextWhite:linkToElementModel( self, "centerTextWhite", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			centerTextWhite:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( centerTextWhite )
	self.centerTextWhite = centerTextWhite
	
	local yellowstar = LUI.UIImage.new()
	yellowstar:setLeftRight( true, false, 163, 197 )
	yellowstar:setTopBottom( true, false, 2, 36 )
	yellowstar:setRGB( 1, 1, 1 )
	yellowstar:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	yellowstar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( yellowstar )
	self.yellowstar = yellowstar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.88, 0 )
				self.clipFinished( image, {} )
				BorderThin:completeAnimation()
				self.BorderThin:setRGB( 1, 1, 1 )
				self.clipFinished( BorderThin, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setRGB( 1, 0.88, 0 )
				self.clipFinished( centerTextWhite, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 1 )
				self.clipFinished( yellowstar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.88, 0 )
				self.clipFinished( image, {} )
				BorderThin:completeAnimation()
				self.BorderThin:setRGB( 1, 0.41, 0 )
				self.clipFinished( BorderThin, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setRGB( 1, 0.88, 0 )
				self.clipFinished( centerTextWhite, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 1 )
				self.clipFinished( yellowstar, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
				BorderThin:completeAnimation()
				self.BorderThin:setRGB( 1, 1, 1 )
				self.clipFinished( BorderThin, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setRGB( 1, 1, 1 )
				self.clipFinished( centerTextWhite, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 0 )
				self.clipFinished( yellowstar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
				BorderThin:completeAnimation()
				self.BorderThin:setRGB( 1, 0.41, 0 )
				self.clipFinished( BorderThin, {} )
				centerTextWhite:completeAnimation()
				self.centerTextWhite:setRGB( 1, 1, 1 )
				self.clipFinished( centerTextWhite, {} )
				yellowstar:completeAnimation()
				self.yellowstar:setAlpha( 0 )
				self.clipFinished( yellowstar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self.close = function ( self )
		self.BorderThin:close()
		self.image:close()
		self.Name:close()
		self.centerTextBlack:close()
		self.centerTextWhite:close()
		CoD.MissionRecordVault_ChallengeRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

