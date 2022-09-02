-- d48202b4b18ae55dd548d776db97fc7c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "hintText", true, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller,
			menu = menu
		} )

		self:completeAnimation()
		local f2_local0 = Engine.GetModelValue( model )
		if f2_local0 then
			self.textCenterAlign:setText( f2_local0 )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( self.textCenterAlign, "setText", function ( element, controller )
		local f3_local0 = element:getTextWidth()
		local f3_local1 = 8
		if self.currentState == "RightHasNew" then
			self:setLeftRight( false, true, -(f3_local0 + 14) - f3_local1, f3_local1 )
		elseif self.currentState == "CenterHasNew" then
			f3_local0 = f3_local0 + 14
			self:setLeftRight( false, false, -f3_local0 / 2 - f3_local1, f3_local0 / 2 + f3_local1 )
		elseif self.currentState == "LeftAlign" then
			self:setLeftRight( true, false, -f3_local1, f3_local0 + f3_local1 )
		elseif self.currentState == "RightAlign" then
			self:setLeftRight( false, true, -f3_local0 - f3_local1, f3_local1 )
		elseif self.currentState == "CenterAlign" then
			self:setLeftRight( false, false, -f3_local0 / 2 - f3_local1, f3_local0 / 2 + f3_local1 )
		end
	end )
end

CoD.ItemHintText = InheritFrom( LUI.UIElement )
CoD.ItemHintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ItemHintText )
	self.id = "ItemHintText"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
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
	cachitBG0:setShaderVector( 0, 0.02, 0.13, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local textCenterAlign = LUI.UIText.new()
	textCenterAlign:setLeftRight( true, true, 4, -4 )
	textCenterAlign:setTopBottom( false, false, -8, 8 )
	textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	textCenterAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textCenterAlign:setLetterSpacing( 0.5 )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textCenterAlign )
	self.textCenterAlign = textCenterAlign
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( false, true, -16, -4 )
	newIcon:setTopBottom( false, false, -5.5, 6.5 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )

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
				self.textCenterAlign:setLeftRight( true, true, 4, -16 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
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
				self.textCenterAlign:setLeftRight( true, true, 8, 0 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
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
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 1 )
				self.clipFinished( cachitBG0, {} )

				textCenterAlign:completeAnimation()
				self.textCenterAlign:setLeftRight( true, true, 4, -4 )
				self.textCenterAlign:setTopBottom( false, false, -8, 8 )
				self.textCenterAlign:setAlpha( 1 )
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

