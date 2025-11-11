CoD.PlaylistDLC1CRM = InheritFrom( LUI.UIElement )
CoD.PlaylistDLC1CRM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PlaylistDLC1CRM )
	self.id = "PlaylistDLC1CRM"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 193 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 675 )
	BG:setTopBottom( 0, 0, 0, 193 )
	BG:setImage( RegisterImage( "uie_t7_crm_dlc1_playlist" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Title = LUI.UIImage.new()
	Title:setLeftRight( 0, 0, 55, 362 )
	Title:setTopBottom( 0, 0, 29, 93 )
	Title:setImage( RegisterImage( "uie_t7_crm_dlc1_playlist_title" ) )
	self:addElement( Title )
	self.Title = Title
	
	local DownloadIcon = LUI.UIImage.new()
	DownloadIcon:setLeftRight( 0, 0, 25, 93 )
	DownloadIcon:setTopBottom( 0, 0, 26, 94 )
	DownloadIcon:setImage( RegisterImage( "t7_menu_frontend_contextual_purchase" ) )
	self:addElement( DownloadIcon )
	self.DownloadIcon = DownloadIcon
	
	local ActionImage = LUI.UIImage.new()
	ActionImage:setLeftRight( 0, 0, 47, 83 )
	ActionImage:setTopBottom( 1, 1, -51, -15 )
	ActionImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ActionImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ActionImage )
	self.ActionImage = ActionImage
	
	local TextPurchaseDLC = LUI.UIText.new()
	TextPurchaseDLC:setLeftRight( 0, 0, 97, 397 )
	TextPurchaseDLC:setTopBottom( 0, 0, 147, 177 )
	TextPurchaseDLC:setText( Engine.Localize( "MENU_PURCHASE_DLC1" ) )
	TextPurchaseDLC:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextPurchaseDLC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextPurchaseDLC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextPurchaseDLC )
	self.TextPurchaseDLC = TextPurchaseDLC
	
	local TextIncludes4New = LUI.UIText.new()
	TextIncludes4New:setLeftRight( 0, 0, 97, 397 )
	TextIncludes4New:setTopBottom( 0, 0, 94, 124 )
	TextIncludes4New:setRGB( 1, 0.42, 0 )
	TextIncludes4New:setText( Engine.Localize( "MENU_PURCHASE_DLC1_DESCRIPTION" ) )
	TextIncludes4New:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextIncludes4New:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextIncludes4New:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextIncludes4New )
	self.TextIncludes4New = TextIncludes4New
	
	self.resetProperties = function ()
		TextIncludes4New:completeAnimation()
		TextPurchaseDLC:completeAnimation()
		ActionImage:completeAnimation()
		DownloadIcon:completeAnimation()
		Title:completeAnimation()
		BG:completeAnimation()
		TextIncludes4New:setAlpha( 1 )
		TextPurchaseDLC:setAlpha( 1 )
		ActionImage:setAlpha( 1 )
		DownloadIcon:setAlpha( 1 )
		Title:setAlpha( 1 )
		BG:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 0 )
				self.clipFinished( DownloadIcon, {} )
				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 0 )
				self.clipFinished( ActionImage, {} )
				TextPurchaseDLC:completeAnimation()
				self.TextPurchaseDLC:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC, {} )
				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 0 )
				self.clipFinished( TextIncludes4New, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not ShouldShowDLCWidget( controller, "mp_rise" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ActionImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

