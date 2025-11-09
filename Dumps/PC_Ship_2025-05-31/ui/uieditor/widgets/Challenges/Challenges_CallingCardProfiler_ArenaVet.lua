require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )

CoD.Challenges_CallingCardProfiler_ArenaVet = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler_ArenaVet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler_ArenaVet )
	self.id = "Challenges_CallingCardProfiler_ArenaVet"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 484 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, false, 1, 92 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( true, true, 3, -2 )
	SelectedCardIcon:setTopBottom( true, false, 3, 89 )
	SelectedCardIcon:linkToElementModel( self, "iconId", true, function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( true, false, 20, 338 )
	CardDescription:setTopBottom( true, false, 141, 161 )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			CardDescription:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local ArenaVetIcon = LUI.UIImage.new()
	ArenaVetIcon:setLeftRight( true, false, 19, 147 )
	ArenaVetIcon:setTopBottom( true, false, 249, 377 )
	ArenaVetIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_arena_seasonvet" ) )
	self:addElement( ArenaVetIcon )
	self.ArenaVetIcon = ArenaVetIcon
	
	local ArenaVetTitle = LUI.UIText.new()
	ArenaVetTitle:setLeftRight( true, false, 20, 329 )
	ArenaVetTitle:setTopBottom( false, true, -124, -90 )
	ArenaVetTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ARENAVET" ) )
	ArenaVetTitle:setTTF( "fonts/escom.ttf" )
	ArenaVetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ArenaVetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaVetTitle )
	self.ArenaVetTitle = ArenaVetTitle
	
	local ArenaVetDescription = LUI.UIText.new()
	ArenaVetDescription:setLeftRight( true, true, 20, -24 )
	ArenaVetDescription:setTopBottom( false, true, -84, -64 )
	ArenaVetDescription:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_ARENAVET_HINT" ) )
	ArenaVetDescription:setTTF( "fonts/default.ttf" )
	ArenaVetDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ArenaVetDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ArenaVetDescription )
	self.ArenaVetDescription = ArenaVetDescription
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 19, 337.5 )
	EmblemName:setTopBottom( true, false, 103, 137 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			EmblemName.weaponNameLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, false, 20.5, 327 )
	ProgressBar:setTopBottom( true, false, 195.5, 207.5 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:linkToElementModel( self, "statPercent", true, function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( true, true, 19, -23 )
	ProgressBarBorder:setTopBottom( true, false, 195.5, 207.5 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressFraction = LUI.UITightText.new()
	ProgressFraction:setLeftRight( true, false, 20.5, 46.5 )
	ProgressFraction:setTopBottom( true, false, 216.5, 236.5 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 175, 179 )
	featlineleft:setTopBottom( true, false, 63, 422 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( true, false, 175, 179 )
	featlineleft1:setTopBottom( true, false, 8, 367 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 1, 349 )
	TitleBg:setTopBottom( true, false, 32.5, 62.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( true, false, 175, 179 )
	featlineleft0:setTopBottom( true, false, -118, 241 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( true, false, 161, 193 )
	LockedIcon:setTopBottom( true, false, 31.95, 63.95 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( true, false, 175, 179 )
	featlineleft000:setTopBottom( true, false, -147, 212 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 1, 93.25 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )
				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )
				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )
				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )
				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 1 )
				self.clipFinished( featlineleft, {} )
				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 1 )
				self.clipFinished( featlineleft1, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setLeftRight( true, false, 175, 179 )
				self.featlineleft0:setTopBottom( true, false, -117, 242 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )
				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )
				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setLeftRight( true, false, 175, 179 )
				self.featlineleft0:setTopBottom( true, false, -117, 242 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and not IsSelfModelValueTrue( element, controller, "hideProgress" )
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "hideProgress" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	self:linkToElementModel( self, "hideProgress", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideProgress"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.BoxButtonLrgInactive:close()
		element.EmblemName:close()
		element.ProgressBarBorder:close()
		element.LockedIcon:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.SelectedCardIcon:close()
		element.CardDescription:close()
		element.ProgressBar:close()
		element.ProgressFraction:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

