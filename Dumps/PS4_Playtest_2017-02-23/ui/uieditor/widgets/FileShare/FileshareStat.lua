CoD.FileshareStat = InheritFrom( LUI.UIElement )
CoD.FileshareStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareStat )
	self.id = "FileshareStat"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 150 )
	BG:setTopBottom( 0, 0, 0, 27 )
	BG:setRGB( 0.21, 0.21, 0.21 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 0, 26 )
	Icon:setTopBottom( 0, 0, 0, 27 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 25, 148 )
	TextBox0:setTopBottom( 0, 0, -3, 27 )
	TextBox0:setText( Engine.Localize( "8,888,888,888" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.resetProperties = function ()
		TextBox0:completeAnimation()
		Icon:completeAnimation()
		BG:completeAnimation()
		TextBox0:setAlpha( 1 )
		Icon:setAlpha( 1 )
		BG:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

