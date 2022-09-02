-- c1877b6919647c207b880d7528607a9e
-- This hash is used for caching, delete to decompile the file again

CoD.FR_BestTimeHud = InheritFrom( LUI.UIElement )
CoD.FR_BestTimeHud.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_BestTimeHud )
	self.id = "FR_BestTimeHud"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 138 )
	self:setTopBottom( true, false, 0, 62 )
	
	local BestTimeBoxOrange = LUI.UIImage.new()
	BestTimeBoxOrange:setLeftRight( true, true, 4, -2.66 )
	BestTimeBoxOrange:setTopBottom( true, true, 0, -31.6 )
	BestTimeBoxOrange:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	BestTimeBoxOrange:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BestTimeBoxOrange )
	self.BestTimeBoxOrange = BestTimeBoxOrange
	
	local BestTimeBoxOrange0 = LUI.UIImage.new()
	BestTimeBoxOrange0:setLeftRight( true, true, 4, -2.66 )
	BestTimeBoxOrange0:setTopBottom( true, true, 0, -31.6 )
	BestTimeBoxOrange0:setAlpha( 0.3 )
	BestTimeBoxOrange0:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebox" ) )
	self:addElement( BestTimeBoxOrange0 )
	self.BestTimeBoxOrange0 = BestTimeBoxOrange0
	
	local BestTimeText = LUI.UIText.new()
	BestTimeText:setLeftRight( false, false, -69, 69 )
	BestTimeText:setTopBottom( false, false, -25.8, -5.8 )
	BestTimeText:setRGB( 0, 0, 0 )
	BestTimeText:setText( Engine.Localize( "FREERUN_BEST_TIME" ) )
	BestTimeText:setTTF( "fonts/escom.ttf" )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTimeText )
	self.BestTimeText = BestTimeText
	
	local BestTimeValueText = LUI.UIText.new()
	BestTimeValueText:setLeftRight( true, true, 24.94, -11.41 )
	BestTimeValueText:setTopBottom( true, true, 30.2, -5.8 )
	BestTimeValueText:setTTF( "fonts/escom.ttf" )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestTimeValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BestTimeValueText:linkToElementModel( self, "bestTime", true, function ( model )
		local bestTime = Engine.GetModelValue( model )
		if bestTime then
			BestTimeValueText:setText( Engine.Localize( NumberAsTimeZeroDashes( bestTime ) ) )
		end
	end )
	self:addElement( BestTimeValueText )
	self.BestTimeValueText = BestTimeValueText
	
	local setBestTime = LUI.UIText.new()
	setBestTime:setLeftRight( false, false, -69, 69 )
	setBestTime:setTopBottom( false, false, -25.8, -5.8 )
	setBestTime:setRGB( 0, 0, 0 )
	setBestTime:setAlpha( 0 )
	setBestTime:setText( Engine.Localize( "FREERUN_SET_BEST_TIME" ) )
	setBestTime:setTTF( "fonts/escom.ttf" )
	setBestTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	setBestTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( setBestTime )
	self.setBestTime = setBestTime
	
	local setBestTimeValue = LUI.UIText.new()
	setBestTimeValue:setLeftRight( true, true, 7.94, -6.41 )
	setBestTimeValue:setTopBottom( true, true, 27.2, -8.8 )
	setBestTimeValue:setAlpha( 0 )
	setBestTimeValue:setTTF( "fonts/escom.ttf" )
	setBestTimeValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	setBestTimeValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	setBestTimeValue:linkToElementModel( self, "bestTime", true, function ( model )
		local bestTime = Engine.GetModelValue( model )
		if bestTime then
			setBestTimeValue:setText( Engine.Localize( NumberAsTimeZeroDashes( bestTime ) ) )
		end
	end )
	self:addElement( setBestTimeValue )
	self.setBestTimeValue = setBestTimeValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BestTimeText:completeAnimation()
				self.BestTimeText:setAlpha( 1 )
				self.clipFinished( BestTimeText, {} )

				BestTimeValueText:completeAnimation()
				self.BestTimeValueText:setLeftRight( true, true, 24.94, -11.41 )
				self.BestTimeValueText:setTopBottom( true, true, 30.2, -5.8 )
				self.BestTimeValueText:setAlpha( 1 )
				self.clipFinished( BestTimeValueText, {} )

				setBestTime:completeAnimation()
				self.setBestTime:setAlpha( 0 )
				self.clipFinished( setBestTime, {} )

				setBestTimeValue:completeAnimation()
				self.setBestTimeValue:setAlpha( 0 )
				self.clipFinished( setBestTimeValue, {} )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BestTimeText:completeAnimation()
				self.BestTimeText:setAlpha( 0 )
				self.clipFinished( BestTimeText, {} )

				BestTimeValueText:completeAnimation()
				self.BestTimeValueText:setAlpha( 0 )
				self.clipFinished( BestTimeValueText, {} )

				setBestTime:completeAnimation()
				self.setBestTime:setAlpha( 1 )
				self.clipFinished( setBestTime, {} )

				setBestTimeValue:completeAnimation()
				self.setBestTimeValue:setLeftRight( true, true, 7.94, -6.41 )
				self.setBestTimeValue:setTopBottom( true, true, 27.2, -8.8 )
				self.setBestTimeValue:setAlpha( 1 )
				self.clipFinished( setBestTimeValue, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return IsSelfModelValueNil( element, controller, "bestTime" )
			end
		}
	} )
	self:linkToElementModel( self, "bestTime", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bestTime"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BestTimeValueText:close()
		element.setBestTimeValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

