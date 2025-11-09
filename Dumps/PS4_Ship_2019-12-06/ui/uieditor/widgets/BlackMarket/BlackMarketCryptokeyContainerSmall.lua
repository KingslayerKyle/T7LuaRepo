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
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -17.5, 43.5 )
	Glow:setTopBottom( true, false, -17.5, 45.5 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_keyglow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( true, false, -13.5, 39.5 )
	ring:setTopBottom( true, false, -12.5, 40.5 )
	ring:setAlpha( 0 )
	ring:setImage( RegisterImage( "uie_t7_blackmarket_keyringglow" ) )
	self:addElement( ring )
	self.ring = ring
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, 1, 25 )
	CryptoIcon:setTopBottom( true, false, 2, 26 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UITightText.new()
	CryptoCount:setLeftRight( true, false, 28, 78 )
	CryptoCount:setTopBottom( true, false, 3, 25 )
	CryptoCount:setTTF( "fonts/default.ttf" )
	CryptoCount:linkToElementModel( self, "itemCount", true, function ( model )
		local itemCount = Engine.GetModelValue( model )
		if itemCount then
			CryptoCount:setText( Engine.Localize( itemCount ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local CryptoBalance = LUI.UITightText.new()
	CryptoBalance:setLeftRight( true, false, 28, 78 )
	CryptoBalance:setTopBottom( true, false, 3, 25 )
	CryptoBalance:setAlpha( 0 )
	CryptoBalance:setTTF( "fonts/default.ttf" )
	CryptoBalance:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			CryptoBalance:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", keyCount ) ) )
		end
	end )
	self:addElement( CryptoBalance )
	self.CryptoBalance = CryptoBalance
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.clipFinished( CryptoCount, {} )
			end
		},
		InsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
			end
		},
		ShowBalanceInsufficientFunds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 0.93, 0.17, 0.17 )
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setRGB( 0.93, 0.17, 0.17 )
				self.CryptoBalance:setAlpha( 1 )
				self.clipFinished( CryptoBalance, {} )
			end
		},
		ShowBalance = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setRGB( 1, 1, 1 )
				self.CryptoBalance:setAlpha( 1 )
				self.clipFinished( CryptoBalance, {} )
			end,
			Bonus = function ()
				self:setupElementClipCounter( 4 )
				local f8_local0 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							if not f11_arg1.interrupted then
								f11_arg0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							end
							f11_arg0:setAlpha( 0 )
							if f11_arg1.interrupted then
								self.clipFinished( f11_arg0, f11_arg1 )
							else
								f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f10_arg1.interrupted then
							f10_local0( f10_arg0, f10_arg1 )
							return 
						else
							f10_arg0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						f9_arg0:setAlpha( 1 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f8_local0 )
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
								CryptoBalance:setLeftRight( true, false, 28, 110 )
								CryptoBalance:setTopBottom( true, false, 3, 25 )
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
								CryptoBalance:setLeftRight( true, false, 48, 130 )
								CryptoBalance:setScale( 1.5 )
								CryptoBalance:registerEventHandler( "transition_complete_keyframe", CryptoBalanceFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoBalanceFrame4( CryptoBalance, event )
							return 
						else
							CryptoBalance:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							CryptoBalance:setLeftRight( true, false, 38, 120 )
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
				self.CryptoBalance:setLeftRight( true, false, 28, 110 )
				self.CryptoBalance:setTopBottom( true, false, 3, 25 )
				self.CryptoBalance:setAlpha( 1 )
				self.CryptoBalance:setScale( 1 )
				CryptoBalanceFrame2( CryptoBalance, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.clipFinished( ring, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 0 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 0 )
				self.clipFinished( CryptoCount, {} )
				CryptoBalance:completeAnimation()
				self.CryptoBalance:setAlpha( 0 )
				self.clipFinished( CryptoBalance, {} )
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
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThanOrEqualTo( element, controller, "itemCount", 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CryptoCount:close()
		element.CryptoBalance:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

