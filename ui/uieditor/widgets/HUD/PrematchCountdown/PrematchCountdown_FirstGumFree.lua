-- 8b87ff69acc647bdede09ec617150d7e
-- This hash is used for caching, delete to decompile the file again

CoD.PrematchCountdown_FirstGumFree = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_FirstGumFree.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_FirstGumFree )
	self.id = "PrematchCountdown_FirstGumFree"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local FirstGumFreeIcon = LUI.UIImage.new()
	FirstGumFreeIcon:setLeftRight( true, false, 0, 128 )
	FirstGumFreeIcon:setTopBottom( true, false, 0, 128 )
	FirstGumFreeIcon:setImage( RegisterImage( "uie_t7_menu_frontend_zm_gg_backer" ) )
	self:addElement( FirstGumFreeIcon )
	self.FirstGumFreeIcon = FirstGumFreeIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		french = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "french",
			condition = function ( menu, element, event )
				return IsCurrentLanguageFrench()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

