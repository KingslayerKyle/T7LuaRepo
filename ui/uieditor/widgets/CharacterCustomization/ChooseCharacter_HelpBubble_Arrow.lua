-- 7cd4cd66478b6ddd5f2d1464ce16f908
-- This hash is used for caching, delete to decompile the file again

CoD.ChooseCharacter_HelpBubble_Arrow = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacter_HelpBubble_Arrow )
	self.id = "ChooseCharacter_HelpBubble_Arrow"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 131 )
	self:setTopBottom( true, false, 0, 61 )
	
	local TriangleBack = LUI.UIImage.new()
	TriangleBack:setLeftRight( true, false, 10.5, 71.5 )
	TriangleBack:setTopBottom( true, false, 0, 61 )
	TriangleBack:setRGB( 0, 0, 0 )
	TriangleBack:setAlpha( 0 )
	TriangleBack:setZRot( 45 )
	TriangleBack:setScale( 0.7 )
	self:addElement( TriangleBack )
	self.TriangleBack = TriangleBack
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( false, false, -11, 11 )
	arrowUp:setTopBottom( false, false, -7.5, 7.5 )
	arrowUp:setZRot( 90 )
	arrowUp:setScale( 1.2 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

