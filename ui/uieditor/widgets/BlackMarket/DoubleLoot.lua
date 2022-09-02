-- 37b30671e22738ecac1a8d72c9efbff5
-- This hash is used for caching, delete to decompile the file again

CoD.DoubleLoot = InheritFrom( LUI.UIElement )
CoD.DoubleLoot.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DoubleLoot )
	self.id = "DoubleLoot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 80 )
	
	local cryptokeyBack = LUI.UIImage.new()
	cryptokeyBack:setLeftRight( false, false, -39, 41 )
	cryptokeyBack:setTopBottom( true, false, 2, 82 )
	cryptokeyBack:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot" ) )
	self:addElement( cryptokeyBack )
	self.cryptokeyBack = cryptokeyBack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 0 )
				self.clipFinished( cryptokeyBack, {} )
			end
		},
		DoubleLoot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.clipFinished( cryptokeyBack, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DoubleLoot",
			condition = function ( menu, element, event )
				return IsDoubleLootXP( controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

