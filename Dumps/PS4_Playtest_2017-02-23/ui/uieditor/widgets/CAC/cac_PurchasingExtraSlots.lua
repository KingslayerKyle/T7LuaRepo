CoD.cac_PurchasingExtraSlots = InheritFrom( LUI.UIElement )
CoD.cac_PurchasingExtraSlots.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_PurchasingExtraSlots )
	self.id = "cac_PurchasingExtraSlots"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 459 )
	self:setTopBottom( 0, 0, 0, 144 )
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( 0, 0, 0, 144 )
	Spinner:setTopBottom( 0, 0, 0, 144 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local PurchasingText = LUI.UIText.new()
	PurchasingText:setLeftRight( 0, 0, 159, 459 )
	PurchasingText:setTopBottom( 0, 0, 53, 91 )
	PurchasingText:setText( Engine.Localize( "MENU_PROCESSING_PURCHASE" ) )
	PurchasingText:setTTF( "fonts/default.ttf" )
	PurchasingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PurchasingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PurchasingText )
	self.PurchasingText = PurchasingText
	
	self.resetProperties = function ()
		Spinner:completeAnimation()
		PurchasingText:completeAnimation()
		Spinner:setAlpha( 1 )
		PurchasingText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartPurchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local SpinnerFrame2 = function ( Spinner, event )
					if not event.interrupted then
						Spinner:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					Spinner:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Spinner, event )
					else
						Spinner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				SpinnerFrame2( Spinner, {} )
				local PurchasingTextFrame2 = function ( PurchasingText, event )
					if not event.interrupted then
						PurchasingText:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					PurchasingText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PurchasingText, event )
					else
						PurchasingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PurchasingText:completeAnimation()
				self.PurchasingText:setAlpha( 0 )
				PurchasingTextFrame2( PurchasingText, {} )
			end,
			Purchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local SpinnerFrame2 = function ( Spinner, event )
					if not event.interrupted then
						Spinner:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					Spinner:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Spinner, event )
					else
						Spinner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				SpinnerFrame2( Spinner, {} )
				local PurchasingTextFrame2 = function ( PurchasingText, event )
					if not event.interrupted then
						PurchasingText:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					PurchasingText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PurchasingText, event )
					else
						PurchasingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PurchasingText:completeAnimation()
				self.PurchasingText:setAlpha( 1 )
				PurchasingTextFrame2( PurchasingText, {} )
				self.nextClip = "Purchasing"
			end,
			StopPurchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local SpinnerFrame2 = function ( Spinner, event )
					if not event.interrupted then
						Spinner:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					Spinner:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Spinner, event )
					else
						Spinner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				SpinnerFrame2( Spinner, {} )
				local PurchasingTextFrame2 = function ( PurchasingText, event )
					if not event.interrupted then
						PurchasingText:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					PurchasingText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PurchasingText, event )
					else
						PurchasingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PurchasingText:completeAnimation()
				self.PurchasingText:setAlpha( 1 )
				PurchasingTextFrame2( PurchasingText, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

