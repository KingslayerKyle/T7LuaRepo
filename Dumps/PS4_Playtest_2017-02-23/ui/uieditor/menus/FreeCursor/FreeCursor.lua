require( "ui.uieditor.widgets.FreeCursor.freeCursorWidget" )

LUI.createMenu.FreeCursor = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FreeCursor" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FreeCursor.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local freeCursorWidget0 = CoD.freeCursorWidget.new( self, controller )
	freeCursorWidget0:setLeftRight( 0, 0, 0, 140 )
	freeCursorWidget0:setTopBottom( 0, 0, 0, 140 )
	freeCursorWidget0:subscribeToGlobalModel( controller, "FreeCursor", nil, function ( model )
		freeCursorWidget0:setModel( model, controller )
	end )
	self:addElement( freeCursorWidget0 )
	self.freeCursorWidget0 = freeCursorWidget0
	
	self.resetProperties = function ()
		freeCursorWidget0:completeAnimation()
		freeCursorWidget0:setAlpha( 1 )
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
				self:setupElementClipCounter( 1 )
				freeCursorWidget0:completeAnimation()
				self.freeCursorWidget0:setAlpha( 0 )
				self.clipFinished( freeCursorWidget0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGlobalDataSourceModelValueGreaterThan( controller, "FreeCursor", "hidden", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( DataSources.FreeCursor.getModel( controller ), "hidden" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hidden"
		} )
	end )
	freeCursorWidget0.id = "freeCursorWidget0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.freeCursorWidget0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeCursor.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = self
	CallCustomElementFunction_Self( self, "setPriority", 1000 )
	SetProperty( self, "m_inputDisabled", true )
	return self
end

