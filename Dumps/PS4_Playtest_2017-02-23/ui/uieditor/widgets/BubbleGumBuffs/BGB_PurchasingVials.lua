CoD.BGB_PurchasingVials = InheritFrom( LUI.UIElement )
CoD.BGB_PurchasingVials.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BGB_PurchasingVials )
	self.id = "BGB_PurchasingVials"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local BurningDuplicatesText = LUI.UIText.new()
	BurningDuplicatesText:setLeftRight( 0, 0, 48, 718 )
	BurningDuplicatesText:setTopBottom( 0, 0, 47, 97 )
	BurningDuplicatesText:setText( Engine.Localize( "ZMUI_TRADING_COD_POINTS_FOR_VIALS" ) )
	BurningDuplicatesText:setTTF( "fonts/default.ttf" )
	BurningDuplicatesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BurningDuplicatesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BurningDuplicatesText )
	self.BurningDuplicatesText = BurningDuplicatesText
	
	self.resetProperties = function ()
		BurningDuplicatesText:completeAnimation()
		BurningDuplicatesText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesText, {} )
			end,
			StartPurchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					if not event.interrupted then
						BurningDuplicatesText:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					BurningDuplicatesText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BurningDuplicatesText, event )
					else
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )
			end,
			Purchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					local BurningDuplicatesTextFrame3 = function ( BurningDuplicatesText, event )
						if not event.interrupted then
							BurningDuplicatesText:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						BurningDuplicatesText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BurningDuplicatesText, event )
						else
							BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BurningDuplicatesTextFrame3( BurningDuplicatesText, event )
						return 
					else
						BurningDuplicatesText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						BurningDuplicatesText:setAlpha( 0.8 )
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", BurningDuplicatesTextFrame3 )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 1 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )
				self.nextClip = "Purchasing"
			end,
			StopPurchasing = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					if not event.interrupted then
						BurningDuplicatesText:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
					end
					BurningDuplicatesText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BurningDuplicatesText, event )
					else
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 1 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

