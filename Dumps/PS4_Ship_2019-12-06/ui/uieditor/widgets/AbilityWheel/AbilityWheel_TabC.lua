require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_TopHeader" )

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
	self.anyChildUsesUpdateState = true
	
	local TabImg = LUI.UIImage.new()
	TabImg:setLeftRight( false, false, -96, 96 )
	TabImg:setTopBottom( false, false, -5, 27 )
	TabImg:setAlpha( RandomAddPercent( -10, 0 ) )
	TabImg:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_tabc" ) )
	TabImg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabImg )
	self.TabImg = TabImg
	
	local TextTab = LUI.UIText.new()
	TextTab:setLeftRight( false, false, -116.5, 116.5 )
	TextTab:setTopBottom( true, false, 0, 20 )
	TextTab:setRGB( 1, 0.93, 0.24 )
	TextTab:setAlpha( RandomAddPercent( -10, 1 ) )
	TextTab:setTTF( "fonts/escom.ttf" )
	TextTab:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextTab:setShaderVector( 0, 0.1, 1, 0, 0 )
	TextTab:setShaderVector( 1, 0.01, 0, 0, 0 )
	TextTab:setShaderVector( 2, 0, 0, 0, 0 )
	TextTab:setShaderVector( 3, 0, 0, 0, 0 )
	TextTab:setShaderVector( 4, 0, 0, 0, 0 )
	TextTab:setLetterSpacing( 2 )
	TextTab:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextTab:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextTab:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			TextTab:setText( LocalizeToUpperString( name ) )
		end
	end )
	self:addElement( TextTab )
	self.TextTab = TextTab
	
	local AbilityWheelTopHeader = CoD.AbilityWheel_TopHeader.new( menu, controller )
	AbilityWheelTopHeader:setLeftRight( false, false, -135.23, 135.23 )
	AbilityWheelTopHeader:setTopBottom( true, false, -1.5, 55.5 )
	AbilityWheelTopHeader:setAlpha( 0.7 )
	AbilityWheelTopHeader:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilityWheelTopHeader )
	self.AbilityWheelTopHeader = AbilityWheelTopHeader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local TabImgFrame2 = function ( TabImg, event )
					if not event.interrupted then
						TabImg:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					TabImg:setAlpha( RandomAddPercent( -10, 0 ) )
					if event.interrupted then
						self.clipFinished( TabImg, event )
					else
						TabImg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabImg:completeAnimation()
				self.TabImg:setAlpha( RandomAddPercent( -10, 0 ) )
				TabImgFrame2( TabImg, {} )
				local TextTabFrame2 = function ( TextTab, event )
					if not event.interrupted then
						TextTab:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					TextTab:setAlpha( RandomAddPercent( -10, 1 ) )
					if event.interrupted then
						self.clipFinished( TextTab, event )
					else
						TextTab:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextTab:completeAnimation()
				self.TextTab:setAlpha( RandomAddPercent( -10, 0 ) )
				TextTabFrame2( TextTab, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelTopHeader:close()
		element.TextTab:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

