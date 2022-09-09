-- d9c24545aa34f97875a81fdcdc57f68d
-- This hash is used for caching, delete to decompile the file again

CoD.BM_GoldBarMed = InheritFrom( LUI.UIElement )
CoD.BM_GoldBarMed.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_GoldBarMed )
	self.id = "BM_GoldBarMed"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( true, false, 3.33, 40 )
	Left:setTopBottom( true, true, -11.92, 13.92 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_left" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( true, true, 40, -40 )
	Center:setTopBottom( true, true, -11.92, 13.92 )
	Center:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_middle" ) )
	self:addElement( Center )
	self.Center = Center
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( false, true, -40, -3.33 )
	Right:setTopBottom( true, true, -11.92, 13.92 )
	Right:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_right" ) )
	self:addElement( Right )
	self.Right = Right
	
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
