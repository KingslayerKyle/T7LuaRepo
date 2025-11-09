require( "ui.uieditor.widgets.Border" )

CoD.StartMenu_Party_Button = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party_Button )
	self.id = "StartMenu_Party_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 349 )
	self:setTopBottom( true, false, 0, 55 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 8.91, 349 )
	Text:setTopBottom( true, false, 17, 38 )
	Text:setRGB( 1, 1, 1 )
	Text:setText( Engine.Localize( "MENU_LEAVE_PARTY" ) )
	Text:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( true, true, 0, 0 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setRGB( 1, 1, 1 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Border0:completeAnimation()
				self.Border0:setRGB( 1, 1, 1 )
				self.clipFinished( Border0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Border0:completeAnimation()
				self.Border0:setRGB( 1, 0.57, 0 )
				self.clipFinished( Border0, {} )
			end
		}
	}
	self.close = function ( self )
		self.Border0:close()
		CoD.StartMenu_Party_Button.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

