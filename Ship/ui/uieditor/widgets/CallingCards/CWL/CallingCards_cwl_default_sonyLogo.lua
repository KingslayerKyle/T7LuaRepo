-- 47f0ea30bfc83d9d2ba4da45ab9f1ad6
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_cwl_default_sonyLogo = InheritFrom( LUI.UIElement )
CoD.CallingCards_cwl_default_sonyLogo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_cwl_default_sonyLogo )
	self.id = "CallingCards_cwl_default_sonyLogo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 75 )
	
	local sonyLogo = LUI.UIImage.new()
	sonyLogo:setLeftRight( true, false, 0, 300 )
	sonyLogo:setTopBottom( true, false, 0, 75 )
	sonyLogo:setAlpha( 0 )
	sonyLogo:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_sonylogo" ) )
	self:addElement( sonyLogo )
	self.sonyLogo = sonyLogo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				sonyLogo:completeAnimation()
				self.sonyLogo:setAlpha( 0 )
				self.clipFinished( sonyLogo, {} )

				self.nextClip = "DefaultClip"
			end
		},
		visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				sonyLogo:completeAnimation()
				self.sonyLogo:setAlpha( 1 )
				self.clipFinished( sonyLogo, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
