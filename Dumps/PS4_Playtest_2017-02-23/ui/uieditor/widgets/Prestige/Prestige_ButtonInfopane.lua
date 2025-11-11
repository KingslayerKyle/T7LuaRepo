CoD.Prestige_ButtonInfopane = InheritFrom( LUI.UIElement )
CoD.Prestige_ButtonInfopane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_ButtonInfopane )
	self.id = "Prestige_ButtonInfopane"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 450 )
	
	local BodyBG = LUI.UIImage.new()
	BodyBG:setLeftRight( 0, 1, 0, 0 )
	BodyBG:setTopBottom( 0, 1, 32, 0 )
	BodyBG:setRGB( 0, 0, 0 )
	BodyBG:setAlpha( 0.2 )
	self:addElement( BodyBG )
	self.BodyBG = BodyBG
	
	local Body = LUI.UIText.new()
	Body:setLeftRight( 0, 1, 8, -8 )
	Body:setTopBottom( 0, 0, 50, 77 )
	Body:setText( Engine.Localize( "MENU_NEW" ) )
	Body:setTTF( "fonts/escom.ttf" )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Body )
	self.Body = Body
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( 0, 1, 0, 0 )
	TitleBG:setTopBottom( 0, 0, 0, 33 )
	TitleBG:setRGB( 0, 0, 0 )
	TitleBG:setAlpha( 0.4 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 1, 8, -8 )
	Title:setTopBottom( 0, 0, 0, 30 )
	Title:setRGB( 1, 0.41, 0 )
	Title:setText( Engine.Localize( "MENU_PRESTIGE_AWARDS_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.resetProperties = function ()
		Title:completeAnimation()
		TitleBG:completeAnimation()
		Body:completeAnimation()
		BodyBG:completeAnimation()
		Title:setAlpha( 1 )
		TitleBG:setAlpha( 0.4 )
		Body:setAlpha( 1 )
		BodyBG:setAlpha( 0.2 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BodyBG:completeAnimation()
				self.BodyBG:setAlpha( 0 )
				self.clipFinished( BodyBG, {} )
				Body:completeAnimation()
				self.Body:setAlpha( 0 )
				self.clipFinished( Body, {} )
				TitleBG:completeAnimation()
				self.TitleBG:setAlpha( 0 )
				self.clipFinished( TitleBG, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

