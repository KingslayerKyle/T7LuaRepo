require( "ui.uieditor.widgets.Raids.RaidsPurchaseItem" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.TextWithDisableState" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:dispatchEventToChildren( {
		name = "open_raids_purchase"
	} )
end

CoD.RaidsPurchases = InheritFrom( LUI.UIElement )
CoD.RaidsPurchases.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RaidsPurchases )
	self.id = "RaidsPurchases"
	self.soundSet = "RaidsPurchases"
	self:setLeftRight( true, false, 0, 357 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 43, 0 )
	Border:setRGB( 0, 0, 0 )
	Border:setAlpha( 0.8 )
	self:addElement( Border )
	self.Border = Border
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 5, -5 )
	Background:setTopBottom( true, true, 47, -46 )
	Background:setAlpha( 0.48 )
	self:addElement( Background )
	self.Background = Background
	
	local BankBorder = LUI.UIImage.new()
	BankBorder:setLeftRight( false, false, -77, 80 )
	BankBorder:setTopBottom( true, false, 0, 43 )
	BankBorder:setRGB( 0, 0, 0 )
	BankBorder:setAlpha( 0.8 )
	self:addElement( BankBorder )
	self.BankBorder = BankBorder
	
	local BankBackground = LUI.UIImage.new()
	BankBackground:setLeftRight( false, false, -73, 76 )
	BankBackground:setTopBottom( true, false, 3, 43 )
	BankBackground:setAlpha( 0.5 )
	self:addElement( BankBackground )
	self.BankBackground = BankBackground
	
	local Bank = LUI.UITightText.new()
	Bank:setLeftRight( false, false, -26.5, 26.5 )
	Bank:setTopBottom( true, false, 3, 43 )
	Bank:setTTF( "fonts/default.ttf" )
	self:addElement( Bank )
	self.Bank = Bank
	
	local PurchasesList = LUI.UIList.new( menu, controller, 12, 0, nil, false, false, 0, 0, false, true )
	PurchasesList:makeFocusable()
	PurchasesList:setLeftRight( true, false, 22.5, 334.5 )
	PurchasesList:setTopBottom( true, false, 57, 369 )
	PurchasesList:setDataSource( "RaidsPurchases" )
	PurchasesList:setWidgetType( CoD.RaidsPurchaseItem )
	PurchasesList:setHorizontalCount( 3 )
	PurchasesList:setVerticalCount( 3 )
	PurchasesList:setSpacing( 12 )
	PurchasesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		if RaidPurchaseAllowed( menu, element, controller ) then
			PlayClipOnElement( self, {
				elementName = "Buy",
				clipName = "DefaultClip"
			}, controller )
			UpdateEnabledText( self, element, controller )
		elseif not RaidPurchaseAllowed( menu, element, controller ) then
			PlayClipOnElement( self, {
				elementName = "Buy",
				clipName = "Hide"
			}, controller )
			UpdateDisableReason( self, element, controller )
		elseif RaidPurchaseItemDisabled( menu, element, controller ) then
			PlayClipOnElement( self, {
				elementName = "Description",
				clipName = "Disabled"
			}, controller )
		elseif not RaidPurchaseItemDisabled( menu, element, controller ) then
			PlayClipOnElement( self, {
				elementName = "Description",
				clipName = "DefaultClip"
			}, controller )
		end
		return f3_local0
	end )
	PurchasesList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	PurchasesList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( PurchasesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if RaidPurchaseAllowed( menu, element, controller ) then
			MakeRaidPurchase( self, element, controller )
			GoBack( self, controller )
			PlaySoundSetSound( self, "purchase" )
			LockInput( self, controller, false )
			return true
		elseif not RaidPurchaseAllowed( menu, element, controller ) then
			PlaySoundSetSound( self, "cant_afford" )
			LockInput( self, controller, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if RaidPurchaseAllowed( menu, element, controller ) then
			return true
		elseif not RaidPurchaseAllowed( menu, element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( PurchasesList )
	self.PurchasesList = PurchasesList
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 22.5, 98.5 )
	Name:setTopBottom( false, true, -121.75, -91.75 )
	Name:setTTF( "fonts/default.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local Buy = CoD.buttonprompt.new( menu, controller )
	Buy:setLeftRight( true, false, 5, 180 )
	Buy:setTopBottom( true, false, 465, 496 )
	Buy.label:setText( Engine.Localize( "MENU_STORE_BUY" ) )
	Buy:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Buy.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( Buy )
	self.Buy = Buy
	
	local Done = CoD.buttonprompt.new( menu, controller )
	Done:setLeftRight( true, false, 178.5, 352 )
	Done:setTopBottom( true, false, 465, 496 )
	Done.label:setText( Engine.Localize( "MPUI_DONE" ) )
	Done:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			Done.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( Done )
	self.Done = Done
	
	local Description = CoD.TextWithDisableState.new( menu, controller )
	Description:setLeftRight( true, false, 22.5, 334.5 )
	Description:setTopBottom( true, false, 408.25, 448.25 )
	self:addElement( Description )
	self.Description = Description
	
	self.Bank:linkToElementModel( self, "bank", true, function ( model )
		local bank = Engine.GetModelValue( model )
		if bank then
			Bank:setText( Engine.Localize( bank ) )
		end
	end )
	Name:linkToElementModel( PurchasesList, "displayName", true, function ( model )
		local displayName = Engine.GetModelValue( model )
		if displayName then
			Name:setText( Engine.Localize( displayName ) )
		end
	end )
	Description:linkToElementModel( PurchasesList, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description.Description:setText( Engine.Localize( description ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Buy:completeAnimation()
				self.Buy:setAlpha( 1 )
				self.clipFinished( Buy, {} )
			end
		}
	}
	PurchasesList.id = "PurchasesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PurchasesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PurchasesList:close()
		element.Buy:close()
		element.Done:close()
		element.Description:close()
		element.Bank:close()
		element.Name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

