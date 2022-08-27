-- 24afa99527c01b4feea7ffb5cf35f9d3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Groups.GroupsFeaturedListLarge" )

CoD.GroupOverviewContentPanel = InheritFrom( LUI.UIElement )
CoD.GroupOverviewContentPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupOverviewContentPanel )
	self.id = "GroupOverviewContentPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 441 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, -1, 648 )
	Image:setTopBottom( true, false, 418, 521 )
	Image:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.02, 0.16, 0.36, 0.36 )
	Image:setupNineSliceShader( 16, 16 )
	self:addElement( Image )
	self.Image = Image
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( true, false, 2, 645 )
	Banner:setTopBottom( true, false, 420, 448 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.7 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local Banner0 = LUI.UIImage.new()
	Banner0:setLeftRight( true, false, 2, 645.11 )
	Banner0:setTopBottom( true, false, 27, 55 )
	Banner0:setRGB( 0, 0, 0 )
	Banner0:setAlpha( 0.7 )
	self:addElement( Banner0 )
	self.Banner0 = Banner0
	
	local Message = LUI.UIText.new()
	Message:setLeftRight( true, false, 5, 242.5 )
	Message:setTopBottom( true, false, 424, 444 )
	Message:setText( Engine.Localize( "GROUPS_MESSAGE_CAPS" ) )
	Message:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Message )
	self.Message = Message
	
	local Featured = LUI.UIText.new()
	Featured:setLeftRight( true, false, 6, 243.5 )
	Featured:setTopBottom( true, false, 30.63, 50.63 )
	Featured:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	Featured:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Featured )
	self.Featured = Featured
	
	local StartMenuframenoBG000 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG000:setLeftRight( true, false, -1, 648.11 )
	StartMenuframenoBG000:setTopBottom( true, false, 25, 408.47 )
	self:addElement( StartMenuframenoBG000 )
	self.StartMenuframenoBG000 = StartMenuframenoBG000
	
	local verticalScrollingTextBox = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox:setLeftRight( true, false, 9, 639 )
	verticalScrollingTextBox:setTopBottom( true, false, 453, 521 )
	verticalScrollingTextBox.textBox:setTTF( "fonts/default.ttf" )
	verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	verticalScrollingTextBox:subscribeToGlobalModel( controller, "SelectedGroup", nil, function ( model )
		verticalScrollingTextBox:setModel( model, controller )
	end )
	verticalScrollingTextBox:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local message = Engine.GetModelValue( model )
		if message then
			verticalScrollingTextBox.textBox:setText( message )
		end
	end )
	self:addElement( verticalScrollingTextBox )
	self.verticalScrollingTextBox = verticalScrollingTextBox
	
	local GroupsFeaturedListLarge = CoD.GroupsFeaturedListLarge.new( menu, controller )
	GroupsFeaturedListLarge:setLeftRight( true, false, 2, 645.11 )
	GroupsFeaturedListLarge:setTopBottom( true, false, 55, 408.47 )
	self:addElement( GroupsFeaturedListLarge )
	self.GroupsFeaturedListLarge = GroupsFeaturedListLarge
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, -1, 648 )
				self.Image:setTopBottom( true, false, 418, 531 )
				self.clipFinished( Image, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.45 )
				self.clipFinished( Banner, {} )
				Banner0:completeAnimation()
				self.Banner0:setLeftRight( true, false, 1, 645 )
				self.Banner0:setTopBottom( true, false, 27, 53.25 )
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
			end
		},
		NonMemberView = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
			end
		}
	}
	GroupsFeaturedListLarge.id = "GroupsFeaturedListLarge"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GroupsFeaturedListLarge:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG000:close()
		element.verticalScrollingTextBox:close()
		element.GroupsFeaturedListLarge:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

