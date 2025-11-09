require( "ui.uieditor.widgets.Blackjack.BlackJack_Activated" )

CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea = InheritFrom( LUI.UIElement )
CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea )
	self.id = "ChooseContracterCharacterLoadoutCarouselItem_ContractInfoArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 189 )
	self:setTopBottom( true, false, 0, 63 )
	self.anyChildUsesUpdateState = true
	
	local desc = LUI.UIText.new()
	desc:setLeftRight( true, false, -5.13, 182 )
	desc:setTopBottom( true, false, 4, 22 )
	desc:setRGB( 0.75, 0.75, 0.75 )
	desc:setAlpha( 0 )
	desc:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK_CONTRACTS_DESC" ) )
	desc:setTTF( "fonts/default.ttf" )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( desc )
	self.desc = desc
	
	local BlackJackActivated = CoD.BlackJack_Activated.new( menu, controller )
	BlackJackActivated:setLeftRight( true, false, -24.5, 210.5 )
	BlackJackActivated:setTopBottom( true, false, 0, 47 )
	BlackJackActivated:linkToElementModel( self, "activeTimeRemaining", true, function ( model )
		local activeTimeRemaining = Engine.GetModelValue( model )
		if activeTimeRemaining then
			BlackJackActivated.timeRemaining:setText( LocalizeIntoString( "MPUI_BM_CONTRACTS_TIME_REMAINING", NumberAsTimeNoMS( activeTimeRemaining ) ) )
		end
	end )
	self:addElement( BlackJackActivated )
	self.BlackJackActivated = BlackJackActivated
	
	local hover = LUI.UIImage.new()
	hover:setLeftRight( true, false, -24.68, 211.5 )
	hover:setTopBottom( true, false, -7.05, 55.93 )
	hover:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_activited_hover" ) )
	self:addElement( hover )
	self.hover = hover
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				desc:completeAnimation()
				self.desc:setRGB( 0.75, 0.75, 0.75 )
				self.desc:setAlpha( 0 )
				self.clipFinished( desc, {} )
				BlackJackActivated:completeAnimation()
				self.BlackJackActivated:setAlpha( 0 )
				self.clipFinished( BlackJackActivated, {} )
				hover:completeAnimation()
				self.hover:setAlpha( 0 )
				self.clipFinished( hover, {} )
			end,
			Activated = function ()
				self:setupElementClipCounter( 2 )
				local BlackJackActivatedFrame2 = function ( BlackJackActivated, event )
					if not event.interrupted then
						BlackJackActivated:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BlackJackActivated:setAlpha( 1 )
					BlackJackActivated:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BlackJackActivated, event )
					else
						BlackJackActivated:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackJackActivated:completeAnimation()
				self.BlackJackActivated:setAlpha( 0 )
				self.BlackJackActivated:setScale( 2 )
				BlackJackActivatedFrame2( BlackJackActivated, {} )
				local f4_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							local f8_local0 = function ( f9_arg0, f9_arg1 )
								if not f9_arg1.interrupted then
									f9_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								end
								f9_arg0:setAlpha( 0 )
								f9_arg0:setScale( 1.6 )
								if f9_arg1.interrupted then
									self.clipFinished( f9_arg0, f9_arg1 )
								else
									f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f8_arg1.interrupted then
								f8_local0( f8_arg0, f8_arg1 )
								return 
							else
								f8_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								f8_arg0:setAlpha( 0 )
								f8_arg0:setScale( 1.2 )
								f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						f6_arg0:setAlpha( 1 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				hover:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				hover:setAlpha( 0 )
				hover:setScale( 1 )
				hover:registerEventHandler( "transition_complete_keyframe", f4_local1 )
			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				desc:completeAnimation()
				self.desc:setAlpha( 0 )
				self.clipFinished( desc, {} )
				BlackJackActivated:completeAnimation()
				self.BlackJackActivated:setAlpha( 1 )
				self.clipFinished( BlackJackActivated, {} )
				hover:completeAnimation()
				self.hover:setAlpha( 0 )
				self.clipFinished( hover, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isActivated" )
			end
		}
	} )
	self:linkToElementModel( self, "isActivated", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BlackJackActivated:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

