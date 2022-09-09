-- 8508b067f527e914a02592ec133d9e79
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_RewardImage" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

CoD.SystemOverlay_ActivateSpecialContract = InheritFrom( LUI.UIElement )
CoD.SystemOverlay_ActivateSpecialContract.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlay_ActivateSpecialContract )
	self.id = "SystemOverlay_ActivateSpecialContract"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 190 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 1280 )
	bg:setTopBottom( true, false, 0, 190 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local RewardImage = CoD.SpecialContracts_RewardImage.new( menu, controller )
	RewardImage:setLeftRight( true, false, 64, 384 )
	RewardImage:setTopBottom( true, false, 6.5, 183.5 )
	RewardImage.ItemImage:setScale( 1.7 )
	RewardImage.CallingCard.CardIconFrame:setScale( 0.66 )
	RewardImage:linkToElementModel( self, nil, false, function ( model )
		RewardImage:setModel( model, controller )
	end )
	RewardImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RewardImage.ItemImage:setImage( RegisterImage( image ) )
		end
	end )
	RewardImage:mergeStateConditions( {
		{
			stateName = "Dimensions4by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "calling_card" )
			end
		},
		{
			stateName = "Dimensions2by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "trifecta" )
			end
		},
		{
			stateName = "Dimensions1by1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "grand_slam" )
			end
		},
		{
			stateName = "DropBundle",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "default" )
			end
		},
		{
			stateName = "BlackjackContract",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "blackjack_contract" )
			end
		},
		{
			stateName = "Camo",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "state", "camo" )
			end
		}
	} )
	RewardImage:linkToElementModel( RewardImage, "state", true, function ( model )
		menu:updateElementState( RewardImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
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
	options:setTopBottom( true, false, 119, 221 )
	options:setWidgetType( CoD.CACGenericButton )
	options:setVerticalCount( 3 )
	options:setSpacing( 3 )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			options:setDataSource( listDatasource )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model )
		local f15_local0 = options
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f16_local0
	end )
	options:registerEventHandler( "lose_focus", function ( element, event )
		local f17_local0 = nil
		if element.loseFocus then
			f17_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f17_local0 = element.super:loseFocus( event )
		end
		return f17_local0
	end )
	menu:AddButtonCallbackFunction( options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if not IsDisabled( f18_arg0, f18_arg2 ) then
			ProcessListAction( self, f18_arg0, f18_arg2 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( f19_arg0, f19_arg2 ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( options )
	self.options = options
	
	local largeImage = LUI.UIImage.new()
	largeImage:setLeftRight( true, false, 0, 352 )
	largeImage:setTopBottom( true, true, 0, 2 )
	largeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			largeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( largeImage )
	self.largeImage = largeImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 1 )
				self.clipFinished( RewardImage, {} )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 0 )
				self.clipFinished( largeImage, {} )
			end
		},
		SpecialContractReplaceConfirm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 0 )
				self.clipFinished( RewardImage, {} )

				largeImage:completeAnimation()
				self.largeImage:setAlpha( 1 )
				self.clipFinished( largeImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "SpecialContractReplaceConfirm",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "image", "t7_icon_error_overlays_bkg" )
			end
		}
	} )
	self:linkToElementModel( self, "image", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "image"
		} )
	end )
	options.id = "options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardImage:close()
		element.text:close()
		element.options:close()
		element.categoryTypeImage:close()
		element.title:close()
		element.largeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
