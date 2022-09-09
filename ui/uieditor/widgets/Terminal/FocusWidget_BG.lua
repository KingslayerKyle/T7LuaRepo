-- 1866adf58773f26400248c60f8bc4304
-- This hash is used for caching, delete to decompile the file again

CoD.FocusWidget_BG = InheritFrom( LUI.UIElement )
CoD.FocusWidget_BG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FocusWidget_BG )
	self.id = "FocusWidget_BG"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 22 )
	
	local LeftHightLigh = LUI.UIImage.new()
	LeftHightLigh:setLeftRight( true, false, 0, 11 )
	LeftHightLigh:setTopBottom( true, true, 0, 0 )
	LeftHightLigh:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_highlightl" ) )
	self:addElement( LeftHightLigh )
	self.LeftHightLigh = LeftHightLigh
	
	local Centerhighligh = LUI.UIImage.new()
	Centerhighligh:setLeftRight( true, true, 11, -11 )
	Centerhighligh:setTopBottom( true, true, 0, 0 )
	Centerhighligh:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_highlightcenter" ) )
	self:addElement( Centerhighligh )
	self.Centerhighligh = Centerhighligh
	
	local LeftHightLigh0 = LUI.UIImage.new()
	LeftHightLigh0:setLeftRight( false, true, -11, 0 )
	LeftHightLigh0:setTopBottom( true, true, 0, 0 )
	LeftHightLigh0:setZRot( 180 )
	LeftHightLigh0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_focustab_highlightl" ) )
	self:addElement( LeftHightLigh0 )
	self.LeftHightLigh0 = LeftHightLigh0
	
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
