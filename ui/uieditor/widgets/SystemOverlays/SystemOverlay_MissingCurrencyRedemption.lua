-- 44cd55c9cbd5ba4b4648c814ddb92c8a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_supportWidget" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.CAC.cac_PurchasingExtraSlots" )

CoD.SystemOverlay_MissingCurrencyRedemption = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_MissingCurrencyRedemption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_MissingCurrencyRedemption )
	self.id = "SystemOverlay_MissingCurrencyRedemption"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 0, 352 )
	largeImage:setTopBottom( true, true, 0, 0 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	local supportInfo = CoD.systemOverlay_supportWidget.new( menu, controller )
	supportInfo:setLeftRight( true, false, 0, 352 )
	supportInfo:setTopBottom( false, true, -24, 0 )
	supportInfo:linkToElementModel( self, nil, false, function ( model )
		supportInfo:setModel( model, controller )
	end )
	self:addElement( supportInfo )
	self.supportInfo = supportInfo
	
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
	title:setLeftRight( true, false, 421, 1216 )
	title:setTopBottom( true, false, 10, 40 )
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
	text:setLeftRight( true, false, 422, 1217 )
	text:setTopBottom( true, false, 41, 61 )
	text:setAlpha( 0.7 )
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
	options:setLeftRight( true, false, 421, 1169 )
	options:setTopBottom( false, true, -39, -7 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f8_local0 = options
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not IsDisabled( f11_arg0, f11_arg2 ) then
			ProcessListAction( self, f11_arg0, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	local PurchasingWidget = CoD.cac_PurchasingExtraSlots.new( menu, controller )
	PurchasingWidget:setLeftRight( true, false, 399, 705 )
	PurchasingWidget:setTopBottom( true, false, 115, 211 )
	PurchasingWidget:setAlpha( 0 )
	PurchasingWidget.PurchasingText:setText( Engine.Localize( "GROUPS_PROCESSING" ) )
	self:addElement( PurchasingWidget )
	self.PurchasingWidget = PurchasingWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PurchasingWidget:completeAnimation()
				self.PurchasingWidget:setAlpha( 0 )
				self.clipFinished( PurchasingWidget, {} )
			end
		},
		Purchasing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.supportInfo:close()
		element.text:close()
		element.options:close()
		element.PurchasingWidget:close()
		element.largeImage:close()
		element.categoryTypeImage:close()
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

