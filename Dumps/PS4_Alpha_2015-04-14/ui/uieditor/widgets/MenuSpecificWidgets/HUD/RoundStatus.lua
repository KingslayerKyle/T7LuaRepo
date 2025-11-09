CoD.RoundStatus = InheritFrom( LUI.UIElement )
CoD.RoundStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RoundStatus )
	self.id = "RoundStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 239 )
	self:setTopBottom( true, false, 0, 24 )
	
	local roundStatus = LUI.UIText.new()
	roundStatus:setLeftRight( true, true, 0, 0 )
	roundStatus:setTopBottom( false, false, -12.5, 12.5 )
	roundStatus:setRGB( 1, 1, 1 )
	roundStatus:setText( Engine.Localize( "MPUI_ROUND_X_CAPS" ) )
	roundStatus:setTTF( "fonts/default.ttf" )
	roundStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	roundStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( roundStatus )
	self.roundStatus = roundStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				roundStatus:completeAnimation()
				self.roundStatus:setText( Engine.Localize( "" ) )
				self.clipFinished( roundStatus, {} )
			end
		},
		NoRoundLimit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				roundStatus:completeAnimation()
				self.roundStatus:setText( Engine.Localize( "MPUI_CURRENT_ROUND_CAPS" ) )
				self.clipFinished( roundStatus, {} )
			end
		},
		RoundLimit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				roundStatus:completeAnimation()
				self.roundStatus:setText( Engine.Localize( "MPUI_CURRENT_ROUND_OF_LIMIT_CAPS" ) )
				self.clipFinished( roundStatus, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

