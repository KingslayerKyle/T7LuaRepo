-- 33614b5d4293340ce377419d7099a35f
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = f1_arg0.defaultText.setAlignment
	f1_arg0.defaultText.setAlignment = function ( f2_arg0, f2_arg1 )
		if IsCurrentLanguageReversed() then
			if f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f2_arg1 = f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f2_arg1 = f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f1_local0( f2_arg0, f2_arg1 )
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
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local defaultText = LUI.UIText.new()
	defaultText:setLeftRight( true, true, 0, 0 )
	defaultText:setTopBottom( true, true, 0, 0 )
	defaultText:setTTF( "fonts/default.ttf" )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	defaultText:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			defaultText:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( defaultText )
	self.defaultText = defaultText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				defaultText:completeAnimation()
				self.defaultText:setRGB( 1, 1, 1 )
				self.defaultText:setAlpha( 1 )
				self.clipFinished( defaultText, {} )
			end
		},
		NonDefault = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.defaultText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

