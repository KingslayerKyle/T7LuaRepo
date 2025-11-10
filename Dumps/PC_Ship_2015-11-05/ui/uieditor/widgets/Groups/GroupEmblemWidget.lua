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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( true, true, 0, 0 )
	GroupEmblem:setTopBottom( true, true, 0, 0 )
	GroupEmblem:setAlpha( 0 )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	local DefaultGroupEmblem = LUI.UIImage.new()
	DefaultGroupEmblem:setLeftRight( true, true, 0, 0 )
	DefaultGroupEmblem:setTopBottom( true, true, 0, 0 )
	DefaultGroupEmblem:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_emblem_temp" ) )
	self:addElement( DefaultGroupEmblem )
	self.DefaultGroupEmblem = DefaultGroupEmblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 0 )
				self.clipFinished( GroupEmblem, {} )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 0 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 0 )
				self.clipFinished( GroupEmblem, {} )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 1 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		ShowGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupEmblem:completeAnimation()
				self.GroupEmblem:setAlpha( 1 )
				self.clipFinished( GroupEmblem, {} )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 0 )
				self.clipFinished( DefaultGroupEmblem, {} )
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
		local f1_local3 = self.m_eventHandlers.group_emblem_updated
		self:registerEventHandler( "group_emblem_updated", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local3( self, event )
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

