-- 91e6f66f07701c4132adeb116483faec
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.OnePxLine" )

CoD.Generalframe = InheritFrom( LUI.UIElement )
CoD.Generalframe.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Generalframe )
	self.id = "Generalframe"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 291 )
	self:setTopBottom( true, false, 0, 169 )
	self.anyChildUsesUpdateState = true
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 0, 0 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.45 )
	self:addElement( Black )
	self.Black = Black
	
	local OnePxLine0 = CoD.OnePxLine.new( menu, controller )
	OnePxLine0:setLeftRight( true, true, -3, 5.25 )
	OnePxLine0:setTopBottom( true, false, -5, 6 )
	self:addElement( OnePxLine0 )
	self.OnePxLine0 = OnePxLine0
	
	local cross = LUI.UIImage.new()
	cross:setLeftRight( true, false, -3.83, 3.83 )
	cross:setTopBottom( true, false, -3.81, 3.84 )
	cross:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cross" ) )
	self:addElement( cross )
	self.cross = cross
	
	local smallwhiteline = LUI.UIImage.new()
	smallwhiteline:setLeftRight( true, false, -3, 4.68 )
	smallwhiteline:setTopBottom( false, true, -3.85, 3.83 )
	smallwhiteline:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( smallwhiteline )
	self.smallwhiteline = smallwhiteline
	
	local cross0 = LUI.UIImage.new()
	cross0:setLeftRight( false, true, -3.83, 3.83 )
	cross0:setTopBottom( false, true, -3.83, 3.83 )
	cross0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cross" ) )
	self:addElement( cross0 )
	self.cross0 = cross0
	
	local smallwhiteline0 = LUI.UIImage.new()
	smallwhiteline0:setLeftRight( false, true, -4, 3.68 )
	smallwhiteline0:setTopBottom( true, false, -3.84, 3.84 )
	smallwhiteline0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( smallwhiteline0 )
	self.smallwhiteline0 = smallwhiteline0
	
	local OnePxLine00 = CoD.OnePxLine.new( menu, controller )
	OnePxLine00:setLeftRight( true, true, -3, 5.25 )
	OnePxLine00:setTopBottom( false, true, -4.85, 6.15 )
	self:addElement( OnePxLine00 )
	self.OnePxLine00 = OnePxLine00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OnePxLine0:close()
		element.OnePxLine00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
