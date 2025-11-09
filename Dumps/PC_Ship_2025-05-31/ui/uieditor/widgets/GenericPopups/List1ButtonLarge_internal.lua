CoD.List1ButtonLarge_internal = InheritFrom( LUI.UIElement )
CoD.List1ButtonLarge_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.List1ButtonLarge_internal )
	self.id = "List1ButtonLarge_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 343 )
	self:setTopBottom( true, false, 0, 19 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Text0 = LUI.UIText.new()
	Text0:setLeftRight( true, false, 0, 343 )
	Text0:setTopBottom( true, false, 1, 21 )
	Text0:setText( Engine.Localize( "BUTTON" ) )
	Text0:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

