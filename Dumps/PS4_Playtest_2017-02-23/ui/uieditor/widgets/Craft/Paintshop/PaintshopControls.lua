require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopButtonPrompt" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintshopChooseSide" )

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
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 337 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 1, 46, 0 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( 0, 1, -3, 3 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( 0, 1, 42, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local Copy = CoD.PaintshopButtonPrompt.new( menu, controller )
	Copy:setLeftRight( 0, 0, 24, 374 )
	Copy:setTopBottom( 0, 0, 54, 100 )
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
	Cut:setLeftRight( 0, 0, 24, 374 )
	Cut:setTopBottom( 0, 0, 93, 139 )
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
	Change:setLeftRight( 0, 0, 24, 374 )
	Change:setTopBottom( 0, 0, 134, 180 )
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
	Insert:setLeftRight( 0, 0, 24, 374 )
	Insert:setTopBottom( 0, 0, 174, 220 )
	Insert.label:setText( Engine.Localize( "MENU_EMBLEM_INSERT_DECAL" ) )
	Insert:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Insert.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Insert )
	self.Insert = Insert
	
	local linkLayers = CoD.PaintshopButtonPrompt.new( menu, controller )
	linkLayers:setLeftRight( 0, 0, 24, 374 )
	linkLayers:setTopBottom( 0, 0, 215, 261 )
	linkLayers.label:setText( Engine.Localize( "MENU_EMBLEM_LINK_LAYERS" ) )
	linkLayers:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			linkLayers.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( linkLayers )
	self.linkLayers = linkLayers
	
	local groupLayers = CoD.PaintshopButtonPrompt.new( menu, controller )
	groupLayers:setLeftRight( 0, 0, 24, 374 )
	groupLayers:setTopBottom( 0, 0, 254, 300 )
	groupLayers.label:setText( Engine.Localize( "MENU_EMBLEMS_UNGROUP" ) )
	groupLayers:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			groupLayers.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( groupLayers )
	self.groupLayers = groupLayers
	
	local saveDecal = CoD.PaintshopButtonPrompt.new( menu, controller )
	saveDecal:setLeftRight( 0, 0, 24, 374 )
	saveDecal:setTopBottom( 0, 0, 291, 337 )
	saveDecal.label:setText( Engine.Localize( "MENU_EMBLEM_SAVE_DECAL_GROUP" ) )
	saveDecal:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			saveDecal.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( saveDecal )
	self.saveDecal = saveDecal
	
	local PaintshopChooseSide0 = CoD.PaintshopChooseSide.new( menu, controller )
	PaintshopChooseSide0:setLeftRight( 0, 1, 0, 0 )
	PaintshopChooseSide0:setTopBottom( 0, 0, 1, 33 )
	PaintshopChooseSide0.text:setText( Engine.Localize( "MENU_CONTROLS_CAPS" ) )
	PaintshopChooseSide0.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( PaintshopChooseSide0 )
	self.PaintshopChooseSide0 = PaintshopChooseSide0
	
	self.resetProperties = function ()
		Copy:completeAnimation()
		Cut:completeAnimation()
		Change:completeAnimation()
		Insert:completeAnimation()
		cacButtonBoxLrgInactiveStroke0:completeAnimation()
		Image0:completeAnimation()
		linkLayers:completeAnimation()
		groupLayers:completeAnimation()
		saveDecal:completeAnimation()
		PaintshopChooseSide0:completeAnimation()
		Copy:setAlpha( 1 )
		Cut:setAlpha( 1 )
		Change:setAlpha( 1 )
		Insert:setLeftRight( 0, 0, 24, 374 )
		Insert:setTopBottom( 0, 0, 174, 220 )
		Insert:setAlpha( 1 )
		cacButtonBoxLrgInactiveStroke0:setAlpha( 1 )
		Image0:setAlpha( 0.5 )
		linkLayers:setAlpha( 1 )
		linkLayers.label:setText( Engine.Localize( "MENU_EMBLEM_LINK_LAYERS" ) )
		groupLayers:setLeftRight( 0, 0, 24, 374 )
		groupLayers:setTopBottom( 0, 0, 254, 300 )
		groupLayers:setAlpha( 1 )
		groupLayers.label:setText( Engine.Localize( "MENU_EMBLEMS_UNGROUP" ) )
		saveDecal:setLeftRight( 0, 0, 24, 374 )
		saveDecal:setTopBottom( 0, 0, 291, 337 )
		saveDecal:setAlpha( 1 )
		PaintshopChooseSide0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
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
				linkLayers:completeAnimation()
				self.linkLayers:setAlpha( 0 )
				self.clipFinished( linkLayers, {} )
				groupLayers:completeAnimation()
				self.groupLayers:setAlpha( 0 )
				self.clipFinished( groupLayers, {} )
				saveDecal:completeAnimation()
				self.saveDecal:setAlpha( 0 )
				self.clipFinished( saveDecal, {} )
				PaintshopChooseSide0:completeAnimation()
				self.PaintshopChooseSide0:setAlpha( 0 )
				self.clipFinished( PaintshopChooseSide0, {} )
			end
		},
		BrowseModeLinkedLayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				linkLayers:completeAnimation()
				linkLayers.label:completeAnimation()
				self.linkLayers.label:setText( Engine.Localize( "MENU_EMBLEM_UNLINK_LAYERS" ) )
				self.clipFinished( linkLayers, {} )
				groupLayers:completeAnimation()
				groupLayers.label:completeAnimation()
				self.groupLayers.label:setText( Engine.Localize( "MENU_EMBLEMS_GROUP" ) )
				self.clipFinished( groupLayers, {} )
				saveDecal:completeAnimation()
				self.saveDecal:setAlpha( 0 )
				self.clipFinished( saveDecal, {} )
			end
		},
		BrowseModeGroupedLayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Change:completeAnimation()
				self.Change:setAlpha( 0 )
				self.clipFinished( Change, {} )
				Insert:completeAnimation()
				self.Insert:setLeftRight( 0, 0, 24, 374 )
				self.Insert:setTopBottom( 0, 0, 134, 180 )
				self.clipFinished( Insert, {} )
				linkLayers:completeAnimation()
				self.linkLayers:setAlpha( 0 )
				self.clipFinished( linkLayers, {} )
				groupLayers:completeAnimation()
				self.groupLayers:setLeftRight( 0, 0, 24, 374 )
				self.groupLayers:setTopBottom( 0, 0, 172, 218 )
				self.clipFinished( groupLayers, {} )
				saveDecal:completeAnimation()
				self.saveDecal:setLeftRight( 0, 0, 24, 374 )
				self.saveDecal:setTopBottom( 0, 0, 252, 298 )
				self.saveDecal:setAlpha( 0 )
				self.clipFinished( saveDecal, {} )
			end
		},
		BrowseModeOneLayerLinked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				linkLayers:completeAnimation()
				linkLayers.label:completeAnimation()
				self.linkLayers.label:setText( Engine.Localize( "MENU_EMBLEM_UNLINK_LAYERS" ) )
				self.clipFinished( linkLayers, {} )
				groupLayers:completeAnimation()
				self.groupLayers:setAlpha( 0 )
				self.clipFinished( groupLayers, {} )
				saveDecal:completeAnimation()
				self.saveDecal:setAlpha( 0 )
				self.clipFinished( saveDecal, {} )
			end
		},
		BrowseMode = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				groupLayers:completeAnimation()
				self.groupLayers:setAlpha( 0 )
				self.clipFinished( groupLayers, {} )
				saveDecal:completeAnimation()
				self.saveDecal:setAlpha( 0 )
				self.clipFinished( saveDecal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke0:close()
		self.Copy:close()
		self.Cut:close()
		self.Change:close()
		self.Insert:close()
		self.linkLayers:close()
		self.groupLayers:close()
		self.saveDecal:close()
		self.PaintshopChooseSide0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

