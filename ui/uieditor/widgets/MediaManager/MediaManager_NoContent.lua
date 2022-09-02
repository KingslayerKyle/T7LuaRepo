-- d4839a9ab34a50cfa08b1fcb36a579b8
-- This hash is used for caching, delete to decompile the file again

CoD.MediaManager_NoContent = InheritFrom( LUI.UIElement )
CoD.MediaManager_NoContent.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MediaManager_NoContent )
	self.id = "MediaManager_NoContent"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 60 )
	
	local NoContentTextbox = LUI.UIText.new()
	NoContentTextbox:setLeftRight( true, false, 0, 250 )
	NoContentTextbox:setTopBottom( true, false, 3, 30 )
	NoContentTextbox:setText( Engine.Localize( "MENU_FILESHARE_NO_CONTENT" ) )
	NoContentTextbox:setTTF( "fonts/default.ttf" )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoContentTextbox )
	self.NoContentTextbox = NoContentTextbox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 0 )
				self.clipFinished( NoContentTextbox, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 1 )
				self.clipFinished( NoContentTextbox, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

