CoD.CombatRecordCallingCardDescription = InheritFrom( LUI.UIElement )
CoD.CombatRecordCallingCardDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordCallingCardDescription )
	self.id = "CombatRecordCallingCardDescription"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 282 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 3, -3 )
	black:setTopBottom( 0, 1, 3, -3 )
	black:setRGB( 0, 0, 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( 0, 1, 0, 0 )
	cachitBG0:setTopBottom( 0, 1, 0, 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0, 0, 0, 0 )
	cachitBG0:setupNineSliceShader( 6, 6 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( 0, 1, 6, -6 )
	textCenterAlign:setTopBottom( 0.5, 0.5, -12, 12 )
	textCenterAlign:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, text )
		ScaleWidgetToLabelCenteredWrapped( self, element, 8, 8 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	self.resetProperties = function ()
		black:completeAnimation()
		cachitBG0:completeAnimation()
		textCenterAlign:completeAnimation()
		black:setAlpha( 1 )
		cachitBG0:setAlpha( 1 )
		textCenterAlign:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 0 )
				self.clipFinished( textCenterAlign, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

