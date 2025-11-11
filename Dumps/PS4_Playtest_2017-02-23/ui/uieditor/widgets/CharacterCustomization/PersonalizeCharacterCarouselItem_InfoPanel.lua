require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizeCharacter_SelectedItemField" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

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
	self:setLeftRight( 0, 0, 0, 421 )
	self:setTopBottom( 0, 0, 0, 714 )
	self.anyChildUsesUpdateState = true
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( 0, 0, 0, 352 )
	TempBackground:setTopBottom( 0, 1, 1, -3 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( 0, 1, 0, -68 )
	FETitleNumBrdr1:setTopBottom( 0.5, 0.5, -356, 354 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local selectedHead = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedHead:setLeftRight( 0.5, 0.5, -170, 34 )
	selectedHead:setTopBottom( 0.5, 0.5, -194, -66 )
	selectedHead.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedHead:linkToElementModel( self, "selectedHeadInfo", false, function ( model )
		selectedHead:setModel( model, controller )
	end )
	self:addElement( selectedHead )
	self.selectedHead = selectedHead
	
	local selectedBody = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedBody:setLeftRight( 0.5, 0.5, -170, 34 )
	selectedBody:setTopBottom( 0.5, 0.5, -67, 61 )
	selectedBody.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedBody:linkToElementModel( self, "selectedBodyInfo", false, function ( model )
		selectedBody:setModel( model, controller )
	end )
	self:addElement( selectedBody )
	self.selectedBody = selectedBody
	
	local selectedShowcaseWeapon = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedShowcaseWeapon:setLeftRight( 0.5, 0.5, -170, 34 )
	selectedShowcaseWeapon:setTopBottom( 0.5, 0.5, 61, 189 )
	selectedShowcaseWeapon:setAlpha( 0 )
	selectedShowcaseWeapon.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedShowcaseWeapon.colorList:setAlpha( 0 )
	selectedShowcaseWeapon:linkToElementModel( self, "selectedShowcaseWeaponInfo", false, function ( model )
		selectedShowcaseWeapon:setModel( model, controller )
	end )
	self:addElement( selectedShowcaseWeapon )
	self.selectedShowcaseWeapon = selectedShowcaseWeapon
	
	local selectedTaunt = CoD.PersonalizeCharacter_SelectedItemField.new( menu, controller )
	selectedTaunt:setLeftRight( 0.5, 0.5, -170, 34 )
	selectedTaunt:setTopBottom( 0.5, 0.5, 146, 274 )
	selectedTaunt:setAlpha( 0 )
	selectedTaunt.selectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedTaunt.colorList:setAlpha( 0 )
	selectedTaunt:linkToElementModel( self, "selectedTauntInfo", false, function ( model )
		selectedTaunt:setModel( model, controller )
	end )
	self:addElement( selectedTaunt )
	self.selectedTaunt = selectedTaunt
	
	local CallsignWidget = CoD.WeaponNameWidget.new( menu, controller )
	CallsignWidget:setLeftRight( 0, 0, 36, 330 )
	CallsignWidget:setTopBottom( 0, 0, 68.5, 119.5 )
	CallsignWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallsignWidget.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CallsignWidget )
	self.CallsignWidget = CallsignWidget
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 36, -294 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -326.5, -293.5 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local callsignLabel0 = LUI.UITightText.new()
	callsignLabel0:setLeftRight( 0, 0, 45, 156 )
	callsignLabel0:setTopBottom( 0, 0, 33, 63 )
	callsignLabel0:setRGB( 1, 0.46, 0 )
	callsignLabel0:setText( LocalizeToUpperString( "HEROES_CALLSIGN" ) )
	callsignLabel0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel0 )
	self.callsignLabel0 = callsignLabel0
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, 367, 421 )
	Image5:setTopBottom( 0.5, 0.5, -357, -352 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 367, 421 )
	Image0:setTopBottom( 0.5, 0.5, 352, 357 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local LeftBoxLine = LUI.UIImage.new()
	LeftBoxLine:setLeftRight( 0, 1, 12, -88 )
	LeftBoxLine:setTopBottom( 0, 0, 270, 276 )
	LeftBoxLine:setAlpha( 0.8 )
	LeftBoxLine:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine )
	self.LeftBoxLine = LeftBoxLine
	
	local LeftBoxLine2 = LUI.UIImage.new()
	LeftBoxLine2:setLeftRight( 0, 1, 12, -88 )
	LeftBoxLine2:setTopBottom( 0, 0, 399, 405 )
	LeftBoxLine2:setAlpha( 0.8 )
	LeftBoxLine2:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine2 )
	self.LeftBoxLine2 = LeftBoxLine2
	
	local LeftBoxLine3 = LUI.UIImage.new()
	LeftBoxLine3:setLeftRight( 0, 1, 12, -88 )
	LeftBoxLine3:setTopBottom( 0, 0, 143, 149 )
	LeftBoxLine3:setAlpha( 0.8 )
	LeftBoxLine3:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	LeftBoxLine3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LeftBoxLine3 )
	self.LeftBoxLine3 = LeftBoxLine3
	
	self.resetProperties = function ()
		selectedHead:completeAnimation()
		selectedBody:completeAnimation()
		LeftBoxLine:completeAnimation()
		LeftBoxLine2:completeAnimation()
		selectedHead:setAlpha( 1 )
		selectedBody:setAlpha( 1 )
		LeftBoxLine:setAlpha( 0.8 )
		LeftBoxLine2:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
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

