-- 1844b803dfebec75ab634117d8092049
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumFootnote" )

CoD.BubblegumBuffSelectFootnote = InheritFrom( LUI.UIElement )
CoD.BubblegumBuffSelectFootnote.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubblegumBuffSelectFootnote )
	self.id = "BubblegumBuffSelectFootnote"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	BubbleGumFootnote:setLeftRight( false, true, -512, 0 )
	BubbleGumFootnote:setTopBottom( false, true, -96, 0 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	local RequiresDLCFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	RequiresDLCFootnote:setLeftRight( false, true, -512, 0 )
	RequiresDLCFootnote:setTopBottom( false, true, -96, 0 )
	RequiresDLCFootnote:setAlpha( 0 )
	RequiresDLCFootnote.FootnoteTextBox:setRGB( 1, 0, 0 )
	RequiresDLCFootnote:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			RequiresDLCFootnote.FootnoteTextBox:setText( GetBGBDLCRequiredHint( controller, itemIndex ) )
		end
	end )
	self:addElement( RequiresDLCFootnote )
	self.RequiresDLCFootnote = RequiresDLCFootnote
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumFootnote:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 0 )
				self.clipFinished( BubbleGumFootnote, {} )
				RequiresDLCFootnote:completeAnimation()
				self.RequiresDLCFootnote:setAlpha( 0 )
				self.clipFinished( RequiresDLCFootnote, {} )
			end
		},
		RequiresDLC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumFootnote:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 0 )
				self.clipFinished( BubbleGumFootnote, {} )
				RequiresDLCFootnote:completeAnimation()
				self.RequiresDLCFootnote:setAlpha( 1 )
				self.clipFinished( RequiresDLCFootnote, {} )
			end
		},
		ConsumableAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumFootnote:completeAnimation()
				BubbleGumFootnote.FootnoteTextBox:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 1 )
				self.BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
				self.clipFinished( BubbleGumFootnote, {} )
				RequiresDLCFootnote:completeAnimation()
				self.RequiresDLCFootnote:setAlpha( 0 )
				self.clipFinished( RequiresDLCFootnote, {} )
			end
		},
		ConsumableNotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumFootnote:completeAnimation()
				BubbleGumFootnote.FootnoteTextBox:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 1 )
				self.BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_EMPTY_CONSUMABLE_FOOTNOTE" ) )
				self.clipFinished( BubbleGumFootnote, {} )
				RequiresDLCFootnote:completeAnimation()
				self.RequiresDLCFootnote:setAlpha( 0 )
				self.clipFinished( RequiresDLCFootnote, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "RequiresDLC",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller )
			end
		},
		{
			stateName = "ConsumableAvailable",
			condition = function ( menu, element, event )
				return IsCACItemConsumable( menu, element, controller ) and DoesCACItemHaveConsumablesRemaining( menu, element, controller )
			end
		},
		{
			stateName = "ConsumableNotAvailable",
			condition = function ( menu, element, event )
				return IsCACItemConsumable( menu, element, controller ) and not DoesCACItemHaveConsumablesRemaining( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumFootnote:close()
		element.RequiresDLCFootnote:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

