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
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 3, -3 )
	black:setTopBottom( 0, 1, 3, -3 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( 0, 1, 0, 0 )
	cachitBG0:setTopBottom( 0, 1, 0, 0 )
	cachitBG0:setAlpha( 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0, 0, 0, 0 )
	cachitBG0:setupNineSliceShader( 6, 6 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( 0, 1, 6, -6 )
	Backing:setTopBottom( 0.5, 0.5, -9, 49 )
	Backing:setScale( 1.2 )
	Backing:setImage( RegisterImage( "uie_t7_blackmarket_focushintbox" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( 0, 1, 6, -6 )
	textCenterAlign:setTopBottom( 0.5, 0.5, 9, 33 )
	textCenterAlign:setAlpha( 0 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( 1, 1, -24, -6 )
	newIcon:setTopBottom( 0.5, 0.5, 11, 29 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.resetProperties = function ()
		Backing:completeAnimation()
		newIcon:completeAnimation()
		textCenterAlign:completeAnimation()
		black:completeAnimation()
		cachitBG0:completeAnimation()
		Backing:setAlpha( 1 )
		newIcon:setAlpha( 0 )
		textCenterAlign:setLeftRight( 0, 1, 6, -6 )
		textCenterAlign:setTopBottom( 0.5, 0.5, 9, 33 )
		textCenterAlign:setAlpha( 0 )
		textCenterAlign:setScale( 1 )
		textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
		black:setAlpha( 0 )
		cachitBG0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PCHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				self.clipFinished( Backing, {} )
			end
		},
		RightHasNew = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 0, -30 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		},
		LeftAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 15, -15 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, 8, 32 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		RightAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 0, -12 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		CenterAlign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( 0, 1, 6, -6 )
				self.textCenterAlign:setTopBottom( 0.5, 0.5, 8, 32 )
				self.textCenterAlign:setAlpha( 1 )
				self.textCenterAlign:setScale( 1.1 )
				self.clipFinished( textCenterAlign, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.newIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

