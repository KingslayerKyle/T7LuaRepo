require( "ui.uieditor.widgets.Raids.RaidsPurchaseItem" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.TextWithDisableState" )

local PostLoadFunc = function ( self, controller )
	self:dispatchEventToChildren( {
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
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Border )
	self.Border = Border
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 5, -5 )
	Background:setTopBottom( true, true, 47, -46 )
	Background:setRGB( 1, 1, 1 )
	Background:setAlpha( 0.48 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local BankBorder = LUI.UIImage.new()
	BankBorder:setLeftRight( false, false, -77, 80 )
	BankBorder:setTopBottom( true, false, 0, 43 )
	BankBorder:setRGB( 0, 0, 0 )
	BankBorder:setAlpha( 0.8 )
	BankBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BankBorder )
	self.BankBorder = BankBorder
	
	local BankBackground = LUI.UIImage.new()
	BankBackground:setLeftRight( false, false, -73, 76 )
	BankBackground:setTopBottom( true, false, 3, 43 )
	BankBackground:setRGB( 1, 1, 1 )
	BankBackground:setAlpha( 0.5 )
	BankBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( BankBackground )
	self.BankBackground = BankBackground
	
	local Bank = LUI.UITightText.new()
	Bank:setLeftRight( false, false, -26.5, 26.5 )
	Bank:setTopBottom( true, false, 3, 43 )
	Bank:setRGB( 1, 1, 1 )
	Bank:setTTF( "fonts/default.ttf" )
	self:addElement( Bank )
	self.Bank = Bank
	
	local PurchasesList = LUI.UIList.new( menu, controller, 12, 0, nil, false, false, 0, 0, false, true )
	PurchasesList:makeFocusable()
	PurchasesList:setLeftRight( true, false, 22.5, 334.5 )
	PurchasesList:setTopBottom( true, false, 57, 369 )
	PurchasesList:setRGB( 1, 1, 1 )
	PurchasesList:setDataSource( "RaidsPurchases" )
	PurchasesList:setWidgetType( CoD.RaidsPurchaseItem )
	PurchasesList:setHorizontalCount( 3 )
	PurchasesList:setVerticalCount( 3 )
	PurchasesList:setSpacing( 12 )
	PurchasesList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
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
		return retVal
	end )
	PurchasesList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if RaidPurchaseAllowed( menu, element, controller ) then
			MakeRaidPurchase( self, element, controller )
			GoBack( self, controller )
			PlaySoundSetSound( self, "purchase" )
			LockInput( self, controller, false )
		elseif not RaidPurchaseAllowed( menu, element, controller ) then
			PlaySoundSetSound( self, "cant_afford" )
			LockInput( self, controller, false )
		end
		return retVal
	end )
	self:addElement( PurchasesList )
	self.PurchasesList = PurchasesList
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 22.5, 98.5 )
	Name:setTopBottom( false, true, -121.75, -91.75 )
	Name:setRGB( 1, 1, 1 )
	Name:setTTF( "fonts/default.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	local Buy = CoD.buttonprompt.new( menu, controller )
	Buy:setLeftRight( true, false, 5, 180 )
	Buy:setTopBottom( true, false, 465, 496 )
	Buy:setRGB( 1, 1, 1 )
	Buy.label:setText( Engine.Localize( "MENU_STORE_BUY" ) )
	Buy:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Buy.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Buy )
	self.Buy = Buy
	
	local Done = CoD.buttonprompt.new( menu, controller )
	Done:setLeftRight( true, false, 178.5, 352 )
	Done:setTopBottom( true, false, 465, 496 )
	Done:setRGB( 1, 1, 1 )
	Done.label:setText( Engine.Localize( "MPUI_DONE" ) )
	Done:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Done.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Done )
	self.Done = Done
	
	local Description = CoD.TextWithDisableState.new( menu, controller )
	Description:setLeftRight( true, false, 22.5, 334.5 )
	Description:setTopBottom( true, false, 408.25, 448.25 )
	Description:setRGB( 1, 1, 1 )
	self:addElement( Description )
	self.Description = Description
	
	self.Bank:linkToElementModel( self, "bank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Bank:setText( Engine.Localize( modelValue ) )
		end
	end )
	Name:linkToElementModel( PurchasesList, "displayName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	Description:linkToElementModel( PurchasesList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description.Description:setText( Engine.Localize( modelValue ) )
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
	self.close = function ( self )
		self.PurchasesList:close()
		self.Buy:close()
		self.Done:close()
		self.Description:close()
		self.Bank:close()
		self.Name:close()
		CoD.RaidsPurchases.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

