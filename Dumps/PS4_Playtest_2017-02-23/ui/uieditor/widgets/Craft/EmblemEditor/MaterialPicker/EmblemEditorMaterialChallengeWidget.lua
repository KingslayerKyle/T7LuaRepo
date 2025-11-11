require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

CoD.EmblemEditorMaterialChallengeWidget = InheritFrom( LUI.UIElement )
CoD.EmblemEditorMaterialChallengeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorMaterialChallengeWidget )
	self.id = "EmblemEditorMaterialChallengeWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 399 )
	self:setTopBottom( 0, 0, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 1, 0, 0 )
	bg:setTopBottom( 0, 1, 0, 0 )
	bg:setAlpha( 0.1 )
	self:addElement( bg )
	self.bg = bg
	
	local requirementDesc = LUI.UIText.new()
	requirementDesc:setLeftRight( 1, 1, -390, -9 )
	requirementDesc:setTopBottom( 0, 0, 66, 96 )
	requirementDesc:setTTF( "fonts/default.ttf" )
	requirementDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	requirementDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	requirementDesc:linkToElementModel( self, "unlockDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			requirementDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( requirementDesc )
	self.requirementDesc = requirementDesc
	
	local completedTitle = LUI.UIText.new()
	completedTitle:setLeftRight( 1, 1, -390, 0 )
	completedTitle:setTopBottom( 0, 0, 10, 46 )
	completedTitle:setRGB( 0.97, 0.93, 0.07 )
	completedTitle:setAlpha( 0 )
	completedTitle:setText( Engine.Localize( "MENU_CAMO_COMPLETE" ) )
	completedTitle:setTTF( "fonts/default.ttf" )
	completedTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	completedTitle:setShaderVector( 0, 0.02, 0, 0, 0 )
	completedTitle:setShaderVector( 1, 0.06, 0, 0, 0 )
	completedTitle:setShaderVector( 2, 1, 0, 0, 0 )
	completedTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	completedTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( completedTitle )
	self.completedTitle = completedTitle
	
	local progressBarBg = LUI.UIImage.new()
	progressBarBg:setLeftRight( 1, 1, -390, -106 )
	progressBarBg:setTopBottom( 1, 1, -65, -44 )
	progressBarBg:setRGB( 0.17, 0.16, 0.16 )
	progressBarBg:setAlpha( 0.6 )
	self:addElement( progressBarBg )
	self.progressBarBg = progressBarBg
	
	local progressBar = LUI.UIImage.new()
	progressBar:setLeftRight( 1, 1, -390, -106 )
	progressBar:setTopBottom( 1, 1, -65, -44 )
	progressBar:setRGB( 0.97, 0.93, 0.07 )
	progressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progressBar:setShaderVector( 1, 0, 0, 0, 0 )
	progressBar:setShaderVector( 2, 1, 0, 0, 0 )
	progressBar:setShaderVector( 3, 0, 0, 0, 0 )
	progressBar:setShaderVector( 4, 0, 0, 0, 0 )
	progressBar:linkToElementModel( self, "unlockProgressAndTarget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressBar:setShaderVector( 0, GetWeaponOptionProgressBar( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local progressText = LUI.UIText.new()
	progressText:setLeftRight( 1, 1, -90, 0 )
	progressText:setTopBottom( 1, 1, -74, -36 )
	progressText:setTTF( "fonts/default.ttf" )
	progressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	progressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	progressText:linkToElementModel( self, "unlockProgressAndTarget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progressText:setText( Engine.Localize( GetWeaponOptionProgressText( controller, modelValue ) ) )
		end
	end )
	self:addElement( progressText )
	self.progressText = progressText
	
	local camoName = CoD.WeaponNameWidget.new( menu, controller )
	camoName:setLeftRight( 0, 0, 10, 390 )
	camoName:setTopBottom( 0, 0, 6.5, 57.5 )
	camoName.weaponNameLabel:setText( Engine.Localize( "MENU_CAMO_REQUIREMENTS" ) )
	self:addElement( camoName )
	self.camoName = camoName
	
	self.resetProperties = function ()
		requirementDesc:completeAnimation()
		progressBarBg:completeAnimation()
		progressBar:completeAnimation()
		progressText:completeAnimation()
		completedTitle:completeAnimation()
		requirementDesc:setLeftRight( 1, 1, -390, -9 )
		requirementDesc:setTopBottom( 0, 0, 66, 96 )
		requirementDesc:setAlpha( 1 )
		progressBarBg:setAlpha( 0.6 )
		progressBar:setAlpha( 1 )
		progressText:setAlpha( 1 )
		completedTitle:setLeftRight( 1, 1, -390, 0 )
		completedTitle:setTopBottom( 0, 0, 10, 46 )
		completedTitle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				requirementDesc:completeAnimation()
				self.requirementDesc:setLeftRight( 1, 1, -476, -7 )
				self.requirementDesc:setTopBottom( 0, 0, 50, 80 )
				self.clipFinished( requirementDesc, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				requirementDesc:completeAnimation()
				self.requirementDesc:setAlpha( 0 )
				self.clipFinished( requirementDesc, {} )
				progressBarBg:completeAnimation()
				self.progressBarBg:setAlpha( 0 )
				self.clipFinished( progressBarBg, {} )
				progressBar:completeAnimation()
				self.progressBar:setAlpha( 0 )
				self.clipFinished( progressBar, {} )
				progressText:completeAnimation()
				self.progressText:setAlpha( 0 )
				self.clipFinished( progressText, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				requirementDesc:completeAnimation()
				self.requirementDesc:setLeftRight( 1, 1, -476, -7 )
				self.requirementDesc:setTopBottom( 0, 0, 80, 110 )
				self.clipFinished( requirementDesc, {} )
				completedTitle:completeAnimation()
				self.completedTitle:setLeftRight( 1, 1, -476.5, -7.5 )
				self.completedTitle:setTopBottom( 0, 0, 38, 74 )
				self.completedTitle:setAlpha( 1 )
				self.clipFinished( completedTitle, {} )
				progressBarBg:completeAnimation()
				self.progressBarBg:setAlpha( 0 )
				self.clipFinished( progressBarBg, {} )
				progressBar:completeAnimation()
				self.progressBar:setAlpha( 0 )
				self.clipFinished( progressBar, {} )
				progressText:completeAnimation()
				self.progressText:setAlpha( 0 )
				self.clipFinished( progressText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.camoName:close()
		self.requirementDesc:close()
		self.progressBar:close()
		self.progressText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

