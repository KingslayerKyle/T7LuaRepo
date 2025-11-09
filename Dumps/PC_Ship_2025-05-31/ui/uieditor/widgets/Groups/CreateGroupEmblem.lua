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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 314 )
	
	local DefaultGroupEmblem = LUI.UIImage.new()
	DefaultGroupEmblem:setLeftRight( true, false, 0, 500 )
	DefaultGroupEmblem:setTopBottom( true, false, 0, 314 )
	DefaultGroupEmblem:setAlpha( 0 )
	DefaultGroupEmblem:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_emblem_temp" ) )
	self:addElement( DefaultGroupEmblem )
	self.DefaultGroupEmblem = DefaultGroupEmblem
	
	local GroupEmblem = LUI.UIImage.new()
	GroupEmblem:setLeftRight( true, true, 0, 0 )
	GroupEmblem:setTopBottom( true, true, 0, 0 )
	GroupEmblem:subscribeToGlobalModel( controller, "SelectedGroup", "groupId", function ( model )
		local groupId = Engine.GetModelValue( model )
		if groupId then
			GroupEmblem:setupGroupEmblem( groupId )
		end
	end )
	self:addElement( GroupEmblem )
	self.GroupEmblem = GroupEmblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setLeftRight( true, false, 0, 500 )
				self.DefaultGroupEmblem:setTopBottom( true, false, 0, 314 )
				self.DefaultGroupEmblem:setAlpha( 0 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 1 )
				self.clipFinished( DefaultGroupEmblem, {} )
			end
		},
		ShowPlayerEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

