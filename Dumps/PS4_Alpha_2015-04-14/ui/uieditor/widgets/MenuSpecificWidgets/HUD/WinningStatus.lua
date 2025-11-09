CoD.WinningStatus = InheritFrom( LUI.UIElement )
CoD.WinningStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WinningStatus )
	self.id = "WinningStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 224 )
	self:setTopBottom( true, false, 0, 24 )
	
	local winningStatus = LUI.UIText.new()
	winningStatus:setLeftRight( true, true, 0, 0 )
	winningStatus:setTopBottom( false, false, -12.5, 12.5 )
	winningStatus:setRGB( 1, 1, 1 )
	winningStatus:setText( Engine.Localize( "MENU_WINNING_CAPS" ) )
	winningStatus:setTTF( "fonts/default.ttf" )
	winningStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	winningStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( winningStatus )
	self.winningStatus = winningStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				winningStatus:completeAnimation()
				self.winningStatus:setText( Engine.Localize( "MENU_TIED_CAPS" ) )
				self.clipFinished( winningStatus, {} )
			end
		},
		Winning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				winningStatus:completeAnimation()
				self.winningStatus:setText( Engine.Localize( "MENU_WINNING_CAPS" ) )
				self.clipFinished( winningStatus, {} )
			end
		},
		Losing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				winningStatus:completeAnimation()
				self.winningStatus:setText( Engine.Localize( "MENU_LOSING_CAPS" ) )
				self.clipFinished( winningStatus, {} )
			end
		},
		Overtime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				winningStatus:completeAnimation()
				self.winningStatus:setText( Engine.Localize( "MP_OVERTIME_CAPS" ) )
				self.clipFinished( winningStatus, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

