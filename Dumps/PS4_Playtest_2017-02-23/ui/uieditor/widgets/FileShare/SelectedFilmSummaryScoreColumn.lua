CoD.SelectedFilmSummaryScoreColumn = InheritFrom( LUI.UIElement )
CoD.SelectedFilmSummaryScoreColumn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectedFilmSummaryScoreColumn )
	self.id = "SelectedFilmSummaryScoreColumn"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local HeaderBackground = LUI.UIImage.new()
	HeaderBackground:setLeftRight( 0, 1, 0, 0 )
	HeaderBackground:setTopBottom( 0, 0, 0, 38 )
	HeaderBackground:setAlpha( 0 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local HeaderText = LUI.UIText.new()
	HeaderText:setLeftRight( 0, 0, 0, 144 )
	HeaderText:setTopBottom( 0, 0, 0, 38 )
	HeaderText:setText( Engine.Localize( "MENU_NEW" ) )
	HeaderText:setTTF( "fonts/default.ttf" )
	HeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local ValueBackground = LUI.UIImage.new()
	ValueBackground:setLeftRight( 0, 1, 0, 0 )
	ValueBackground:setTopBottom( 0, 0, 37, 75 )
	ValueBackground:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
	self:addElement( ValueBackground )
	self.ValueBackground = ValueBackground
	
	local ValueText = LUI.UIText.new()
	ValueText:setLeftRight( 0, 0, 0, 144 )
	ValueText:setTopBottom( 0, 0, 37, 75 )
	ValueText:setText( Engine.Localize( "MENU_NEW" ) )
	ValueText:setTTF( "fonts/default.ttf" )
	ValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ValueText )
	self.ValueText = ValueText
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isValid" )
			end
		}
	} )
	self:linkToElementModel( self, "isValid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

