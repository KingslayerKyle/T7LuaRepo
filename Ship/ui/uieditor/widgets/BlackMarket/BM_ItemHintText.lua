-- 1b825003c2289da2173fec38fc333182
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

CoD.BM_ItemHintText = InheritFrom( LUI.UIElement )
CoD.BM_ItemHintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_ItemHintText )
	self.id = "BM_ItemHintText"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 2, -2 )
	black:setTopBottom( true, true, 2, -2 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, 0, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setAlpha( 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.02, 0.08, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( true, true, 3.38, -4 )
	Backing:setTopBottom( false, false, -6, 33 )
	Backing:setScale( 1.2 )
	Backing:setImage( RegisterImage( "uie_t7_blackmarket_focushintbox" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 4, -4 )
	textCenterAlign:setTopBottom( false, false, 6, 22 )
	textCenterAlign:setAlpha( 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( false, true, -16, -4 )
	newIcon:setTopBottom( false, false, 7.5, 19.5 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PCHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )

				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		RightHasNew = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 0, -20 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		},
		CenterHasNew = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 4, -4 )
				self.textCenterAlign:setTopBottom( false, false, 6, 22 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 10, -10 )
				self.textCenterAlign:setTopBottom( false, false, 5, 21 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		RightAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 0, -8 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )

				Backing:completeAnimation()
				self.Backing:setAlpha( 1 )
				self.Backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Backing, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 4, -4 )
				self.textCenterAlign:setTopBottom( false, false, 5, 21 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setScale( 1.1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( textCenterAlign, {} )

				newIcon:completeAnimation()
				self.newIcon:setAlpha( 0 )
				self.clipFinished( newIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "PCHidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasHintText( element )
			end
		},
		{
			stateName = "RightHasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterHasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return IsHintTextLeftAlign( element, controller )
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return IsHintTextRightAlign( element, controller )
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.newIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
