-- f69c99e146a048959047d5adadd4f3d4
-- This hash is used for caching, delete to decompile the file again

CoD.PrematchCountdown_2xpBadge = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_2xpBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_2xpBadge )
	self.id = "PrematchCountdown_2xpBadge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local DoubleXPIcon = LUI.UIImage.new()
	DoubleXPIcon:setLeftRight( true, false, 0, 128 )
	DoubleXPIcon:setTopBottom( true, false, 0, 128 )
	DoubleXPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp" ) )
	self:addElement( DoubleXPIcon )
	self.DoubleXPIcon = DoubleXPIcon
	
	local Label = LUI.UIText.new()
	Label:setLeftRight( true, false, -36, 164 )
	Label:setTopBottom( true, false, 37, 87 )
	Label:setText( Engine.Localize( AppendLocalizeString( "MENU_XP_CAPS", "2" ) ) )
	Label:setTTF( "fonts/escom.ttf" )
	Label:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label:setShaderVector( 0, 0.05, 0, 0, 0 )
	Label:setShaderVector( 1, 0.7, 0, 0, 0 )
	Label:setShaderVector( 2, 1, 0, 0, 0 )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Label )
	self.Label = Label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Label:completeAnimation()
				self.Label:setLeftRight( true, false, -36, 164 )
				self.Label:setTopBottom( true, false, 37, 87 )
				self.clipFinished( Label, {} )
			end
		},
		french = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Label:completeAnimation()
				self.Label:setLeftRight( true, false, -36, 164 )
				self.Label:setTopBottom( true, false, 44, 82 )
				self.clipFinished( Label, {} )
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
