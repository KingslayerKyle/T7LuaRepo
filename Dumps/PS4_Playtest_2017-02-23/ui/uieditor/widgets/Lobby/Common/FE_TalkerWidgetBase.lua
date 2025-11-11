CoD.FE_TalkerWidgetBase = InheritFrom( LUI.UIElement )
CoD.FE_TalkerWidgetBase.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TalkerWidgetBase )
	self.id = "FE_TalkerWidgetBase"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 25 )
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( 0, 0, 0, 256 )
	WpnName:setTopBottom( 0, 0, 0.5, 25.5 )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	WpnName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WpnName:setText( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( WpnName, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 20 )
	end )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	local talker = LUI.UIImage.new()
	talker:setLeftRight( 0, 0, 261, 285 )
	talker:setTopBottom( 0, 0, 0, 24 )
	self:addElement( talker )
	self.talker = talker
	
	self.resetProperties = function ()
		talker:completeAnimation()
		talker:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				talker:completeAnimation()
				self.talker:setAlpha( 0 )
				self.clipFinished( talker, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "name" )
			end
		}
	} )
	self:linkToElementModel( self, "name", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "name"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WpnName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

