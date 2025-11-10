require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CombatRecordItemButton = InheritFrom( LUI.UIElement )
CoD.CombatRecordItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordItemButton )
	self.id = "CombatRecordItemButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 370 )
	self:setTopBottom( true, false, 0, 164 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( true, true, 2, -4 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local WeaponImage = LUI.UIImage.new()
	WeaponImage:setLeftRight( false, true, -329.61, -46.02 )
	WeaponImage:setTopBottom( true, false, 18, 141 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local ItemImage = LUI.UIImage.new()
	ItemImage:setLeftRight( false, true, -249.5, -126.13 )
	ItemImage:setTopBottom( true, false, 18, 141 )
	self:addElement( ItemImage )
	self.ItemImage = ItemImage
	
	local GameModeImage2 = LUI.UIImage.new()
	GameModeImage2:setLeftRight( true, true, 68.86, -74.49 )
	GameModeImage2:setTopBottom( true, true, 49, -46.77 )
	self:addElement( GameModeImage2 )
	self.GameModeImage2 = GameModeImage2
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 5, -5 )
	ButtonTitleBG:setTopBottom( true, false, 4, 27.5 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.4 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 11, -5 )
	ButtonTitle:setTopBottom( true, false, 5.5, 25.5 )
	ButtonTitle:setText( Engine.Localize( "MENU_WEAPONS" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 367, -367 )
	Image0:setTopBottom( false, true, -27, -19 )
	Image0:setAlpha( 0.25 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ButtonTitle0 = LUI.UIText.new()
	ButtonTitle0:setLeftRight( true, true, 8, -8 )
	ButtonTitle0:setTopBottom( false, true, -23, -3 )
	ButtonTitle0:setRGB( 0.93, 0.74, 0.29 )
	ButtonTitle0:setText( Engine.Localize( LocalizeToUpperString( "MENU_DEADLIEST_WEAPON" ) ) )
	ButtonTitle0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle0:setLetterSpacing( 2 )
	ButtonTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ButtonTitle0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle0 )
	self.ButtonTitle0 = ButtonTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setRGB( 0, 0, 0 )
				self.BlackBox:setAlpha( 0.05 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setRGB( 1, 1, 1 )
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.4 )
				self.clipFinished( ButtonTitleBG, {} )
				ButtonTitle:completeAnimation()
				self.ButtonTitle:setAlpha( 1 )
				self.clipFinished( ButtonTitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

