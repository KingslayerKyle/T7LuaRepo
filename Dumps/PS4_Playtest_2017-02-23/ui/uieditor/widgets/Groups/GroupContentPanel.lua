require( "ui.uieditor.widgets.BorderBaked" )

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
	self:setLeftRight( 0, 0, 0, 576 )
	self:setTopBottom( 0, 0, 0, 661 )
	
	local BorderBaked2 = CoD.BorderBaked.new( menu, controller )
	BorderBaked2:setLeftRight( 0, 0, 0, 488 )
	BorderBaked2:setTopBottom( 0, 0, 334, 661 )
	self:addElement( BorderBaked2 )
	self.BorderBaked2 = BorderBaked2
	
	local FeaturedImage = LUI.UIImage.new()
	FeaturedImage:setLeftRight( 0, 0, 1, 487 )
	FeaturedImage:setTopBottom( 0, 0, 38, 324 )
	FeaturedImage:setImage( RegisterImage( "uie_t7_menu_mp_loadscreen_sector" ) )
	self:addElement( FeaturedImage )
	self.FeaturedImage = FeaturedImage
	
	local Banner = LUI.UIImage.new()
	Banner:setLeftRight( 0, 0, 2, 485 )
	Banner:setTopBottom( 0, 0, 338, 380 )
	Banner:setRGB( 0, 0, 0 )
	Banner:setAlpha( 0.7 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local MessageContent = LUI.UIText.new()
	MessageContent:setLeftRight( 0, 0, 9, 485 )
	MessageContent:setTopBottom( 0, 0, 391, 429 )
	MessageContent:setAlpha( 0.8 )
	MessageContent:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MessageContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MessageContent:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MessageContent:subscribeToGlobalModel( controller, "SelectedGroup", "message", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MessageContent:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MessageContent )
	self.MessageContent = MessageContent
	
	local Banner0 = LUI.UIImage.new()
	Banner0:setLeftRight( 0, 0, 1, 487 )
	Banner0:setTopBottom( 0, 0, 38, 80 )
	Banner0:setRGB( 0, 0, 0 )
	Banner0:setAlpha( 0.7 )
	self:addElement( Banner0 )
	self.Banner0 = Banner0
	
	local Message = LUI.UIText.new()
	Message:setLeftRight( 0, 0, 9, 365 )
	Message:setTopBottom( 0, 0, 341, 371 )
	Message:setText( Engine.Localize( "GROUPS_MESSAGE_CAPS" ) )
	Message:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Message )
	self.Message = Message
	
	local Featured = LUI.UIText.new()
	Featured:setLeftRight( 0, 0, 9, 365 )
	Featured:setTopBottom( 0, 0, 42, 72 )
	Featured:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	Featured:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Featured )
	self.Featured = Featured
	
	local BorderBaked3 = CoD.BorderBaked.new( menu, controller )
	BorderBaked3:setLeftRight( 0, 0, 1, 487 )
	BorderBaked3:setTopBottom( 0, 0, 38, 324 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	self.resetProperties = function ()
		BorderBaked2:completeAnimation()
		BorderBaked3:completeAnimation()
		Banner0:completeAnimation()
		Banner:completeAnimation()
		MessageContent:completeAnimation()
		Message:completeAnimation()
		FeaturedImage:completeAnimation()
		Featured:completeAnimation()
		BorderBaked2:setAlpha( 1 )
		BorderBaked3:setAlpha( 1 )
		Banner0:setAlpha( 0.7 )
		Banner:setAlpha( 0.7 )
		MessageContent:setAlpha( 0.8 )
		Message:setAlpha( 1 )
		FeaturedImage:setAlpha( 1 )
		Featured:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BorderBaked2:completeAnimation()
				self.BorderBaked2:setAlpha( 0.1 )
				self.clipFinished( BorderBaked2, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0.45 )
				self.clipFinished( Banner, {} )
				Banner0:completeAnimation()
				self.Banner0:setAlpha( 0.45 )
				self.clipFinished( Banner0, {} )
				BorderBaked3:completeAnimation()
				self.BorderBaked3:setAlpha( 0.1 )
				self.clipFinished( BorderBaked3, {} )
			end
		},
		NonMemberView = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BorderBaked2:completeAnimation()
				self.BorderBaked2:setAlpha( 0 )
				self.clipFinished( BorderBaked2, {} )
				FeaturedImage:completeAnimation()
				self.FeaturedImage:setAlpha( 0 )
				self.clipFinished( FeaturedImage, {} )
				Banner:completeAnimation()
				self.Banner:setAlpha( 0 )
				self.clipFinished( Banner, {} )
				MessageContent:completeAnimation()
				self.MessageContent:setAlpha( 0 )
				self.clipFinished( MessageContent, {} )
				Banner0:completeAnimation()
				self.Banner0:setAlpha( 0 )
				self.clipFinished( Banner0, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 0 )
				self.clipFinished( Message, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 0 )
				self.clipFinished( Featured, {} )
				BorderBaked3:completeAnimation()
				self.BorderBaked3:setAlpha( 0 )
				self.clipFinished( BorderBaked3, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBaked2:close()
		self.BorderBaked3:close()
		self.MessageContent:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

