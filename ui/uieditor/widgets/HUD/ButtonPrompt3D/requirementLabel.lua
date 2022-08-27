-- f4a79fdaf0a1088dac8f090661d0189f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.requirementLabel = InheritFrom( LUI.UIElement )
CoD.requirementLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.requirementLabel )
	self.id = "requirementLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 24 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local requirementLabel2 = LUI.UITightText.new()
	requirementLabel2:setLeftRight( true, false, 23.5, 99.5 )
	requirementLabel2:setTopBottom( true, false, -3, 27 )
	requirementLabel2:setRGB( 0, 0, 0 )
	requirementLabel2:setAlpha( 0.92 )
	requirementLabel2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	requirementLabel2:subscribeToGlobalModel( controller, "InteractivePrompt", "activeActionEntityText", function ( model )
		local activeActionEntityText = Engine.GetModelValue( model )
		if activeActionEntityText then
			requirementLabel2:setText( Engine.Localize( activeActionEntityText ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( requirementLabel2, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, -10 )
	end )
	self:addElement( requirementLabel2 )
	self.requirementLabel2 = requirementLabel2
	
	local requirementLabel = LUI.UITightText.new()
	requirementLabel:setLeftRight( true, false, 22.5, 98.5 )
	requirementLabel:setTopBottom( true, false, -3, 27 )
	requirementLabel:setRGB( 0, 0, 0 )
	requirementLabel:setAlpha( 0.92 )
	requirementLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	requirementLabel:subscribeToGlobalModel( controller, "InteractivePrompt", "activeActionEntityText", function ( model )
		local activeActionEntityText = Engine.GetModelValue( model )
		if activeActionEntityText then
			requirementLabel:setText( Engine.Localize( activeActionEntityText ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( requirementLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, -10 )
	end )
	self:addElement( requirementLabel )
	self.requirementLabel = requirementLabel
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				requirementLabel2:completeAnimation()
				self.requirementLabel2:setAlpha( 0 )
				self.clipFinished( requirementLabel2, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				requirementLabel2:completeAnimation()
				self.requirementLabel2:setAlpha( 0.92 )
				self.clipFinished( requirementLabel2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "progress", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "progress", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
		element.requirementLabel2:close()
		element.requirementLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

