-- d7c957af08103c979605947754a8648f
-- This hash is used for caching, delete to decompile the file again

CoD.LobbyProcessQueueDebugItemText = InheritFrom( LUI.UIElement )
CoD.LobbyProcessQueueDebugItemText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LobbyProcessQueueDebugItemText )
	self.id = "LobbyProcessQueueDebugItemText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 14 )
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, true, 0, 0 )
	Name:setTopBottom( true, false, 0, 14 )
	Name:setText( Engine.Localize( "NAME" ) )
	Name:setTTF( "fonts/escom.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Name )
	self.Name = Name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Pending = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 1, 1, 1 )
				self.clipFinished( Name, {} )
			end
		},
		Running = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 0, 1, 0.04 )
				self.clipFinished( Name, {} )
			end
		},
		Success = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 1, 1, 1 )
				self.clipFinished( Name, {} )
			end
		},
		Failure = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 1, 0.96, 0 )
				self.clipFinished( Name, {} )
			end
		},
		Error = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 1, 0.01, 0 )
				self.clipFinished( Name, {} )
			end
		},
		Throttled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Name:completeAnimation()
				self.Name:setRGB( 0, 0.82, 1 )
				self.clipFinished( Name, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Pending",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 0 )
			end
		},
		{
			stateName = "Running",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 1 )
			end
		},
		{
			stateName = "Success",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 2 )
			end
		},
		{
			stateName = "Failure",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 3 )
			end
		},
		{
			stateName = "Error",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 4 )
			end
		},
		{
			stateName = "Throttled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "processState", 5 )
			end
		}
	} )
	self:linkToElementModel( self, "processState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "processState"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
