-- 0f4610c411641ea0c733c63b7a43096c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Groups.GroupsFeaturedListSmall" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "summaryFileUpdated", false )
end

CoD.GroupContentPanel = InheritFrom( LUI.UIElement )
CoD.GroupContentPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupContentPanel )
	self.id = "GroupContentPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 441 )
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 325 )
	Image:setTopBottom( true, false, 238.5, 441.5 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.05, 0.08, 0.36, 0.36 )
	Image:setupNineSliceShader( 16, 16 )
	self:addElement( Image )
	self.Image = Image
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( true, false, 3, 322 )
	Banner:setTopBottom( true, false, 240.5, 268.5 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.45 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local Banner0 = LUI.UIImage.new()
	Banner0:setLeftRight( true, false, 3, 322 )
	Banner0:setTopBottom( true, false, 27, 53.25 )
	Banner0:setRGB( 0, 0, 0 )
	Banner0:setAlpha( 0.45 )
	self:addElement( Banner0 )
	self.Banner0 = Banner0
	
	local Message = LUI.UIText.new()
	Message:setLeftRight( true, false, 6, 315 )
	Message:setTopBottom( true, false, 244.5, 264.5 )
	Message:setText( Engine.Localize( "GROUPS_MESSAGE_CAPS" ) )
	Message:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Message )
	self.Message = Message
	
	local Featured = LUI.UIText.new()
	Featured:setLeftRight( true, false, 7, 244.5 )
	Featured:setTopBottom( true, false, 30.63, 50.63 )
	Featured:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	Featured:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Featured )
	self.Featured = Featured
	
	local StartMenuframenoBG000 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG000:setLeftRight( true, false, 0, 325 )
	StartMenuframenoBG000:setTopBottom( true, false, 22.63, 226.63 )
	self:addElement( StartMenuframenoBG000 )
	self.StartMenuframenoBG000 = StartMenuframenoBG000
	
	local verticalScrollingTextBox = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox:setLeftRight( true, false, 10, 315 )
	verticalScrollingTextBox:setTopBottom( true, false, 276, 429 )
	verticalScrollingTextBox.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	verticalScrollingTextBox:linkToElementModel( self, "message", true, function ( model )
		local message = Engine.GetModelValue( model )
		if message then
			verticalScrollingTextBox.textBox:setText( message )
		end
	end )
	self:addElement( verticalScrollingTextBox )
	self.verticalScrollingTextBox = verticalScrollingTextBox
	
	local GroupsFeaturedListSmall = CoD.GroupsFeaturedListSmall.new( menu, controller )
	GroupsFeaturedListSmall:setLeftRight( true, false, 2.5, 322.5 )
	GroupsFeaturedListSmall:setTopBottom( true, false, 52.63, 226.63 )
	GroupsFeaturedListSmall.contentList:setDataSource( "FilesharePublishedList" )
	self:addElement( GroupsFeaturedListSmall )
	self.GroupsFeaturedListSmall = GroupsFeaturedListSmall
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0 )
				self.clipFinished( Banner, {} )
				Banner0:completeAnimation()
				self.Banner0:setLeftRight( true, false, 1, 322 )
				self.Banner0:setTopBottom( true, false, 27, 53.25 )
				self.Banner0:setAlpha( 0 )
				self.clipFinished( Banner0, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 0 )
				self.clipFinished( Message, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 0 )
				self.clipFinished( Featured, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG000, {} )
				verticalScrollingTextBox:completeAnimation()
				self.verticalScrollingTextBox:setAlpha( 0 )
				self.clipFinished( verticalScrollingTextBox, {} )
				GroupsFeaturedListSmall:completeAnimation()
				self.GroupsFeaturedListSmall:setAlpha( 0 )
				self.clipFinished( GroupsFeaturedListSmall, {} )
			end
		},
		NonMemberView = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0 )
				self.clipFinished( Banner, {} )
				Banner0:completeAnimation()
				self.Banner0:setAlpha( 0 )
				self.clipFinished( Banner0, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 0 )
				self.clipFinished( Message, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 0 )
				self.clipFinished( Featured, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG000, {} )
				verticalScrollingTextBox:completeAnimation()
				self.verticalScrollingTextBox:setAlpha( 0 )
				self.clipFinished( verticalScrollingTextBox, {} )
				GroupsFeaturedListSmall:completeAnimation()
				self.GroupsFeaturedListSmall:setAlpha( 0 )
				self.clipFinished( GroupsFeaturedListSmall, {} )
			end
		},
		MemberView = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.45 )
				self.clipFinished( Banner, {} )
				Banner0:completeAnimation()
				self.Banner0:setAlpha( 0.45 )
				self.clipFinished( Banner0, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 1 )
				self.clipFinished( Message, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 1 )
				self.clipFinished( Featured, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG000, {} )
				verticalScrollingTextBox:completeAnimation()
				self.verticalScrollingTextBox:setAlpha( 1 )
				self.clipFinished( verticalScrollingTextBox, {} )
				GroupsFeaturedListSmall:completeAnimation()
				self.GroupsFeaturedListSmall:setAlpha( 1 )
				self.clipFinished( GroupsFeaturedListSmall, {} )
			end
		}
	}
	GroupsFeaturedListSmall.id = "GroupsFeaturedListSmall"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG000:close()
		element.verticalScrollingTextBox:close()
		element.GroupsFeaturedListSmall:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

