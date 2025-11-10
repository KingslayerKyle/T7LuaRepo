require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.BlackMarket.BribeDuplicatesPopupInfo" )

CoD.SystemOverlay_BlackMarket = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_BlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_BlackMarket )
	self.id = "SystemOverlay_BlackMarket"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 1280 )
	bg:setTopBottom( true, false, -5, 331 )
	bg:setImage( RegisterImage( "uie_t7_blackmarket_backgroundbg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BIGicon = LUI.UIImage.new()
	BIGicon:setLeftRight( true, false, 1053.2, 1280 )
	BIGicon:setTopBottom( true, false, -4, 320 )
	BIGicon:setImage( RegisterImage( "uie_t7_blackmarket_popup_icon" ) )
	self:addElement( BIGicon )
	self.BIGicon = BIGicon
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 44, 308 )
	largeImage:setTopBottom( true, false, 1, 265 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( true, false, 384, 414 )
	categoryTypeImage:setTopBottom( true, false, 11, 41 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local categoryType = Engine.GetModelValue( model )
		if categoryType then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( categoryType ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local titleForBurning = LUI.UITightText.new()
	titleForBurning:setLeftRight( true, false, 421, 509 )
	titleForBurning:setTopBottom( true, false, 11, 41 )
	titleForBurning:setAlpha( 0 )
	titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
	titleForBurning:setTTF( "fonts/escom.ttf" )
	self:addElement( titleForBurning )
	self.titleForBurning = titleForBurning
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 421, 621 )
	title:setTopBottom( true, false, 11, 41 )
	title:setTTF( "fonts/escom.ttf" )
	title:linkToElementModel( self, "title", true, function ( model )
		local _title = Engine.GetModelValue( model )
		if _title then
			title:setText( Engine.Localize( _title ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local textForBurning = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	textForBurning:setLeftRight( true, false, 422, 1217 )
	textForBurning:setTopBottom( true, false, 37, 57 )
	textForBurning:setAlpha( 0 )
	textForBurning.text:setText( Engine.Localize( "MPUI_BM_BURNING_DESCRIPTION" ) )
	self:addElement( textForBurning )
	self.textForBurning = textForBurning
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( true, false, 422, 1127 )
	text:setTopBottom( true, false, 45, 65 )
	text:setAlpha( 0.85 )
	text:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			text.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local options = LUI.UIList.new( menu, controller, 3, 0, nil, true, false, 0, 0, false, false )
	options:makeFocusable()
	options:setLeftRight( true, false, 422, 752 )
	options:setTopBottom( true, false, 154, 221 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 2 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f7_local0 = options
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 0, 352 )
	supportInfo:setTopBottom( false, true, -24, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
	local CryptokeyTypeName = CoD.CryptokeyTypeName.new( menu, controller )
	CryptokeyTypeName:setLeftRight( true, false, 128, 224 )
	CryptokeyTypeName:setTopBottom( true, false, 244, 266 )
	CryptokeyTypeName:linkToElementModel( self, "cryptoKeyType", false, function ( model )
		CryptokeyTypeName:setModel( model, controller )
	end )
	self:addElement( CryptokeyTypeName )
	self.CryptokeyTypeName = CryptokeyTypeName
	
	local NextKeyProgress = CoD.NextKeyProgress.new( menu, controller )
	NextKeyProgress:setLeftRight( true, false, 410, 870 )
	NextKeyProgress:setTopBottom( true, false, 116, 142 )
	NextKeyProgress:setAlpha( 0 )
	NextKeyProgress:mergeStateConditions( {
		{
			stateName = "HidePixels",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local costText = LUI.UIText.new()
	costText:setLeftRight( true, false, 421.5, 498.5 )
	costText:setTopBottom( false, false, -60.5, -38.5 )
	costText:setAlpha( 0 )
	costText:setText( Engine.Localize( "MENU_COST" ) )
	costText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	costText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	costText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( costText )
	self.costText = costText
	
	local BoxImageText2 = LUI.UIText.new()
	BoxImageText2:setLeftRight( true, false, 464, 502 )
	BoxImageText2:setTopBottom( false, false, -34.5, 5.5 )
	BoxImageText2:setAlpha( 0 )
	BoxImageText2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BoxImageText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BoxImageText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BoxImageText2:linkToElementModel( self, "cost", true, function ( model )
		local cost = Engine.GetModelValue( model )
		if cost then
			BoxImageText2:setText( Engine.Localize( cost ) )
		end
	end )
	self:addElement( BoxImageText2 )
	self.BoxImageText2 = BoxImageText2
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, 996, 1041 )
	CryptoIcon:setTopBottom( true, false, 8.5, 53.5 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UIText.new()
	CryptoCount:setLeftRight( true, false, 1043, 1111 )
	CryptoCount:setTopBottom( true, false, 11, 51 )
	CryptoCount:setTTF( "fonts/default.ttf" )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptoCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			CryptoCount:setText( Engine.Localize( keyCount ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local TextBox0 = LUI.UITightText.new()
	TextBox0:setLeftRight( true, false, 944, 1021 )
	TextBox0:setTopBottom( true, false, 19, 41 )
	TextBox0:setText( Engine.Localize( "MPUI_BM_BALANCE" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local SupplyDropText = LUI.UIText.new()
	SupplyDropText:setLeftRight( true, false, 76, 276 )
	SupplyDropText:setTopBottom( true, false, 266, 294 )
	SupplyDropText:setAlpha( 0 )
	SupplyDropText:setText( Engine.Localize( "MPUI_BM_SUPPLY_DROP" ) )
	SupplyDropText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SupplyDropText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SupplyDropText )
	self.SupplyDropText = SupplyDropText
	
	local CryptoIcon0 = LUI.UIImage.new()
	CryptoIcon0:setLeftRight( true, false, 419, 464 )
	CryptoIcon0:setTopBottom( false, false, -37.5, 7.5 )
	CryptoIcon0:setAlpha( 0 )
	CryptoIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon0 )
	self.CryptoIcon0 = CryptoIcon0
	
	local BribeDuplicatesPopupInfo = CoD.BribeDuplicatesPopupInfo.new( menu, controller )
	BribeDuplicatesPopupInfo:setLeftRight( true, false, 48.5, 301.5 )
	BribeDuplicatesPopupInfo:setTopBottom( true, false, 30, 279 )
	BribeDuplicatesPopupInfo:linkToElementModel( self, nil, false, function ( model )
		BribeDuplicatesPopupInfo:setModel( model, controller )
	end )
	self:addElement( BribeDuplicatesPopupInfo )
	self.BribeDuplicatesPopupInfo = BribeDuplicatesPopupInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )
				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end
		},
		BurnDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )
				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )
				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 753 )
				self.options:setTopBottom( true, false, 204.5, 296 )
				self.clipFinished( options, {} )
				CryptokeyTypeName:completeAnimation()
				self.CryptokeyTypeName:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeName, {} )
				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setLeftRight( true, false, 421, 821 )
				self.NextKeyProgress:setTopBottom( true, false, 120.5, 170.5 )
				self.NextKeyProgress:setAlpha( 1 )
				self.clipFinished( NextKeyProgress, {} )
				costText:completeAnimation()
				self.costText:setAlpha( 0 )
				self.clipFinished( costText, {} )
				BoxImageText2:completeAnimation()
				self.BoxImageText2:setAlpha( 0 )
				self.clipFinished( BoxImageText2, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setAlpha( 0 )
				self.clipFinished( CryptoIcon0, {} )
				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 1 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )
			end
		},
		PurchaseSupplyDrop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 0 )
				self.clipFinished( titleForBurning, {} )
				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 0 )
				self.clipFinished( textForBurning, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.85 )
				self.clipFinished( text, {} )
				options:completeAnimation()
				self.options:setLeftRight( true, false, 422, 690.5 )
				self.options:setTopBottom( true, false, 140, 207 )
				self.clipFinished( options, {} )
				CryptokeyTypeName:completeAnimation()
				self.CryptokeyTypeName:setLeftRight( true, false, 113, 233 )
				self.CryptokeyTypeName:setTopBottom( true, false, 244, 266 )
				self.clipFinished( CryptokeyTypeName, {} )
				costText:completeAnimation()
				self.costText:setLeftRight( true, false, 779.5, 852.5 )
				self.costText:setTopBottom( false, false, -49, -27 )
				self.costText:setAlpha( 1 )
				self.costText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( costText, {} )
				BoxImageText2:completeAnimation()
				self.BoxImageText2:setLeftRight( true, false, 797, 835 )
				self.BoxImageText2:setTopBottom( false, false, -23, 17 )
				self.BoxImageText2:setAlpha( 1 )
				self.BoxImageText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( BoxImageText2, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setLeftRight( true, false, 996, 1041 )
				self.CryptoIcon:setTopBottom( true, false, 8.5, 53.5 )
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setLeftRight( true, false, 1043, 1111 )
				self.CryptoCount:setTopBottom( true, false, 11, 51 )
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setLeftRight( true, false, 944, 1021 )
				self.TextBox0:setTopBottom( true, false, 19, 41 )
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
				SupplyDropText:completeAnimation()
				self.SupplyDropText:setLeftRight( true, false, 73, 273 )
				self.SupplyDropText:setTopBottom( true, false, 266, 294 )
				self.SupplyDropText:setAlpha( 1 )
				self.clipFinished( SupplyDropText, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setLeftRight( true, false, 752, 797 )
				self.CryptoIcon0:setTopBottom( false, false, -26, 19 )
				self.CryptoIcon0:setAlpha( 1 )
				self.clipFinished( CryptoIcon0, {} )
				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setLeftRight( true, false, 68, 289 )
				self.BribeDuplicatesPopupInfo:setTopBottom( true, false, 31, 280 )
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )
			end
		},
		BurningDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 1 )
				self.titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNING_TITLE" ) )
				self.clipFinished( titleForBurning, {} )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
				textForBurning:completeAnimation()
				textForBurning.text:completeAnimation()
				self.textForBurning:setAlpha( 1 )
				self.textForBurning.text:setText( Engine.Localize( "MPUI_BM_BURNING_DESCRIPTION" ) )
				self.clipFinished( textForBurning, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
				BribeDuplicatesPopupInfo:completeAnimation()
				self.BribeDuplicatesPopupInfo:setAlpha( 0 )
				self.clipFinished( BribeDuplicatesPopupInfo, {} )
			end
		},
		BurnedDuplicates = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				titleForBurning:completeAnimation()
				self.titleForBurning:setAlpha( 1 )
				self.titleForBurning:setText( Engine.Localize( "MPUI_BM_BURNED_TITLE" ) )
				self.clipFinished( titleForBurning, {} )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
				textForBurning:completeAnimation()
				self.textForBurning:setAlpha( 1 )
				self.clipFinished( textForBurning, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BurnDuplicates",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "BurnDuplicates" )
			end
		},
		{
			stateName = "PurchaseSupplyDrop",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "PurchaseSupplyDrop" )
			end
		},
		{
			stateName = "BurningDuplicates",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "BurnedDuplicates",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.textForBurning:close()
		element.text:close()
		element.options:close()
		element.supportInfo:close()
		element.CryptokeyTypeName:close()
		element.NextKeyProgress:close()
		element.BribeDuplicatesPopupInfo:close()
		element.largeImage:close()
		element.categoryTypeImage:close()
		element.title:close()
		element.BoxImageText2:close()
		element.CryptoCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

