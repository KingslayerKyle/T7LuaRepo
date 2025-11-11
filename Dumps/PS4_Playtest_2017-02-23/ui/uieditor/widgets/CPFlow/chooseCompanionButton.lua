require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.chooseCompanionButton = InheritFrom( LUI.UIElement )
CoD.chooseCompanionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseCompanionButton )
	self.id = "chooseCompanionButton"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 162 )
	BG:setTopBottom( 0, 0, 0, 162 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.3 )
	BG:setScale( 0.7 )
	self:addElement( BG )
	self.BG = BG
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( 0, 0, 0, 162 )
	BG2:setTopBottom( 0, 0, 0, 162 )
	BG2:setRGB( 0.74, 1, 0.9 )
	BG2:setAlpha( 0 )
	BG2:setScale( 0.7 )
	BG2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	BG2:setShaderVector( 0, 0, 1, 0, 0 )
	BG2:setShaderVector( 1, 0, 0, 0, 0 )
	BG2:setShaderVector( 2, 0, 1, 0, 0 )
	BG2:setShaderVector( 3, 0, 0.7, 0, 0 )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local BG22 = LUI.UIImage.new()
	BG22:setLeftRight( 0, 0, 0, 162 )
	BG22:setTopBottom( 0, 0, 0, 4 )
	BG22:setRGB( 0.33, 0.95, 0.71 )
	BG22:setAlpha( 0 )
	BG22:setScale( 0.7 )
	self:addElement( BG22 )
	self.BG22 = BG22
	
	local BoxButtonLrgInactiveStroke = LUI.UIImage.new()
	BoxButtonLrgInactiveStroke:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveStroke:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	BoxButtonLrgInactiveStroke:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokefull" ) )
	BoxButtonLrgInactiveStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveStroke:setShaderVector( 0, 0, 0, 0, 0 )
	BoxButtonLrgInactiveStroke:setupNineSliceShader( 24, 24 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactiveDiag = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	BoxButtonLrgInactiveDiag:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag:setShaderVector( 0, 0, 0, 0, 0 )
	BoxButtonLrgInactiveDiag:setupNineSliceShader( 36, 36 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local CharacterItemExtraCamRender = LUI.UIImage.new()
	CharacterItemExtraCamRender:setLeftRight( 0, 1, 0, 0 )
	CharacterItemExtraCamRender:setTopBottom( 0, 1, 0, 0 )
	CharacterItemExtraCamRender:setScale( 0.7 )
	CharacterItemExtraCamRender:linkToElementModel( self, "renderInfo", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterItemExtraCamRender:setupCharacterItemRender( SplitString( "+", modelValue ) )
		end
	end )
	self:addElement( CharacterItemExtraCamRender )
	self.CharacterItemExtraCamRender = CharacterItemExtraCamRender
	
	local onOffImage = CoD.onOffImage.new( menu, controller )
	onOffImage:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsPlayerStatEqualToElementProperty( controller, "companion", self, "characterIndex" ) and not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN )
			end
		}
	} )
	onOffImage:setLeftRight( 1, 1, -48, -24 )
	onOffImage:setTopBottom( 0, 0, 24, 48 )
	onOffImage:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	onOffImage.image:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( onOffImage )
	self.onOffImage = onOffImage
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( 0.5, 0.5, -23, 23 )
	lockedIcon:setTopBottom( 0.5, 0.5, -23, 23 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( 0, 1, 0, 0 )
	FocusBorder:setTopBottom( 0, 1, 0, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	self.resetProperties = function ()
		BG22:completeAnimation()
		BG:completeAnimation()
		CharacterItemExtraCamRender:completeAnimation()
		BG2:completeAnimation()
		onOffImage:completeAnimation()
		lockedIcon:completeAnimation()
		BG22:setLeftRight( 0, 0, 0, 162 )
		BG22:setTopBottom( 0, 0, 0, 4 )
		BG22:setAlpha( 0 )
		BG22:setScale( 0.7 )
		BG:setAlpha( 0.3 )
		BG:setScale( 0.7 )
		CharacterItemExtraCamRender:setRGB( 1, 1, 1 )
		CharacterItemExtraCamRender:setScale( 0.7 )
		BG2:setAlpha( 0 )
		BG2:setScale( 0.7 )
		onOffImage:setLeftRight( 1, 1, -48, -24 )
		onOffImage:setTopBottom( 0, 0, 24, 48 )
		lockedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 0, 162 )
				self.BG22:setTopBottom( 0, 0, 8, 12 )
				self.BG22:setScale( 0.9 )
				self.clipFinished( BG22, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setScale( 0.7 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0.03 )
					BG2:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0 )
				self.BG2:setScale( 0.7 )
				BG2Frame2( BG2, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 16, 146 )
					BG22:setTopBottom( 0, 0, 16, 19 )
					BG22:setAlpha( 0.2 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
				local CharacterItemExtraCamRenderFrame2 = function ( CharacterItemExtraCamRender, event )
					if not event.interrupted then
						CharacterItemExtraCamRender:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					CharacterItemExtraCamRender:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( CharacterItemExtraCamRender, event )
					else
						CharacterItemExtraCamRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setScale( 0.7 )
				CharacterItemExtraCamRenderFrame2( CharacterItemExtraCamRender, {} )
				local onOffImageFrame2 = function ( onOffImage, event )
					if not event.interrupted then
						onOffImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					onOffImage:setLeftRight( 1, 1, -41, -17 )
					onOffImage:setTopBottom( 0, 0, 17, 41 )
					if event.interrupted then
						self.clipFinished( onOffImage, event )
					else
						onOffImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				onOffImage:completeAnimation()
				self.onOffImage:setLeftRight( 1, 1, -48, -24 )
				self.onOffImage:setTopBottom( 0, 0, 24, 48 )
				onOffImageFrame2( onOffImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BG:completeAnimation()
				self.BG:setScale( 0.8 )
				self.clipFinished( BG, {} )
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				self.clipFinished( BG2, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				self.clipFinished( BG22, {} )
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setScale( 0.8 )
				self.clipFinished( CharacterItemExtraCamRender, {} )
				onOffImage:completeAnimation()
				self.onOffImage:setLeftRight( 1, 1, -41, -17 )
				self.onOffImage:setTopBottom( 0, 0, 17, 41 )
				self.clipFinished( onOffImage, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG:setAlpha( 0.3 )
					BG:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0.3 )
				self.BG:setScale( 0.8 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0 )
					BG2:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				BG2Frame2( BG2, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 24, 138 )
					BG22:setTopBottom( 0, 0, 24, 28 )
					BG22:setAlpha( 0 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
				local CharacterItemExtraCamRenderFrame2 = function ( CharacterItemExtraCamRender, event )
					if not event.interrupted then
						CharacterItemExtraCamRender:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					CharacterItemExtraCamRender:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( CharacterItemExtraCamRender, event )
					else
						CharacterItemExtraCamRender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setScale( 0.8 )
				CharacterItemExtraCamRenderFrame2( CharacterItemExtraCamRender, {} )
				local onOffImageFrame2 = function ( onOffImage, event )
					if not event.interrupted then
						onOffImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					onOffImage:setLeftRight( 1, 1, -48, -24 )
					onOffImage:setTopBottom( 0, 0, 24, 48 )
					if event.interrupted then
						self.clipFinished( onOffImage, event )
					else
						onOffImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				onOffImage:completeAnimation()
				self.onOffImage:setLeftRight( 1, 1, -41, -17 )
				self.onOffImage:setTopBottom( 0, 0, 17, 41 )
				onOffImageFrame2( onOffImage, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.clipFinished( BG, {} )
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setRGB( 0.27, 0.27, 0.27 )
				self.clipFinished( CharacterItemExtraCamRender, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.clipFinished( BG, {} )
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setRGB( 0.27, 0.27, 0.27 )
				self.clipFinished( CharacterItemExtraCamRender, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.clipFinished( BG, {} )
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setRGB( 0.27, 0.27, 0.27 )
				self.clipFinished( CharacterItemExtraCamRender, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.clipFinished( BG, {} )
				CharacterItemExtraCamRender:completeAnimation()
				self.CharacterItemExtraCamRender:setRGB( 0.27, 0.27, 0.27 )
				self.clipFinished( CharacterItemExtraCamRender, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "locked" )
			end
		}
	} )
	self:linkToElementModel( self, "locked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "locked"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.onOffImage:close()
		self.FocusBorder:close()
		self.CharacterItemExtraCamRender:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

