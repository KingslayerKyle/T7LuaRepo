-- e161f9e81d6b2ba44ef950f414e5f02b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBGTextures" )

CoD.StartMenu_CampaignBG = InheritFrom( LUI.UIElement )
CoD.StartMenu_CampaignBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_CampaignBG )
	self.id = "StartMenu_CampaignBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	blackimage:setAlpha( 0.5 )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setAlpha( 0.82 )
	Background:setScale( 1 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( true, true, 0, 0 )
	blackImage:setTopBottom( true, true, 0, 0 )
	blackImage:setRGB( 0, 0, 0 )
	blackImage:setAlpha( 0.5 )
	self:addElement( blackImage )
	self.blackImage = blackImage
	
	local StartMenuCampaignBGTextures = CoD.StartMenu_CampaignBGTextures.new( menu, controller )
	StartMenuCampaignBGTextures:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBGTextures:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuCampaignBGTextures )
	self.StartMenuCampaignBGTextures = StartMenuCampaignBGTextures
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )

			end,
			Back = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 3 )

				blackimage:completeAnimation()
				self.blackimage:setAlpha( 0 )
				self.clipFinished( blackimage, {} )

				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )

				blackImage:completeAnimation()
				self.blackImage:setAlpha( 0 )
				self.clipFinished( blackImage, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuCampaignBGTextures:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

