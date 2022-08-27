-- c430fbe68889f7f79596eef29fc7c36e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "currentCategory", false )
end

CoD.FilesharePublishDetails = InheritFrom( LUI.UIElement )
CoD.FilesharePublishDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FilesharePublishDetails )
	self.id = "FilesharePublishDetails"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 474 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 268 )
	BG:setTopBottom( true, false, 0, 474 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.8 )
	self:addElement( BG )
	self.BG = BG
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, false, -1, 269 )
	BorderBakedSolid0:setTopBottom( true, false, -1, 475 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local PublishImageBacking = LUI.UIImage.new()
	PublishImageBacking:setLeftRight( true, false, 12, 256 )
	PublishImageBacking:setTopBottom( true, false, 11, 216 )
	PublishImageBacking:setAlpha( 0.1 )
	self:addElement( PublishImageBacking )
	self.PublishImageBacking = PublishImageBacking
	
	local PublishImage = LUI.UIImage.new()
	PublishImage:setLeftRight( true, false, 37.5, 230.5 )
	PublishImage:setTopBottom( true, false, 17, 210 )
	PublishImage:setRGB( 0, 0, 0 )
	PublishImage:setAlpha( 0.5 )
	PublishImage:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategory", function ( model )
		local currentCategory = Engine.GetModelValue( model )
		if currentCategory then
			PublishImage:setImage( RegisterImage( FileshareGetLargeCategoryIcon( currentCategory ) ) )
		end
	end )
	self:addElement( PublishImage )
	self.PublishImage = PublishImage
	
	local PublishBG = LUI.UIImage.new()
	PublishBG:setLeftRight( true, false, 12, 256 )
	PublishBG:setTopBottom( true, false, 215, 245 )
	PublishBG:setRGB( 0, 0.87, 0 )
	PublishBG:setAlpha( 0.7 )
	self:addElement( PublishBG )
	self.PublishBG = PublishBG
	
	local PublishSmallIcon = LUI.UIImage.new()
	PublishSmallIcon:setLeftRight( true, false, 12.5, 42.5 )
	PublishSmallIcon:setTopBottom( true, false, 215, 245 )
	PublishSmallIcon:setRGB( 0.03, 0.03, 0.03 )
	PublishSmallIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_publish" ) )
	self:addElement( PublishSmallIcon )
	self.PublishSmallIcon = PublishSmallIcon
	
	local PublishLabel = LUI.UITightText.new()
	PublishLabel:setLeftRight( true, false, 45, 248 )
	PublishLabel:setTopBottom( true, false, 213.5, 246.5 )
	PublishLabel:setRGB( 0, 0, 0 )
	PublishLabel:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	PublishLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PublishLabel )
	self.PublishLabel = PublishLabel
	
	local PublishInstruction = LUI.UIText.new()
	PublishInstruction:setLeftRight( true, false, 12, 257 )
	PublishInstruction:setTopBottom( true, false, 250, 272 )
	PublishInstruction:setRGB( 0.55, 0.55, 0.55 )
	PublishInstruction:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	PublishInstruction:setTTF( "fonts/default.ttf" )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublishInstruction )
	self.PublishInstruction = PublishInstruction
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( menu, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 13.5, 270.5 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 431.26, 461.26 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 268 )
				self.BG:setTopBottom( true, false, 0, 474 )
				self.BG:setAlpha( 0.8 )
				self.clipFinished( BG, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid0, {} )
				PublishImageBacking:completeAnimation()
				self.PublishImageBacking:setRGB( 1, 1, 1 )
				self.PublishImageBacking:setAlpha( 0.1 )
				self.clipFinished( PublishImageBacking, {} )
				PublishImage:completeAnimation()
				self.PublishImage:setRGB( 0, 0, 0 )
				self.PublishImage:setAlpha( 0.5 )
				self.clipFinished( PublishImage, {} )
				PublishBG:completeAnimation()
				self.PublishBG:setAlpha( 0.6 )
				self.clipFinished( PublishBG, {} )
				PublishSmallIcon:completeAnimation()
				self.PublishSmallIcon:setAlpha( 1 )
				self.clipFinished( PublishSmallIcon, {} )
				PublishLabel:completeAnimation()
				self.PublishLabel:setAlpha( 1 )
				self.clipFinished( PublishLabel, {} )
				PublishInstruction:completeAnimation()
				self.PublishInstruction:setRGB( 0.55, 0.55, 0.55 )
				self.PublishInstruction:setAlpha( 1 )
				self.clipFinished( PublishInstruction, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 1 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				PublishImageBacking:completeAnimation()
				self.PublishImageBacking:setAlpha( 0 )
				self.clipFinished( PublishImageBacking, {} )
				PublishImage:completeAnimation()
				self.PublishImage:setAlpha( 0 )
				self.clipFinished( PublishImage, {} )
				PublishBG:completeAnimation()
				self.PublishBG:setAlpha( 0 )
				self.clipFinished( PublishBG, {} )
				PublishSmallIcon:completeAnimation()
				self.PublishSmallIcon:setAlpha( 0 )
				self.clipFinished( PublishSmallIcon, {} )
				PublishLabel:completeAnimation()
				self.PublishLabel:setAlpha( 0 )
				self.clipFinished( PublishLabel, {} )
				PublishInstruction:completeAnimation()
				self.PublishInstruction:setAlpha( 0 )
				self.clipFinished( PublishInstruction, {} )
				FileshareSlotsAvailable0:completeAnimation()
				self.FileshareSlotsAvailable0:setAlpha( 0 )
				self.clipFinished( FileshareSlotsAvailable0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid0:close()
		element.FileshareSlotsAvailable0:close()
		element.PublishImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

