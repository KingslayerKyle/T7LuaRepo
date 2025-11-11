CoD.GroupEmblemWidget = InheritFrom( LUI.UIElement )
CoD.GroupEmblemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GroupEmblemWidget )
	self.id = "GroupEmblemWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 513 )
	self:setTopBottom( 0, 0, 0, 366 )
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( 0, 1, 0, 0 )
	GroupEmblem:setTopBottom( 0, 1, 0, 0 )
	GroupEmblem:setAlpha( 0 )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( 0.5, 0.5, -96, 96 )
	Spinner:setTopBottom( 0.5, 0.5, -96, 96 )
	Spinner:setScale( 0.7 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self.resetProperties = function ()
		GroupEmblem:completeAnimation()
		Spinner:completeAnimation()
		GroupEmblem:setAlpha( 0 )
		Spinner:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowGroupEmblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 1 )
				self.clipFinished( GroupEmblem, {} )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultGroupEmblem",
			condition = function ( menu, element, event )
				return IsGroupEmblemEmpty( element, controller )
			end
		},
		{
			stateName = "ShowGroupEmblem",
			condition = function ( menu, element, event )
				return not IsGroupEmblemEmpty( element, controller )
			end
		}
	} )
	if self.m_eventHandlers.group_emblem_updated then
		local currentEv = self.m_eventHandlers.group_emblem_updated
		self:registerEventHandler( "group_emblem_updated", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "group_emblem_updated", LUI.UIElement.updateState )
	end
	self:linkToElementModel( self, "groupId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

