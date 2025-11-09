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
	IconController:setLeftRight( true, false, 0, 33 )
	IconController:setTopBottom( true, false, 0, 32 )
	IconController:setRGB( 1, 1, 1 )
	IconController:linkToElementModel( self, nil, false, function ( model )
		IconController:setModel( model, controller )
	end )
	self:addElement( IconController )
	self.IconController = IconController
	
	local VoipBacking = LUI.UIImage.new()
	VoipBacking:setLeftRight( true, false, 25, 57 )
	VoipBacking:setTopBottom( true, false, 0, 32 )
	VoipBacking:setRGB( 1, 1, 1 )
	VoipBacking:setImage( RegisterImage( "uie_t7_menu_frontend_iconspeechback" ) )
	VoipBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( VoipBacking )
	self.VoipBacking = VoipBacking
	
	local VOIPImage = LUI.UIImage.new()
	VOIPImage:setLeftRight( true, false, 32, 53 )
	VOIPImage:setTopBottom( true, false, 4.5, 27 )
	VOIPImage:setRGB( 1, 1, 1 )
	VOIPImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
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
				self.VOIPImage:setAlpha( 0 )
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
	self.close = function ( self )
		self.IconController:close()
		self.VOIPImage:close()
		CoD.IconControllerContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

