require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Border" )

CoD.GridItemButtonLarge = InheritFrom( LUI.UIElement )
CoD.GridItemButtonLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemButtonLarge )
	self.id = "GridItemButtonLarge"
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
	BorderBakedSolid0:setRGB( 1, 1, 1 )
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
	FocusFooter:setRGB( 1, 1, 1 )
	FocusFooter:setZoom( 50 )
	FocusFooter:setImage( RegisterImage( "uie_img_t7_menu_cacselection_listboxafocusfooter" ) )
	FocusFooter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
	itemImage:setLeftRight( true, true, -0.5, 0.5 )
	itemImage:setTopBottom( true, true, -0.5, 0.5 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setAlpha( 0.5 )
	itemImage:setZoom( 50 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
	lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
	lockedIcon:setRGB( 0.78, 0.8, 0.64 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setZoom( 50 )
	lockedIcon:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local notAvailableIcon = LUI.UIImage.new()
	notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
	notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
	notAvailableIcon:setRGB( 1, 1, 1 )
	notAvailableIcon:setAlpha( 0 )
	notAvailableIcon:setZoom( 50 )
	notAvailableIcon:setImage( RegisterImage( "uie_combat_tab_knife" ) )
	notAvailableIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( notAvailableIcon )
	self.notAvailableIcon = notAvailableIcon
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -14, 0 )
	equippedIcon:setTopBottom( true, false, 0, 14 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setZoom( 50 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	equippedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local alertIcon = LUI.UIImage.new()
	alertIcon:setLeftRight( false, true, -13.75, 0.25 )
	alertIcon:setTopBottom( true, false, 0, 14 )
	alertIcon:setRGB( 1, 0.41, 0 )
	alertIcon:setAlpha( 0 )
	alertIcon:setZoom( 50 )
	alertIcon:setImage( RegisterImage( "uie_t7_hud_cac_warning_16" ) )
	alertIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( alertIcon )
	self.alertIcon = alertIcon
	
	local itemLabel = LUI.UIText.new()
	itemLabel:setLeftRight( true, true, -4, 4 )
	itemLabel:setTopBottom( false, true, -19.46, -5.54 )
	itemLabel:setRGB( 1, 1, 1 )
	itemLabel:setZoom( 50 )
	itemLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	itemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemLabel )
	self.itemLabel = itemLabel
	
	local tokenIcon = LUI.UIImage.new()
	tokenIcon:setLeftRight( false, true, -14.58, 1 )
	tokenIcon:setTopBottom( true, false, -1, 16 )
	tokenIcon:setRGB( 1, 1, 1 )
	tokenIcon:setAlpha( 0 )
	tokenIcon:setZoom( 50 )
	tokenIcon:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge" ) )
	tokenIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( tokenIcon )
	self.tokenIcon = tokenIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
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
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setZoom( 0 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 0 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setZoom( 0 )
				self.clipFinished( tokenIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
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
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 50 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				self.clipFinished( tokenIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
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
					itemImage:setLeftRight( true, true, -0.5, 0.5 )
					itemImage:setTopBottom( true, true, -0.5, 0.5 )
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
					lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
					lockedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setZoom( 0 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
					notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
					notAvailableIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setZoom( 0 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -14, 0 )
					equippedIcon:setTopBottom( true, false, 0, 14 )
					equippedIcon:setAlpha( 0 )
					equippedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -13.75, 0.25 )
					alertIcon:setTopBottom( true, false, 0, 14 )
					alertIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setZoom( 0 )
				alertIconFrame2( alertIcon, {} )
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
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -14.58, 1 )
					tokenIcon:setTopBottom( true, false, -1, 16 )
					tokenIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setZoom( 0 )
				tokenIconFrame2( tokenIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
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
					itemImage:setLeftRight( true, true, 0, 0 )
					itemImage:setTopBottom( true, true, 0, 0 )
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 38, -38 )
					lockedIcon:setTopBottom( true, true, 38, -38 )
					lockedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 5, -5 )
					notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
					notAvailableIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -15, -1 )
					equippedIcon:setTopBottom( true, false, 1, 15 )
					equippedIcon:setAlpha( 0 )
					equippedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 50 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -14.75, -0.75 )
					alertIcon:setTopBottom( true, false, 1, 15 )
					alertIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				alertIconFrame2( alertIcon, {} )
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
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -15.58, 0 )
					tokenIcon:setTopBottom( true, false, 0, 17 )
					tokenIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				tokenIconFrame2( tokenIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 0 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.equippedIcon:setZoom( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 0 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setZoom( 0 )
				self.clipFinished( tokenIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
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
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setAlpha( 1 )
				self.equippedIcon:setZoom( 50 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				self.clipFinished( tokenIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
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
					itemImage:setLeftRight( true, true, -0.5, 0.5 )
					itemImage:setTopBottom( true, true, -0.5, 0.5 )
					itemImage:setAlpha( 1 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.8 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
					lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
					lockedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setZoom( 0 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
					notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
					notAvailableIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setZoom( 0 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -14, 0 )
					equippedIcon:setTopBottom( true, false, 0, 14 )
					equippedIcon:setAlpha( 1 )
					equippedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 1 )
				self.equippedIcon:setZoom( 0 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -13.75, 0.25 )
					alertIcon:setTopBottom( true, false, 0, 14 )
					alertIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setZoom( 0 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, -4, 4 )
					itemLabel:setTopBottom( false, true, -19.46, -5.54 )
					itemLabel:setAlpha( 1 )
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
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 0 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -14.58, 1 )
					tokenIcon:setTopBottom( true, false, -1, 16 )
					tokenIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setZoom( 0 )
				tokenIconFrame2( tokenIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
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
					itemImage:setLeftRight( true, true, 0, 0 )
					itemImage:setTopBottom( true, true, 0, 0 )
					itemImage:setAlpha( 0.8 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 1 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 38, -38 )
					lockedIcon:setTopBottom( true, true, 38, -38 )
					lockedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 5, -5 )
					notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
					notAvailableIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -15, -1 )
					equippedIcon:setTopBottom( true, false, 1, 15 )
					equippedIcon:setRGB( 0.55, 0.77, 0.25 )
					equippedIcon:setAlpha( 1 )
					equippedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.equippedIcon:setAlpha( 1 )
				self.equippedIcon:setZoom( 50 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -14.75, -0.75 )
					alertIcon:setTopBottom( true, false, 1, 15 )
					alertIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
					itemLabel:setTopBottom( false, true, -19, -6 )
					itemLabel:setAlpha( 1 )
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
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -15.58, 0 )
					tokenIcon:setTopBottom( true, false, 0, 17 )
					tokenIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				tokenIconFrame2( tokenIcon, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
				self.clipFinished( FocusFooter, {} )
				FocusHeader:completeAnimation()
				self.FocusHeader:setLeftRight( true, true, 31.33, -31.33 )
				self.FocusHeader:setTopBottom( true, false, -1, 4.34 )
				self.FocusHeader:setRGB( 0.25, 0.25, 0.25 )
				self.FocusHeader:setAlpha( 1 )
				self.FocusHeader:setZoom( 0 )
				self.clipFinished( FocusHeader, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.5 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 0 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 0 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setZoom( 0 )
				self.clipFinished( tokenIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
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
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 0.5 )
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 50 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 50 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 50 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 50 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setAlpha( 0 )
				self.tokenIcon:setZoom( 50 )
				self.clipFinished( tokenIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
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
					itemImage:setLeftRight( true, true, -0.5, 0.5 )
					itemImage:setTopBottom( true, true, -0.5, 0.5 )
					itemImage:setAlpha( 0.5 )
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, true, 0, 0 )
				self.itemImage:setAlpha( 0.5 )
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
					lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
					lockedIcon:setAlpha( 0 )
					lockedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 0 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
					notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
					notAvailableIcon:setAlpha( 0 )
					notAvailableIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -14, 0 )
					equippedIcon:setTopBottom( true, false, 0, 14 )
					equippedIcon:setAlpha( 0 )
					equippedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -13.75, 0.25 )
					alertIcon:setTopBottom( true, false, 0, 14 )
					alertIcon:setAlpha( 0 )
					alertIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 0 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, -4, 4 )
					itemLabel:setTopBottom( false, true, -19.46, -5.54 )
					itemLabel:setAlpha( 1 )
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
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 0 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -14.58, 1 )
					tokenIcon:setTopBottom( true, false, -1, 16 )
					tokenIcon:setAlpha( 0 )
					tokenIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setAlpha( 0 )
				self.tokenIcon:setZoom( 0 )
				tokenIconFrame2( tokenIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
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
					itemImage:setLeftRight( true, true, 0, 0 )
					itemImage:setTopBottom( true, true, 0, 0 )
					itemImage:setAlpha( 0.5 )
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, -0.5, 0.5 )
				self.itemImage:setTopBottom( true, true, -0.5, 0.5 )
				self.itemImage:setAlpha( 0.5 )
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 38, -38 )
					lockedIcon:setTopBottom( true, true, 38, -38 )
					lockedIcon:setAlpha( 0 )
					lockedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 50 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 5, -5 )
					notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
					notAvailableIcon:setAlpha( 0 )
					notAvailableIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 50 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -15, -1 )
					equippedIcon:setTopBottom( true, false, 1, 15 )
					equippedIcon:setAlpha( 0 )
					equippedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 50 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -14.75, -0.75 )
					alertIcon:setTopBottom( true, false, 1, 15 )
					alertIcon:setAlpha( 0 )
					alertIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 50 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
					itemLabel:setTopBottom( false, true, -19, -6 )
					itemLabel:setAlpha( 1 )
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
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -15.58, 0 )
					tokenIcon:setTopBottom( true, false, 0, 17 )
					tokenIcon:setAlpha( 0 )
					tokenIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setAlpha( 0 )
				self.tokenIcon:setZoom( 50 )
				tokenIconFrame2( tokenIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedMask0:setAlpha( 0.35 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
				self.BorderBakedSolid0:setAlpha( 0.45 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
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
				self.itemImage:setAlpha( 0 )
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setAlpha( 0.5 )
				self.lockedIcon:setZoom( 0 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setAlpha( 0 )
				self.alertIcon:setZoom( 0 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setAlpha( 0.5 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setAlpha( 0 )
				self.tokenIcon:setZoom( 0 )
				self.clipFinished( tokenIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedMask0:setAlpha( 0.75 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
				self.BorderBakedSolid0:setAlpha( 0.85 )
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
				self.FocusFooter:setAlpha( 0 )
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
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setAlpha( 0.5 )
				self.lockedIcon:setZoom( 50 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setZoom( 50 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, -4, 4 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setAlpha( 0.5 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				self.clipFinished( tokenIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedMask0:setAlpha( 0.75 )
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
				self.BorderBakedMask0:setAlpha( 0.35 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setTopBottom( true, true, -0.5, 0.5 )
					BorderBakedSolid0:setAlpha( 0.85 )
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
				self.BorderBakedSolid0:setAlpha( 0.45 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local FocusFooterFrame2 = function ( FocusFooter, event )
					if not event.interrupted then
						FocusFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					FocusFooter:setAlpha( 0 )
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
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
					lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
					lockedIcon:setAlpha( 0.5 )
					lockedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setAlpha( 0.5 )
				self.lockedIcon:setZoom( 0 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
					notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
					notAvailableIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setZoom( 0 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -14, 0 )
					equippedIcon:setTopBottom( true, false, 0, 14 )
					equippedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setZoom( 0 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -13.75, 0.25 )
					alertIcon:setTopBottom( true, false, 0, 14 )
					alertIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setZoom( 0 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, -4, 4 )
					itemLabel:setTopBottom( false, true, -19.46, -5.54 )
					itemLabel:setAlpha( 0.5 )
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
				self.itemLabel:setAlpha( 0.5 )
				self.itemLabel:setZoom( 0 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -14.58, 1 )
					tokenIcon:setTopBottom( true, false, -1, 16 )
					tokenIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setZoom( 0 )
				tokenIconFrame2( tokenIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, 0, 0 )
					BorderBakedMask0:setTopBottom( true, true, 0, 0 )
					BorderBakedMask0:setAlpha( 0.35 )
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
				self.BorderBakedMask0:setAlpha( 0.75 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
					BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
					BorderBakedSolid0:setAlpha( 0.45 )
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
				self.BorderBakedSolid0:setAlpha( 0.85 )
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
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 38, -38 )
					lockedIcon:setTopBottom( true, true, 38, -38 )
					lockedIcon:setAlpha( 0.5 )
					lockedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setAlpha( 0.5 )
				self.lockedIcon:setZoom( 50 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 5, -5 )
					notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
					notAvailableIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -15, -1 )
					equippedIcon:setTopBottom( true, false, 1, 15 )
					equippedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setZoom( 50 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -14.75, -0.75 )
					alertIcon:setTopBottom( true, false, 1, 15 )
					alertIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
					itemLabel:setTopBottom( false, true, -19, -6 )
					itemLabel:setAlpha( 0.5 )
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
				self.itemLabel:setAlpha( 0.5 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -15.58, 0 )
					tokenIcon:setTopBottom( true, false, 0, 17 )
					tokenIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				tokenIconFrame2( tokenIcon, {} )
			end
		},
		MutuallyExclusive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
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
				FocusFooter:completeAnimation()
				self.FocusFooter:setLeftRight( true, true, -4, 4 )
				self.FocusFooter:setTopBottom( false, true, -1, 5 )
				self.FocusFooter:setAlpha( 0 )
				self.FocusFooter:setZoom( 0 )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setAlpha( 0 )
				self.lockedIcon:setZoom( 0 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setAlpha( 0 )
				self.notAvailableIcon:setZoom( 0 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setAlpha( 0 )
				self.equippedIcon:setZoom( 0 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setAlpha( 1 )
				self.alertIcon:setZoom( 0 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19, -6 )
				self.itemLabel:setAlpha( 1 )
				self.itemLabel:setZoom( 0 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setAlpha( 0 )
				self.tokenIcon:setZoom( 0 )
				self.clipFinished( tokenIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
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
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				self.clipFinished( lockedIcon, {} )
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				self.clipFinished( notAvailableIcon, {} )
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setZoom( 50 )
				self.clipFinished( equippedIcon, {} )
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				self.clipFinished( alertIcon, {} )
				itemLabel:completeAnimation()
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				self.clipFinished( itemLabel, {} )
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				self.clipFinished( tokenIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 11 )
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
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
					lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
					lockedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 38, -38 )
				self.lockedIcon:setTopBottom( true, true, 38, -38 )
				self.lockedIcon:setZoom( 0 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
					notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
					notAvailableIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 5, -5 )
				self.notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
				self.notAvailableIcon:setZoom( 0 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -14, 0 )
					equippedIcon:setTopBottom( true, false, 0, 14 )
					equippedIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -15, -1 )
				self.equippedIcon:setTopBottom( true, false, 1, 15 )
				self.equippedIcon:setZoom( 0 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -13.75, 0.25 )
					alertIcon:setTopBottom( true, false, 0, 14 )
					alertIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -14.75, -0.75 )
				self.alertIcon:setTopBottom( true, false, 1, 15 )
				self.alertIcon:setZoom( 0 )
				alertIconFrame2( alertIcon, {} )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					itemLabel:setLeftRight( true, true, 0, 0 )
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
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -14.58, 1 )
					tokenIcon:setTopBottom( true, false, -1, 16 )
					tokenIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -15.58, 0 )
				self.tokenIcon:setTopBottom( true, false, 0, 17 )
				self.tokenIcon:setZoom( 0 )
				tokenIconFrame2( tokenIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 11 )
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
				local lockedIconFrame2 = function ( lockedIcon, event )
					if not event.interrupted then
						lockedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					lockedIcon:setLeftRight( true, true, 38, -38 )
					lockedIcon:setTopBottom( true, true, 38, -38 )
					lockedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( lockedIcon, event )
					else
						lockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( true, true, 37.33, -37.33 )
				self.lockedIcon:setTopBottom( true, true, 37.33, -37.33 )
				self.lockedIcon:setZoom( 50 )
				lockedIconFrame2( lockedIcon, {} )
				local notAvailableIconFrame2 = function ( notAvailableIcon, event )
					if not event.interrupted then
						notAvailableIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					notAvailableIcon:setLeftRight( true, true, 5, -5 )
					notAvailableIcon:setTopBottom( true, true, 29.75, -29.75 )
					notAvailableIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( notAvailableIcon, event )
					else
						notAvailableIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				notAvailableIcon:completeAnimation()
				self.notAvailableIcon:setLeftRight( true, true, 4.91, -4.91 )
				self.notAvailableIcon:setTopBottom( true, true, 29.23, -29.23 )
				self.notAvailableIcon:setZoom( 50 )
				notAvailableIconFrame2( notAvailableIcon, {} )
				local equippedIconFrame2 = function ( equippedIcon, event )
					if not event.interrupted then
						equippedIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					equippedIcon:setLeftRight( false, true, -15, -1 )
					equippedIcon:setTopBottom( true, false, 1, 15 )
					equippedIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( equippedIcon, event )
					else
						equippedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equippedIcon:completeAnimation()
				self.equippedIcon:setLeftRight( false, true, -14, 0 )
				self.equippedIcon:setTopBottom( true, false, 0, 14 )
				self.equippedIcon:setZoom( 50 )
				equippedIconFrame2( equippedIcon, {} )
				local alertIconFrame2 = function ( alertIcon, event )
					if not event.interrupted then
						alertIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					alertIcon:setLeftRight( false, true, -14.75, -0.75 )
					alertIcon:setTopBottom( true, false, 1, 15 )
					alertIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( alertIcon, event )
					else
						alertIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				alertIcon:completeAnimation()
				self.alertIcon:setLeftRight( false, true, -13.75, 0.25 )
				self.alertIcon:setTopBottom( true, false, 0, 14 )
				self.alertIcon:setZoom( 50 )
				alertIconFrame2( alertIcon, {} )
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
				self.itemLabel:setLeftRight( true, true, 0, 0 )
				self.itemLabel:setTopBottom( false, true, -19.46, -5.54 )
				self.itemLabel:setZoom( 50 )
				itemLabelFrame2( itemLabel, {} )
				local tokenIconFrame2 = function ( tokenIcon, event )
					if not event.interrupted then
						tokenIcon:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					tokenIcon:setLeftRight( false, true, -15.58, 0 )
					tokenIcon:setTopBottom( true, false, 0, 17 )
					tokenIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( tokenIcon, event )
					else
						tokenIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tokenIcon:completeAnimation()
				self.tokenIcon:setLeftRight( false, true, -14.58, 1 )
				self.tokenIcon:setTopBottom( true, false, -1, 16 )
				self.tokenIcon:setZoom( 50 )
				tokenIconFrame2( tokenIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return IsCACItemPurchasable( menu, element, event )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	if self.m_eventHandlers.update_class then
		local currentEv = self.m_eventHandlers.update_class
		self:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.border:close()
		self.itemImage:close()
		self.itemLabel:close()
		CoD.GridItemButtonLarge.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

