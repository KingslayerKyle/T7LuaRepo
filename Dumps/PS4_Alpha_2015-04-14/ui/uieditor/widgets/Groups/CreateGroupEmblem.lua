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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local DefaultGroupEmblem = LUI.UIImage.new()
	DefaultGroupEmblem:setLeftRight( true, false, 0, 128 )
	DefaultGroupEmblem:setTopBottom( true, false, 0, 128 )
	DefaultGroupEmblem:setRGB( 1, 1, 1 )
	DefaultGroupEmblem:setAlpha( 0 )
	DefaultGroupEmblem:setImage( RegisterImage( "uie_img_t7_menu_frontend_asset_emblem_temp" ) )
	DefaultGroupEmblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( DefaultGroupEmblem )
	self.DefaultGroupEmblem = DefaultGroupEmblem
	
	local PlayerEmblem = LUI.UIElement.new()
	PlayerEmblem:setLeftRight( true, false, 0, 128 )
	PlayerEmblem:setTopBottom( true, false, 0, 128 )
	PlayerEmblem:setRGB( 1, 1, 1 )
	PlayerEmblem:setAlpha( 0 )
	PlayerEmblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	PlayerEmblem:setupEmblem( Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
	self:addElement( PlayerEmblem )
	self.PlayerEmblem = PlayerEmblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 0 )
				self.clipFinished( DefaultGroupEmblem, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 0 )
				self.clipFinished( PlayerEmblem, {} )
			end
		},
		DefaultGroupEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 1 )
				self.clipFinished( DefaultGroupEmblem, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 0 )
				self.clipFinished( PlayerEmblem, {} )
			end
		},
		ShowPlayerEmblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DefaultGroupEmblem:completeAnimation()
				self.DefaultGroupEmblem:setAlpha( 0 )
				self.clipFinished( DefaultGroupEmblem, {} )
				PlayerEmblem:completeAnimation()
				self.PlayerEmblem:setAlpha( 1 )
				self.clipFinished( PlayerEmblem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultGroupEmblem",
			condition = function ( menu, element, event )
				return IsEmblemEmpty( controller )
			end
		},
		{
			stateName = "ShowPlayerEmblem",
			condition = function ( menu, element, event )
				return not IsEmblemEmpty( controller )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

