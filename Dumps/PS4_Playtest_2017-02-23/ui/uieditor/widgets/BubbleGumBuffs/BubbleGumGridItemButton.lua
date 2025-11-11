require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumDLCTextPopup" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )

CoD.BubbleGumGridItemButton = InheritFrom( LUI.UIElement )
CoD.BubbleGumGridItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumGridItemButton )
	self.id = "BubbleGumGridItemButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local GridItemButtonNew = CoD.GridItemButtonNew.new( menu, controller )
	GridItemButtonNew:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				local f2_local0 = IsCACItemNew( element, controller )
				if f2_local0 then
					if not IsInPermanentUnlockMenu( controller ) then
						f2_local0 = not IsBGBItemLocked( menu, element, controller )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsBGBItemLocked( menu, element, controller )
			end
		}
	} )
	GridItemButtonNew:linkToElementModel( GridItemButtonNew, "itemIndex", true, function ( model )
		menu:updateElementState( GridItemButtonNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	GridItemButtonNew:setLeftRight( 0, 0, 0, 162 )
	GridItemButtonNew:setTopBottom( 0, 0, 0, 162 )
	GridItemButtonNew:linkToElementModel( self, nil, false, function ( model )
		GridItemButtonNew:setModel( model, controller )
	end )
	self:addElement( GridItemButtonNew )
	self.GridItemButtonNew = GridItemButtonNew
	
	local BubbleGumDLCTextPopup = CoD.BubbleGumDLCTextPopup.new( menu, controller )
	BubbleGumDLCTextPopup:setLeftRight( 0.5, 0.5, -141, 141 )
	BubbleGumDLCTextPopup:setTopBottom( 0, 0, 192, 240 )
	self:addElement( BubbleGumDLCTextPopup )
	self.BubbleGumDLCTextPopup = BubbleGumDLCTextPopup
	
	self.BubbleGumDLCTextPopup:linkToElementModel( self, "dlcIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumDLCTextPopup.textCenterAlign:setText( Engine.Localize( GetBGBDLCStringFromIndex( "ZMUI_BGB_PURCHASE_DLC", modelValue ) ) )
		end
	end )
	self.resetProperties = function ()
		BubbleGumDLCTextPopup:completeAnimation()
		BubbleGumDLCTextPopup:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BubbleGumDLCTextPopup:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				self.BubbleGumDLCTextPopup:setAlpha( 0 )
				BubbleGumDLCTextPopup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CanBuyDLC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BubbleGumDLCTextPopup:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				self.BubbleGumDLCTextPopup:setAlpha( 0 )
				BubbleGumDLCTextPopup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BubbleGumDLCTextPopupFrame2 = function ( BubbleGumDLCTextPopup, event )
					if not event.interrupted then
						BubbleGumDLCTextPopup:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BubbleGumDLCTextPopup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BubbleGumDLCTextPopup, event )
					else
						BubbleGumDLCTextPopup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BubbleGumDLCTextPopup:completeAnimation()
				self.BubbleGumDLCTextPopup:setAlpha( 0 )
				BubbleGumDLCTextPopupFrame2( BubbleGumDLCTextPopup, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BubbleGumDLCTextPopupFrame2 = function ( BubbleGumDLCTextPopup, event )
					if not event.interrupted then
						BubbleGumDLCTextPopup:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BubbleGumDLCTextPopup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BubbleGumDLCTextPopup, event )
					else
						BubbleGumDLCTextPopup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BubbleGumDLCTextPopup:completeAnimation()
				self.BubbleGumDLCTextPopup:setAlpha( 1 )
				BubbleGumDLCTextPopupFrame2( BubbleGumDLCTextPopup, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CanBuyDLC",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller )
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
	GridItemButtonNew.id = "GridItemButtonNew"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GridItemButtonNew:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GridItemButtonNew:close()
		self.BubbleGumDLCTextPopup:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

