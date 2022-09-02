-- 50e5390a4561a3f9961ddbd2f1714a6c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setAlpha( 0.1 )
	self:addElement( bg )
	self.bg = bg
	
	local requirementDesc = LUI.UIText.new()
	requirementDesc:setLeftRight( false, true, -260, -6 )
	requirementDesc:setTopBottom( true, false, 44, 64 )
	requirementDesc:setTTF( "fonts/default.ttf" )
	requirementDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	requirementDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	requirementDesc:linkToElementModel( self, "unlockDescription", true, function ( model )
		local unlockDescription = Engine.GetModelValue( model )
		if unlockDescription then
			requirementDesc:setText( Engine.Localize( unlockDescription ) )
		end
	end )
	self:addElement( requirementDesc )
	self.requirementDesc = requirementDesc
	
	local completedTitle = LUI.UIText.new()
	completedTitle:setLeftRight( false, true, -260, 0 )
	completedTitle:setTopBottom( true, false, 7, 31 )
	completedTitle:setRGB( 0.97, 0.93, 0.07 )
	completedTitle:setAlpha( 0 )
	completedTitle:setText( Engine.Localize( "MENU_CAMO_COMPLETE" ) )
	completedTitle:setTTF( "fonts/default.ttf" )
	completedTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	completedTitle:setShaderVector( 0, 0.02, 0, 0, 0 )
	completedTitle:setShaderVector( 1, 0.06, 0, 0, 0 )
	completedTitle:setShaderVector( 2, 1, 0, 0, 0 )
	completedTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	completedTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( completedTitle )
	self.completedTitle = completedTitle
	
	local progressBarBg = LUI.UIImage.new()
	progressBarBg:setLeftRight( false, true, -260, -71 )
	progressBarBg:setTopBottom( false, true, -43.5, -29.5 )
	progressBarBg:setRGB( 0.17, 0.16, 0.16 )
	progressBarBg:setAlpha( 0.6 )
	self:addElement( progressBarBg )
	self.progressBarBg = progressBarBg
	
	local progressBar = LUI.UIImage.new()
	progressBar:setLeftRight( false, true, -260, -71 )
	progressBar:setTopBottom( false, true, -43.5, -29.5 )
	progressBar:setRGB( 0.97, 0.93, 0.07 )
	progressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progressBar:setShaderVector( 1, 0, 0, 0, 0 )
	progressBar:setShaderVector( 2, 1, 0, 0, 0 )
	progressBar:setShaderVector( 3, 0, 0, 0, 0 )
	progressBar:linkToElementModel( self, "unlockProgressAndTarget", true, function ( model )
		local unlockProgressAndTarget = Engine.GetModelValue( model )
		if unlockProgressAndTarget then
			progressBar:setShaderVector( 0, GetWeaponOptionProgressBar( controller, CoD.GetVectorComponentFromString( unlockProgressAndTarget, 1 ), CoD.GetVectorComponentFromString( unlockProgressAndTarget, 2 ), CoD.GetVectorComponentFromString( unlockProgressAndTarget, 3 ), CoD.GetVectorComponentFromString( unlockProgressAndTarget, 4 ) ) )
		end
	end )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local progressText = LUI.UIText.new()
	progressText:setLeftRight( false, true, -60, 0 )
	progressText:setTopBottom( false, true, -49, -24 )
	progressText:setTTF( "fonts/default.ttf" )
	progressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	progressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	progressText:linkToElementModel( self, "unlockProgressAndTarget", true, function ( model )
		local unlockProgressAndTarget = Engine.GetModelValue( model )
		if unlockProgressAndTarget then
			progressText:setText( Engine.Localize( GetWeaponOptionProgressText( controller, unlockProgressAndTarget ) ) )
		end
	end )
	self:addElement( progressText )
	self.progressText = progressText
	
	local camoName = CoD.WeaponNameWidget.new( menu, controller )
	camoName:setLeftRight( true, false, 7, 260 )
	camoName:setTopBottom( true, false, 4, 38 )
	camoName.weaponNameLabel:setText( Engine.Localize( "MENU_CAMO_REQUIREMENTS" ) )
	self:addElement( camoName )
	self.camoName = camoName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				requirementDesc:completeAnimation()
				self.requirementDesc:setLeftRight( false, true, -317.5, -5 )
				self.requirementDesc:setTopBottom( true, false, 33.5, 53.5 )
				self.requirementDesc:setAlpha( 1 )
				self.clipFinished( requirementDesc, {} )

				completedTitle:completeAnimation()
				self.completedTitle:setAlpha( 0 )
				self.clipFinished( completedTitle, {} )

				progressBarBg:completeAnimation()
				self.progressBarBg:setAlpha( 0.6 )
				self.clipFinished( progressBarBg, {} )

				progressBar:completeAnimation()
				self.progressBar:setAlpha( 1 )
				self.clipFinished( progressBar, {} )

				progressText:completeAnimation()
				self.progressText:setAlpha( 1 )
				self.clipFinished( progressText, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				requirementDesc:completeAnimation()
				self.requirementDesc:setAlpha( 0 )
				self.clipFinished( requirementDesc, {} )

				completedTitle:completeAnimation()
				self.completedTitle:setAlpha( 0 )
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
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				requirementDesc:completeAnimation()
				self.requirementDesc:setLeftRight( false, true, -317.5, -5 )
				self.requirementDesc:setTopBottom( true, false, 53.5, 73.5 )
				self.requirementDesc:setAlpha( 1 )
				self.clipFinished( requirementDesc, {} )

				completedTitle:completeAnimation()
				self.completedTitle:setLeftRight( false, true, -317.5, -5 )
				self.completedTitle:setTopBottom( true, false, 25.5, 49.5 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.camoName:close()
		element.requirementDesc:close()
		element.progressBar:close()
		element.progressText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

