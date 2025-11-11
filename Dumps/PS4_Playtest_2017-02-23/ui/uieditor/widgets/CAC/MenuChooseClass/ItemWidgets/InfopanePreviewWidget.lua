require( "ui.uieditor.widgets.CAC.cac_CustomClassDecscription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

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
	self:setLeftRight( 0, 0, 0, 1275 )
	self:setTopBottom( 0, 0, 0, 894 )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local itemName = CoD.InfoPaneItemName.new( menu, controller )
	itemName:setLeftRight( 0, 0, 27, 599 )
	itemName:setTopBottom( 0, 0, 19.5, 70.5 )
	itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
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
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( 0, 0, 28, 412 )
	categoryName:setTopBottom( 0, 0, -17, 11 )
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
	
	local cacCustomClassDecscription0 = CoD.cac_CustomClassDecscription.new( menu, controller )
	cacCustomClassDecscription0:setLeftRight( 0, 0, 28, 412 )
	cacCustomClassDecscription0:setTopBottom( 0, 0, 76.5, 109.5 )
	cacCustomClassDecscription0:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cacCustomClassDecscription0.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cacCustomClassDecscription0 )
	self.cacCustomClassDecscription0 = cacCustomClassDecscription0
	
	local xcamMouse = CoD.XCamMouseControl.new( menu, controller )
	xcamMouse:setLeftRight( 0.5, 0.5, -445, 540 )
	xcamMouse:setTopBottom( 0, 1, 71, -129 )
	self:addElement( xcamMouse )
	self.xcamMouse = xcamMouse
	
	self.resetProperties = function ()
		itemName:completeAnimation()
		categoryName:completeAnimation()
		itemName:setAlpha( 1 )
		itemName.weaponNameWithVariant.variantName:setAlpha( 1 )
		categoryName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
		NonVariantNameSlot = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
						itemName.weaponNameWithVariant.variantName:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Bounce )
					end
					itemName:setAlpha( 1 )
					itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				itemName.weaponNameWithVariant.variantName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
				itemNameFrame2( itemName, {} )
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
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonVariantNameSlot",
			condition = function ( menu, element, event )
				return not IsCACSlotHasVariantName( element )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemName:close()
		self.cacCustomClassDecscription0:close()
		self.xcamMouse:close()
		self.categoryName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

