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
	self:setLeftRight( true, false, 0, 638 )
	self:setTopBottom( true, false, 0, 128 )
	
	local BubbleGumFootnote = CoD.BubbleGumFootnote.new( menu, controller )
	BubbleGumFootnote:setLeftRight( true, false, 0, 638 )
	BubbleGumFootnote:setTopBottom( true, false, 0, 128 )
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
				local f5_local0 = IsCACItemConsumable( menu, element, controller )
				if f5_local0 then
					f5_local0 = DoesCACItemHaveConsumablesRemaining( menu, element, controller )
				end
				return f5_local0
			end
		},
		{
			stateName = "ConsumableNotAvailable",
			condition = function ( menu, element, event )
				local f6_local0 = IsCACItemConsumable( menu, element, controller )
				if f6_local0 then
					f6_local0 = not DoesCACItemHaveConsumablesRemaining( menu, element, controller )
				end
				return f6_local0
			end
		}
	} )
	self:linkToElementModel( "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BubbleGumFootnote:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

