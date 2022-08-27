-- 074f191d3865669f67498b7b57334f31
-- This hash is used for caching, delete to decompile the file again

CoD.DotLineDot = InheritFrom( LUI.UIElement )
CoD.DotLineDot.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DotLineDot )
	self.id = "DotLineDot"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 78 )
	self:setTopBottom( true, false, 0, 6 )
	
	local dotend = LUI.UIImage.new()
	dotend:setLeftRight( true, false, 0, 6 )
	dotend:setTopBottom( true, true, 0, 0 )
	dotend:setImage( RegisterImage( "uie_t7_menu_cp_datavault_bookmark_dotlineend" ) )
	self:addElement( dotend )
	self.dotend = dotend
	
	local dotend0 = LUI.UIImage.new()
	dotend0:setLeftRight( true, true, 6, -6 )
	dotend0:setTopBottom( true, true, 0, 0 )
	dotend0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_bookmark_center" ) )
	self:addElement( dotend0 )
	self.dotend0 = dotend0
	
	local dotend1 = LUI.UIImage.new()
	dotend1:setLeftRight( false, true, -6, 0 )
	dotend1:setTopBottom( true, true, 0, 0 )
	dotend1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_bookmark_dotlineend2" ) )
	self:addElement( dotend1 )
	self.dotend1 = dotend1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Close_Nav = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bookmark_Nav = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Closed_Nav = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bookmark_Nav = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bookmark_Nav = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			Closed_Nav = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

