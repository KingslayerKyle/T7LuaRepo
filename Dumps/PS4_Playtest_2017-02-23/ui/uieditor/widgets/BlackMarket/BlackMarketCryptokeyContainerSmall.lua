CoD.BlackMarketCryptokeyContainerSmall = InheritFrom( LUI.UIElement )
CoD.BlackMarketCryptokeyContainerSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketCryptokeyContainerSmall )
	self.id = "BlackMarketCryptokeyContainerSmall"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 120 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, -26, 66 )
	Glow:setTopBottom( 0, 0, -26, 68 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_keyglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( 0, 0, -20, 60 )
	ring:setTopBottom( 0, 0, -19, 61 )
	ring:setAlpha( 0 )
	ring:setImage( RegisterImage( "uie_t7_blackmarket_keyringglow" ) )
	self:addElement( ring )
	self.ring = ring
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( 0, 0, 2, 38 )
	CryptoIcon:setTopBottom( 0, 0, 3, 39 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UITightText.new()
	CryptoCount:setLeftRight( 0, 0, 42, 117 )
	CryptoCount:setTopBottom( 0, 0, 5, 38 )
	CryptoCount:setTTF( "fonts/default.ttf" )
	CryptoCount:linkToElementModel( self, "itemCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptoCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local CryptoBalance = LUI.UITightText.new()
	CryptoBalance:setLeftRight( 0, 0, 42, 117 )
	CryptoBalance:setTopBottom( 0, 0, 5, 38 )
	CryptoBalance:setAlpha( 0 )
	CryptoBalance:setTTF( "fonts/default.ttf" )
	CryptoBalance:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptoBalance:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptoBalance )
	self.CryptoBalance = CryptoBalance
	
	self.resetProperties = function ()
		CryptoCount:completeAnimation()
		CryptoBalance:completeAnimation()
		ring:completeAnimation()
		Glow:completeAnimation()
		CryptoCount:setRGB( 1, 1, 1 )
		CryptoCount:setAlpha( 1 )
		CryptoBalance:setLeftRight( 0, 0, 42, 117 )
		CryptoBalance:setTopBottom( 0, 0, 5, 38 )
		CryptoBalance:setAlpha( 0 )
		CryptoBalance:setScale( 1 )
		ring:setAlpha( 0 )
		ring:setScale( 1 )
		Glow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		InsufficientFunds = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.clipFinished( CryptoCount, {} )
			end
		},
		ShowBalanceInsufficientFunds = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setAlpha( 1 )
				self.clipFinished( CryptoBalance, {} )
			end
		},
		ShowBalance = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setAlpha( 1 )
				self.clipFinished( CryptoBalance, {} )
			end,
			Bonus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							end
							Glow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
				local ringFrame2 = function ( ring, event )
					local ringFrame3 = function ( ring, event )
						local ringFrame4 = function ( ring, event )
							local ringFrame5 = function ( ring, event )
								local ringFrame6 = function ( ring, event )
									if not event.interrupted then
										ring:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									ring:setAlpha( 0 )
									ring:setScale( 1.8 )
									if event.interrupted then
										self.clipFinished( ring, event )
									else
										ring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ringFrame6( ring, event )
									return 
								else
									ring:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									ring:setAlpha( 0 )
									ring:setScale( 1.7 )
									ring:registerEventHandler( "transition_complete_keyframe", ringFrame6 )
								end
							end
							
							if event.interrupted then
								ringFrame5( ring, event )
								return 
							else
								ring:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								ring:setScale( 1.55 )
								ring:registerEventHandler( "transition_complete_keyframe", ringFrame5 )
							end
						end
						
						if event.interrupted then
							ringFrame4( ring, event )
							return 
						else
							ring:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							ring:setAlpha( 1 )
							ring:registerEventHandler( "transition_complete_keyframe", ringFrame4 )
						end
					end
					
					if event.interrupted then
						ringFrame3( ring, event )
						return 
					else
						ring:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						ring:registerEventHandler( "transition_complete_keyframe", ringFrame3 )
					end
				end
				
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.ring:setScale( 1 )
				ringFrame2( ring, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				local CryptoBalanceFrame2 = function ( CryptoBalance, event )
					local CryptoBalanceFrame3 = function ( CryptoBalance, event )
						local CryptoBalanceFrame4 = function ( CryptoBalance, event )
							local CryptoBalanceFrame5 = function ( CryptoBalance, event )
								if not event.interrupted then
									CryptoBalance:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
								end
								CryptoBalance:setLeftRight( 0, 0, 42, 165 )
								CryptoBalance:setTopBottom( 0, 0, 4, 37 )
								CryptoBalance:setAlpha( 1 )
								CryptoBalance:setScale( 1 )
								if event.interrupted then
									self.clipFinished( CryptoBalance, event )
								else
									CryptoBalance:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoBalanceFrame5( CryptoBalance, event )
								return 
							else
								CryptoBalance:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								CryptoBalance:setLeftRight( 0, 0, 72, 195 )
								CryptoBalance:setScale( 1.5 )
								CryptoBalance:registerEventHandler( "transition_complete_keyframe", CryptoBalanceFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoBalanceFrame4( CryptoBalance, event )
							return 
						else
							CryptoBalance:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							CryptoBalance:setLeftRight( 0, 0, 57, 180 )
							CryptoBalance:setScale( 1.24 )
							CryptoBalance:registerEventHandler( "transition_complete_keyframe", CryptoBalanceFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoBalanceFrame3( CryptoBalance, event )
						return 
					else
						CryptoBalance:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						CryptoBalance:registerEventHandler( "transition_complete_keyframe", CryptoBalanceFrame3 )
					end
				end
				
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setLeftRight( 0, 0, 42, 165 )
				self.CryptoBalance:setTopBottom( 0, 0, 4, 37 )
				self.CryptoBalance:setAlpha( 1 )
				self.CryptoBalance:setScale( 1 )
				CryptoBalanceFrame2( CryptoBalance, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InsufficientFunds",
			condition = function ( menu, element, event )
				return not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" )
			end
		},
		{
			stateName = "ShowBalanceInsufficientFunds",
			condition = function ( menu, element, event )
				return not IsControllerModelValueGreaterThanOrEqualToSelfModelValue( element, controller, "CryptoKeyProgress.keyCount", "itemCount" )
			end
		},
		{
			stateName = "ShowBalance",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	self:linkToElementModel( self, "itemCount", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemCount"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CryptoCount:close()
		self.CryptoBalance:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

