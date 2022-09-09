-- aeba0f6b7f428e9eb2429b6ab94e1cd6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterButtons" )

CoD.CodCasterButtonBar = InheritFrom( LUI.UIElement )
CoD.CodCasterButtonBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterButtonBar )
	self.id = "CodCasterButtonBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 80 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.7 )
	self:addElement( black )
	self.black = black
	
	local CodCasterButtons = CoD.CodCasterButtons.new( menu, controller )
	CodCasterButtons:setLeftRight( true, true, 0, 0 )
	CodCasterButtons:setTopBottom( true, true, 0, 0 )
	CodCasterButtons:linkToElementModel( self, nil, false, function ( model )
		CodCasterButtons:setModel( model, controller )
	end )
	self:addElement( CodCasterButtons )
	self.CodCasterButtons = CodCasterButtons
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				CodCasterButtons:completeAnimation()
				self.CodCasterButtons:setAlpha( 0 )
				self.clipFinished( CodCasterButtons, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				black:completeAnimation()
				self.black:setAlpha( 0.7 )
				self.clipFinished( black, {} )

				CodCasterButtons:completeAnimation()
				self.CodCasterButtons:setAlpha( 1 )
				self.clipFinished( CodCasterButtons, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_toolbar", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterButtons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
