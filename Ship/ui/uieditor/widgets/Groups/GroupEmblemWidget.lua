-- be16cbd36dbc3f8f7053d7375e9572d5
-- This hash is used for caching, delete to decompile the file again

CoD.GroupEmblemWidget = InheritFrom( LUI.UIElement )
CoD.GroupEmblemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupEmblemWidget )
	self.id = "GroupEmblemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 244 )
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( true, true, 0, 0 )
	GroupEmblem:setTopBottom( true, true, 0, 0 )
	GroupEmblem:setAlpha( 0 )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( false, false, -64, 64 )
	Spinner:setTopBottom( false, false, -64, 64 )
	Spinner:setAlpha( 0 )
	Spinner:setScale( 0.7 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local DefaultEmblem = LUI.UIImage.new()
	DefaultEmblem:setLeftRight( true, true, 0, 0 )
	DefaultEmblem:setTopBottom( true, true, 0, 0 )
	DefaultEmblem:setImage( RegisterImage( "uie_t7_icon_groups_default_emblem" ) )
	self:addElement( DefaultEmblem )
	self.DefaultEmblem = DefaultEmblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 0 )
				self.clipFinished( GroupEmblem, {} )

				DefaultEmblem:completeAnimation()
				self.DefaultEmblem:setAlpha( 1 )
				self.clipFinished( DefaultEmblem, {} )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 0 )
				self.clipFinished( GroupEmblem, {} )

				DefaultEmblem:completeAnimation()
				self.DefaultEmblem:setAlpha( 1 )
				self.clipFinished( DefaultEmblem, {} )
			end
		},
		ShowGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 1 )
				self.clipFinished( GroupEmblem, {} )

				DefaultEmblem:completeAnimation()
				self.DefaultEmblem:setAlpha( 0 )
				self.clipFinished( DefaultEmblem, {} )
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
		local f1_local4 = self.m_eventHandlers.group_emblem_updated
		self:registerEventHandler( "group_emblem_updated", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local4( element, event )
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
