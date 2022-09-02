-- c5eca57791daf0d7affd94d69df648b3
-- This hash is used for caching, delete to decompile the file again

CoD.DLC_Free_TitleAndText = InheritFrom( LUI.UIElement )
CoD.DLC_Free_TitleAndText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DLC_Free_TitleAndText )
	self.id = "DLC_Free_TitleAndText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 420 )
	self:setTopBottom( true, false, 0, 104 )
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 0, 0 )
	Title:setTopBottom( true, false, 0, 20 )
	Title:setText( Engine.Localize( "MENU_DLC_TRY_AWAKENING_FREE" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.06, 0, 0, 0 )
	Title:setShaderVector( 1, 0.03, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Body = LUI.UIText.new()
	Body:setLeftRight( true, true, 1, 0 )
	Body:setTopBottom( true, false, 20, 36 )
	Body:setRGB( 0.69, 0.69, 0.69 )
	Body:setText( Engine.Localize( "MENU_DLC_TRY_AWAKENING_FREE_DESC" ) )
	Body:setTTF( "fonts/default.ttf" )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Body )
	self.Body = Body
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setLeftRight( true, true, 0, 0 )
				self.Title:setTopBottom( true, false, 0, 20 )
				self.clipFinished( Title, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

