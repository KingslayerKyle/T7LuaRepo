require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Border" )

CoD.GunsmithAttachmentItemButton = InheritFrom( LUI.UIElement )
CoD.GunsmithAttachmentItemButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithAttachmentItemButton )
	self.id = "GunsmithAttachmentItemButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
	BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.9 )
	BorderBakedMask0:setZoom( 50 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
	BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
	BorderBakedSolid0:setZoom( 50 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 3.31 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	border:setZoom( 10 )
	self:addElement( border )
	self.border = border
	
	local FocusFooter = LUI.UIImage.new()
	FocusFooter:setLeftRight( true, true, -4, 4 )
	FocusFooter:setTopBottom( false, true, -1, 5 )
	FocusFooter:setZoom( 50 )
	FocusFooter:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusfooter" ) )
	self:addElement( FocusFooter )
	self.FocusFooter = FocusFooter
	
	local FocusHeader = LUI.UIImage.new()
	FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
	FocusHeader:setTopBottom( true, false, -8.34, -3 )
	FocusHeader:setRGB( 0.91, 0.39, 0.05 )
	FocusHeader:setZoom( 50 )
	FocusHeader:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusheader" ) )
	FocusHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FocusHeader )
	self.FocusHeader = FocusHeader
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 16.79, -16.79 )
	itemImage:setTopBottom( true, true, 7.71, -24.71 )
	itemImage:setZoom( 50 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemLabel = LUI.UIText.new()
	itemLabel:setLeftRight( true, true, -4, 4 )
	itemLabel:setTopBottom( false, true, -19.46, -5.54 )
	itemLabel:setZoom( 50 )
	itemLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	itemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemLabel:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( itemLabel )
	self.itemLabel = itemLabel
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -26, -12 )
	equippedIcon:setTopBottom( true, false, 9, 23 )
	equippedIcon:setRGB( 0.56, 0.68, 0.27 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.6 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 3.31 )
				self.border:setRGB( 0.58, 0.58, 0.6 )
				self.border:setZoom( 0 )
				self.clipFinished( border, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.5, -16.5 )
				self.itemImage:setTopBottom( true, true, 8, -25 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				self.clipFinished( BorderBakedSolid0, {} )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 0 )
				self.border:setZoom( 10 )
				self.clipFinished( border, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 1 )
				self.FocusFooter:setZoom( 50 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -8.34, -3 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.79, -16.79 )
				self.itemImage:setTopBottom( true, true, 7.71, -24.71 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setAlpha( 1 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.6 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
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
					FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
					FocusHeader:setTopBottom( true, false, -8.34, -3 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setLeftRight( true, true, 16.79, -16.79 )
					itemImage:setTopBottom( true, true, 7.71, -24.71 )
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.5, -16.5 )
				self.itemImage:setTopBottom( true, true, 8, -25 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, -4, 4 )
					itemLabel:setTopBottom( false, true, -19.46, -5.54 )
					itemLabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemLabel, event )
					else
						itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setZoom( 0 )
				itemLabelFrame2( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BorderBakedMask0:setLeftRight( true, true, 0, 0 )
					BorderBakedMask0:setTopBottom( true, true, 0, 0 )
					BorderBakedMask0:setAlpha( 0.5 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
					BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.6 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
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
					FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
					FocusHeader:setTopBottom( true, false, -1, 4.34 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -8.34, -3 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setLeftRight( true, true, 16.5, -16.5 )
					itemImage:setTopBottom( true, true, 8, -25 )
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.79, -16.79 )
				self.itemImage:setTopBottom( true, true, 7.71, -24.71 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
					itemLabel:setTopBottom( false, true, -19, -6 )
					itemLabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemLabel, event )
					else
						itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.6 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 3.31 )
				self.border:setRGB( 0.58, 0.58, 0.6 )
				self.border:setZoom( 0 )
				self.clipFinished( border, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setAlpha( 0 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.5, -16.5 )
				self.itemImage:setTopBottom( true, true, 8, -25 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				self.clipFinished( BorderBakedSolid0, {} )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 0 )
				self.border:setZoom( 10 )
				self.clipFinished( border, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 1 )
				self.FocusFooter:setZoom( 50 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -8.34, -3 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.79, -16.79 )
				self.itemImage:setTopBottom( true, true, 7.71, -24.71 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedMask0:setAlpha( 0.9 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setAlpha( 1 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.6 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
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
					FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
					FocusHeader:setTopBottom( true, false, -8.34, -3 )
					FocusHeader:setRGB( 0.91, 0.39, 0.05 )
					FocusHeader:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setZoom( 0 )
				FocusHeaderFrame2( FocusHeader, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemImage:setLeftRight( true, true, 16.79, -16.79 )
					itemImage:setTopBottom( true, true, 7.71, -24.71 )
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.5, -16.5 )
				self.itemImage:setTopBottom( true, true, 8, -25 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, -4, 4 )
					itemLabel:setTopBottom( false, true, -19.46, -5.54 )
					itemLabel:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemLabel, event )
					else
						itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setZoom( 0 )
				itemLabelFrame2( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BorderBakedMask0:setLeftRight( true, true, 0, 0 )
					BorderBakedMask0:setTopBottom( true, true, 0, 0 )
					BorderBakedMask0:setAlpha( 0.5 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setAlpha( 0.9 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
					BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.6 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
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
					FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
					FocusHeader:setTopBottom( true, false, -1, 4.34 )
					FocusHeader:setRGB( 0.25, 0.25, 0.25 )
					FocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FocusHeader, event )
					else
						FocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -8.34, -3 )
				self.FocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.FocusHeader:setZoom( 50 )
				FocusHeaderFrame2( FocusHeader, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setLeftRight( true, true, 16.5, -16.5 )
					itemImage:setTopBottom( true, true, 8, -25 )
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 16.79, -16.79 )
				self.itemImage:setTopBottom( true, true, 7.71, -24.71 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
					itemLabel:setTopBottom( false, true, -19, -6 )
					itemLabel:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemLabel, event )
					else
						itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setRGB( 0.56, 0.68, 0.27 )
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.border:close()
		element.itemImage:close()
		element.itemLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

