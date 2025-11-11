require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Challenges_MasterCallingCardWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_MasterCallingCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MasterCallingCardWidget )
	self.id = "Challenges_MasterCallingCardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1131 )
	self:setTopBottom( 0, 0, 0, 147 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 1, 1, -507, -12 )
	BoxButtonLrgInactive:setTopBottom( 0, 0, 9, 137 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( 0, 0, 22.5, 127.5 )
	PercentCompleteWidget:setTopBottom( 0, 0, 21.5, 126.5 )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local MasterCallingCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	MasterCallingCardIcon:setLeftRight( 1, 1, -260, -260 )
	MasterCallingCardIcon:setTopBottom( 0, 0, 73, 73 )
	MasterCallingCardIcon.CardIconFrame:setScale( 0.68 )
	MasterCallingCardIcon:subscribeToGlobalModel( controller, "MasterCallingCard", nil, function ( model )
		MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardIcon )
	self.MasterCallingCardIcon = MasterCallingCardIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 1, 1, -508, -10 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 0, 9, 137 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 1, 1, -505, -13 )
	TitleBg:setTopBottom( 0, 0, 50, 95 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( 1, 1, -273, -227 )
	LockedIcon:setTopBottom( 0, 0, 50, 96 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 1, 1, -258, -252 )
	featlineleft000:setTopBottom( 0, 0, -205, 305 )
	featlineleft000:setAlpha( 0.5 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( 1, 1, -258, -252 )
	featlineleft0000:setTopBottom( 0, 0, -160, 350 )
	featlineleft0000:setAlpha( 0.5 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 144, 601 )
	EmblemName:setTopBottom( 0, 0, 21, 60 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 143, 601 )
	EmblemSubtitle:setTopBottom( 0, 0, 68, 98 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	self.resetProperties = function ()
		featlineleft000:completeAnimation()
		featlineleft0000:completeAnimation()
		LockedIcon:completeAnimation()
		TitleBg:completeAnimation()
		MasterCallingCardIcon:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		featlineleft000:setAlpha( 0.5 )
		featlineleft0000:setAlpha( 0.5 )
		LockedIcon:setAlpha( 1 )
		TitleBg:setAlpha( 0.4 )
		MasterCallingCardIcon:setAlpha( 1 )
		BoxButtonLrgInactiveDiag:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setAlpha( 0 )
				self.clipFinished( featlineleft0000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 0 )
				self.clipFinished( MasterCallingCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setAlpha( 1 )
				self.clipFinished( featlineleft0000, {} )
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
	MasterCallingCardIcon.id = "MasterCallingCardIcon"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.BoxButtonLrgInactive:close()
		self.PercentCompleteWidget:close()
		self.MasterCallingCardIcon:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.LockedIcon:close()
		self.EmblemName:close()
		self.EmblemSubtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

