-- ad971cd16a75d63fc657021e148690cb
-- This hash is used for caching, delete to decompile the file again

CoD.FR_Checkpoint_Delta = InheritFrom( LUI.UIElement )
CoD.FR_Checkpoint_Delta.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_Checkpoint_Delta )
	self.id = "FR_Checkpoint_Delta"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 183 )
	self:setTopBottom( true, false, 0, 25 )
	
	local TextBG = LUI.UIText.new()
	TextBG:setLeftRight( true, true, 1, 1 )
	TextBG:setTopBottom( true, false, 1, 26.12 )
	TextBG:setRGB( 0, 0, 0 )
	TextBG:setAlpha( 0.5 )
	TextBG:setTTF( "fonts/escom.ttf" )
	TextBG:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBG:setShaderVector( 0, 0.04, 0, 0, 0 )
	TextBG:setShaderVector( 1, 0.04, 0, 0, 0 )
	TextBG:setShaderVector( 2, 1, 0, 0, 0 )
	TextBG:setLetterSpacing( 0.6 )
	TextBG:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBG:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBG:linkToElementModel( self, "timeAdjustment", true, function ( model )
		local timeAdjustment = Engine.GetModelValue( model )
		if timeAdjustment then
			TextBG:setText( Engine.Localize( PrependSignToFreerunDelta( controller, timeAdjustment ) ) )
		end
	end )
	self:addElement( TextBG )
	self.TextBG = TextBG
	
	local BestTimeDeltaText = LUI.UIText.new()
	BestTimeDeltaText:setLeftRight( true, true, 0, 0 )
	BestTimeDeltaText:setTopBottom( true, false, 0, 25.12 )
	BestTimeDeltaText:setTTF( "fonts/escom.ttf" )
	BestTimeDeltaText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BestTimeDeltaText:setShaderVector( 0, 0.04, 0, 0, 0 )
	BestTimeDeltaText:setShaderVector( 1, 0.04, 0, 0, 0 )
	BestTimeDeltaText:setShaderVector( 2, 1, 0, 0, 0 )
	BestTimeDeltaText:setLetterSpacing( 0.6 )
	BestTimeDeltaText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeDeltaText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BestTimeDeltaText:linkToElementModel( self, "timeAdjustment", true, function ( model )
		local timeAdjustment = Engine.GetModelValue( model )
		if timeAdjustment then
			BestTimeDeltaText:setText( Engine.Localize( PrependSignToFreerunDelta( controller, timeAdjustment ) ) )
		end
	end )
	self:addElement( BestTimeDeltaText )
	self.BestTimeDeltaText = BestTimeDeltaText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				TextBG:completeAnimation()
				self.TextBG:setAlpha( 0.5 )
				self.clipFinished( TextBG, {} )

				BestTimeDeltaText:completeAnimation()
				self.BestTimeDeltaText:setRGB( 1, 1, 1 )
				self.BestTimeDeltaText:setAlpha( 0.9 )
				self.clipFinished( BestTimeDeltaText, {} )
			end
		},
		Ahead = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				TextBG:completeAnimation()
				self.TextBG:setAlpha( 0.4 )
				self.clipFinished( TextBG, {} )

				BestTimeDeltaText:completeAnimation()
				self.BestTimeDeltaText:setRGB( 0.01, 1, 0 )
				self.BestTimeDeltaText:setAlpha( 0.9 )
				self.clipFinished( BestTimeDeltaText, {} )
			end
		},
		Behind = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				TextBG:completeAnimation()
				self.TextBG:setAlpha( 0.4 )
				self.clipFinished( TextBG, {} )

				BestTimeDeltaText:completeAnimation()
				self.BestTimeDeltaText:setRGB( 1, 0, 0 )
				self.BestTimeDeltaText:setAlpha( 0.9 )
				self.clipFinished( BestTimeDeltaText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Ahead",
			condition = function ( menu, element, event )
				local f7_local0 = IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 )
				if f7_local0 then
					if not IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 ) then
						f7_local0 = ShouldShowFreerunTimeClips( controller )
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "Behind",
			condition = function ( menu, element, event )
				local f8_local0 = IsModelValueGreaterThanOrEqualTo( controller, "FreeRun.timer.timeAdjustment", 0 )
				if f8_local0 then
					f8_local0 = IsModelValueEqualTo( controller, "FreeRun.timer.timeAdjustmentNegative", 0 )
					if f8_local0 then
						f8_local0 = ShouldShowFreerunTimeClips( controller )
					end
				end
				return f8_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.timer.timeAdjustment" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.timer.timeAdjustment"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.timer.timeAdjustmentNegative" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.timer.timeAdjustmentNegative"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.runState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TextBG:close()
		element.BestTimeDeltaText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

