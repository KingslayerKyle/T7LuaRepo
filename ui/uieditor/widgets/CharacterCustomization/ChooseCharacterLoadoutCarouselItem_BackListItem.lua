-- f5078f4719ac5c8adfe77396ab7827cb
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 245 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local GreenBox = LUI.UIImage.new()
	GreenBox:setLeftRight( true, true, 46.16, 0 )
	GreenBox:setTopBottom( false, false, -13, 13.5 )
	GreenBox:setRGB( 0.41, 0.76, 0.6 )
	GreenBox:setAlpha( 0 )
	self:addElement( GreenBox )
	self.GreenBox = GreenBox
	
	local GreenBox0 = LUI.UIImage.new()
	GreenBox0:setLeftRight( true, true, 2, -207 )
	GreenBox0:setTopBottom( false, false, -13, 13.5 )
	GreenBox0:setRGB( 0, 0, 0 )
	GreenBox0:setAlpha( 0 )
	self:addElement( GreenBox0 )
	self.GreenBox0 = GreenBox0
	
	local iconBorder = LUI.UIImage.new()
	iconBorder:setLeftRight( true, false, 0, 40 )
	iconBorder:setTopBottom( true, true, 0, 0.5 )
	iconBorder:setRGB( 0.82, 0.98, 1 )
	iconBorder:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	iconBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	iconBorder:setShaderVector( 0, 0.1, 0.13, 0, 0 )
	iconBorder:setupNineSliceShader( 4, 4 )
	self:addElement( iconBorder )
	self.iconBorder = iconBorder
	
	local textBorder = LUI.UIImage.new()
	textBorder:setLeftRight( true, true, 45, 1 )
	textBorder:setTopBottom( true, true, 0, 1 )
	textBorder:setRGB( 0.82, 0.98, 1 )
	textBorder:setAlpha( 0.5 )
	textBorder:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	textBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	textBorder:setShaderVector( 0, 0.02, 0.13, 0, 0 )
	textBorder:setupNineSliceShader( 4, 4 )
	self:addElement( textBorder )
	self.textBorder = textBorder
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 5, 35 )
	icon:setTopBottom( false, false, -10, 10 )
	icon:setRGB( 0.82, 0.98, 1 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local text = LUI.UITightText.new()
	text:setLeftRight( true, false, 50, 250 )
	text:setTopBottom( false, false, -12.5, 12.5 )
	text:setRGB( 1, 0.41, 0 )
	text:setTTF( "fonts/default.ttf" )
	text:linkToElementModel( self, "text", true, function ( model )
		local _text = Engine.GetModelValue( model )
		if _text then
			text:setText( _text )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local TopBottomLines = LUI.UIImage.new()
	TopBottomLines:setLeftRight( true, false, 42, 248.36 )
	TopBottomLines:setTopBottom( true, false, -3, 34 )
	TopBottomLines:setRGB( 0.82, 0.98, 1 )
	TopBottomLines:setImage( RegisterImage( "uie_t7_menu_cp_datavault_topbottombarsfull" ) )
	TopBottomLines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	TopBottomLines:setShaderVector( 0, 0.04, 0.22, 0, 0 )
	TopBottomLines:setupNineSliceShader( 8, 8 )
	self:addElement( TopBottomLines )
	self.TopBottomLines = TopBottomLines
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -6, 2 )
	Arrow:setTopBottom( true, false, 11.5, 19.5 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:setLeftRight( false, true, 0, 20 )
	FEHelpItemsLabel0:setTopBottom( false, false, -10, 10 )
	FEHelpItemsLabel0:setScale( 0.7 )
	FEHelpItemsLabel0:linkToElementModel( self, nil, false, function ( model )
		FEHelpItemsLabel0:setModel( model, controller )
	end )
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
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GreenBox:completeAnimation()
				self.GreenBox:setLeftRight( true, true, 47.16, -1 )
				self.GreenBox:setTopBottom( false, false, -13, 13.5 )
				self.GreenBox:setRGB( 0, 0, 0 )
				self.GreenBox:setAlpha( 1 )
				self.clipFinished( GreenBox, {} )

				GreenBox0:completeAnimation()
				self.GreenBox0:setLeftRight( true, true, 2, -207 )
				self.GreenBox0:setTopBottom( false, false, -13, 13.5 )
				self.GreenBox0:setRGB( 0, 0, 0 )
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
				self:setupElementClipCounter( 5 )

				local GreenBoxFrame2 = function ( GreenBox, event )
					if not event.interrupted then
						GreenBox:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					GreenBox:setLeftRight( true, true, 47.16, -1 )
					GreenBox:setTopBottom( false, false, -13, 13.5 )
					GreenBox:setRGB( 0.82, 0.98, 1 )
					GreenBox:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( GreenBox, event )
					else
						GreenBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox:completeAnimation()
				self.GreenBox:setLeftRight( true, true, 47.16, -1 )
				self.GreenBox:setTopBottom( false, false, -13, 13.5 )
				self.GreenBox:setRGB( 0.82, 0.98, 1 )
				self.GreenBox:setAlpha( 0 )
				GreenBoxFrame2( GreenBox, {} )
				local GreenBox0Frame2 = function ( GreenBox0, event )
					if not event.interrupted then
						GreenBox0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					GreenBox0:setLeftRight( true, true, 2, -207 )
					GreenBox0:setTopBottom( false, false, -13, 13.5 )
					GreenBox0:setRGB( 0.82, 0.98, 1 )
					GreenBox0:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( GreenBox0, event )
					else
						GreenBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBox0:completeAnimation()
				self.GreenBox0:setLeftRight( true, true, 2, -207 )
				self.GreenBox0:setTopBottom( false, false, -13, 13.5 )
				self.GreenBox0:setRGB( 0.82, 0.98, 1 )
				self.GreenBox0:setAlpha( 0 )
				GreenBox0Frame2( GreenBox0, {} )

				iconBorder:completeAnimation()
				self.iconBorder:setLeftRight( true, false, 0, 39 )
				self.iconBorder:setTopBottom( true, true, 1, -0.5 )
				self.clipFinished( iconBorder, {} )

				text:completeAnimation()
				self.text:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( text, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					Arrow:setRGB( 1, 1, 1 )
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setRGB( 1, 1, 1 )
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
			end,
			LoseFocus = function ()
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
				self.iconBorder:setLeftRight( true, false, 0, 39 )
				self.iconBorder:setTopBottom( true, true, 1, -0.5 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEHelpItemsLabel0:close()
		element.icon:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
