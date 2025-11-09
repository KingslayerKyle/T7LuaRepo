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
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 441 )
	
	local BorderBaked3 = CoD.BorderBaked.new( menu, controller )
	BorderBaked3:setLeftRight( true, false, 1, 384.32 )
	BorderBaked3:setTopBottom( true, false, 25, 264.29 )
	BorderBaked3:setRGB( 1, 1, 1 )
	BorderBaked3:setAlpha( 0.1 )
	BorderBaked3:setZoom( -50 )
	self:addElement( BorderBaked3 )
	self.BorderBaked3 = BorderBaked3
	
	local BorderBaked2 = CoD.BorderBaked.new( menu, controller )
	BorderBaked2:setLeftRight( true, false, 0, 383.32 )
	BorderBaked2:setTopBottom( true, false, 305, 440.5 )
	BorderBaked2:setRGB( 1, 1, 1 )
	BorderBaked2:setAlpha( 0.1 )
	BorderBaked2:setZoom( -50 )
	self:addElement( BorderBaked2 )
	self.BorderBaked2 = BorderBaked2
	
	local Featured = LUI.UIText.new()
	Featured:setLeftRight( true, false, 0, 237.5 )
	Featured:setTopBottom( true, false, 0, 17 )
	Featured:setRGB( 1, 1, 1 )
	Featured:setText( Engine.Localize( "GROUPS_FEATURED_CAPS" ) )
	Featured:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Featured:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Featured )
	self.Featured = Featured
	
	local FeaturedImage = LUI.UIImage.new()
	FeaturedImage:setLeftRight( true, false, 0, 383.32 )
	FeaturedImage:setTopBottom( true, false, 25, 264.29 )
	FeaturedImage:setRGB( 1, 1, 1 )
	FeaturedImage:setImage( RegisterImage( "uie_t7_menu_mp_loadscreen_sector" ) )
	FeaturedImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FeaturedImage )
	self.FeaturedImage = FeaturedImage
	
	local Message = LUI.UIText.new()
	Message:setLeftRight( true, false, 0, 237.5 )
	Message:setTopBottom( true, false, 279, 296 )
	Message:setRGB( 1, 1, 1 )
	Message:setText( Engine.Localize( "GROUPS_MESSAGE_CAPS" ) )
	Message:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Message:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Message )
	self.Message = Message
	
	local MessageContent = LUI.UIText.new()
	MessageContent:setLeftRight( true, false, 12, 373.32 )
	MessageContent:setTopBottom( true, false, 317, 333 )
	MessageContent:setRGB( 1, 1, 1 )
	MessageContent:setAlpha( 0.8 )
	MessageContent:setTTF( "fonts/UnitedSansRgMd.ttf" )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBaked3:completeAnimation()
				self.BorderBaked3:setAlpha( 0.1 )
				self.clipFinished( BorderBaked3, {} )
				BorderBaked2:completeAnimation()
				self.BorderBaked2:setAlpha( 0.1 )
				self.clipFinished( BorderBaked2, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 1 )
				self.clipFinished( Featured, {} )
				FeaturedImage:completeAnimation()
				self.FeaturedImage:setAlpha( 1 )
				self.clipFinished( FeaturedImage, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 1 )
				self.clipFinished( Message, {} )
				MessageContent:completeAnimation()
				self.MessageContent:setAlpha( 0.8 )
				self.clipFinished( MessageContent, {} )
			end
		},
		NonMemberView = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBaked3:completeAnimation()
				self.BorderBaked3:setAlpha( 0 )
				self.clipFinished( BorderBaked3, {} )
				BorderBaked2:completeAnimation()
				self.BorderBaked2:setAlpha( 0 )
				self.clipFinished( BorderBaked2, {} )
				Featured:completeAnimation()
				self.Featured:setAlpha( 0 )
				self.clipFinished( Featured, {} )
				FeaturedImage:completeAnimation()
				self.FeaturedImage:setAlpha( 0 )
				self.clipFinished( FeaturedImage, {} )
				Message:completeAnimation()
				self.Message:setAlpha( 0 )
				self.clipFinished( Message, {} )
				MessageContent:completeAnimation()
				self.MessageContent:setAlpha( 0 )
				self.clipFinished( MessageContent, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBaked3:close()
		self.BorderBaked2:close()
		self.MessageContent:close()
		CoD.GroupContentPanel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

