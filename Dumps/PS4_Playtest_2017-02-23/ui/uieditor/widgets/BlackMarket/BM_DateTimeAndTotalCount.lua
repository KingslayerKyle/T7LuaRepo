CoD.BM_DateTimeAndTotalCount = InheritFrom( LUI.UIElement )
CoD.BM_DateTimeAndTotalCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DateTimeAndTotalCount )
	self.id = "BM_DateTimeAndTotalCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 370 )
	self:setTopBottom( 0, 0, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 0, -49, 419 )
	backing:setTopBottom( 0, 0, -4, 68 )
	backing:setImage( RegisterImage( "uie_t7_blackmarket_common_timedate_backing" ) )
	self:addElement( backing )
	self.backing = backing
	
	local dateTimeReceived = LUI.UIText.new()
	dateTimeReceived:setLeftRight( 0.5, 0.5, -183, 183 )
	dateTimeReceived:setTopBottom( 0, 0, 8, 33 )
	dateTimeReceived:setTTF( "fonts/escom.ttf" )
	dateTimeReceived:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	dateTimeReceived:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	dateTimeReceived:linkToElementModel( self, "dateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			dateTimeReceived:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( dateTimeReceived )
	self.dateTimeReceived = dateTimeReceived
	
	local TotalCount = LUI.UIText.new()
	TotalCount:setLeftRight( 0.5, 0.5, -184, 184 )
	TotalCount:setTopBottom( 0, 0, 39, 66 )
	TotalCount:setTTF( "fonts/default.ttf" )
	TotalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TotalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TotalCount:linkToElementModel( self, "duplicateText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TotalCount )
	self.TotalCount = TotalCount
	
	self.resetProperties = function ()
		dateTimeReceived:completeAnimation()
		TotalCount:completeAnimation()
		dateTimeReceived:setLeftRight( 0.5, 0.5, -183, 183 )
		dateTimeReceived:setTopBottom( 0, 0, 8, 33 )
		dateTimeReceived:setAlpha( 1 )
		dateTimeReceived:setScale( 1 )
		TotalCount:setLeftRight( 0.5, 0.5, -184, 184 )
		TotalCount:setTopBottom( 0, 0, 39, 66 )
		TotalCount:setAlpha( 1 )
		TotalCount:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartFuzz = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
				self.nextClip = "StartFuzz"
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			RevealedCommon = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			RevealedRare = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			RevealedLegendary = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			RevealedEpic = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		RevealedCommon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setLeftRight( 0.5, 0.5, -152, 148 )
				self.dateTimeReceived:setTopBottom( 0, 0, -7.5, 22.5 )
				self.dateTimeReceived:setScale( 1.08 )
				self.clipFinished( dateTimeReceived, {} )
				TotalCount:completeAnimation()
				self.TotalCount:setLeftRight( 0.5, 0.5, -152, 148 )
				self.TotalCount:setTopBottom( 0, 0, 20.5, 50.5 )
				self.TotalCount:setScale( 1.08 )
				self.clipFinished( TotalCount, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					local dateTimeReceivedFrame3 = function ( dateTimeReceived, event )
						if not event.interrupted then
							dateTimeReceived:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						dateTimeReceived:setAlpha( 1 )
						dateTimeReceived:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( dateTimeReceived, event )
						else
							dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						dateTimeReceivedFrame3( dateTimeReceived, event )
						return 
					else
						dateTimeReceived:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						dateTimeReceived:setScale( 1.04 )
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", dateTimeReceivedFrame3 )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 0 )
				self.dateTimeReceived:setScale( 1 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
				local TotalCountFrame2 = function ( TotalCount, event )
					local TotalCountFrame3 = function ( TotalCount, event )
						if not event.interrupted then
							TotalCount:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						TotalCount:setAlpha( 1 )
						TotalCount:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( TotalCount, event )
						else
							TotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalCountFrame3( TotalCount, event )
						return 
					else
						TotalCount:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						TotalCount:setScale( 1.04 )
						TotalCount:registerEventHandler( "transition_complete_keyframe", TotalCountFrame3 )
					end
				end
				
				TotalCount:completeAnimation()
				self.TotalCount:setAlpha( 0 )
				self.TotalCount:setScale( 1 )
				TotalCountFrame2( TotalCount, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					local dateTimeReceivedFrame3 = function ( dateTimeReceived, event )
						if not event.interrupted then
							dateTimeReceived:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						dateTimeReceived:setAlpha( 0 )
						dateTimeReceived:setScale( 1 )
						if event.interrupted then
							self.clipFinished( dateTimeReceived, event )
						else
							dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						dateTimeReceivedFrame3( dateTimeReceived, event )
						return 
					else
						dateTimeReceived:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						dateTimeReceived:setAlpha( 0 )
						dateTimeReceived:setScale( 1.04 )
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", dateTimeReceivedFrame3 )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 1 )
				self.dateTimeReceived:setScale( 1.08 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
				local TotalCountFrame2 = function ( TotalCount, event )
					local TotalCountFrame3 = function ( TotalCount, event )
						if not event.interrupted then
							TotalCount:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						TotalCount:setAlpha( 0 )
						TotalCount:setScale( 1 )
						if event.interrupted then
							self.clipFinished( TotalCount, event )
						else
							TotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalCountFrame3( TotalCount, event )
						return 
					else
						TotalCount:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						TotalCount:setAlpha( 0 )
						TotalCount:setScale( 1.04 )
						TotalCount:registerEventHandler( "transition_complete_keyframe", TotalCountFrame3 )
					end
				end
				
				TotalCount:completeAnimation()
				self.TotalCount:setAlpha( 1 )
				self.TotalCount:setScale( 1.08 )
				TotalCountFrame2( TotalCount, {} )
			end
		},
		RevealedRare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 0 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 1 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end
		},
		RevealedLegendary = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 0 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 1 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end
		},
		RevealedEpic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 0 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local dateTimeReceivedFrame2 = function ( dateTimeReceived, event )
					if not event.interrupted then
						dateTimeReceived:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					dateTimeReceived:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( dateTimeReceived, event )
					else
						dateTimeReceived:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setAlpha( 1 )
				dateTimeReceivedFrame2( dateTimeReceived, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "RevealedCommon",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_COMMON" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedRare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_RARE" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedLegendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_LEGENDARY" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedEpic",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_EPIC" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		}
	} )
	self:linkToElementModel( self, "rarityName", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarityName"
		} )
	end )
	self:linkToElementModel( self, "reveal", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "reveal"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.dateTimeReceived:close()
		self.TotalCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

