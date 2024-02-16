-- 797a19714af2cbe6e436f171356a32f8
-- This hash is used for caching, delete to decompile the file again

CoD.Social_PartyMemberIcon = InheritFrom( LUI.UIElement )
CoD.Social_PartyMemberIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyMemberIcon )
	self.id = "Social_PartyMemberIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, -3, 13 )
	Icon:setTopBottom( true, false, -4, 30 )
	Icon:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymember" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
