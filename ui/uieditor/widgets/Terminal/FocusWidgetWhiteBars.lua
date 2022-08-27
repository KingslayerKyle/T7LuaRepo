-- 413be87a654707eb99b6065cf678e806
-- This hash is used for caching, delete to decompile the file again

CoD.FocusWidgetWhiteBars = InheritFrom( LUI.UIElement )
CoD.FocusWidgetWhiteBars.new = function ( menu, controller )
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
	self:setClass( CoD.FocusWidgetWhiteBars )
	self.id = "FocusWidgetWhiteBars"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 165 )
	self:setTopBottom( true, false, 0, 7 )
	
	local Ends = LUI.UIImage.new()
	Ends:setLeftRight( true, false, 0, 13.65 )
	Ends:setTopBottom( true, true, 0, -0.17 )
	Ends:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_tip" ) )
	self:addElement( Ends )
	self.Ends = Ends
	
	local bar = LUI.UIImage.new()
	bar:setLeftRight( true, true, 13.65, -14 )
	bar:setTopBottom( true, true, 0.91, -1.09 )
	bar:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_center" ) )
	self:addElement( bar )
	self.bar = bar
	
	local ends10 = LUI.UIImage.new()
	ends10:setLeftRight( false, true, -14, -0.32 )
	ends10:setTopBottom( true, true, 0, -0.16 )
	ends10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_tip2" ) )
	self:addElement( ends10 )
	self.ends10 = ends10
	
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

