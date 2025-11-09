require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_SelectedItemField" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

CoD.PersonalizeCharacterCarouselItem_InfoPanel = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacterCarouselItem_InfoPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PersonalizeCharacterCarouselItem_InfoPanel )
	self.id = "PersonalizeCharacterCarouselItem_InfoPanel"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 281 )
	self:setTopBottom( true, false, 0, 476 )
	self.anyChildUsesUpdateState = true
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( true, false, 0, 235 )
	TempBackground:setTopBottom( true, true, 1, -1.75 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, -46 )
	FETitleNumBrdr1:setTopBottom( false, false, -236.88, 236.13 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local selectedHead = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedHead:setLeftRight( false, false, -113.5, 22.5 )
	selectedHead:setTopBottom( false, false, -129.38, -44.38 )
	selectedHead.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedHead:linkToElementModel( self, "selectedHeadInfo", false, function ( model )
		selectedHead:setModel( model, controller )
	end )
	self:addElement( selectedHead )
	self.selectedHead = selectedHead
	
	local selectedBody = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedBody:setLeftRight( false, false, -113.5, 22.5 )
	selectedBody:setTopBottom( false, false, -44.38, 40.63 )
	selectedBody.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedBody:linkToElementModel( self, "selectedBodyInfo", false, function ( model )
		selectedBody:setModel( model, controller )
	end )
	self:addElement( selectedBody )
	self.selectedBody = selectedBody
	
	local selectedShowcaseWeapon = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedShowcaseWeapon:setLeftRight( false, false, -113.5, 22.5 )
	selectedShowcaseWeapon:setTopBottom( false, false, 40.63, 125.63 )
	selectedShowcaseWeapon:setAlpha( 0 )
	selectedShowcaseWeapon.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedShowcaseWeapon.colorList:setAlpha( 0 )
	selectedShowcaseWeapon:linkToElementModel( self, "selectedShowcaseWeaponInfo", false, function ( model )
		selectedShowcaseWeapon:setModel( model, controller )
	end )
	self:addElement( selectedShowcaseWeapon )
	self.selectedShowcaseWeapon = selectedShowcaseWeapon
	
	local selectedTaunt = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedTaunt:setLeftRight( false, false, -113.5, 22.5 )
	selectedTaunt:setTopBottom( false, false, 97.63, 182.63 )
	selectedTaunt:setAlpha( 0 )
	selectedTaunt.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedTaunt.colorList:setAlpha( 0 )
	selectedTaunt:linkToElementModel( self, "selectedTauntInfo", false, function ( model )
		selectedTaunt:setModel( model, controller )
	end )
	self:addElement( selectedTaunt )
	self.selectedTaunt = selectedTaunt
	
	local CallsignWidget = CoD.WeaponNameWidget.new( menu, controller )
	CallsignWidget:setLeftRight( true, false, 24, 220 )
	CallsignWidget:setTopBottom( true, false, 46, 80 )
	CallsignWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallsignWidget.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CallsignWidget )
	self.CallsignWidget = CallsignWidget
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 24, -196 )
	FETitleNumBrdr0:setTopBottom( false, false, -217.88, -195.88 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local callsignLabel0 = LUI.UITightText.new()
	callsignLabel0:setLeftRight( true, false, 30, 104 )
	callsignLabel0:setTopBottom( true, false, 22, 42 )
	callsignLabel0:setRGB( 1, 0.46, 0 )
	callsignLabel0:setText( Engine.Localize( LocalizeToUpperString( "HEROES_CALLSIGN" ) ) )
	callsignLabel0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel0 )
	self.callsignLabel0 = callsignLabel0
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 245, 281 )
	Image5:setTopBottom( false, false, -237.88, -234.38 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 245, 281 )
	Image0:setTopBottom( false, false, 234.38, 237.88 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( true, true, 8.5, -58.5 )
	LeftBoxLine:setTopBottom( true, false, 180, 184 )
	LeftBoxLine:setAlpha( 0.8 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local LeftBoxLine2 = LUI.UIImage.new()
	LeftBoxLine2:setLeftRight( true, true, 8.5, -58.5 )
	LeftBoxLine2:setTopBottom( true, false, 266, 270 )
	LeftBoxLine2:setAlpha( 0.8 )
	LeftBoxLine2:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine2 )
	self.LeftBoxLine2 = LeftBoxLine2
	
	local LeftBoxLine3 = LUI.UIImage.new()
	LeftBoxLine3:setLeftRight( true, true, 8.5, -58.5 )
	LeftBoxLine3:setTopBottom( true, false, 95.5, 99.5 )
	LeftBoxLine3:setAlpha( 0.8 )
	LeftBoxLine3:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine3 )
	self.LeftBoxLine3 = LeftBoxLine3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				selectedHead:completeAnimation()
				self.selectedHead:setAlpha( 1 )
				self.clipFinished( selectedHead, {} )
				selectedBody:completeAnimation()
				self.selectedBody:setAlpha( 1 )
				self.clipFinished( selectedBody, {} )
				CallsignWidget:completeAnimation()
				self.CallsignWidget:setAlpha( 1 )
				self.clipFinished( CallsignWidget, {} )
				LeftBoxLine:completeAnimation()
				self.LeftBoxLine:setAlpha( 0.8 )
				self.clipFinished( LeftBoxLine, {} )
				LeftBoxLine2:completeAnimation()
				self.LeftBoxLine2:setAlpha( 0.8 )
				self.clipFinished( LeftBoxLine2, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				selectedHead:completeAnimation()
				self.selectedHead:setAlpha( 0 )
				self.clipFinished( selectedHead, {} )
				selectedBody:completeAnimation()
				self.selectedBody:setAlpha( 0 )
				self.clipFinished( selectedBody, {} )
				LeftBoxLine:completeAnimation()
				self.LeftBoxLine:setAlpha( 0 )
				self.clipFinished( LeftBoxLine, {} )
				LeftBoxLine2:completeAnimation()
				self.LeftBoxLine2:setAlpha( 0 )
				self.clipFinished( LeftBoxLine2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr1:close()
		self.selectedHead:close()
		self.selectedBody:close()
		self.selectedShowcaseWeapon:close()
		self.selectedTaunt:close()
		self.CallsignWidget:close()
		self.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

