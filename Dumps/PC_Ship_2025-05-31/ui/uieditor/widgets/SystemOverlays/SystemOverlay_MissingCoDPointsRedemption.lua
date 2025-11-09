require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_CODpoints" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

CoD.SystemOverlay_MissingCoDPointsRedemption = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_MissingCoDPointsRedemption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_MissingCoDPointsRedemption )
	self.id = "SystemOverlay_MissingCoDPointsRedemption"
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
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, -53.5, 374 )
	largeImage:setTopBottom( true, false, 56, 284 )
	largeImage:setImage( RegisterImage( "uie_t7_menu_blackmarket_codpoints_large" ) )
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
	options:setLeftRight( true, false, 422, 1170 )
	options:setTopBottom( true, false, 264, 296 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f6_local0 = options
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
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
	end, true )
	self:addElement( options )
	self.options = options
	
	local CODPoints = CoD.StartMenu_CODpoints.new( menu, controller )
	CODPoints:setLeftRight( true, false, 1069.85, 1146.1 )
	CODPoints:setTopBottom( true, false, 11, 36 )
	CODPoints:subscribeToGlobalModel( controller, "CryptoKeyProgress", "codPoints", function ( model )
		local codPoints = Engine.GetModelValue( model )
		if codPoints then
			CODPoints.codpointsCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", codPoints ) ) )
		end
	end )
	self:addElement( CODPoints )
	self.CODPoints = CODPoints
	
	local PurchasingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	PurchasingWidget:setLeftRight( true, false, 399, 705 )
	PurchasingWidget:setTopBottom( true, false, 115, 211 )
	PurchasingWidget:setAlpha( 0 )
	self:addElement( PurchasingWidget )
	self.PurchasingWidget = PurchasingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CODPoints:completeAnimation()
				self.CODPoints:setAlpha( 1 )
				self.clipFinished( CODPoints, {} )
				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 0 )
				self.clipFinished( PurchasingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CODPoints:completeAnimation()
				self.CODPoints:setAlpha( 0 )
				self.clipFinished( CODPoints, {} )
				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 1 )
				self.clipFinished( PurchasingWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Purchasing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.options:close()
		element.CODPoints:close()
		element.PurchasingWidget:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

