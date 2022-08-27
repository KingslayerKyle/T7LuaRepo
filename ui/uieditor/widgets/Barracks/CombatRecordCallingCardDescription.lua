-- 3c6b6f6fb685989ca20b54da0f5c8183
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 32 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 2, -2 )
	black:setTopBottom( true, true, 2, -2 )
	black:setRGB( 0, 0, 0 )
	black:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( black )
	self.black = black
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, 0, 0 )
	cachitBG0:setTopBottom( true, true, 0, 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.01, 0.12, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 8, -8 )
	textCenterAlign:setTopBottom( false, false, -8, 8 )
	textCenterAlign:setText( Engine.Localize( "MENU_DESCRIPTION" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( textCenterAlign, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 8, 8 )
	end )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )
				textCenterAlign:completeAnimation()
				self.textCenterAlign:setAlpha( 1 )
				self.clipFinished( textCenterAlign, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
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

