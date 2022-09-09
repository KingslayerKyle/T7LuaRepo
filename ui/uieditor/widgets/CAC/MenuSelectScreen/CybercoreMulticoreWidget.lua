-- 02c3f15dee675827209f478762977b1c
-- This hash is used for caching, delete to decompile the file again

CoD.CybercoreMulticoreWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreMulticoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreMulticoreWidget )
	self.id = "CybercoreMulticoreWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 119 )
	self:setTopBottom( true, false, 0, 90 )
	
	local multicoreText = LUI.UIText.new()
	multicoreText:setLeftRight( false, true, -119, 0 )
	multicoreText:setTopBottom( true, false, 0, 18 )
	multicoreText:setAlpha( 0 )
	multicoreText:setText( Engine.Localize( "MENU_CYBERCOM_RIG_MULTICORE" ) )
	multicoreText:setTTF( "fonts/escom.ttf" )
	multicoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	multicoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( multicoreText )
	self.multicoreText = multicoreText
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, true, -67, -3 )
	icon:setTopBottom( true, false, 24, 88 )
	icon:setAlpha( 0 )
	icon:setImage( RegisterImage( GetItemImageFromIndex( GetEquippedCybercoreItemIndex( controller, "uie_t7_hud_ks_carepackage_menu" ) ) ) )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				multicoreText:completeAnimation()
				self.multicoreText:setLeftRight( false, true, -67, -3 )
				self.multicoreText:setTopBottom( true, false, 0, 18 )
				self.multicoreText:setAlpha( 1 )
				self.multicoreText:setText( Engine.Localize( "MENU_DEFAULT" ) )
				self.multicoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( multicoreText, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
