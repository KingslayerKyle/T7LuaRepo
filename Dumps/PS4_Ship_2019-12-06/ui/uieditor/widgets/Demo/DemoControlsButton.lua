require( "ui.uieditor.widgets.Theater.Theater_FocusBar" )

CoD.DemoControlsButton = InheritFrom( LUI.UIElement )
CoD.DemoControlsButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoControlsButton )
	self.id = "DemoControlsButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local whitebox = LUI.UIImage.new()
	whitebox:setLeftRight( true, false, 3, 37 )
	whitebox:setTopBottom( true, false, 11.5, 35 )
	whitebox:setAlpha( 0 )
	self:addElement( whitebox )
	self.whitebox = whitebox
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -10, 10 )
	icon:setTopBottom( false, false, -10, 10 )
	self:addElement( icon )
	self.icon = icon
	
	local TheaterFocusBarT0 = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarT0:setLeftRight( true, false, 0, 40 )
	TheaterFocusBarT0:setTopBottom( true, false, 7, 15 )
	TheaterFocusBarT0:setAlpha( 0 )
	TheaterFocusBarT0:setScale( 0.9 )
	self:addElement( TheaterFocusBarT0 )
	self.TheaterFocusBarT0 = TheaterFocusBarT0
	
	local TheaterFocusBarB0 = CoD.Theater_FocusBar.new( menu, controller )
	TheaterFocusBarB0:setLeftRight( true, false, 0, 40 )
	TheaterFocusBarB0:setTopBottom( true, false, 31, 39 )
	TheaterFocusBarB0:setAlpha( 0 )
	TheaterFocusBarB0:setXRot( 180 )
	TheaterFocusBarB0:setScale( 0.9 )
	self:addElement( TheaterFocusBarB0 )
	self.TheaterFocusBarB0 = TheaterFocusBarB0
	
	self.icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				icon:completeAnimation()
				self.icon:setRGB( 0.7, 0.7, 0.7 )
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		},
		DisabledWithFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.icon:setAlpha( 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 0 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				whitebox:completeAnimation()
				self.whitebox:setAlpha( 0.15 )
				self.clipFinished( whitebox, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				TheaterFocusBarT0:completeAnimation()
				self.TheaterFocusBarT0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarT0, {} )
				TheaterFocusBarB0:completeAnimation()
				self.TheaterFocusBarB0:setAlpha( 1 )
				self.clipFinished( TheaterFocusBarB0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and not IsSelfModelValueTrue( element, controller, "disabledWithFocus" )
			end
		},
		{
			stateName = "DisabledWithFocus",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and IsSelfModelValueTrue( element, controller, "disabledWithFocus" )
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
	self:linkToElementModel( self, "disabledWithFocus", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabledWithFocus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterFocusBarT0:close()
		element.TheaterFocusBarB0:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

