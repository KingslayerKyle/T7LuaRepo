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
	self:setLeftRight( 0, 0, 0, 768 )
	self:setTopBottom( 0, 0, 0, 144 )
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	BubbleGumFootnote:setLeftRight( 1, 1, -768, 0 )
	BubbleGumFootnote:setTopBottom( 1, 1, -144, 0 )
	BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	self:addElement( BubbleGumFootnote )
	self.BubbleGumFootnote = BubbleGumFootnote
	
	self.resetProperties = function ()
		BubbleGumFootnote:completeAnimation()
		BubbleGumFootnote:setAlpha( 1 )
		BubbleGumFootnote.FootnoteTextBox:setText( Engine.Localize( "MENU_BGB_CONSUMABLE_FOOTNOTE" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BubbleGumFootnote:completeAnimation()
				self.BubbleGumFootnote:setAlpha( 0 )
				self.clipFinished( BubbleGumFootnote, {} )
			end
		},
		ConsumableAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ConsumableNotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BubbleGumFootnote:completeAnimation()
				BubbleGumFootnote.FootnoteTextBox:completeAnimation()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BubbleGumFootnote:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

