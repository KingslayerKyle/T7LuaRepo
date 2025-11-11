require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )

CoD.CustomClassGenericItemButton = InheritFrom( LUI.UIElement )
CoD.CustomClassGenericItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomClassGenericItemButton )
	self.id = "CustomClassGenericItemButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BorderBakedStroke0 = LUI.UIImage.new()
	BorderBakedStroke0:setLeftRight( 0, 1, -4, 4 )
	BorderBakedStroke0:setTopBottom( 0, 1, -4, 4 )
	BorderBakedStroke0:setAlpha( 0 )
	BorderBakedStroke0:setZoom( -200 )
	BorderBakedStroke0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxstrokefull" ) )
	BorderBakedStroke0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BorderBakedStroke0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local BorderBakedBlur0 = LUI.UIImage.new()
	BorderBakedBlur0:setLeftRight( 0, 1, -4, 4 )
	BorderBakedBlur0:setTopBottom( 0, 1, -4, 4 )
	BorderBakedBlur0:setAlpha( 0.4 )
	BorderBakedBlur0:setZoom( -100 )
	BorderBakedBlur0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxblurfull" ) )
	BorderBakedBlur0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BorderBakedBlur0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = LUI.UIImage.new()
	BorderBakedMask0:setLeftRight( 0, 1, -5, 5 )
	BorderBakedMask0:setTopBottom( 0, 1, -5, 5 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.3 )
	BorderBakedMask0:setZoom( 50 )
	BorderBakedMask0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskfull" ) )
	BorderBakedMask0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BorderBakedMask0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = LUI.UIImage.new()
	BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
	BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
	BorderBakedSolid0:setAlpha( 0 )
	BorderBakedSolid0:setZoom( 50 )
	BorderBakedSolid0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BorderBakedSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BorderBakedSolid0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = LUI.UIImage.new()
	BorderBaked0:setLeftRight( 0, 1, -5, 5 )
	BorderBaked0:setTopBottom( 0, 1, -5, 5 )
	BorderBaked0:setAlpha( 0.65 )
	BorderBaked0:setZoom( 50 )
	BorderBaked0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxfull" ) )
	BorderBaked0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BorderBaked0:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0.5, 0.5, -56, 56 )
	itemImage:setTopBottom( 0.5, 0.5, -69, 44 )
	itemImage:setAlpha( 0 )
	itemImage:setZoom( 50 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemlabel = LUI.UIText.new()
	itemlabel:setLeftRight( 0, 1, -6, 6 )
	itemlabel:setTopBottom( 1, 1, -29, -8 )
	itemlabel:setAlpha( 0 )
	itemlabel:setZoom( 50 )
	itemlabel:setTTF( "fonts/default.ttf" )
	itemlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemlabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemlabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemlabel )
	self.itemlabel = itemlabel
	
	local FocusFooter = LUI.UIImage.new()
	FocusFooter:setLeftRight( 0, 1, -6, 6 )
	FocusFooter:setTopBottom( 1, 1, -1, 8 )
	FocusFooter:setAlpha( 0 )
	FocusFooter:setZoom( 50 )
	FocusFooter:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusfooter" ) )
	self:addElement( FocusFooter )
	self.FocusFooter = FocusFooter
	
	local FocusHeader = LUI.UIImage.new()
	FocusHeader:setLeftRight( 0, 1, 47, -47 )
	FocusHeader:setTopBottom( 0, 0, -1, 7 )
	FocusHeader:setRGB( 0.25, 0.25, 0.25 )
	FocusHeader:setZoom( 50 )
	FocusHeader:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusheader" ) )
	FocusHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FocusHeader )
	self.FocusHeader = FocusHeader
	
	local CustomClassPlusSymbol0 = CoD.CustomClassPlusSymbol.new( menu, controller )
	CustomClassPlusSymbol0:setLeftRight( 0.5, 0.5, -10.5, 10.5 )
	CustomClassPlusSymbol0:setTopBottom( 0.5, 0.5, -15, 6 )
	CustomClassPlusSymbol0:setAlpha( 0 )
	self:addElement( CustomClassPlusSymbol0 )
	self.CustomClassPlusSymbol0 = CustomClassPlusSymbol0
	
	self.resetProperties = function ()
		itemImage:completeAnimation()
		BorderBakedSolid0:completeAnimation()
		BorderBaked0:completeAnimation()
		BorderBakedMask0:completeAnimation()
		itemlabel:completeAnimation()
		FocusHeader:completeAnimation()
		FocusFooter:completeAnimation()
		CustomClassPlusSymbol0:completeAnimation()
		itemImage:setAlpha( 0 )
		itemImage:setZoom( 50 )
		BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
		BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
		BorderBakedSolid0:setAlpha( 0 )
		BorderBakedSolid0:setZoom( 50 )
		BorderBaked0:setLeftRight( 0, 1, -5, 5 )
		BorderBaked0:setTopBottom( 0, 1, -5, 5 )
		BorderBaked0:setAlpha( 0.65 )
		BorderBaked0:setZoom( 50 )
		BorderBakedMask0:setLeftRight( 0, 1, -5, 5 )
		BorderBakedMask0:setTopBottom( 0, 1, -5, 5 )
		BorderBakedMask0:setAlpha( 0.3 )
		BorderBakedMask0:setZoom( 50 )
		itemlabel:setLeftRight( 0, 1, -6, 6 )
		itemlabel:setTopBottom( 1, 1, -29, -8 )
		itemlabel:setAlpha( 0 )
		itemlabel:setZoom( 50 )
		FocusHeader:setLeftRight( 0, 1, 47, -47 )
		FocusHeader:setTopBottom( 0, 0, -1, 7 )
		FocusHeader:setRGB( 0.25, 0.25, 0.25 )
		FocusHeader:setZoom( 50 )
		FocusFooter:setAlpha( 0 )
		FocusFooter:setZoom( 50 )
		CustomClassPlusSymbol0:setAlpha( 0 )
		CustomClassPlusSymbol0:setZoom( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 1 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setAlpha( 1 )
				self.clipFinished( itemlabel, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.clipFinished( FocusHeader, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setAlpha( 1 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setAlpha( 1 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 0 )
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -1, 7 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setAlpha( 1 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 1 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 1 )
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -13, -5 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -1, 7 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.2 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0.1 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.clipFinished( BorderBaked0, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0.2 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.3 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0.1 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0.65 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.3 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.2 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0.65 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0.1 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.clipFinished( BorderBaked0, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.clipFinished( FocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setZoom( 50 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 0 )
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -1, 7 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setZoom( 50 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 1 )
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -13, -5 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -1, 7 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setZoom( 0 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end
		},
		Unavailable_Gadget = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.2 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0.1 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.clipFinished( BorderBaked0, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0.2 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.3 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0.1 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0.65 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.3 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.2 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0.65 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0.1 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
			end
		},
		Unequipped_Gadget = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.clipFinished( BorderBaked0, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.clipFinished( FocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 50 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 0 )
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -1, 7 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setAlpha( 1 )
					CustomClassPlusSymbol0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 50 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setAlpha( 0 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setAlpha( 0 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 1 )
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -13, -5 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -1, 7 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setAlpha( 1 )
					CustomClassPlusSymbol0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 0 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end
		},
		Equipped_Gadget = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				self.clipFinished( itemlabel, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.clipFinished( BorderBaked0, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 1 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.clipFinished( FocusHeader, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
					BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, 0, 0 )
					BorderBaked0:setTopBottom( 0, 1, 0, 0 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, -1, 1 )
				self.BorderBaked0:setTopBottom( 0, 1, -1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, 0, 0 )
					itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
					itemlabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, -6, 6 )
				self.itemlabel:setTopBottom( 1, 1, -29, -8 )
				self.itemlabel:setZoom( 50 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 0 )
					FocusFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 50 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -1, 7 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -13, -5 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedMask0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( 0, 1, -1, 1 )
					BorderBakedSolid0:setTopBottom( 0, 1, -1, 1 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setLeftRight( 0, 1, -1, 1 )
					BorderBaked0:setTopBottom( 0, 1, -1, 1 )
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setLeftRight( 0, 1, 0, 0 )
				self.BorderBaked0:setTopBottom( 0, 1, 0, 0 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemlabelFrame2 = function ( itemlabel, event )
					if not event.interrupted then
						itemlabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemlabel:setLeftRight( 0, 1, -6, 6 )
					itemlabel:setTopBottom( 1, 1, -29, -8 )
					itemlabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemlabel, event )
					else
						itemlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemlabel:completeAnimation()
				self.itemlabel:setLeftRight( 0, 1, 0, 0 )
				self.itemlabel:setTopBottom( 1, 1, -28.5, -8.5 )
				self.itemlabel:setZoom( 0 )
				itemlabelFrame2( itemlabel, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 1 )
					FocusFooter:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusFooter, event )
					else
						FocusFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				FocusFooterFrame2( FocusFooter, {} )
				local FocusHeaderFrame2 = function ( FocusHeader, event )
					if not event.interrupted then
						FocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusHeader:setLeftRight( 0, 1, 47, -47 )
					FocusHeader:setTopBottom( 0, 0, -13, -5 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( 0, 1, 47, -47 )
				self.FocusHeader:setTopBottom( 0, 0, -1, 7 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CustomClassPlusSymbol0:close()
		self.itemImage:close()
		self.itemlabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

