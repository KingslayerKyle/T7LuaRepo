CoD.AbilityWheel_TabC = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_TabC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_TabC )
	self.id = "AbilityWheel_TabC"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 54 )
	
	local TabImg = LUI.UIImage.new()
	TabImg:setLeftRight( false, false, -95.5, 96.5 )
	TabImg:setTopBottom( false, false, -5, 27 )
	TabImg:setRGB( 1, 1, 1 )
	TabImg:setAlpha( RandomAddPercent( 0.99, -10 ) )
	TabImg:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_tabc" ) )
	TabImg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabImg )
	self.TabImg = TabImg
	
	local TextTab = LUI.UIText.new()
	TextTab:setLeftRight( false, false, -116.5, 116.5 )
	TextTab:setTopBottom( false, false, -27, -7 )
	TextTab:setRGB( 1, 0.93, 0.24 )
	TextTab:setAlpha( RandomAddPercent( 0.89, -10 ) )
	TextTab:setTTF( "fonts/Entovo.ttf" )
	TextTab:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextTab:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextTab:setShaderVector( 1, 0, 0, 0, 0 )
	TextTab:setShaderVector( 2, 0, 0, 0, 0 )
	TextTab:setShaderVector( 3, 0, 0, 0, 0 )
	TextTab:setShaderVector( 4, 0, 0, 0, 0 )
	TextTab:setLetterSpacing( 2 )
	TextTab:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextTab:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextTab:subscribeToGlobalModel( controller, "AbilityWheel", "name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextTab:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( TextTab )
	self.TextTab = TextTab
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local TabImgFrame2 = function ( TabImg, event )
					if not event.interrupted then
						TabImg:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					TabImg:setAlpha( RandomAddPercent( 0.99, -10 ) )
					if event.interrupted then
						self.clipFinished( TabImg, event )
					else
						TabImg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabImg:completeAnimation()
				self.TabImg:setAlpha( RandomAddPercent( 1, -10 ) )
				TabImgFrame2( TabImg, {} )
				local TextTabFrame2 = function ( TextTab, event )
					if not event.interrupted then
						TextTab:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					TextTab:setAlpha( RandomAddPercent( 0.89, -10 ) )
					if event.interrupted then
						self.clipFinished( TextTab, event )
					else
						TextTab:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextTab:completeAnimation()
				self.TextTab:setAlpha( RandomAddPercent( 0.9, -10 ) )
				TextTabFrame2( TextTab, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.TextTab:close()
		CoD.AbilityWheel_TabC.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

