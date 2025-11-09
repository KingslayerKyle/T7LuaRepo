require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_SaveVariant" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox" )

CoD.systemOverlay_SaveVariantFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_SaveVariantFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_SaveVariantFrame )
	self.id = "systemOverlay_SaveVariantFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( true, false, 50, 370 )
	extracamBG:setTopBottom( true, true, 0, -4 )
	extracamBG:setAlpha( 0.05 )
	self:addElement( extracamBG )
	self.extracamBG = extracamBG
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( true, false, 50, 370 )
	extraCamRender:setTopBottom( true, true, 0, -4 )
	extraCamRender:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			extraCamRender:setupWCVariantIconExtraCamRender( GetSaveVariantExtraCamParameters( controller, image ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local foreground = CoD.systemOverlay_Layout_SaveVariant.new( menu, controller )
	foreground:setLeftRight( true, false, 0, 1280 )
	foreground:setTopBottom( true, false, 0, 320 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, false, 50, 370 )
	cacItemTitleGlow0:setTopBottom( true, false, 290.5, 321.5 )
	cacItemTitleGlow0:setRGB( 0.89, 0.89, 0.89 )
	cacItemTitleGlow0:setAlpha( 0.6 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( true, false, 50, 151 )
	LabelButton:setTopBottom( false, true, -24, -4 )
	LabelButton:setAlpha( 0 )
	LabelButton:linkToElementModel( self, nil, false, function ( model )
		LabelButton:setModel( model, controller )
	end )
	LabelButton:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			LabelButton.itemName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local horizontalScrollingTextBox0 = CoD.horizontalScrollingTextBox.new( menu, controller )
	horizontalScrollingTextBox0:setLeftRight( true, false, 53, 367 )
	horizontalScrollingTextBox0:setTopBottom( true, false, 295, 317 )
	horizontalScrollingTextBox0.textBox:setRGB( 0, 0, 0 )
	horizontalScrollingTextBox0.textBox:setTTF( "fonts/escom.ttf" )
	horizontalScrollingTextBox0.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	horizontalScrollingTextBox0:linkToElementModel( self, nil, false, function ( model )
		horizontalScrollingTextBox0:setModel( model, controller )
	end )
	horizontalScrollingTextBox0:linkToElementModel( self, "variantName", true, function ( model )
		local variantName = Engine.GetModelValue( model )
		if variantName then
			horizontalScrollingTextBox0.textBox:setText( variantName )
		end
	end )
	self:addElement( horizontalScrollingTextBox0 )
	self.horizontalScrollingTextBox0 = horizontalScrollingTextBox0
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.foreground:close()
		element.cacItemTitleGlow0:close()
		element.LabelButton:close()
		element.horizontalScrollingTextBox0:close()
		element.extraCamRender:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

