local PostLoadFunc = function ( self, controller )
	self.getWidthInList = function ( self, controller )
		local textWidth = nil
		local spacing = 70
		if self.currentState == "NavButton" then
			textWidth = self.buttonText:getTextWidth()
		else
			textWidth = self.text:getTextWidth()
		end
		return textWidth + spacing
	end
	
end

CoD.emblemMaterialTabWidget = InheritFrom( LUI.UIElement )
CoD.emblemMaterialTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.emblemMaterialTabWidget )
	self.id = "emblemMaterialTabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 28 )
	
	local TabLMask = LUI.UIImage.new()
	TabLMask:setLeftRight( true, false, 0, 18.67 )
	TabLMask:setTopBottom( true, true, 0, 0 )
	TabLMask:setRGB( 0, 0, 0 )
	TabLMask:setAlpha( 0 )
	TabLMask:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababacklmask" ) )
	TabLMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabLMask )
	self.TabLMask = TabLMask
	
	local TabRMask = LUI.UIImage.new()
	TabRMask:setLeftRight( false, true, -18.67, 0 )
	TabRMask:setTopBottom( true, true, 0, 0 )
	TabRMask:setRGB( 0, 0, 0 )
	TabRMask:setAlpha( 0 )
	TabRMask:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababackrmask" ) )
	TabRMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabRMask )
	self.TabRMask = TabRMask
	
	local TabMMask = LUI.UIImage.new()
	TabMMask:setLeftRight( true, true, 18.67, -18.67 )
	TabMMask:setTopBottom( true, true, 0, 0 )
	TabMMask:setRGB( 0, 0, 0 )
	TabMMask:setAlpha( 0 )
	TabMMask:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababackmmask" ) )
	TabMMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabMMask )
	self.TabMMask = TabMMask
	
	local TabM = LUI.UIImage.new()
	TabM:setLeftRight( true, true, 18.67, -18.67 )
	TabM:setTopBottom( true, true, 0, 0 )
	TabM:setRGB( 1, 1, 1 )
	TabM:setAlpha( 0.35 )
	TabM:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababackm" ) )
	TabM:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabM )
	self.TabM = TabM
	
	local TabR = LUI.UIImage.new()
	TabR:setLeftRight( false, true, -18.67, 0 )
	TabR:setTopBottom( true, true, 0, 0 )
	TabR:setRGB( 1, 1, 1 )
	TabR:setAlpha( 0.35 )
	TabR:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababackr" ) )
	TabR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabR )
	self.TabR = TabR
	
	local TabL = LUI.UIImage.new()
	TabL:setLeftRight( true, false, 0, 18.67 )
	TabL:setTopBottom( true, true, 0, 0 )
	TabL:setRGB( 1, 1, 1 )
	TabL:setAlpha( 0.35 )
	TabL:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tababackl" ) )
	TabL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabL )
	self.TabL = TabL
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -100, 100 )
	text:setTopBottom( false, false, -8, 12 )
	text:setRGB( 0.96, 0.96, 0.73 )
	text:setAlpha( 0.6 )
	text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local footer = LUI.UIImage.new()
	footer:setLeftRight( true, true, 14.81, -14.81 )
	footer:setTopBottom( true, true, 32, 5.34 )
	footer:setRGB( 1, 1, 1 )
	footer:setAlpha( 0 )
	footer:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tabafocusfooter" ) )
	footer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( footer )
	self.footer = footer
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, false, -7.1, 5.1 )
	arrow:setTopBottom( false, false, 10.62, 20.38 )
	arrow:setRGB( 0.85, 0.48, 0.09 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tabafocusarrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local header = LUI.UIImage.new()
	header:setLeftRight( false, false, -27.84, 25.84 )
	header:setTopBottom( false, false, -16.5, -11.62 )
	header:setRGB( 0.26, 0.26, 0.26 )
	header:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tabafocusheader" ) )
	header:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( header )
	self.header = header
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( false, false, -100, 100 )
	buttonText:setTopBottom( false, false, -14, 15 )
	buttonText:setRGB( 1, 1, 1 )
	buttonText:setAlpha( 0 )
	buttonText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "tabIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				TabLMask:completeAnimation()
				self.TabLMask:setLeftRight( true, false, 0, 18.67 )
				self.TabLMask:setTopBottom( true, true, 0, 0 )
				self.TabLMask:setAlpha( 0 )
				self.TabLMask:setZoom( 0 )
				self.clipFinished( TabLMask, {} )
				TabRMask:completeAnimation()
				self.TabRMask:setLeftRight( false, true, -18.67, 0 )
				self.TabRMask:setTopBottom( true, true, 0, 0 )
				self.TabRMask:setAlpha( 0 )
				self.TabRMask:setZoom( 0 )
				self.clipFinished( TabRMask, {} )
				TabMMask:completeAnimation()
				self.TabMMask:setLeftRight( true, true, 18.67, -18.67 )
				self.TabMMask:setTopBottom( true, true, 0, 0 )
				self.TabMMask:setAlpha( 0 )
				self.TabMMask:setZoom( 0 )
				self.clipFinished( TabMMask, {} )
				TabM:completeAnimation()
				self.TabM:setLeftRight( true, true, 18.67, -18.67 )
				self.TabM:setTopBottom( true, true, 0, 0 )
				self.TabM:setAlpha( 0 )
				self.TabM:setZoom( 0 )
				self.clipFinished( TabM, {} )
				TabR:completeAnimation()
				self.TabR:setLeftRight( false, true, -18.67, 0 )
				self.TabR:setTopBottom( true, true, 0, 0 )
				self.TabR:setAlpha( 0 )
				self.TabR:setZoom( 0 )
				self.clipFinished( TabR, {} )
				TabL:completeAnimation()
				self.TabL:setLeftRight( true, false, 0, 18.67 )
				self.TabL:setTopBottom( true, true, 0, 0 )
				self.TabL:setAlpha( 0 )
				self.TabL:setZoom( 0 )
				self.clipFinished( TabL, {} )
				text:completeAnimation()
				self.text:setLeftRight( false, false, -100, 100 )
				self.text:setTopBottom( false, false, -8, 12 )
				self.text:setRGB( 0.96, 0.96, 0.73 )
				self.text:setAlpha( 0.6 )
				self.text:setZoom( 0 )
				self.clipFinished( text, {} )
				footer:completeAnimation()
				self.footer:setLeftRight( true, true, 18.67, -18.67 )
				self.footer:setTopBottom( true, true, 31, 4.34 )
				self.footer:setAlpha( 0 )
				self.footer:setZoom( 0 )
				self.clipFinished( footer, {} )
				arrow:completeAnimation()
				self.arrow:setLeftRight( false, false, -7.1, 5.1 )
				self.arrow:setTopBottom( false, false, 10.62, 20.38 )
				self.arrow:setRGB( 0.85, 0.48, 0.09 )
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				header:completeAnimation()
				self.header:setLeftRight( false, false, -27.84, 25.84 )
				self.header:setTopBottom( false, false, -16.5, -11.62 )
				self.header:setRGB( 0.26, 0.26, 0.26 )
				self.header:setAlpha( 0 )
				self.header:setZoom( 0 )
				self.clipFinished( header, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 11 )
				TabLMask:completeAnimation()
				self.TabLMask:setLeftRight( true, false, -4.79, 14.81 )
				self.TabLMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabLMask:setAlpha( 1 )
				self.TabLMask:setZoom( 0 )
				self.clipFinished( TabLMask, {} )
				TabRMask:completeAnimation()
				self.TabRMask:setLeftRight( false, true, -14.81, 4.79 )
				self.TabRMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabRMask:setAlpha( 1 )
				self.TabRMask:setZoom( 0 )
				self.clipFinished( TabRMask, {} )
				TabMMask:completeAnimation()
				self.TabMMask:setLeftRight( true, true, 14.81, -14.81 )
				self.TabMMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabMMask:setAlpha( 1 )
				self.TabMMask:setZoom( 0 )
				self.clipFinished( TabMMask, {} )
				TabM:completeAnimation()
				self.TabM:setLeftRight( true, true, 14.81, -14.81 )
				self.TabM:setTopBottom( true, true, -0.77, 0.77 )
				self.TabM:setAlpha( 1 )
				self.TabM:setZoom( 0 )
				self.clipFinished( TabM, {} )
				TabR:completeAnimation()
				self.TabR:setLeftRight( false, true, -14.81, 4.79 )
				self.TabR:setTopBottom( true, true, -0.77, 0.77 )
				self.TabR:setAlpha( 1 )
				self.TabR:setZoom( 0 )
				self.clipFinished( TabR, {} )
				TabL:completeAnimation()
				self.TabL:setLeftRight( true, false, -4.79, 14.81 )
				self.TabL:setTopBottom( true, true, -0.77, 0.77 )
				self.TabL:setAlpha( 1 )
				self.TabL:setZoom( 0 )
				self.clipFinished( TabL, {} )
				text:completeAnimation()
				self.text:setLeftRight( false, false, -100, 100 )
				self.text:setTopBottom( false, false, -9.75, 11.75 )
				self.text:setRGB( 0.93, 0.45, 0.05 )
				self.text:setAlpha( 1 )
				self.text:setZoom( 0 )
				self.clipFinished( text, {} )
				footer:completeAnimation()
				self.footer:setLeftRight( true, true, 14.81, -14.81 )
				self.footer:setTopBottom( true, true, 32, 5.34 )
				self.footer:setAlpha( 0 )
				self.footer:setZoom( 0 )
				self.clipFinished( footer, {} )
				arrow:completeAnimation()
				self.arrow:setLeftRight( false, false, -7.1, 5.1 )
				self.arrow:setTopBottom( false, false, 21.62, 31.38 )
				self.arrow:setZoom( 0 )
				self.clipFinished( arrow, {} )
				header:completeAnimation()
				self.header:setLeftRight( false, false, -27.84, 25.84 )
				self.header:setTopBottom( false, false, -17.94, -13.06 )
				self.header:setRGB( 0.85, 0.49, 0.09 )
				self.header:setAlpha( 1 )
				self.header:setZoom( 0 )
				self.clipFinished( header, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			GainActive = function ()
				self:setupElementClipCounter( 11 )
				local TabLMaskFrame2 = function ( TabLMask, event )
					if not event.interrupted then
						TabLMask:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabLMask:setLeftRight( true, false, -4.79, 14.81 )
					TabLMask:setTopBottom( true, true, -0.77, 0.77 )
					TabLMask:setAlpha( 1 )
					TabLMask:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabLMask, event )
					else
						TabLMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabLMask:completeAnimation()
				self.TabLMask:setLeftRight( true, false, 0, 18.67 )
				self.TabLMask:setTopBottom( true, true, 0, 0 )
				self.TabLMask:setAlpha( 0 )
				self.TabLMask:setZoom( 0 )
				TabLMaskFrame2( TabLMask, {} )
				local TabRMaskFrame2 = function ( TabRMask, event )
					if not event.interrupted then
						TabRMask:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabRMask:setLeftRight( false, true, -14.81, 4.79 )
					TabRMask:setTopBottom( true, true, -0.77, 0.77 )
					TabRMask:setAlpha( 1 )
					TabRMask:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabRMask, event )
					else
						TabRMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabRMask:completeAnimation()
				self.TabRMask:setLeftRight( false, true, -18.67, 0 )
				self.TabRMask:setTopBottom( true, true, 0, 0 )
				self.TabRMask:setAlpha( 0 )
				self.TabRMask:setZoom( 0 )
				TabRMaskFrame2( TabRMask, {} )
				local TabMMaskFrame2 = function ( TabMMask, event )
					if not event.interrupted then
						TabMMask:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabMMask:setLeftRight( true, true, 14.81, -14.81 )
					TabMMask:setTopBottom( true, true, -0.77, 0.77 )
					TabMMask:setAlpha( 1 )
					TabMMask:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabMMask, event )
					else
						TabMMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabMMask:completeAnimation()
				self.TabMMask:setLeftRight( true, true, 18.67, -18.67 )
				self.TabMMask:setTopBottom( true, true, 0, 0 )
				self.TabMMask:setAlpha( 0 )
				self.TabMMask:setZoom( 0 )
				TabMMaskFrame2( TabMMask, {} )
				local TabMFrame2 = function ( TabM, event )
					if not event.interrupted then
						TabM:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabM:setLeftRight( true, true, 14.81, -14.81 )
					TabM:setTopBottom( true, true, -0.77, 0.77 )
					TabM:setAlpha( 1 )
					TabM:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabM, event )
					else
						TabM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabM:completeAnimation()
				self.TabM:setLeftRight( true, true, 18.67, -18.67 )
				self.TabM:setTopBottom( true, true, 0, 0 )
				self.TabM:setAlpha( 0.35 )
				self.TabM:setZoom( 0 )
				TabMFrame2( TabM, {} )
				local TabRFrame2 = function ( TabR, event )
					if not event.interrupted then
						TabR:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabR:setLeftRight( false, true, -14.81, 4.79 )
					TabR:setTopBottom( true, true, -0.77, 0.77 )
					TabR:setAlpha( 1 )
					TabR:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabR, event )
					else
						TabR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabR:completeAnimation()
				self.TabR:setLeftRight( false, true, -18.67, 0 )
				self.TabR:setTopBottom( true, true, 0, 0 )
				self.TabR:setAlpha( 0.35 )
				self.TabR:setZoom( 0 )
				TabRFrame2( TabR, {} )
				local TabLFrame2 = function ( TabL, event )
					if not event.interrupted then
						TabL:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					TabL:setLeftRight( true, false, -4.79, 14.81 )
					TabL:setTopBottom( true, true, -0.77, 0.77 )
					TabL:setAlpha( 1 )
					TabL:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( TabL, event )
					else
						TabL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabL:completeAnimation()
				self.TabL:setLeftRight( true, false, 0, 18.67 )
				self.TabL:setTopBottom( true, true, 0, 0 )
				self.TabL:setAlpha( 0.35 )
				self.TabL:setZoom( 0 )
				TabLFrame2( TabL, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					text:setLeftRight( false, false, -100, 100 )
					text:setTopBottom( false, false, -8.5, 12.5 )
					text:setRGB( 1, 0.65, 0 )
					text:setAlpha( 1 )
					text:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setLeftRight( false, false, -100, 100 )
				self.text:setTopBottom( false, false, -8, 12 )
				self.text:setRGB( 0.96, 0.96, 0.73 )
				self.text:setAlpha( 0.6 )
				self.text:setZoom( 0 )
				textFrame2( text, {} )
				local footerFrame2 = function ( footer, event )
					if not event.interrupted then
						footer:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					footer:setLeftRight( true, true, 14.81, -14.81 )
					footer:setTopBottom( true, true, 32, 5.34 )
					footer:setAlpha( 0 )
					footer:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( footer, event )
					else
						footer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				footer:completeAnimation()
				self.footer:setLeftRight( true, true, 14.81, -14.81 )
				self.footer:setTopBottom( true, true, 32, 5.34 )
				self.footer:setAlpha( 0 )
				self.footer:setZoom( 0 )
				footerFrame2( footer, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					arrow:setLeftRight( false, false, -7.1, 5.1 )
					arrow:setTopBottom( false, false, 21.62, 31.38 )
					arrow:setRGB( 0.85, 0.48, 0.09 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( false, false, -7.1, 5.1 )
				self.arrow:setTopBottom( false, false, 10.62, 20.38 )
				self.arrow:setRGB( 0.85, 0.48, 0.09 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
				local headerFrame2 = function ( header, event )
					if not event.interrupted then
						header:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Back )
					end
					header:setLeftRight( false, false, -27.84, 25.84 )
					header:setTopBottom( false, false, -24.5, -19.62 )
					header:setRGB( 0.85, 0.49, 0.09 )
					header:setAlpha( 1 )
					header:setZoom( 45 )
					if event.interrupted then
						self.clipFinished( header, event )
					else
						header:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				header:completeAnimation()
				self.header:setLeftRight( false, false, -27.84, 25.84 )
				self.header:setTopBottom( false, false, -16.5, -11.62 )
				self.header:setRGB( 0.26, 0.26, 0.26 )
				self.header:setAlpha( 1 )
				self.header:setZoom( 0 )
				headerFrame2( header, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			LoseActive = function ()
				self:setupElementClipCounter( 11 )
				local TabLMaskFrame2 = function ( TabLMask, event )
					if not event.interrupted then
						TabLMask:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabLMask:setLeftRight( true, false, 0, 18.67 )
					TabLMask:setTopBottom( true, true, 0, 0 )
					TabLMask:setAlpha( 0 )
					TabLMask:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabLMask, event )
					else
						TabLMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabLMask:completeAnimation()
				self.TabLMask:setLeftRight( true, false, -4.79, 14.81 )
				self.TabLMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabLMask:setAlpha( 1 )
				self.TabLMask:setZoom( 45 )
				TabLMaskFrame2( TabLMask, {} )
				local TabRMaskFrame2 = function ( TabRMask, event )
					if not event.interrupted then
						TabRMask:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabRMask:setLeftRight( false, true, -18.67, 0 )
					TabRMask:setTopBottom( true, true, 0, 0 )
					TabRMask:setAlpha( 0 )
					TabRMask:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabRMask, event )
					else
						TabRMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabRMask:completeAnimation()
				self.TabRMask:setLeftRight( false, true, -14.81, 4.79 )
				self.TabRMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabRMask:setAlpha( 1 )
				self.TabRMask:setZoom( 45 )
				TabRMaskFrame2( TabRMask, {} )
				local TabMMaskFrame2 = function ( TabMMask, event )
					if not event.interrupted then
						TabMMask:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabMMask:setLeftRight( true, true, 18.67, -18.67 )
					TabMMask:setTopBottom( true, true, 0, 0 )
					TabMMask:setAlpha( 0 )
					TabMMask:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabMMask, event )
					else
						TabMMask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabMMask:completeAnimation()
				self.TabMMask:setLeftRight( true, true, 14.81, -14.81 )
				self.TabMMask:setTopBottom( true, true, -0.77, 0.77 )
				self.TabMMask:setAlpha( 1 )
				self.TabMMask:setZoom( 45 )
				TabMMaskFrame2( TabMMask, {} )
				local TabMFrame2 = function ( TabM, event )
					if not event.interrupted then
						TabM:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabM:setLeftRight( true, true, 18.67, -18.67 )
					TabM:setTopBottom( true, true, 0, 0 )
					TabM:setAlpha( 0.35 )
					TabM:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabM, event )
					else
						TabM:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabM:completeAnimation()
				self.TabM:setLeftRight( true, true, 14.81, -14.81 )
				self.TabM:setTopBottom( true, true, -0.78, 0.78 )
				self.TabM:setAlpha( 1 )
				self.TabM:setZoom( 45 )
				TabMFrame2( TabM, {} )
				local TabRFrame2 = function ( TabR, event )
					if not event.interrupted then
						TabR:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabR:setLeftRight( false, true, -18.67, 0 )
					TabR:setTopBottom( true, true, 0, 0 )
					TabR:setAlpha( 0.35 )
					TabR:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabR, event )
					else
						TabR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabR:completeAnimation()
				self.TabR:setLeftRight( false, true, -14.81, 4.79 )
				self.TabR:setTopBottom( true, true, -0.77, 0.77 )
				self.TabR:setAlpha( 1 )
				self.TabR:setZoom( 45 )
				TabRFrame2( TabR, {} )
				local TabLFrame2 = function ( TabL, event )
					if not event.interrupted then
						TabL:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					TabL:setLeftRight( true, false, 0, 18.67 )
					TabL:setTopBottom( true, true, 0, 0 )
					TabL:setAlpha( 0.35 )
					TabL:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( TabL, event )
					else
						TabL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabL:completeAnimation()
				self.TabL:setLeftRight( true, false, -4.79, 14.81 )
				self.TabL:setTopBottom( true, true, -0.77, 0.77 )
				self.TabL:setAlpha( 1 )
				self.TabL:setZoom( 45 )
				TabLFrame2( TabL, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					text:setLeftRight( false, false, -100, 100 )
					text:setTopBottom( false, false, -8, 12 )
					text:setRGB( 0.96, 0.96, 0.73 )
					text:setAlpha( 0.6 )
					text:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setLeftRight( false, false, -100, 100 )
				self.text:setTopBottom( false, false, -8.5, 12.5 )
				self.text:setRGB( 1, 1, 1 )
				self.text:setAlpha( 1 )
				self.text:setZoom( 45 )
				textFrame2( text, {} )
				local footerFrame2 = function ( footer, event )
					local footerFrame3 = function ( footer, event )
						local footerFrame4 = function ( footer, event )
							local footerFrame5 = function ( footer, event )
								if not event.interrupted then
									footer:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Back )
								end
								footer:setLeftRight( true, true, 14.81, -14.81 )
								footer:setTopBottom( true, true, 32, 5.34 )
								footer:setAlpha( 0 )
								footer:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( footer, event )
								else
									footer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								footerFrame5( footer, event )
								return 
							else
								footer:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								footer:setZoom( -16.31 )
								footer:registerEventHandler( "transition_complete_keyframe", footerFrame5 )
							end
						end
						
						if event.interrupted then
							footerFrame4( footer, event )
							return 
						else
							footer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							footer:setZoom( 33.58 )
							footer:registerEventHandler( "transition_complete_keyframe", footerFrame4 )
						end
					end
					
					if event.interrupted then
						footerFrame3( footer, event )
						return 
					else
						footer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						footer:setZoom( 42.01 )
						footer:registerEventHandler( "transition_complete_keyframe", footerFrame3 )
					end
				end
				
				footer:completeAnimation()
				self.footer:setLeftRight( true, true, 14.81, -14.81 )
				self.footer:setTopBottom( true, true, 32, 5.34 )
				self.footer:setAlpha( 0 )
				self.footer:setZoom( 45 )
				footerFrame2( footer, {} )
				local arrowFrame2 = function ( arrow, event )
					if not event.interrupted then
						arrow:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					arrow:setLeftRight( false, false, -7.1, 5.1 )
					arrow:setTopBottom( false, false, 10.62, 20.38 )
					arrow:setRGB( 0.85, 0.48, 0.09 )
					arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( arrow, event )
					else
						arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrow:completeAnimation()
				self.arrow:setLeftRight( false, false, -7.1, 5.1 )
				self.arrow:setTopBottom( false, false, 21.62, 31.38 )
				self.arrow:setRGB( 0.85, 0.48, 0.09 )
				self.arrow:setAlpha( 0 )
				arrowFrame2( arrow, {} )
				local headerFrame2 = function ( header, event )
					if not event.interrupted then
						header:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Back )
					end
					header:setLeftRight( false, false, -27.84, 25.84 )
					header:setTopBottom( false, false, -16.5, -11.62 )
					header:setRGB( 0.26, 0.26, 0.26 )
					header:setAlpha( 1 )
					header:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( header, event )
					else
						header:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				header:completeAnimation()
				self.header:setLeftRight( false, false, -27.84, 25.84 )
				self.header:setTopBottom( false, false, -24.5, -19.62 )
				self.header:setRGB( 0.85, 0.49, 0.09 )
				self.header:setAlpha( 1 )
				self.header:setZoom( 45 )
				headerFrame2( header, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				TabLMask:completeAnimation()
				self.TabLMask:setAlpha( 0 )
				self.clipFinished( TabLMask, {} )
				TabRMask:completeAnimation()
				self.TabRMask:setAlpha( 0 )
				self.clipFinished( TabRMask, {} )
				TabMMask:completeAnimation()
				self.TabMMask:setAlpha( 0 )
				self.clipFinished( TabMMask, {} )
				TabM:completeAnimation()
				self.TabM:setAlpha( 0 )
				self.clipFinished( TabM, {} )
				TabR:completeAnimation()
				self.TabR:setAlpha( 0 )
				self.clipFinished( TabR, {} )
				TabL:completeAnimation()
				self.TabL:setAlpha( 0 )
				self.clipFinished( TabL, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				footer:completeAnimation()
				self.footer:setAlpha( 0 )
				self.clipFinished( footer, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				header:completeAnimation()
				self.header:setAlpha( 0 )
				self.clipFinished( header, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				TabLMask:completeAnimation()
				self.TabLMask:setAlpha( 0 )
				self.clipFinished( TabLMask, {} )
				TabRMask:completeAnimation()
				self.TabRMask:setAlpha( 0 )
				self.clipFinished( TabRMask, {} )
				TabMMask:completeAnimation()
				self.TabMMask:setAlpha( 0 )
				self.clipFinished( TabMMask, {} )
				TabM:completeAnimation()
				self.TabM:setAlpha( 0 )
				self.clipFinished( TabM, {} )
				TabR:completeAnimation()
				self.TabR:setAlpha( 0 )
				self.clipFinished( TabR, {} )
				TabL:completeAnimation()
				self.TabL:setAlpha( 0 )
				self.clipFinished( TabL, {} )
				text:completeAnimation()
				self.text:setRGB( 1, 1, 1 )
				self.text:setAlpha( 0.21 )
				self.clipFinished( text, {} )
				footer:completeAnimation()
				self.footer:setAlpha( 0 )
				self.clipFinished( footer, {} )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				header:completeAnimation()
				self.header:setAlpha( 0 )
				self.clipFinished( header, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NavButton",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.text:close()
		self.buttonText:close()
		CoD.emblemMaterialTabWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

