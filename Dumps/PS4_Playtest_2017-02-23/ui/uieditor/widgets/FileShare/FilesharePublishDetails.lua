require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( rootModel, "currentCategory", false )
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
	self:setLeftRight( 0, 0, 0, 402 )
	self:setTopBottom( 0, 0, 0, 711 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 402 )
	BG:setTopBottom( 0, 0, 0, 711 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.8 )
	self:addElement( BG )
	self.BG = BG
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 0, -1, 404 )
	BorderBakedSolid0:setTopBottom( 0, 0, -1, 713 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local PublishImageBacking = LUI.UIImage.new()
	PublishImageBacking:setLeftRight( 0, 0, 18, 384 )
	PublishImageBacking:setTopBottom( 0, 0, 16, 324 )
	PublishImageBacking:setAlpha( 0.1 )
	self:addElement( PublishImageBacking )
	self.PublishImageBacking = PublishImageBacking
	
	local PublishImage = LUI.UIImage.new()
	PublishImage:setLeftRight( 0, 0, 56, 346 )
	PublishImage:setTopBottom( 0, 0, 25, 315 )
	PublishImage:setRGB( 0, 0, 0 )
	PublishImage:setAlpha( 0.5 )
	PublishImage:subscribeToGlobalModel( controller, "FileshareRoot", "currentCategory", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PublishImage:setImage( RegisterImage( FileshareGetLargeCategoryIcon( modelValue ) ) )
		end
	end )
	self:addElement( PublishImage )
	self.PublishImage = PublishImage
	
	local PublishBG = LUI.UIImage.new()
	PublishBG:setLeftRight( 0, 0, 18, 384 )
	PublishBG:setTopBottom( 0, 0, 323, 368 )
	PublishBG:setRGB( 0, 0.87, 0 )
	PublishBG:setAlpha( 0.7 )
	self:addElement( PublishBG )
	self.PublishBG = PublishBG
	
	local PublishSmallIcon = LUI.UIImage.new()
	PublishSmallIcon:setLeftRight( 0, 0, 19, 64 )
	PublishSmallIcon:setTopBottom( 0, 0, 323, 368 )
	PublishSmallIcon:setRGB( 0.03, 0.03, 0.03 )
	PublishSmallIcon:setImage( RegisterImage( "t7_icon_menu_simple_publish" ) )
	self:addElement( PublishSmallIcon )
	self.PublishSmallIcon = PublishSmallIcon
	
	local PublishLabel = LUI.UITightText.new()
	PublishLabel:setLeftRight( 0, 0, 68, 372 )
	PublishLabel:setTopBottom( 0, 0, 320, 370 )
	PublishLabel:setRGB( 0, 0, 0 )
	PublishLabel:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	PublishLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PublishLabel )
	self.PublishLabel = PublishLabel
	
	local PublishInstruction = LUI.UIText.new()
	PublishInstruction:setLeftRight( 0, 0, 18, 386 )
	PublishInstruction:setTopBottom( 0, 0, 375, 408 )
	PublishInstruction:setRGB( 0.55, 0.55, 0.55 )
	PublishInstruction:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	PublishInstruction:setTTF( "fonts/default.ttf" )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublishInstruction )
	self.PublishInstruction = PublishInstruction
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( menu, controller )
	FileshareSlotsAvailable0:setLeftRight( 0, 0, 20, 406 )
	FileshareSlotsAvailable0:setTopBottom( 0, 0, 646.5, 691.5 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	self.resetProperties = function ()
		PublishBG:completeAnimation()
		FileshareSlotsAvailable0:completeAnimation()
		PublishInstruction:completeAnimation()
		PublishLabel:completeAnimation()
		PublishSmallIcon:completeAnimation()
		PublishImage:completeAnimation()
		BG:completeAnimation()
		PublishImageBacking:completeAnimation()
		BorderBakedSolid0:completeAnimation()
		PublishBG:setAlpha( 0.7 )
		FileshareSlotsAvailable0:setAlpha( 1 )
		PublishInstruction:setAlpha( 1 )
		PublishLabel:setAlpha( 1 )
		PublishSmallIcon:setAlpha( 1 )
		PublishImage:setAlpha( 0.5 )
		BG:setAlpha( 0.8 )
		PublishImageBacking:setAlpha( 0.1 )
		BorderBakedSolid0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PublishBG:completeAnimation()
				self.PublishBG:setAlpha( 0.6 )
				self.clipFinished( PublishBG, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedSolid0:close()
		self.FileshareSlotsAvailable0:close()
		self.PublishImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

