-- 860c3ba41d5d15016d603e77507fd7f5
-- This hash is used for caching, delete to decompile the file again

CoD.GroupsSocialMainPrimaryGroupBadge = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMainPrimaryGroupBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMainPrimaryGroupBadge )
	self.id = "GroupsSocialMainPrimaryGroupBadge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 42 )
	self:setTopBottom( true, false, 0, 42 )
	
	local PrimaryIcon = LUI.UIImage.new()
	PrimaryIcon:setLeftRight( true, true, 0, 0 )
	PrimaryIcon:setTopBottom( true, true, 0, 0 )
	PrimaryIcon:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PrimaryIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_favorites" ) )
	self:addElement( PrimaryIcon )
	self.PrimaryIcon = PrimaryIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PrimaryIcon:completeAnimation()
				self.PrimaryIcon:setAlpha( 0 )
				self.clipFinished( PrimaryIcon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PrimaryIcon:completeAnimation()
				self.PrimaryIcon:setAlpha( 1 )
				self.clipFinished( PrimaryIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

