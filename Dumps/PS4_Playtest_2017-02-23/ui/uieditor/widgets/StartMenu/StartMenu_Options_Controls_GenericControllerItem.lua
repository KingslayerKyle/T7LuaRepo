local PostLoadFunc = function ( self )
	local elementSetAlignment = self.defaultText.setAlignment
	self.defaultText.setAlignment = function ( element, alignment )
		if IsCurrentLanguageReversed() then
			if alignment & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				alignment = alignment & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif alignment & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				alignment = alignment & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		elementSetAlignment( element, alignment )
	end
	
end

CoD.StartMenu_Options_Controls_GenericControllerItem = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Controls_GenericControllerItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Controls_GenericControllerItem )
	self.id = "StartMenu_Options_Controls_GenericControllerItem"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local defaultText = LUI.UIText.new()
	defaultText:setLeftRight( 0, 1, 0, 0 )
	defaultText:setTopBottom( 0, 1, 0, 0 )
	defaultText:setTTF( "fonts/default.ttf" )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	defaultText:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			defaultText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( defaultText )
	self.defaultText = defaultText
	
	self.resetProperties = function ()
		defaultText:completeAnimation()
		defaultText:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				defaultText:completeAnimation()
				self.clipFinished( defaultText, {} )
			end
		},
		NonDefault = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				defaultText:completeAnimation()
				self.defaultText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( defaultText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonDefault",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isDefault" )
			end
		}
	} )
	self:linkToElementModel( self, "isDefault", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isDefault"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.defaultText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

