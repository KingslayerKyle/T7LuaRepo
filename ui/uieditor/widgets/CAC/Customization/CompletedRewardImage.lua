-- d9095ec91e9a96c6634b4e1576192c43
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.CompletedRewardImage = InheritFrom( LUI.UIElement )
CoD.CompletedRewardImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompletedRewardImage )
	self.id = "CompletedRewardImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 78 )
	self:setTopBottom( true, false, 0, 78 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.14, 0.12, 0.13 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local completedRewardImage = LUI.UIImage.new()
	completedRewardImage:setLeftRight( false, false, -16, 16 )
	completedRewardImage:setTopBottom( false, false, -16, 16 )
	completedRewardImage:setRGB( 0.98, 0.73, 0.35 )
	completedRewardImage:setImage( RegisterImage( "uie_menu_mp_star_rating" ) )
	self:addElement( completedRewardImage )
	self.completedRewardImage = completedRewardImage
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

