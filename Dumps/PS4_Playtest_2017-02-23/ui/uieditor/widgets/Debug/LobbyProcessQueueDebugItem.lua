CoD.LobbyProcessQueueDebugItem = InheritFrom( LUI.UIElement )
CoD.LobbyProcessQueueDebugItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyProcessQueueDebugItem )
	self.id = "LobbyProcessQueueDebugItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 15 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.7 )
	self:addElement( Background )
	self.Background = Background
	
	self.resetProperties = function ()
		Background:completeAnimation()
		Background:setRGB( 0, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Process = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setRGB( 0, 0.04, 0.43 )
				self.clipFinished( Background, {} )
			end
		},
		Action = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Process",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "process" )
			end
		},
		{
			stateName = "Action",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "action" )
			end
		}
	} )
	self:linkToElementModel( self, "type", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

