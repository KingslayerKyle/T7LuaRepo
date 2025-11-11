require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_SaveVariant" )

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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local extracamBG = LUI.UIImage.new()
	extracamBG:setLeftRight( 0, 0, 75, 555 )
	extracamBG:setTopBottom( 0, 1, 0, -6 )
	extracamBG:setAlpha( 0.05 )
	self:addElement( extracamBG )
	self.extracamBG = extracamBG
	
	local extraCamRender = LUI.UIImage.new()
	extraCamRender:setLeftRight( 0, 0, 75, 555 )
	extraCamRender:setTopBottom( 0, 1, 0, -6 )
	extraCamRender:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			extraCamRender:setupWCVariantIconExtraCamRender( GetSaveVariantExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( extraCamRender )
	self.extraCamRender = extraCamRender
	
	local foreground = CoD.systemOverlay_Layout_SaveVariant.new( menu, controller )
	foreground:setLeftRight( 0, 0, 0, 1920 )
	foreground:setTopBottom( 0, 0, 0, 480 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 0, 75, 555 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 436, 482 )
	cacItemTitleGlow0:setRGB( 0.89, 0.89, 0.89 )
	cacItemTitleGlow0:setAlpha( 0.6 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local LabelButton = CoD.cac_ListButtonLabel.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 75, 227 )
	LabelButton:setTopBottom( 1, 1, -36, -6 )
	LabelButton:setAlpha( 0 )
	LabelButton:linkToElementModel( self, nil, false, function ( model )
		LabelButton:setModel( model, controller )
	end )
	LabelButton:linkToElementModel( self, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local horizontalScrollingTextBox0 = CoD.horizontalScrollingTextBox.new( menu, controller )
	horizontalScrollingTextBox0:setLeftRight( 0, 0, 80, 551 )
	horizontalScrollingTextBox0:setTopBottom( 0, 0, 442.5, 475.5 )
	horizontalScrollingTextBox0.textBox:setRGB( 0, 0, 0 )
	horizontalScrollingTextBox0.textBox:setTTF( "fonts/escom.ttf" )
	horizontalScrollingTextBox0.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	horizontalScrollingTextBox0:linkToElementModel( self, nil, false, function ( model )
		horizontalScrollingTextBox0:setModel( model, controller )
	end )
	horizontalScrollingTextBox0:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			horizontalScrollingTextBox0.textBox:setText( Engine.Localize( modelValue ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.foreground:close()
		self.cacItemTitleGlow0:close()
		self.LabelButton:close()
		self.horizontalScrollingTextBox0:close()
		self.extraCamRender:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

