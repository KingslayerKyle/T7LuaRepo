-- ade544f6899ce69a0df4db864386c910
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 96 )
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 0, 96 )
	Spinner:setTopBottom( true, false, 0, 96 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local PurchasingText = LUI.UIText.new()
	PurchasingText:setLeftRight( true, false, 106, 306 )
	PurchasingText:setTopBottom( true, false, 35.5, 60.5 )
	PurchasingText:setText( Engine.Localize( "MENU_PROCESSING_PURCHASE" ) )
	PurchasingText:setTTF( "fonts/default.ttf" )
	PurchasingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PurchasingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PurchasingText )
	self.PurchasingText = PurchasingText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )

				PurchasingText:completeAnimation()
				self.PurchasingText:setAlpha( 1 )
				self.clipFinished( PurchasingText, {} )
			end,
			StartPurchasing = function ()
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
