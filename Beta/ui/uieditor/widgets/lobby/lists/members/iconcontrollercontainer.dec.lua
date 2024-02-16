require( "ui.uieditor.widgets.Lobby.Lists.Members.IconController" )

CoD.IconControllerContainer = InheritFrom( LUI.UIElement )
CoD.IconControllerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IconControllerContainer )
	self.id = "IconControllerContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 57 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local IconController = CoD.IconController.new( menu, controller )
	IconController:setLeftRight( true, false, 24, 57 )
	IconController:setTopBottom( true, false, 0, 32 )
	IconController:setAlpha( 0 )
	IconController:linkToElementModel( self, nil, false, function ( model )
		IconController:setModel( model, controller )
	end )
	self:addElement( IconController )
	self.IconController = IconController
	
	local VoipBacking = LUI.UIImage.new()
	VoipBacking:setLeftRight( true, false, 25, 57 )
	VoipBacking:setTopBottom( true, false, 0, 32 )
	VoipBacking:setAlpha( 0 )
	VoipBacking:setImage( RegisterImage( "uie_t7_menu_frontend_iconspeechback" ) )
	self:addElement( VoipBacking )
	self.VoipBacking = VoipBacking
	
	local VOIPImage = LUI.UIImage.new()
	VOIPImage:setLeftRight( true, false, 53, 32 )
	VOIPImage:setTopBottom( true, false, 4.5, 27 )
	VOIPImage:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VOIPImage:setupVoipImageByXUID( modelValue )
		end
	end )
	self:addElement( VOIPImage )
	self.VOIPImage = VOIPImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				IconController:completeAnimation()
				self.IconController:setLeftRight( true, false, 24, 57 )
				self.IconController:setTopBottom( true, false, 0, 32 )
				self.IconController:setAlpha( 0 )
				self.clipFinished( IconController, {} )
				VoipBacking:completeAnimation()
				self.VoipBacking:setAlpha( 0 )
				self.clipFinished( VoipBacking, {} )
				VOIPImage:completeAnimation()
				self.VOIPImage:setAlpha( 1 )
				self.clipFinished( VOIPImage, {} )
			end
		},
		VoipActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				IconController:completeAnimation()
				self.IconController:setLeftRight( true, false, 0, 33 )
				self.IconController:setTopBottom( true, false, 0, 32 )
				self.IconController:setAlpha( 0 )
				self.clipFinished( IconController, {} )
				VoipBacking:completeAnimation()
				self.VoipBacking:setAlpha( 1 )
				self.clipFinished( VoipBacking, {} )
				VOIPImage:completeAnimation()
				self.VOIPImage:setAlpha( 1 )
				self.clipFinished( VOIPImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.IconController:close()
		self.VOIPImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

