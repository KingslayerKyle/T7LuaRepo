-- b7c919ab655152a67cae77bc33bb8a64
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 17 )
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( true, false, 0, 171 )
	WpnName:setTopBottom( true, false, 0, 17 )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	WpnName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WpnName:setText( name )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( WpnName, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 20 )
	end )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	local talker = LUI.UIImage.new()
	talker:setLeftRight( true, false, 174, 190 )
	talker:setTopBottom( true, false, 0, 16 )
	talker:setImage( RegisterImage( "uie_voice_on" ) )
	self:addElement( talker )
	self.talker = talker
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WpnName:completeAnimation()
				self.WpnName:setAlpha( 1 )
				self.clipFinished( WpnName, {} )

				talker:completeAnimation()
				self.talker:setAlpha( 0 )
				self.clipFinished( talker, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WpnName:completeAnimation()
				self.WpnName:setAlpha( 1 )
				self.clipFinished( WpnName, {} )

				talker:completeAnimation()
				self.talker:setAlpha( 1 )
				self.clipFinished( talker, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WpnName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

