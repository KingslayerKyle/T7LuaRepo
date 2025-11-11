require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Challenges_CallingCardProfiler_DarkOps = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler_DarkOps.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler_DarkOps )
	self.id = "Challenges_CallingCardProfiler_DarkOps"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 726 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( 0, 0, 2, 138 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( 0, 1, 5, -3 )
	SelectedCardIcon:setTopBottom( 0, 0, 5, 134 )
	SelectedCardIcon:linkToElementModel( self, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( 0, 0, 30, 507 )
	CardDescription:setTopBottom( 0, 0, 211, 241 )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local DarkOpsIcon = LUI.UIImage.new()
	DarkOpsIcon:setLeftRight( 0, 0, -6, 255 )
	DarkOpsIcon:setTopBottom( 0, 0, 281, 542 )
	DarkOpsIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_darkops" ) )
	self:addElement( DarkOpsIcon )
	self.DarkOpsIcon = DarkOpsIcon
	
	local DarkOpsTitle = LUI.UIText.new()
	DarkOpsTitle:setLeftRight( 0, 0, 30, 494 )
	DarkOpsTitle:setTopBottom( 1, 1, -186, -135 )
	DarkOpsTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	DarkOpsTitle:setTTF( "fonts/escom.ttf" )
	DarkOpsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DarkOpsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DarkOpsTitle )
	self.DarkOpsTitle = DarkOpsTitle
	
	local DarkOpsDescription = LUI.UIText.new()
	DarkOpsDescription:setLeftRight( 0, 1, 30.5, -35.5 )
	DarkOpsDescription:setTopBottom( 1, 1, -126, -96 )
	DarkOpsDescription:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS_HINT" ) )
	DarkOpsDescription:setTTF( "fonts/default.ttf" )
	DarkOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DarkOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DarkOpsDescription )
	self.DarkOpsDescription = DarkOpsDescription
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 28, 506 )
	EmblemName:setTopBottom( 0, 0, 154.5, 205.5 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( 0, 0, 263, 269 )
	featlineleft1:setTopBottom( 0, 0, 12, 550 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 0, 1, 523 )
	TitleBg:setTopBottom( 0, 0, 49, 94 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( 0, 0, 263, 269 )
	featlineleft0:setTopBottom( 0, 0, -177, 361 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( 0, 0, 242, 290 )
	LockedIcon:setTopBottom( 0, 0, 48, 96 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 0, 0, 263, 269 )
	featlineleft000:setTopBottom( 0, 0, -220, 318 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 0, 2, 140 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.resetProperties = function ()
		LockedIcon:completeAnimation()
		featlineleft000:completeAnimation()
		featlineleft0:completeAnimation()
		TitleBg:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		SelectedCardIcon:completeAnimation()
		LockedIcon:setAlpha( 1 )
		featlineleft000:setAlpha( 1 )
		featlineleft0:setLeftRight( 0, 0, 263, 269 )
		featlineleft0:setTopBottom( 0, 0, -177, 361 )
		featlineleft0:setAlpha( 1 )
		TitleBg:setAlpha( 0.4 )
		BoxButtonLrgInactiveDiag:setAlpha( 1 )
		SelectedCardIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setLeftRight( 0, 0, 263, 269 )
				self.featlineleft0:setTopBottom( 0, 0, -175, 363 )
				self.clipFinished( featlineleft0, {} )
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
				return IsSelfModelValueTrue( element, controller, "isLocked" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.BoxButtonLrgInactive:close()
		self.EmblemName:close()
		self.LockedIcon:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.SelectedCardIcon:close()
		self.CardDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

