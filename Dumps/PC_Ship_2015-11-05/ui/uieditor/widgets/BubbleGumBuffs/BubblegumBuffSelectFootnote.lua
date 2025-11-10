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
	self.soundSet = "CAC_Perk"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	BubbleGumFootnote:setLeftRight( false, true, -512, 0 )
	BubbleGumFootnote:setTopBottom( false, true, -96, 0 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BubbleGumFootnote:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 0 )
				self.clipFinished( BubbleGumFootnote, {} )
			end
		},
		ConsumableAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BubbleGumFootnote:completeAnimation()
				BubbleGumFootnote.FootnoteTextBox:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 1 )
				self.BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
				self.clipFinished( BubbleGumFootnote, {} )
			end
		},
		ConsumableNotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BubbleGumFootnote:completeAnimation()
				BubbleGumFootnote.FootnoteTextBox:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 1 )
				self.BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_EMPTY_CONSUMABLE_FOOTNOTE" ) )
				self.clipFinished( BubbleGumFootnote, {} )
			end
		}
	}
	self:mergeStateConditions( {
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
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

