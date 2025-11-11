CoD.CreateGroupEmblem = InheritFrom( LUI.UIElement )
CoD.CreateGroupEmblem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CreateGroupEmblem )
	self.id = "CreateGroupEmblem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 510 )
	self:setTopBottom( 0, 0, 0, 360 )
	
	local DefaultGroupEmblem = LUI.UIImage.new()
	DefaultGroupEmblem:setLeftRight( 0, 1, 0, 0 )
	DefaultGroupEmblem:setTopBottom( 0, 1, 0, 0 )
	DefaultGroupEmblem:setAlpha( 0 )
	DefaultGroupEmblem:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_emblem_temp" ) )
	self:addElement( DefaultGroupEmblem )
	self.DefaultGroupEmblem = DefaultGroupEmblem
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( 0, 1, 0, 0 )
	GroupEmblem:setTopBottom( 0, 1, 0, 0 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupEmblem:setupGroupEmblem( modelValue )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	self.resetProperties = function ()
		DefaultGroupEmblem:completeAnimation()
		DefaultGroupEmblem:setLeftRight( 0, 1, 0, 0 )
		DefaultGroupEmblem:setTopBottom( 0, 1, 0, 0 )
		DefaultGroupEmblem:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setLeftRight( 0, 0, 255, 255 )
				self.DefaultGroupEmblem:setTopBottom( 0, 0, 180, 180 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 1 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		ShowPlayerEmblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultGroupEmblem",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ShowPlayerEmblem",
			condition = function ( menu, element, event )
				return not IsEmblemEmpty( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupEmblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

