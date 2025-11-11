CoD.freeCursorTraitSummary = InheritFrom( LUI.UIElement )
CoD.freeCursorTraitSummary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorTraitSummary )
	self.id = "freeCursorTraitSummary"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 131 )
	
	local BlackBG3 = LUI.UIImage.new()
	BlackBG3:setLeftRight( 0, 0, 0, 420 )
	BlackBG3:setTopBottom( 0, 1, 0, 0 )
	BlackBG3:setRGB( 0.05, 0.15, 0.11 )
	BlackBG3:setAlpha( 0.98 )
	self:addElement( BlackBG3 )
	self.BlackBG3 = BlackBG3
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 10, 410 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.05, 0.15, 0.11 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Summary = LUI.UIText.new()
	Summary:setLeftRight( 0, 0, 15, 400 )
	Summary:setTopBottom( 0, 0, 5, 34 )
	Summary:setAlpha( 0.3 )
	Summary:setTTF( "fonts/default.ttf" )
	Summary:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Summary:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Summary:linkToElementModel( self, "characterTraitSummary", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Summary:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Summary, "setText", function ( element, text )
		if not IsTextEmpty( element ) then
			ScaleWidgetToLabelWrappedLeftAlign( self, self.Summary, -10, 10 )
		else
			CollapseFreeCursorElement( self )
		end
	end )
	self:addElement( Summary )
	self.Summary = Summary
	
	self.resetProperties = function ()
		BlackBG3:completeAnimation()
		Summary:completeAnimation()
		BlackBG3:setAlpha( 0.98 )
		Summary:setAlpha( 0.3 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BlackBG3:completeAnimation()
				self.BlackBG3:setAlpha( 0 )
				self.clipFinished( BlackBG3, {} )
				Summary:completeAnimation()
				self.Summary:setAlpha( 0 )
				self.clipFinished( Summary, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Hidden" )
			end
		}
	} )
	self:linkToElementModel( self, "characterTraitSummary", true, function ( model )
		local element = self
		if IsSelfModelValueNonEmptyString( element, controller, "characterTraitSummary" ) then
			SetState( self, "DefaultState" )
		else
			SetState( self, "Hidden" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Summary:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

