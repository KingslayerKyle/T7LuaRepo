require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )

CoD.ChooseCharacterLoadoutCarouselItem_BackListItem = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_BackListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_BackListItem )
	self.id = "ChooseCharacterLoadoutCarouselItem_BackListItem"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 367 )
	self:setTopBottom( 0, 0, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local GreenBox = LUI.UIImage.new()
	GreenBox:setLeftRight( 0, 1, 70, 0 )
	GreenBox:setTopBottom( 0.5, 0.5, -20, 20 )
	GreenBox:setRGB( 0.41, 0.76, 0.6 )
	GreenBox:setAlpha( 0 )
	self:addElement( GreenBox )
	self.GreenBox = GreenBox
	
	local GreenBox0 = LUI.UIImage.new()
	GreenBox0:setLeftRight( 0, 1, 3, -311 )
	GreenBox0:setTopBottom( 0.5, 0.5, -20, 20 )
	GreenBox0:setRGB( 0, 0, 0 )
	GreenBox0:setAlpha( 0 )
	self:addElement( GreenBox0 )
	self.GreenBox0 = GreenBox0
	
	local iconBorder = LUI.UIImage.new()
	iconBorder:setLeftRight( 0, 0, 0, 60 )
	iconBorder:setTopBottom( 0, 1, 0, 0 )
	iconBorder:setRGB( 0.82, 0.98, 1 )
	iconBorder:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	iconBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	iconBorder:setShaderVector( 0, 0, 0, 0, 0 )
	iconBorder:setupNineSliceShader( 6, 6 )
	self:addElement( iconBorder )
	self.iconBorder = iconBorder
	
	local textBorder = LUI.UIImage.new()
	textBorder:setLeftRight( 0, 1, 67, 1 )
	textBorder:setTopBottom( 0, 1, 0, 2 )
	textBorder:setRGB( 0.82, 0.98, 1 )
	textBorder:setAlpha( 0.5 )
	textBorder:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	textBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	textBorder:setShaderVector( 0, 0, 0, 0, 0 )
	textBorder:setupNineSliceShader( 6, 6 )
	self:addElement( textBorder )
	self.textBorder = textBorder
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 0, 7, 52 )
	icon:setTopBottom( 0.5, 0.5, -15, 15 )
	icon:setRGB( 0.82, 0.98, 1 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local text = LUI.UITightText.new()
	text:setLeftRight( 0, 0, 75, 375 )
	text:setTopBottom( 0.5, 0.5, -19, 19 )
	text:setRGB( 1, 0.41, 0 )
	text:setTTF( "fonts/default.ttf" )
	text:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( modelValue )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local TopBottomLines = LUI.UIImage.new()
	TopBottomLines:setLeftRight( 0, 0, 63, 373 )
	TopBottomLines:setTopBottom( 0, 0, -5, 51 )
	TopBottomLines:setRGB( 0.82, 0.98, 1 )
	TopBottomLines:setImage( RegisterImage( "uie_t7_menu_cp_datavault_topbottombarsfull" ) )
	TopBottomLines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	TopBottomLines:setShaderVector( 0, 0, 0, 0, 0 )
	TopBottomLines:setupNineSliceShader( 12, 12 )
	self:addElement( TopBottomLines )
	self.TopBottomLines = TopBottomLines
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -9, 3 )
	Arrow:setTopBottom( 0, 0, 17, 29 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isNew" )
			end
		}
	} )
	FEHelpItemsLabel0:linkToElementModel( FEHelpItemsLabel0, "isNew", true, function ( model )
		menu:updateElementState( FEHelpItemsLabel0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isNew"
		} )
	end )
	FEHelpItemsLabel0:setLeftRight( 1, 1, 0, 30 )
	FEHelpItemsLabel0:setTopBottom( 0.5, 0.5, -15, 15 )
	FEHelpItemsLabel0:setScale( 0.7 )
	FEHelpItemsLabel0:linkToElementModel( self, nil, false, function ( model )
		FEHelpItemsLabel0:setModel( model, controller )
	end )
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	self.resetProperties = function ()
		text:completeAnimation()
		GreenBox:completeAnimation()
		Arrow:completeAnimation()
		GreenBox0:completeAnimation()
		iconBorder:completeAnimation()
		text:setRGB( 1, 0.41, 0 )
		GreenBox:setLeftRight( 0, 1, 70, 0 )
		GreenBox:setTopBottom( 0.5, 0.5, -20, 20 )
		GreenBox:setRGB( 0.41, 0.76, 0.6 )
		GreenBox:setAlpha( 0 )
		Arrow:setRGB( 1, 1, 1 )
		Arrow:setAlpha( 1 )
		GreenBox0:setRGB( 0, 0, 0 )
		GreenBox0:setAlpha( 0 )
		iconBorder:setLeftRight( 0, 0, 0, 60 )
		iconBorder:setTopBottom( 0, 1, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				GreenBox:completeAnimation()
				self.GreenBox:setLeftRight( 0, 1, 71, -1 )
				self.GreenBox:setTopBottom( 0.5, 0.5, -20, 20 )
				self.GreenBox:setRGB( 0, 0, 0 )
				self.GreenBox:setAlpha( 1 )
				self.clipFinished( GreenBox, {} )
				GreenBox0:completeAnimation()
				self.GreenBox0:setAlpha( 1 )
				self.clipFinished( GreenBox0, {} )
				text:completeAnimation()
				self.text:setRGB( 0.82, 0.98, 1 )
				self.clipFinished( text, {} )
				Arrow:completeAnimation()
				self.Arrow:setRGB( 0, 0.82, 1 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local GreenBoxFrame2 = function ( GreenBox, event )
					if not event.interrupted then
						GreenBox:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					GreenBox:setLeftRight( 0, 1, 71, -1 )
					GreenBox:setTopBottom( 0.5, 0.5, -20, 20 )
					GreenBox:setRGB( 0.82, 0.98, 1 )
					GreenBox:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( GreenBox, event )
					else
						GreenBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox:completeAnimation()
				self.GreenBox:setLeftRight( 0, 1, 71, -1 )
				self.GreenBox:setTopBottom( 0.5, 0.5, -20, 20 )
				self.GreenBox:setRGB( 0.82, 0.98, 1 )
				self.GreenBox:setAlpha( 0 )
				GreenBoxFrame2( GreenBox, {} )
				local GreenBox0Frame2 = function ( GreenBox0, event )
					if not event.interrupted then
						GreenBox0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					GreenBox0:setRGB( 0.82, 0.98, 1 )
					GreenBox0:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( GreenBox0, event )
					else
						GreenBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox0:completeAnimation()
				self.GreenBox0:setRGB( 0.82, 0.98, 1 )
				self.GreenBox0:setAlpha( 0 )
				GreenBox0Frame2( GreenBox0, {} )
				iconBorder:completeAnimation()
				self.iconBorder:setLeftRight( 0, 0, 0, 58 )
				self.iconBorder:setTopBottom( 0, 1, 1, -1 )
				self.clipFinished( iconBorder, {} )
				text:completeAnimation()
				self.text:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( text, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local GreenBoxFrame2 = function ( GreenBox, event )
					if not event.interrupted then
						GreenBox:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					GreenBox:setRGB( 0.82, 0.98, 1 )
					GreenBox:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GreenBox, event )
					else
						GreenBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox:completeAnimation()
				self.GreenBox:setRGB( 0.82, 0.98, 1 )
				self.GreenBox:setAlpha( 0.2 )
				GreenBoxFrame2( GreenBox, {} )
				local GreenBox0Frame2 = function ( GreenBox0, event )
					if not event.interrupted then
						GreenBox0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					GreenBox0:setRGB( 0.82, 0.98, 1 )
					GreenBox0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GreenBox0, event )
					else
						GreenBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox0:completeAnimation()
				self.GreenBox0:setRGB( 0.82, 0.98, 1 )
				self.GreenBox0:setAlpha( 0.2 )
				GreenBox0Frame2( GreenBox0, {} )
				iconBorder:completeAnimation()
				self.iconBorder:setLeftRight( 0, 0, 0, 58 )
				self.iconBorder:setTopBottom( 0, 1, 1, -1 )
				self.clipFinished( iconBorder, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					text:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setRGB( 1, 0.41, 0 )
				textFrame2( text, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEHelpItemsLabel0:close()
		self.icon:close()
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

