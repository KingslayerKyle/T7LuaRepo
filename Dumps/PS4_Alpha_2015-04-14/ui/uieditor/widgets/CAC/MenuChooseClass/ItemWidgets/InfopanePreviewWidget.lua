require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopaneWeaponPreview" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvl" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ()
		self:processEvent( {
			name = "update_state",
			menu = menu
		} )
	end )
end

CoD.InfopanePreviewWidget = InheritFrom( LUI.UIElement )
CoD.InfopanePreviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfopanePreviewWidget )
	self.id = "InfopanePreviewWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 850 )
	self:setTopBottom( true, false, 0, 596 )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 1, 1, 1 )
	bgImage:setAlpha( 0 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( true, false, 19, 400 )
	itemName:setTopBottom( true, false, 10, 44 )
	itemName:setRGB( 1, 1, 1 )
	itemName:linkToElementModel( self, nil, false, function ( model )
		itemName:setModel( model, controller )
	end )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemName:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local weaponPreview = CoD.InfopaneWeaponPreview.new( menu, controller )
	weaponPreview:setLeftRight( true, false, 128.5, 640.5 )
	weaponPreview:setTopBottom( true, false, 119, 375 )
	weaponPreview:setRGB( 1, 1, 1 )
	weaponPreview:linkToElementModel( self, nil, false, function ( model )
		weaponPreview:setModel( model, controller )
	end )
	weaponPreview:mergeStateConditions( {
		{
			stateName = "WideImage",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and IsCACSlot2by1AspectRatio( element )
			end
		},
		{
			stateName = "EmptySquareImage",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f9_local0 = not IsCACSlotInfopane2by1AspectRatio( element )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "EmptyWideImage",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f10_local0 = IsCACSlotInfopane2by1AspectRatio( element )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	self:addElement( weaponPreview )
	self.weaponPreview = weaponPreview
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 19, 275 )
	categoryName:setTopBottom( true, false, -10.5, 8.5 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	categoryName:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	local weaponProgression = CoD.cac_WpnLvl.new( menu, controller )
	weaponProgression:setLeftRight( true, false, 20.5, 435.5 )
	weaponProgression:setTopBottom( false, true, -111, -71 )
	weaponProgression:setRGB( 1, 1, 1 )
	weaponProgression.FELabelSubHeadingB0.Label1:setRGB( 0.71, 0.76, 0.77 )
	weaponProgression.FELabelSubHeadingB0.Label1:setText( Engine.Localize( "LEVEL" ) )
	weaponProgression.FELabelSubHeadingB0.Label1:setTTF( "fonts/Entovo.ttf" )
	weaponProgression:linkToElementModel( self, nil, false, function ( model )
		weaponProgression:setModel( model, controller )
	end )
	weaponProgression:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return not IsCACSlotWeaponType( element )
			end
		}
	} )
	self:addElement( weaponProgression )
	self.weaponProgression = weaponProgression
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 0 )
				self.clipFinished( weaponPreview, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					itemName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 0 )
				self.clipFinished( weaponPreview, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					categoryName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end
		},
		SlotHasNoModel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 1 )
				self.clipFinished( weaponPreview, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
					end
					itemName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				local weaponPreviewFrame2 = function ( weaponPreview, event )
					local weaponPreviewFrame3 = function ( weaponPreview, event )
						if not event.interrupted then
							weaponPreview:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Bounce )
						end
						weaponPreview:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weaponPreview, event )
						else
							weaponPreview:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weaponPreviewFrame3( weaponPreview, event )
						return 
					else
						weaponPreview:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						weaponPreview:registerEventHandler( "transition_complete_keyframe", weaponPreviewFrame3 )
					end
				end
				
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 0 )
				weaponPreviewFrame2( weaponPreview, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					categoryName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end
		},
		SlotIsEmpty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 1 )
				self.clipFinished( weaponPreview, {} )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
					end
					itemName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
				local weaponPreviewFrame2 = function ( weaponPreview, event )
					local weaponPreviewFrame3 = function ( weaponPreview, event )
						if not event.interrupted then
							weaponPreview:beginAnimation( "keyframe", 499, false, false, CoD.TweenType.Bounce )
						end
						weaponPreview:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weaponPreview, event )
						else
							weaponPreview:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weaponPreviewFrame3( weaponPreview, event )
						return 
					else
						weaponPreview:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weaponPreview:registerEventHandler( "transition_complete_keyframe", weaponPreviewFrame3 )
					end
				end
				
				weaponPreview:completeAnimation()
				self.weaponPreview:setAlpha( 0 )
				weaponPreviewFrame2( weaponPreview, {} )
				local categoryNameFrame2 = function ( categoryName, event )
					if not event.interrupted then
						categoryName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					categoryName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryName, event )
					else
						categoryName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				categoryNameFrame2( categoryName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SlotHasNoModel",
			condition = function ( menu, element, event )
				return not IsCACSlotHaveModel( element )
			end
		},
		{
			stateName = "SlotIsEmpty",
			condition = function ( menu, element, event )
				local f31_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f31_local0 = not IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
				else
					f31_local0 = false
				end
				return f31_local0
			end
		}
	} )
	self.close = function ( self )
		self.itemName:close()
		self.weaponPreview:close()
		self.weaponProgression:close()
		self.categoryName:close()
		CoD.InfopanePreviewWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

