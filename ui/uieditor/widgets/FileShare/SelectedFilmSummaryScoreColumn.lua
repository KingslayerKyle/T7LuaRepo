-- c4470debc458af4109ca7c35e02be7ef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )

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
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local HeaderBackground = LUI.UIImage.new()
	HeaderBackground:setLeftRight( true, true, 0, 0 )
	HeaderBackground:setTopBottom( true, false, 0, 25 )
	HeaderBackground:setAlpha( 0 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local HeaderText = LUI.UIText.new()
	HeaderText:setLeftRight( true, false, 0, 96.25 )
	HeaderText:setTopBottom( true, false, 0, 25 )
	HeaderText:setText( Engine.Localize( "MENU_NEW" ) )
	HeaderText:setTTF( "fonts/default.ttf" )
	HeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local ValueBackground = LUI.UIImage.new()
	ValueBackground:setLeftRight( true, true, 1, -1 )
	ValueBackground:setTopBottom( true, false, 25, 49 )
	ValueBackground:setRGB( 0, 0, 0 )
	ValueBackground:setAlpha( 0.65 )
	self:addElement( ValueBackground )
	self.ValueBackground = ValueBackground
	
	local ValueText = LUI.UIText.new()
	ValueText:setLeftRight( true, false, 0, 96.25 )
	ValueText:setTopBottom( true, false, 25, 50 )
	ValueText:setText( Engine.Localize( "MENU_NEW" ) )
	ValueText:setTTF( "fonts/default.ttf" )
	ValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ValueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ValueText )
	self.ValueText = ValueText
	
	local BorderThin01 = CoD.BorderThin.new( menu, controller )
	BorderThin01:setLeftRight( true, true, 0, 0 )
	BorderThin01:setTopBottom( true, false, 0, 50 )
	BorderThin01:setAlpha( 0.5 )
	self:addElement( BorderThin01 )
	self.BorderThin01 = BorderThin01
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThin01:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

