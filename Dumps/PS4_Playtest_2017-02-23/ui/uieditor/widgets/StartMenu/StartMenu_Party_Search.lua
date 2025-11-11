require( "ui.uieditor.widgets.Border" )

CoD.StartMenu_Party_Search = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party_Search.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party_Search )
	self.id = "StartMenu_Party_Search"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 574 )
	self:setTopBottom( 0, 0, 0, 555 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 10, 174 )
	Icon:setTopBottom( 0, 0, 258, 422 )
	Icon:setAlpha( 0.49 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 574 )
	Background:setTopBottom( 0, 0, 0, 555 )
	Background:setAlpha( 0.2 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 30, 574 )
	Title:setTopBottom( 0, 0, 438, 492 )
	Title:setText( Engine.Localize( "Look for Party" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( 0, 0, 30, 574 )
	Subtitle:setTopBottom( 0, 0, 500, 530 )
	Subtitle:setText( Engine.Localize( "Find a Party, Join them, and play together." ) )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( 0, 0, 186, 574 )
	Count:setTopBottom( 0, 0, 326, 359 )
	Count:setRGB( 1, 0.8, 0.4 )
	Count:setText( Engine.Localize( "1,250 Parties" ) )
	Count:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Count )
	self.Count = Count
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	self.resetProperties = function ()
		Border:completeAnimation()
		Border:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Border:completeAnimation()
				self.Border:setRGB( 1, 0.56, 0 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

