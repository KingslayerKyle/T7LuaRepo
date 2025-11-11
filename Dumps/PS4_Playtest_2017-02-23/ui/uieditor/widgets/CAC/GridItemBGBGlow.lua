CoD.GridItemBGBGlow = InheritFrom( LUI.UIElement )
CoD.GridItemBGBGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemBGBGlow )
	self.id = "GridItemBGBGlow"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 223 )
	self:setTopBottom( 0, 0, 0, 223 )
	
	local Purple = LUI.UIImage.new()
	Purple:setLeftRight( 0, 1, 0, 0 )
	Purple:setTopBottom( 0, 1, 0, 0 )
	Purple:setAlpha( 0 )
	Purple:setScale( 0.97 )
	Purple:setImage( RegisterImage( "uie_t7_menu_zm_bgb_purpleglow" ) )
	self:addElement( Purple )
	self.Purple = Purple
	
	local Green = LUI.UIImage.new()
	Green:setLeftRight( 0, 1, 0, 0 )
	Green:setTopBottom( 0, 1, 0, 0 )
	Green:setAlpha( 0 )
	Green:setScale( 0.97 )
	Green:setImage( RegisterImage( "uie_t7_menu_zm_bgb_greenglow" ) )
	self:addElement( Green )
	self.Green = Green
	
	local Blue = LUI.UIImage.new()
	Blue:setLeftRight( 0, 1, 0, 0 )
	Blue:setTopBottom( 0, 1, 0, 0 )
	Blue:setAlpha( 0 )
	Blue:setScale( 0.97 )
	Blue:setImage( RegisterImage( "uie_t7_menu_zm_bgb_blueglow" ) )
	self:addElement( Blue )
	self.Blue = Blue
	
	local Orange = LUI.UIImage.new()
	Orange:setLeftRight( 0, 1, 0, 0 )
	Orange:setTopBottom( 0, 1, 0, 0 )
	Orange:setScale( 0.97 )
	Orange:setImage( RegisterImage( "uie_t7_menu_zm_bgb_orangeglow" ) )
	self:addElement( Orange )
	self.Orange = Orange
	
	self.resetProperties = function ()
		Orange:completeAnimation()
		Blue:completeAnimation()
		Green:completeAnimation()
		Purple:completeAnimation()
		Orange:setAlpha( 1 )
		Blue:setAlpha( 0 )
		Green:setAlpha( 0 )
		Purple:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Orange:completeAnimation()
				self.Orange:setAlpha( 0 )
				self.clipFinished( Orange, {} )
			end
		},
		Orange = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local OrangeFrame2 = function ( Orange, event )
					local OrangeFrame3 = function ( Orange, event )
						if not event.interrupted then
							Orange:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
						end
						Orange:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Orange, event )
						else
							Orange:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OrangeFrame3( Orange, event )
						return 
					else
						Orange:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Orange:setAlpha( 0.9 )
						Orange:registerEventHandler( "transition_complete_keyframe", OrangeFrame3 )
					end
				end
				
				Orange:completeAnimation()
				self.Orange:setAlpha( 0.5 )
				OrangeFrame2( Orange, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Blue = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local BlueFrame2 = function ( Blue, event )
					local BlueFrame3 = function ( Blue, event )
						if not event.interrupted then
							Blue:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
						end
						Blue:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Blue, event )
						else
							Blue:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlueFrame3( Blue, event )
						return 
					else
						Blue:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Blue:setAlpha( 1 )
						Blue:registerEventHandler( "transition_complete_keyframe", BlueFrame3 )
					end
				end
				
				Blue:completeAnimation()
				self.Blue:setAlpha( 0.5 )
				BlueFrame2( Blue, {} )
				Orange:completeAnimation()
				self.Orange:setAlpha( 0 )
				self.clipFinished( Orange, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Green = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local GreenFrame2 = function ( Green, event )
					local GreenFrame3 = function ( Green, event )
						if not event.interrupted then
							Green:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
						end
						Green:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Green, event )
						else
							Green:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GreenFrame3( Green, event )
						return 
					else
						Green:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Green:setAlpha( 1 )
						Green:registerEventHandler( "transition_complete_keyframe", GreenFrame3 )
					end
				end
				
				Green:completeAnimation()
				self.Green:setAlpha( 0.5 )
				GreenFrame2( Green, {} )
				Orange:completeAnimation()
				self.Orange:setAlpha( 0 )
				self.clipFinished( Orange, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Purple = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local PurpleFrame2 = function ( Purple, event )
					local PurpleFrame3 = function ( Purple, event )
						if not event.interrupted then
							Purple:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
						end
						Purple:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Purple, event )
						else
							Purple:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PurpleFrame3( Purple, event )
						return 
					else
						Purple:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Purple:setAlpha( 1 )
						Purple:registerEventHandler( "transition_complete_keyframe", PurpleFrame3 )
					end
				end
				
				Purple:completeAnimation()
				self.Purple:setAlpha( 0.5 )
				PurpleFrame2( Purple, {} )
				Orange:completeAnimation()
				self.Orange:setAlpha( 0 )
				self.clipFinished( Orange, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Orange",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "event" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Blue",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "round" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Green",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "time" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Purple",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "activated" ) and IsCACItemConsumable( menu, element, controller )
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
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

