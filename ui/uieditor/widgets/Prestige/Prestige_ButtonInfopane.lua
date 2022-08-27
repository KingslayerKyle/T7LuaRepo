-- e282811b18d1a29319080424cfa9e842
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 300 )
	
	local BodyBG = LUI.UIImage.new()
	BodyBG:setLeftRight( true, true, 0, 0 )
	BodyBG:setTopBottom( true, true, 22, 0 )
	BodyBG:setRGB( 0, 0, 0 )
	BodyBG:setAlpha( 0.2 )
	self:addElement( BodyBG )
	self.BodyBG = BodyBG
	
	local Body = LUI.UIText.new()
	Body:setLeftRight( true, true, 5, -5 )
	Body:setTopBottom( true, false, 33, 51 )
	Body:setText( Engine.Localize( "MENU_NEW" ) )
	Body:setTTF( "fonts/escom.ttf" )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Body )
	self.Body = Body
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, true, 0, 0 )
	TitleBG:setTopBottom( true, false, 0, 22 )
	TitleBG:setRGB( 0, 0, 0 )
	TitleBG:setAlpha( 0.4 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 5, -5 )
	Title:setTopBottom( true, false, 0, 20 )
	Title:setRGB( 1, 0.41, 0 )
	Title:setText( Engine.Localize( "MENU_PRESTIGE_AWARDS_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				BodyBG:completeAnimation()
				self.BodyBG:setAlpha( 0.2 )
				self.clipFinished( BodyBG, {} )
				Body:completeAnimation()
				self.Body:setAlpha( 1 )
				self.clipFinished( Body, {} )
				TitleBG:completeAnimation()
				self.TitleBG:setAlpha( 0.4 )
				self.clipFinished( TitleBG, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

