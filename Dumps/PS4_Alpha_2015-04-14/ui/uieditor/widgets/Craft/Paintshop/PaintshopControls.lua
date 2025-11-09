require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChoosePaintSide" )

CoD.PaintshopControls = InheritFrom( LUI.UIElement )
CoD.PaintshopControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopControls )
	self.id = "PaintshopControls"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.45, 0 )
	Image0:setTopBottom( true, true, 31, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 28, 2 )
	cacButtonBoxLrgInactiveStroke0:setRGB( 1, 1, 1 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local Copy = CoD.PaintshopButtonPrompt.new( menu, controller )
	Copy:setLeftRight( true, false, 16, 249 )
	Copy:setTopBottom( true, false, 36, 67 )
	Copy:setRGB( 1, 1, 1 )
	Copy.label:setText( Engine.Localize( "MENU_EMBLEM_COPY_LAYER" ) )
	Copy:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Copy.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Copy )
	self.Copy = Copy
	
	local Cut = CoD.PaintshopButtonPrompt.new( menu, controller )
	Cut:setLeftRight( true, false, 16, 249 )
	Cut:setTopBottom( true, false, 62, 93 )
	Cut:setRGB( 1, 1, 1 )
	Cut.label:setText( Engine.Localize( "MENU_EMBLEM_CUT_LAYER" ) )
	Cut:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Cut.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Cut )
	self.Cut = Cut
	
	local Change = CoD.PaintshopButtonPrompt.new( menu, controller )
	Change:setLeftRight( true, false, 16, 249 )
	Change:setTopBottom( true, false, 88.95, 119.95 )
	Change:setRGB( 1, 1, 1 )
	Change.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_DECAL" ) )
	Change:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Change.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Change )
	self.Change = Change
	
	local Insert = CoD.PaintshopButtonPrompt.new( menu, controller )
	Insert:setLeftRight( true, false, 16, 249 )
	Insert:setTopBottom( true, false, 115.95, 146.95 )
	Insert:setRGB( 1, 1, 1 )
	Insert.label:setText( Engine.Localize( "MENU_EMBLEM_INSERT_DECAL" ) )
	Insert:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Insert.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Insert )
	self.Insert = Insert
	
	local choosePaintSide = CoD.PaintshopChoosePaintSide.new( menu, controller )
	choosePaintSide:setLeftRight( true, true, 0, 0 )
	choosePaintSide:setTopBottom( true, false, 0, 27 )
	choosePaintSide:setRGB( 1, 1, 1 )
	choosePaintSide.PaintshopChooseSide.text:setText( Engine.Localize( "MENU_CONTROLS" ) )
	choosePaintSide.leftBumper:setAlpha( 0 )
	choosePaintSide.rightBumper:setAlpha( 0 )
	choosePaintSide:mergeStateConditions( {
		{
			stateName = "BrowseModeControlsState",
			condition = function ( menu, element, event )
				return IsPaintshop( controller ) and not IsModelValueEqualToEnum( controller, "Emblem.EmblemProperties.editorMode", Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT )
			end
		}
	} )
	choosePaintSide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties.editorMode" ), function ( model )
		menu:updateElementState( choosePaintSide, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Emblem.EmblemProperties.editorMode"
		} )
	end )
	self:addElement( choosePaintSide )
	self.choosePaintSide = choosePaintSide
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )
				Copy:completeAnimation()
				self.Copy:setAlpha( 0 )
				self.clipFinished( Copy, {} )
				Cut:completeAnimation()
				self.Cut:setAlpha( 0 )
				self.clipFinished( Cut, {} )
				Change:completeAnimation()
				self.Change:setAlpha( 0 )
				self.clipFinished( Change, {} )
				Insert:completeAnimation()
				self.Insert:setAlpha( 0 )
				self.clipFinished( Insert, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 0 )
				self.clipFinished( choosePaintSide, {} )
			end
		},
		BrowseModeControlsState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.5 )
				self.clipFinished( Image0, {} )
				cacButtonBoxLrgInactiveStroke0:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke0, {} )
				Copy:completeAnimation()
				self.Copy:setAlpha( 1 )
				self.clipFinished( Copy, {} )
				Cut:completeAnimation()
				self.Cut:setAlpha( 1 )
				self.clipFinished( Cut, {} )
				Change:completeAnimation()
				self.Change:setAlpha( 1 )
				self.clipFinished( Change, {} )
				Insert:completeAnimation()
				self.Insert:setAlpha( 1 )
				self.clipFinished( Insert, {} )
				choosePaintSide:completeAnimation()
				self.choosePaintSide:setAlpha( 1 )
				self.clipFinished( choosePaintSide, {} )
			end
		}
	}
	self.close = function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.Copy:close()
		self.Cut:close()
		self.Change:close()
		self.Insert:close()
		self.choosePaintSide:close()
		CoD.PaintshopControls.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

