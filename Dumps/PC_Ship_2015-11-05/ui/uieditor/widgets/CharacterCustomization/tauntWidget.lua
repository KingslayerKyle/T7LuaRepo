require( "ui.uieditor.widgets.CharacterCustomization.tauntArrowWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.tauntBindsWidget" )

CoD.tauntWidget = InheritFrom( LUI.UIElement )
CoD.tauntWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.tauntWidget )
	self.id = "tauntWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 126 )
	self.anyChildUsesUpdateState = true
	
	local tauntArrowWidget = CoD.tauntArrowWidget.new( menu, controller )
	tauntArrowWidget:setLeftRight( false, true, -208.22, 0 )
	tauntArrowWidget:setTopBottom( true, false, 0, 126 )
	tauntArrowWidget:linkToElementModel( self, nil, false, function ( model )
		tauntArrowWidget:setModel( model, controller )
	end )
	self:addElement( tauntArrowWidget )
	self.tauntArrowWidget = tauntArrowWidget
	
	local tauntBindsWidget = CoD.tauntBindsWidget.new( menu, controller )
	tauntBindsWidget:setLeftRight( true, false, -0.22, 208 )
	tauntBindsWidget:setTopBottom( true, false, 0, 126 )
	self:addElement( tauntBindsWidget )
	self.tauntBindsWidget = tauntBindsWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				tauntArrowWidget:completeAnimation()
				self.tauntArrowWidget:setAlpha( 1 )
				self.clipFinished( tauntArrowWidget, {} )
				tauntBindsWidget:completeAnimation()
				self.tauntBindsWidget:setAlpha( 0 )
				self.clipFinished( tauntBindsWidget, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				tauntArrowWidget:completeAnimation()
				self.tauntArrowWidget:setAlpha( 0 )
				self.clipFinished( tauntArrowWidget, {} )
				tauntBindsWidget:completeAnimation()
				self.tauntBindsWidget:setAlpha( 1 )
				self.clipFinished( tauntBindsWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.tauntArrowWidget:close()
		element.tauntBindsWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

