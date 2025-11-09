require( "ui.uieditor.widgets.BorderBakedSymbols" )
require( "ui.uieditor.widgets.BorderBakedStroke" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassCategoryHeader" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.BorderFooter" )
require( "ui.uieditor.widgets.BorderFocusHeader" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )

local PostLoadFunc = function ( self, controller )
	if Dvar.ui_extracamCAC:get() then
		self.Image0:unregisterAllElementModelBindings()
		self.Image0:setImage( RegisterMaterial( "extracam_4" ) )
		self.Image0:setShaderVector( 0, 0.25, 0, 0.75, 1 )
		self.Image0:setShaderVector( 1, 0.02, 0.02, 0, 0 )
	end
end

CoD.SecondaryWeaponSlot = InheritFrom( LUI.UIElement )
CoD.SecondaryWeaponSlot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SecondaryWeaponSlot )
	self.id = "SecondaryWeaponSlot"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 335 )
	self:setTopBottom( true, false, 0, 304 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedSymbols0 = CoD.BorderBakedSymbols.new( menu, controller )
	BorderBakedSymbols0:setLeftRight( true, true, 0, 0 )
	BorderBakedSymbols0:setTopBottom( true, true, 26, 0 )
	BorderBakedSymbols0:setRGB( 1, 1, 1 )
	BorderBakedSymbols0:setZoom( 10 )
	self:addElement( BorderBakedSymbols0 )
	self.BorderBakedSymbols0 = BorderBakedSymbols0
	
	local BorderBakedStroke0 = CoD.BorderBakedStroke.new( menu, controller )
	BorderBakedStroke0:setLeftRight( true, true, 0, 0 )
	BorderBakedStroke0:setTopBottom( true, true, 26, 0 )
	BorderBakedStroke0:setRGB( 1, 1, 1 )
	BorderBakedStroke0:setAlpha( 0 )
	BorderBakedStroke0:setZoom( -200 )
	self:addElement( BorderBakedStroke0 )
	self.BorderBakedStroke0 = BorderBakedStroke0
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 0, 0 )
	BorderBakedBlur0:setTopBottom( true, true, 26, 0 )
	BorderBakedBlur0:setRGB( 1, 1, 1 )
	BorderBakedBlur0:setAlpha( 0.4 )
	BorderBakedBlur0:setZoom( -100 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local CustomClassCategoryHeader0 = CoD.CustomClassCategoryHeader.new( menu, controller )
	CustomClassCategoryHeader0:setLeftRight( true, true, 0, 0 )
	CustomClassCategoryHeader0:setTopBottom( true, false, 1, 21 )
	CustomClassCategoryHeader0:setRGB( 1, 1, 1 )
	CustomClassCategoryHeader0:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CustomClassCategoryHeader0.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CustomClassCategoryHeader0 )
	self.CustomClassCategoryHeader0 = CustomClassCategoryHeader0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 26, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0.1 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -126, 126 )
	Image0:setTopBottom( false, false, -113, 139 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.85 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 11.46, 53.46 )
	Label0:setTopBottom( false, true, -26, -8 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Label0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local BorderBaked = CoD.BorderBaked.new( menu, controller )
	BorderBaked:setLeftRight( true, true, 0, 0 )
	BorderBaked:setTopBottom( true, true, 26, 0 )
	BorderBaked:setRGB( 1, 1, 1 )
	BorderBaked:setAlpha( 0 )
	self:addElement( BorderBaked )
	self.BorderBaked = BorderBaked
	
	local BorderFooter = CoD.BorderFooter.new( menu, controller )
	BorderFooter:setLeftRight( true, true, -3, 3 )
	BorderFooter:setTopBottom( true, true, 304, 5 )
	BorderFooter:setRGB( 1, 1, 1 )
	BorderFooter:setAlpha( 0 )
	self:addElement( BorderFooter )
	self.BorderFooter = BorderFooter
	
	local BorderFocusHeader = CoD.BorderFocusHeader.new( menu, controller )
	BorderFocusHeader:setLeftRight( true, true, 120, -120 )
	BorderFocusHeader:setTopBottom( false, false, -127, -122 )
	BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
	self:addElement( BorderFocusHeader )
	self.BorderFocusHeader = BorderFocusHeader
	
	local CustomClassPlusSymbol0 = CoD.CustomClassPlusSymbol.new( menu, controller )
	CustomClassPlusSymbol0:setLeftRight( false, false, -16, 16 )
	CustomClassPlusSymbol0:setTopBottom( false, false, -7, 25 )
	CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
	CustomClassPlusSymbol0:setAlpha( 0 )
	self:addElement( CustomClassPlusSymbol0 )
	self.CustomClassPlusSymbol0 = CustomClassPlusSymbol0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				CustomClassCategoryHeader0:completeAnimation()
				self.CustomClassCategoryHeader0:setAlpha( 1 )
				self.clipFinished( CustomClassCategoryHeader0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -126, 126 )
				self.Image0:setTopBottom( false, false, -113, 139 )
				self.Image0:setAlpha( 0.85 )
				self.Image0:setZoom( 0 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26, -8 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 1 )
				self.Label0:setZoom( 0 )
				self.clipFinished( Label0, {} )
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, 0, 0 )
				self.BorderBaked:setTopBottom( true, true, 26, 0 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 0 )
				self.clipFinished( BorderBaked, {} )
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -3, 3 )
				self.BorderFooter:setTopBottom( true, true, 304, 5 )
				self.BorderFooter:setAlpha( 0 )
				self.BorderFooter:setZoom( 0 )
				self.clipFinished( BorderFooter, {} )
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -127, -122 )
				self.BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
				self.BorderFocusHeader:setAlpha( 1 )
				self.BorderFocusHeader:setZoom( 0 )
				self.clipFinished( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 0 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				CustomClassCategoryHeader0:completeAnimation()
				self.CustomClassCategoryHeader0:setAlpha( 1 )
				self.clipFinished( CustomClassCategoryHeader0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 30 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 30 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -131.27, 131.27 )
				self.Image0:setTopBottom( false, false, -118.27, 144.27 )
				self.Image0:setAlpha( 1 )
				self.Image0:setZoom( 30 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26.27, -7.73 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 1 )
				self.Label0:setZoom( 30 )
				self.clipFinished( Label0, {} )
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 30 )
				self.clipFinished( BorderBaked, {} )
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -8, 8 )
				self.BorderFooter:setTopBottom( true, true, 307, 8 )
				self.BorderFooter:setAlpha( 1 )
				self.BorderFooter:setZoom( 30 )
				self.clipFinished( BorderFooter, {} )
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -144, -139 )
				self.BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.BorderFocusHeader:setZoom( 30 )
				self.clipFinished( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 0 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, 0, 0 )
					BorderBakedMask0:setTopBottom( true, true, 26, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 30 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
					BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 30 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					Image0:setLeftRight( false, false, -126, 126 )
					Image0:setTopBottom( false, false, -113, 139 )
					Image0:setAlpha( 0.85 )
					Image0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -131.27, 131.27 )
				self.Image0:setTopBottom( false, false, -118.27, 144.27 )
				self.Image0:setAlpha( 1 )
				self.Image0:setZoom( 30 )
				Image0Frame2( Image0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					Label0:setLeftRight( true, false, 11.46, 154.46 )
					Label0:setTopBottom( false, true, -26, -8 )
					Label0:setRGB( 1, 1, 1 )
					Label0:setAlpha( 1 )
					Label0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26.27, -7.73 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 1 )
				self.Label0:setZoom( 30 )
				Label0Frame2( Label0, {} )
				local BorderBakedFrame2 = function ( BorderBaked, event )
					if not event.interrupted then
						BorderBaked:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked:setLeftRight( true, true, 0, 0 )
					BorderBaked:setTopBottom( true, true, 26, 0 )
					BorderBaked:setAlpha( 0 )
					BorderBaked:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked, event )
					else
						BorderBaked:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 30 )
				BorderBakedFrame2( BorderBaked, {} )
				local BorderFooterFrame2 = function ( BorderFooter, event )
					if not event.interrupted then
						BorderFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderFooter:setLeftRight( true, true, -3, 3 )
					BorderFooter:setTopBottom( true, true, 304, 5 )
					BorderFooter:setAlpha( 0 )
					BorderFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderFooter, event )
					else
						BorderFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -8, 8 )
				self.BorderFooter:setTopBottom( true, true, 307, 8 )
				self.BorderFooter:setAlpha( 1 )
				self.BorderFooter:setZoom( 30 )
				BorderFooterFrame2( BorderFooter, {} )
				local BorderFocusHeaderFrame2 = function ( BorderFocusHeader, event )
					if not event.interrupted then
						BorderFocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderFocusHeader:setLeftRight( true, true, 120, -120 )
					BorderFocusHeader:setTopBottom( false, false, -127, -122 )
					BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
					BorderFocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader, event )
					else
						BorderFocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -144, -139 )
				self.BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.BorderFocusHeader:setZoom( 30 )
				BorderFocusHeaderFrame2( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 0 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
					BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
					BorderBakedMask0:setAlpha( 0.5 )
					BorderBakedMask0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
					BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Image0:setLeftRight( false, false, -131.27, 131.27 )
					Image0:setTopBottom( false, false, -118.27, 144.27 )
					Image0:setAlpha( 1 )
					Image0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -126, 126 )
				self.Image0:setTopBottom( false, false, -113, 139 )
				self.Image0:setAlpha( 0.85 )
				self.Image0:setZoom( 0 )
				Image0Frame2( Image0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Label0:setLeftRight( true, false, 11.46, 154.46 )
					Label0:setTopBottom( false, true, -26.27, -7.73 )
					Label0:setRGB( 1, 1, 1 )
					Label0:setAlpha( 1 )
					Label0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26, -8 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 1 )
				self.Label0:setZoom( 0 )
				Label0Frame2( Label0, {} )
				local BorderBakedFrame2 = function ( BorderBaked, event )
					if not event.interrupted then
						BorderBaked:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
					BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
					BorderBaked:setAlpha( 0 )
					BorderBaked:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBaked, event )
					else
						BorderBaked:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, 0, 0 )
				self.BorderBaked:setTopBottom( true, true, 26, 0 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 0 )
				BorderBakedFrame2( BorderBaked, {} )
				local BorderFooterFrame2 = function ( BorderFooter, event )
					if not event.interrupted then
						BorderFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderFooter:setLeftRight( true, true, -8, 8 )
					BorderFooter:setTopBottom( true, true, 307, 8 )
					BorderFooter:setAlpha( 1 )
					BorderFooter:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderFooter, event )
					else
						BorderFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -3, 3 )
				self.BorderFooter:setTopBottom( true, true, 304, 5 )
				self.BorderFooter:setAlpha( 0 )
				self.BorderFooter:setZoom( 0 )
				BorderFooterFrame2( BorderFooter, {} )
				local BorderFocusHeaderFrame2 = function ( BorderFocusHeader, event )
					if not event.interrupted then
						BorderFocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderFocusHeader:setLeftRight( true, true, 120, -120 )
					BorderFocusHeader:setTopBottom( false, false, -144, -139 )
					BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
					BorderFocusHeader:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader, event )
					else
						BorderFocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -127, -122 )
				self.BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
				self.BorderFocusHeader:setZoom( 0 )
				BorderFocusHeaderFrame2( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setAlpha( 0 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				CustomClassCategoryHeader0:completeAnimation()
				self.CustomClassCategoryHeader0:setAlpha( 1 )
				self.clipFinished( CustomClassCategoryHeader0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -100, 100 )
				self.Image0:setTopBottom( false, false, -100, 100 )
				self.Image0:setAlpha( 0 )
				self.Image0:setZoom( 0 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26, -8 )
				self.Label0:setRGB( 0.78, 0.8, 0.64 )
				self.Label0:setAlpha( 0 )
				self.Label0:setZoom( 0 )
				self.clipFinished( Label0, {} )
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, 0, 0 )
				self.BorderBaked:setTopBottom( true, true, 26, 0 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 0 )
				self.clipFinished( BorderBaked, {} )
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -3, 3 )
				self.BorderFooter:setTopBottom( true, true, 304, 5 )
				self.BorderFooter:setAlpha( 0 )
				self.BorderFooter:setZoom( 0 )
				self.clipFinished( BorderFooter, {} )
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -127, -122 )
				self.BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
				self.BorderFocusHeader:setAlpha( 1 )
				self.BorderFocusHeader:setZoom( 0 )
				self.clipFinished( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 0 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				CustomClassCategoryHeader0:completeAnimation()
				self.CustomClassCategoryHeader0:setAlpha( 1 )
				self.clipFinished( CustomClassCategoryHeader0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 30 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 30 )
				self.clipFinished( BorderBakedSolid0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -103, 103 )
				self.Image0:setTopBottom( false, false, -103, 103 )
				self.Image0:setAlpha( 0 )
				self.Image0:setZoom( 30 )
				self.clipFinished( Image0, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26.27, -7.73 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 0 )
				self.Label0:setZoom( 30 )
				self.clipFinished( Label0, {} )
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 30 )
				self.clipFinished( BorderBaked, {} )
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -8, 8 )
				self.BorderFooter:setTopBottom( true, true, 307, 8 )
				self.BorderFooter:setAlpha( 1 )
				self.BorderFooter:setZoom( 30 )
				self.clipFinished( BorderFooter, {} )
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -144, -139 )
				self.BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.BorderFocusHeader:setZoom( 30 )
				self.clipFinished( BorderFocusHeader, {} )
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 50 )
				self.clipFinished( CustomClassPlusSymbol0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, 0, 0 )
					BorderBakedMask0:setTopBottom( true, true, 26, 0 )
					BorderBakedMask0:setAlpha( 0 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.BorderBakedMask0:setZoom( 30 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
					BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
					BorderBakedSolid0:setAlpha( 0.1 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBakedSolid0:setAlpha( 0.65 )
				self.BorderBakedSolid0:setZoom( 30 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					Image0:setLeftRight( false, false, -100, 100 )
					Image0:setTopBottom( false, false, -100, 100 )
					Image0:setAlpha( 0 )
					Image0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -103, 103 )
				self.Image0:setTopBottom( false, false, -103, 103 )
				self.Image0:setAlpha( 0 )
				self.Image0:setZoom( 30 )
				Image0Frame2( Image0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					Label0:setLeftRight( true, false, 11.46, 154.46 )
					Label0:setTopBottom( false, true, -26, -8 )
					Label0:setRGB( 0.78, 0.8, 0.64 )
					Label0:setAlpha( 0 )
					Label0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26.27, -7.73 )
				self.Label0:setRGB( 1, 1, 1 )
				self.Label0:setAlpha( 0 )
				self.Label0:setZoom( 30 )
				Label0Frame2( Label0, {} )
				local BorderBakedFrame2 = function ( BorderBaked, event )
					if not event.interrupted then
						BorderBaked:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked:setLeftRight( true, true, 0, 0 )
					BorderBaked:setTopBottom( true, true, 26, 0 )
					BorderBaked:setAlpha( 0 )
					BorderBaked:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked, event )
					else
						BorderBaked:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
				self.BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 30 )
				BorderBakedFrame2( BorderBaked, {} )
				local BorderFooterFrame2 = function ( BorderFooter, event )
					if not event.interrupted then
						BorderFooter:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderFooter:setLeftRight( true, true, -3, 3 )
					BorderFooter:setTopBottom( true, true, 304, 5 )
					BorderFooter:setAlpha( 0 )
					BorderFooter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderFooter, event )
					else
						BorderFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -8, 8 )
				self.BorderFooter:setTopBottom( true, true, 307, 8 )
				self.BorderFooter:setAlpha( 1 )
				self.BorderFooter:setZoom( 30 )
				BorderFooterFrame2( BorderFooter, {} )
				local BorderFocusHeaderFrame2 = function ( BorderFocusHeader, event )
					if not event.interrupted then
						BorderFocusHeader:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderFocusHeader:setLeftRight( true, true, 120, -120 )
					BorderFocusHeader:setTopBottom( false, false, -127, -122 )
					BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
					BorderFocusHeader:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader, event )
					else
						BorderFocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -144, -139 )
				self.BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
				self.BorderFocusHeader:setZoom( 30 )
				BorderFocusHeaderFrame2( BorderFocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
					CustomClassPlusSymbol0:setAlpha( 1 )
					CustomClassPlusSymbol0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 50 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )
				BorderBakedStroke0:completeAnimation()
				self.BorderBakedStroke0:setAlpha( 0 )
				self.clipFinished( BorderBakedStroke0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setLeftRight( true, true, -5.03, 5.03 )
					BorderBakedMask0:setTopBottom( true, true, 21.83, 4.17 )
					BorderBakedMask0:setAlpha( 0.5 )
					BorderBakedMask0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedMask0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setLeftRight( true, true, -5.03, 5.03 )
					BorderBakedSolid0:setTopBottom( true, true, 21.83, 4.17 )
					BorderBakedSolid0:setAlpha( 0.65 )
					BorderBakedSolid0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
				self.BorderBakedSolid0:setTopBottom( true, true, 26, 0 )
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Image0:setLeftRight( false, false, -103, 103 )
					Image0:setTopBottom( false, false, -103, 103 )
					Image0:setAlpha( 0 )
					Image0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -100, 100 )
				self.Image0:setTopBottom( false, false, -100, 100 )
				self.Image0:setAlpha( 0 )
				self.Image0:setZoom( 0 )
				Image0Frame2( Image0, {} )
				local Label0Frame2 = function ( Label0, event )
					if not event.interrupted then
						Label0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Label0:setLeftRight( true, false, 11.46, 154.46 )
					Label0:setTopBottom( false, true, -26.27, -7.73 )
					Label0:setRGB( 0.78, 0.8, 0.64 )
					Label0:setAlpha( 0 )
					Label0:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( Label0, event )
					else
						Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 11.46, 154.46 )
				self.Label0:setTopBottom( false, true, -26, -8 )
				self.Label0:setRGB( 0.78, 0.8, 0.64 )
				self.Label0:setAlpha( 0 )
				self.Label0:setZoom( 0 )
				Label0Frame2( Label0, {} )
				local BorderBakedFrame2 = function ( BorderBaked, event )
					if not event.interrupted then
						BorderBaked:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderBaked:setLeftRight( true, true, -5.03, 5.03 )
					BorderBaked:setTopBottom( true, true, 21.83, 4.17 )
					BorderBaked:setAlpha( 0 )
					BorderBaked:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderBaked, event )
					else
						BorderBaked:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked:completeAnimation()
				self.BorderBaked:setLeftRight( true, true, 0, 0 )
				self.BorderBaked:setTopBottom( true, true, 26, 0 )
				self.BorderBaked:setAlpha( 0 )
				self.BorderBaked:setZoom( 0 )
				BorderBakedFrame2( BorderBaked, {} )
				local BorderFooterFrame2 = function ( BorderFooter, event )
					if not event.interrupted then
						BorderFooter:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderFooter:setLeftRight( true, true, -8, 8 )
					BorderFooter:setTopBottom( true, true, 307, 8 )
					BorderFooter:setAlpha( 1 )
					BorderFooter:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderFooter, event )
					else
						BorderFooter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFooter:completeAnimation()
				self.BorderFooter:setLeftRight( true, true, -3, 3 )
				self.BorderFooter:setTopBottom( true, true, 304, 5 )
				self.BorderFooter:setAlpha( 0 )
				self.BorderFooter:setZoom( 0 )
				BorderFooterFrame2( BorderFooter, {} )
				local BorderFocusHeaderFrame2 = function ( BorderFocusHeader, event )
					if not event.interrupted then
						BorderFocusHeader:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					BorderFocusHeader:setLeftRight( true, true, 120, -120 )
					BorderFocusHeader:setTopBottom( false, false, -144, -139 )
					BorderFocusHeader:setRGB( 0.91, 0.39, 0.05 )
					BorderFocusHeader:setZoom( 30 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader, event )
					else
						BorderFocusHeader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader:completeAnimation()
				self.BorderFocusHeader:setLeftRight( true, true, 120, -120 )
				self.BorderFocusHeader:setTopBottom( false, false, -127, -122 )
				self.BorderFocusHeader:setRGB( 0.35, 0.39, 0.47 )
				self.BorderFocusHeader:setZoom( 0 )
				BorderFocusHeaderFrame2( BorderFocusHeader, {} )
				local CustomClassPlusSymbol0Frame2 = function ( CustomClassPlusSymbol0, event )
					if not event.interrupted then
						CustomClassPlusSymbol0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
					CustomClassPlusSymbol0:setAlpha( 1 )
					CustomClassPlusSymbol0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( CustomClassPlusSymbol0, event )
					else
						CustomClassPlusSymbol0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassPlusSymbol0:completeAnimation()
				self.CustomClassPlusSymbol0:setRGB( 1, 1, 1 )
				self.CustomClassPlusSymbol0:setAlpha( 1 )
				self.CustomClassPlusSymbol0:setZoom( 0 )
				CustomClassPlusSymbol0Frame2( CustomClassPlusSymbol0, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedSymbols0:close()
		self.BorderBakedStroke0:close()
		self.BorderBakedBlur0:close()
		self.CustomClassCategoryHeader0:close()
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked:close()
		self.BorderFooter:close()
		self.BorderFocusHeader:close()
		self.CustomClassPlusSymbol0:close()
		self.Label0:close()
		CoD.SecondaryWeaponSlot.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

